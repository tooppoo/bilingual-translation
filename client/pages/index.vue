<template>
  <div>
    <header class="flex flex-col justify-between h-1/5">
      <original-text-form
        name="origin-text"
        class="h-full"
        :value="data.origin.body"
        @input="onSetOrigin"
      />
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
        <source-text-form
          name="source-text"
          class="h-full"
          :value="data.source.body"
          @input="e => onWriteSource(e.target.value)"
        />
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
        <translated-text-form
          name="target-text"
          class="h-full"
          :value="data.translated"
        />
      </section>
    </article>
  </div>
</template>

<script>
import TextForm from '~/components/translation/form/TextForm.vue'
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";
import ToolTip from "../components/translation/form/source/ToolTip";
import OriginalTextForm from "../components/translation/form/origin/OriginalTextForm";
import SourceTextForm from "../components/translation/form/source/SourceTextForm";
import TranslatedTextForm from "../components/translation/form/translated/TranslatedTextForm";

export default {
  name: 'Translation',
  components: {
    TranslatedTextForm,
    SourceTextForm,
    OriginalTextForm,
    ToolTip,
    TextForm,
  },
  data: () => ({
    data: Interaction.initialize(),
  }),
  methods: {
    onSetOrigin: function (event) {
      console.debug({ event })
      const newOrigin = event.target.value

      this.data = Interaction.changeOrigin(newOrigin, this.data.clone())
    },
    onWriteSource: function (written) {
      console.debug({ event })
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
