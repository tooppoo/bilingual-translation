<template>
  <fa :icon="faExclamationCircle" class="text-red-600 text-xl" />
</template>

<script>
import { faExclamationCircle } from '@fortawesome/free-solid-svg-icons/faExclamationCircle'

export default {
  name: 'NoticeError',
  computed: {
    faExclamationCircle: () => faExclamationCircle,
  },
}
</script>

<style scoped></style>
