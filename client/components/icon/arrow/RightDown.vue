<template>
  <fa :icon="faAngleDoubleDown" class="text-xl" />
</template>

<script>
import { faAngleDoubleDown } from '@fortawesome/free-solid-svg-icons/faAngleDoubleDown'

export default {
  name: 'DownArrow',
  computed: {
    faAngleDoubleDown: () => faAngleDoubleDown,
  },
}
</script>

<style scoped></style>
