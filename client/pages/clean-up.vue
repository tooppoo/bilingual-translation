<template>
  <div class="h-screen">
    <header class="h-10p flex flex-row items-center p-3">
      <button
        id="clean-up"
        type="button"
        class="w-32 h-8 border-2"
      >
        整形
      </button>
    </header>
    <article class="flex flex-row h-90p p-3">
      <text-form
        name="source-text"
        caption="整形前"
      />
      <text-form
        name="target-text"
        caption="整形後"
      />
    </article>
  </div>
</template>

<script>
import TextForm from "../components/translation/TextForm";

export default {
  name: "CleanUp",
  components: {
    TextForm,
  },
};
</script>

<style scoped>

</style>
