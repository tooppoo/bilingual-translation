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
      <over-write-button
        @click="() => onWriteSource(data.origin.body)"
      />
    </header>
    <div class="my-2" />
    <article class="h-4/5 flex flex-row items-center">
      <section
        class="h-full flex-auto flex flex-col"
      >
        <source-text-form
          name="source-text"
          :value="data.source.body"
          @input="e => onWriteSource(e.target.value)"
        />
        <tool-tip
          class="h-20 flex-initial"
          :value="data.source.body"
          @remove-new-line="onRemoveNewLine"
          @add-new-line="onSplitBySentence"
          @remove-excessive-blank="onRemoveExcessiveBlank"
        />
      </section>
      <section
        class="w-24 flex-initial"
      >
        <translate-button @click="onTranslate" />
      </section>
      <section
        class="h-full flex-auto flex flex-col"
      >
        <translated-text-form
          name="target-text"
          :value="data.translated"
        />
      </section>
    </article>
  </div>
</template>

<script>
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";
import ToolTip from "../components/translation/form/source/ToolTip";
import OriginalTextForm from "../components/translation/form/origin/OriginalTextForm";
import SourceTextForm from "../components/translation/form/source/SourceTextForm";
import TranslatedTextForm from "../components/translation/form/translated/TranslatedTextForm";
import OverWriteButton from "../components/translation/form/origin/OverWriteButton";
import TranslateButton from "../components/translation/form/TranslateButton";

export default {
  name: 'Translation',
  components: {
    TranslateButton,
    OverWriteButton,
    TranslatedTextForm,
    SourceTextForm,
    OriginalTextForm,
    ToolTip,
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
      this.data = Interaction.writeSource(written, this.data.clone())
    },
    onTranslate: async function () {
      this.data = await this.translator(this.data.clone())
    },
    onRemoveNewLine: function () {
      this.data = Interaction.removeNewLines(this.data.clone())
    },
    onRemoveExcessiveBlank: function () {
      this.data = Interaction.removeExcessiveBlank(this.data.clone())
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
