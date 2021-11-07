<template>
  <div
    name="tool-tip"
    class="flex py-3 px-2 bg-white border-2 shadow-md justify-start"
  >
    <button
      v-for="(b) in buttons"
      :key="b.event"
      @click="() => $emit(b.event)"
      class="border-2 mx-2 shadow p-2 text-lg"
    >
      {{ b.label }}
    </button>
  </div>
</template>

<script>
export default {
  name: "ToolTip",
  computed: {
    buttons: function () {
      return [
        { label: '改行削除', event: 'remove-new-line' },
        { label: '改行追加', event: 'add-new-line' },
      ]
    },
  }
};
</script>

<style scoped>

</style>
