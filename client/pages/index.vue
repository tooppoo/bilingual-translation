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
      <div class="flex items-start">
        <over-write-button @click="() => onWriteSource(data.origin.body)" />
        <div class="h-8 w-8 flex items-center justify-center">
          <down-arrow />
        </div>
      </div>
    </header>
    <div class="my-2" />
    <article class="h-4/5 flex flex-row items-center">
      <section class="h-full flex-auto flex flex-col">
        <source-text-form
          name="source-text"
          :value="data.source.body"
          @input="(e) => onWriteSource(e.target.value)"
        />
        <tool-tip
          class="h-20 flex-initial"
          :value="data.source.body"
          @remove-new-line="onRemoveNewLine"
          @add-new-line="onSplitBySentence"
          @remove-excessive-blank="onRemoveExcessiveBlank"
        />
      </section>
      <section class="w-24 flex-initial text-center px-2">
        <translate-button @click="onTranslate" />
        <div class="w-full h-8">
          <right-arrow />
        </div>
        <div class="w-full h-8">
          <component :is="actionState.view" :name="actionState.id" />
        </div>
      </section>
      <section class="h-full flex-auto flex flex-col">
        <translated-text-form name="target-text" :value="data.translated" />
      </section>
    </article>
  </div>
</template>

<script>
import ToolTip from '../components/translation/form/source/ToolTip'
import OriginalTextForm from '../components/translation/form/origin/OriginalTextForm'
import SourceTextForm from '../components/translation/form/source/SourceTextForm'
import TranslatedTextForm from '../components/translation/form/translated/TranslatedTextForm'
import OverWriteButton from '../components/translation/form/origin/OverWriteButton'
import TranslateButton from '../components/translation/form/TranslateButton'
import { error, idle, loading } from '../components/icon/notice/notice-state'
import DownArrow from '../components/icon/arrow/RightDown'
import RightArrow from '../components/icon/arrow/RightArrow'
import { translateGateway } from '~/lib/translation/infrastructure/gateway/axios'
import { Interaction } from '~/lib/translation/model/interaction'

export default {
  name: 'Translation',
  components: {
    RightArrow,
    DownArrow,
    TranslateButton,
    OverWriteButton,
    TranslatedTextForm,
    SourceTextForm,
    OriginalTextForm,
    ToolTip,
  },
  data: () => ({
    data: Interaction.initialize(),
    actionState: idle,
  }),
  computed: {
    translator: function () {
      const gateway = translateGateway.build(this.$axios)

      return Interaction.translate(gateway)
    },
    sentenceSplitter: function () {
      return Interaction.splitBySentence('[.?!]')
    },
  },
  methods: {
    onSetOrigin: function (event) {
      const newOrigin = event.target.value

      this.data = Interaction.changeOrigin(newOrigin, this.data.clone())
    },
    onWriteSource: function (written) {
      this.data = Interaction.writeSource(written, this.data.clone())
    },
    onTranslate: async function () {
      try {
        this.actionState = loading

        this.data = await this.translator(this.data.clone())

        this.actionState = idle
      } catch (e) {
        this.actionState = error
      }
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
}
</script>
