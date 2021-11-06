<template>
  <div>
    <header class="flex justify-center">
      <nuxt-link class="text-center w-40 mr-2 ml-2 border-r-2 border-l-2" to="/">翻訳</nuxt-link>
      <nuxt-link class="text-center w-40 mr-2 ml-2 border-r-2 border-l-2" to="/CleanUp">整形</nuxt-link>
    </header>
    <nuxt />
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
export default {
  name: 'DefaultLayout'
}
</script>
