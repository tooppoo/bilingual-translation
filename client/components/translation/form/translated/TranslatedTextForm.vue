<template>
  <text-form :value="value">
    <template #caption> 翻訳後 </template>
  </text-form>
</template>

<script>
import TextForm from '../TextForm'

export default {
  name: 'TranslatedTextForm',
  components: {
    TextForm,
  },
  props: {
    value: {
      type: String,
      default: '',
    },
  },
}
</script>

<style scoped></style>
