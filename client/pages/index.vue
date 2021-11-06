<template>
  <div class="h-screen">
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
      <button
        class="text-2xl border-2 shadow"
        @click="() => onSetOrigin(origin.body)"
      >
        原文に戻す
      </button>
    </header>
    <article class="h-4/5 flex flex-row">
      <text-form
        name="source-text"
        class="h-full"
        :value="data.source"
        @input="onWriteSource"
      >
        <template v-slot:caption>
          整形文
        </template>
      </text-form>
      <text-form
        name="target-text"
        class="h-full"
        :value="data.target"
      >
        <template v-slot:caption>
          訳文
        </template>
      </text-form>
    </article>
  </div>
</template>

<script>
import TextForm from '~/components/translation/TextForm.vue'
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";

export default {
  name: 'Translation',
  components: {
    TextForm,
  },
  data: () => ({
    origin: {
      body: '',
      show: true,
    },
    data: Interaction.initialize(),
  }),
  methods: {
    onSetOrigin: function (newOrigin) {
      this.origin.body = newOrigin

      this.data = Interaction.initialize(newOrigin)
    },
    onWriteSource: function (written) {
      this.data = Interaction.writeSource(written, this.data)
    },
    onTranslate: async function () {
      this.data = await this.translator(this.data)
    },
    onRemoveNewLine: function () {
      this.data = Interaction.cleanUp({ ...this.data })
    },
    onSplitBySentence: function () {
      this.data = this.sentenceSplitter(this.data)
    },
  },
  computed: {
    translator: function () {
      const gateway = translateGateway.build(this.$axios)

      return Interaction.translate(gateway)
    },
    sentenceSplitter: function () {
      return Interaction.splitBySentence('\\.')
    }
  }
}
</script>
