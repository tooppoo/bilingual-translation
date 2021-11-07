<template>
  <div
    class="text-center"
  >
    <button
      class="text-xl text-center border-2 shadow w-full"
      @click="onClick"
    >
      翻訳
    </button>
    <div class="text-xl">→</div>
    <notice-loading />
    <notice-error />
  </div>
</template>

<script>
import NoticeError from "../../icon/NoticeError";
import NoticeLoading from "../../icon/NoticeLoading";

export default {
  name: "TranslateButton",
  components: {
    NoticeLoading,
    NoticeError
  },
  methods: {
    onClick: function (event) {
      this.$emit('click', event)
    },
  },
};
</script>

<style scoped>

</style>
