import path from 'path'
import pkg from './package'

export default {
  ssr: false,
  target: 'static',

  /*
   ** Headers of the page
   */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },

  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },

  /*
   ** Global CSS
   */
  css: ['~/assets/css/tailwind.css'],

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [],

  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
  ],
  /*
   ** Axios module configuration
   */
  axios: {
    host: '127.0.0.1',
    port: 3001,
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    postcss: {
      plugins: {
        /**
         * fontawesome-svg-coreからsyntax errorが上がってくる問題の回避策
         * https://virment.com/how-to-fix-nuxt-generate-font-awsome-css-error/
         */
        'postcss-custom-properties': false,
        autoprefixer: require('autoprefixer'),
      },
    },
  },
  buildModules: [
    '@nuxt/postcss8',
    '@nuxtjs/tailwindcss',
    '@nuxtjs/eslint-module',
    [
      '@nuxtjs/fontawesome',
      {
        component: 'fa',
        suffix: true,
        icons: {
          solid: [
            'faCircleNotch',
            'faExclamationCircle',
            'faAngleDoubleDown',
            'faAngleDoubleRight',
          ],
        },
      },
    ],
  ],
  resolve: {
    extensions: ['.js', '.json', '.vue', '.ts'],
    root: path.resolve(__dirname),
    alias: {
      '@': path.resolve(__dirname),
      '~': path.resolve(__dirname),
    },
  },
}
