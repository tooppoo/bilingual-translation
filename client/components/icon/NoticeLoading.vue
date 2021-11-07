<template>
  <fa :icon="faCircleNotch" spin class="text-blue-400 text-xl" />
</template>

<script>
import { faCircleNotch } from "@fortawesome/free-solid-svg-icons/faCircleNotch";

export default {
  name: "NoticeLoading",
  computed: {
    faCircleNotch: () => faCircleNotch,
  },
};
</script>

<style scoped>

</style>
