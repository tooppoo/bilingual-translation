<template>
  <section class="flex-1 flex flex-col">
    <label class="text-2xl">
      <slot name="caption"></slot>
    </label>
    <textarea
      :value="value"
      class="border-2 h-full resize-none"
      @change="onChange"
      @select="onSelect"
    ></textarea>
  </section>
</template>

<script>
export default {
  name: 'TextForm',
  props: {
    value: {
      type: String,
      default: '',
    },
  },
  methods: {
    onChange: function (event) {
      this.$emit('input', event)
    },
    onSelect: function (event) {
      this.$emit('select', event)
    },
  },
}
</script>
