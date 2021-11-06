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
        :value="data.source"
        @input="onWriteSource"
      />
      <text-form
        name="target-text"
        caption="訳文"
        :value="data.target"
      />
    </article>
  </div>
</template>

<script>
import TextForm from '~/components/translation/TextForm.vue'
import { Interaction } from '~/lib/translation/model/interaction'
import { translateGateway } from "~/lib/translation/infrastructure/gateway/axios";
import { messages } from "../store/translation";

export default {
  name: 'Translation',
  components: {
    TextForm,
  },
  methods: {
    created() {
      console.debug('created')
    },
    onWriteSource: function (written) {
      const updated = Interaction.writeSource(written, this.state)

      this.$store.commit(messages.mutations.overwrite, updated)
    },
    onTranslate: async function () {
      const translated = await this.translator(this.state)

      this.$store.commit(messages.mutations.overwrite, translated)
    }
  },
  computed: {
    data: function () {
      return this.$store.state.translation.data
    },
    translator: function () {
      const gateway = translateGateway.build(this.$axios)

      return Interaction.translate(gateway)
    }
  }
}
</script>
