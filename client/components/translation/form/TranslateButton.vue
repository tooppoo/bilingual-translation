<template>
  <button class="text-xl text-center border-2 shadow w-full" @click="onClick">
    翻訳
  </button>
</template>

<script>
export default {
  name: 'TranslateButton',
  methods: {
    onClick: function (event) {
      this.$emit('click', event)
    },
  },
}
</script>

<style scoped></style>
