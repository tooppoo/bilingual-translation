<template>
  <nuxt-link :to="href" class="text-center w-40 border-b-2">
    <slot></slot>
  </nuxt-link>
</template>

<script>
export default {
  name: "MenuLink",
  props: {
    href: String,
  },
};
</script>

<style scoped>

</style>
