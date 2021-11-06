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
        class="text-2xl text-center border-2 shadow"
        @click="() => onWriteSource(origin.body)"
      >
        ↓
      </button>
    </header>
    <article class="h-4/5 flex flex-row">
      <tool-tip />
      <text-form
        name="source-text"
        class="h-full"
        :value="data.source"
        @input="e => onWriteSource(e.target.value)"
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
import TextForm from '~/components/translation/form/TextForm.vue'
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";
import ToolTip from "../components/translation/form/ToolTip";

export default {
  name: 'Translation',
  components: {
    ToolTip,
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
    onSetOrigin: function (event) {
      const newOrigin = event.target.value
      this.origin.body = newOrigin

      if (this.data.source.isEmpty()) return

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
