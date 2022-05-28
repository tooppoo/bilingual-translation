<template>
  <text-form :value="value" @input="onInput">
    <template #caption> 翻訳前 </template>
  </text-form>
</template>

<script>
import TextForm from '../TextForm'

export default {
  name: 'SourceTextForm',
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
