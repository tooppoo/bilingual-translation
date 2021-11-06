<template>
  <div class="h-screen">
    <header class="h-10p flex flex-row items-center p-3">
      <button
        id="clean-up"
        type="button"
        class="w-52 h-8 border-2"
        @click="onCleanUp"
      >
        改行を削除
      </button>
      <button
        id="finish-clean-up"
        type="button"
        class="w-52 h-8 border-2"
        @click="onFinish"
      >
        削除後を使用
      </button>
    </header>
    <article class="flex flex-row h-90p p-3">
      <text-form
        name="source-text"
        caption="整形前"
        :value="origin.source"
        @input="onWriteSource"
      />
      <text-form
        name="target-text"
        caption="整形後"
        :value="cleaned.source"
      />
    </article>
  </div>
</template>

<script>
import TextForm from "../components/translation/TextForm";
import { Interaction } from "../lib/translation/model/interaction";
import { messages } from "../store/translation";

export default {
  name: "RemoveNewLine",
  components: {
    TextForm,
  },
  data: () => ({
    cleaned: Interaction.initialize(),
  }),
  methods: {
    onWriteSource: function (written) {
      const updated = Interaction.writeSource(written, this.state)

      this.$store.commit(messages.mutations.overwrite, updated)
    },
    onCleanUp: function () {
      this.cleaned = Interaction.cleanUp({ ...this.origin })
    },
    onFinish: function () {
      this.$store.commit(messages.mutations.overwrite, this.cleaned)
      this.cleaned = Interaction.initialize()
    },
  },
  computed: {
    origin: function () {
      return this.$store.state.translation.data
    }
  }
};
</script>

<style scoped>

</style>
