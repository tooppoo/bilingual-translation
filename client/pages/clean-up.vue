<template>
  <div class="h-screen">
    <header class="h-10p flex flex-row items-center p-3">
      <button
        id="clean-up"
        type="button"
        class="w-32 h-8 border-2"
        @click="onCleanUp"
      >
        整形
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
import { cleanUpContext } from "../lib/translation/model/context/clean-up-context";

export default {
  name: "CleanUp",
  components: {
    TextForm,
  },
  data: () => ({
    origin: Interaction.initialize(),
    cleaned: Interaction.initialize(),
  }),
  methods: {
    onWriteSource: function (written) {
      this.origin = Interaction.writeSource(written, this.origin)
    },
    onCleanUp: function () {
      cleanUpContext.onCleanUp.apply({ ...this.origin }, d => {
        this.cleaned = d.cleanUp()
      })
    }
  },
};
</script>

<style scoped>

</style>
