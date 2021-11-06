<template>
  <div>
    <header class="flex flex-col justify-between h-1/5">
      <text-form
        name="origin-text"
        class="h-full"
        @input="onSetOrigin"
      >
        <template v-slot:caption>
          原文
        </template>
      </text-form>
      <div class="my-1" />
      <div>
        <button
          class="text-xl text-center border-2 shadow w-24"
          @click="() => onWriteSource(data.origin.body)"
        >
          上書き
        </button>
        <span class="text-xl">↓</span>
      </div>
    </header>
    <div class="my-2" />
    <article class="h-4/5 flex flex-row items-center">
      <section
        class="h-full flex-auto"
      >
        <text-form
          name="source-text"
          class="h-full"
          :value="data.source.body"
          @input="e => onWriteSource(e.target.value)"
        >
          <template v-slot:caption>
            翻訳前
          </template>
        </text-form>
      </section>
      <section
        class="w-24 text-center flex-initial"
      >
        <button
          class="text-xl text-center border-2 shadow w-full"
          @click="onTranslate"
        >
          翻訳
        </button>
        <div class="text-xl">→</div>
      </section>
      <section
        class="h-full flex-auto"
      >
        <text-form
          name="target-text"
          class="h-full"
          :value="data.translated"
        >
          <template v-slot:caption>
            翻訳後
          </template>
        </text-form>
      </section>
    </article>
  </div>
</template>

<script>
import TextForm from '~/components/translation/form/TextForm.vue'
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";
import ToolTip from "../components/translation/form/source/ToolTip";

export default {
  name: 'Translation',
  components: {
    ToolTip,
    TextForm,
  },
  data: () => ({
    data: Interaction.initialize(),
  }),
  methods: {
    onSetOrigin: function (event) {
      const newOrigin = event.target.value

      this.data = Interaction.changeOrigin(newOrigin, this.data.clone())
    },
    onWriteSource: function (written) {
      this.data = Interaction.writeSource(written, this.data.clone())
    },
    onTranslate: async function () {
      this.data = await this.translator(this.data.clone())
    },
    onRemoveNewLine: function () {
      this.data = Interaction.cleanUp(this.data.clone())
    },
    onSplitBySentence: function () {
      this.data = this.sentenceSplitter(this.data.clone())
    },
  },
  computed: {
    translator: function () {
      const gateway = translateGateway.build(this.$axios)

      return Interaction.translate(gateway)
    },
    sentenceSplitter: function () {
      return Interaction.splitBySentence('\\.')
    },
  }
}
</script>
