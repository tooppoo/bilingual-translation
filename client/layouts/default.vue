<template>
  <div class="flex">
    <left-board id="left-board" class="flex-initial" />
    <nuxt id ="right-board" class="flex-auto" />
  </div>
</template>

<style>
html {
  font-family: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  margin: 0;
}

</style>

<script>
import LeftBoard from "../components/translation/left-board/LeftBoard";

export default {
  name: 'DefaultLayout',
  components: {
    LeftBoard,
  },
}
</script>
