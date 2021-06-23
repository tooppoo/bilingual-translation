<template>
  <div class="h-screen">
    <header class="h-10p flex flex-row items-center p-3">
      <button
        id="translate"
        type="button"
        class="w-32 h-8 border-2"
        @click="onTranslate"
      >
        翻訳
      </button>
    </header>
    <article class="flex flex-row h-90p p-3">
      <text-form
        name="source-text"
        caption="原文"
        :value="state.source"
        @input="onWriteSource"
      />
      <text-form
        name="target-text"
        caption="訳文"
        :value="state.target"
      />
    </article>
  </div>
</template>

<script>
import TextForm from '~/components/translation/TextForm.vue'
import * as Interaction from '~/lib/translation/model/interaction'

export default {
  name: 'Translation',
  components: {
    TextForm,
  },
  data: () => ({
    state: Interaction.initialize()
  }),
  methods: {
    onWriteSource: function (written) {
      this.state = Interaction.writeSource(written, this.state)
    },
    onTranslate: async function () {
      this.state = await this.translator(this.state)
    }
  },
  computed: {
    translator: function () {
      const gateway = {
        translate: async (params) => {
          const res = await this.$axios.post(
            '/api/translation',
            params
          )

          return res.data
        }
      }

      return Interaction.translate(gateway)
    }
  }
}
</script>
