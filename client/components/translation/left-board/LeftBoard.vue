<template>
  <div class="items-center flex flex-col w-48 pt-8" >
    <menu-link href="/" class="mt-2 mb-2">翻訳</menu-link>
    <menu-link href="/clean-up" class="mt-2 mb-2">整形</menu-link>
  </div>
</template>

<script>
import MenuLink from "./MenuLink";

export default {
  name: "LeftBoard",
  components: {
    MenuLink,
  }
};
</script>

<style scoped>

</style>
