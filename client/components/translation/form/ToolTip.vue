<template>
  <div
    name="tool-tip"
    class="flex py-3 px-2 bg-white border-2 shadow-md justify-between"
    :style="gridStyle"
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
  props: {
    x: {
      type: Number,
      default: 0,
    },
    y: {
      type: Number,
      default: 0,
    },
  },
  computed: {
    buttons: function () {
      return [
        { label: '改行削除', event: 'remove-new-line' },
        { label: '改行追加', event: 'add-new-line' },
      ]
    },
    gridStyle: function () {
      return {
        position: 'absolute',
        left: this.x,
        bottom: this.y,
      }
    }
  }
};
</script>

<style scoped>

</style>
