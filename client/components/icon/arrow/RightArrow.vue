<template>
  <fa :icon="faAngleDoubleRight" class="text-xl" />
</template>

<script>
import { faAngleDoubleRight } from '@fortawesome/free-solid-svg-icons/faAngleDoubleRight'

export default {
  name: 'RightArrow',
  computed: {
    faAngleDoubleRight: () => faAngleDoubleRight,
  },
}
</script>

<style scoped></style>
