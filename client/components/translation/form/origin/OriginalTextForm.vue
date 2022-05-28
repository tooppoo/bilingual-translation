<template>
  <text-form :value="value" @input="onInput">
    <template #caption> 原文 </template>
  </text-form>
</template>

<script>
import TextForm from '../TextForm'

export default {
  name: 'OriginalTextForm',
  components: {
    TextForm,
  },
  props: {
    value: {
      type: String,
      default: '',
    },
  },
  methods: {
    onInput: function (event) {
      this.$emit('input', event)
    },
  },
}
</script>

<style scoped></style>
