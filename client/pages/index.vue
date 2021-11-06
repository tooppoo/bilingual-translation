<template>
  <div class="h-screen">
    <header class="h-1/5 flex flex-row items-center p-3">
      <text-form
        name="origin-text"
        class="h-full"
        caption="原文"
        @input="onSetOrigin"
      >
        <template v-slot:caption>
          原文
        </template>
      </text-form>
    </header>
    <article class="h-4/5 flex flex-row p-3">
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
import { messages } from "../store/translation";

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
  }),
  methods: {
    onSetOrigin: function (body) {
      this.origin.body = body

      this.$store.commit(
        messages.mutations.overwrite,
        {
          ...this.state,
          source: origin,
        }
      )
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
