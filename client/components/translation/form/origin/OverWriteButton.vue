<template>
  <button
    class="text-xl text-center border-2 shadow w-24"
    @click="onClick"
  >
    上書き
  </button>
</template>

<script>
export default {
  name: "OverWriteButton",
  methods: {
    onClick: function (event) {
      this.$emit('click', event)
    },
  },
};
</script>

<style scoped>

</style>
