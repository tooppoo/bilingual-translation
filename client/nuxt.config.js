import pkg from './package'
import path from 'path'

export default {
  ssr: false,
  target: 'static',

  rootDir: "../",
  srcDir: "client/",
  generate: {
    dir: "public"
  },

  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: [
    '~/assets/css/tailwind.css'
  ],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
  ],

  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    [
      'nuxt-fontawesome', {
      component: 'fa',
      imports: [
        {
          set: '@fortawesome/free-solid-svg-icons',
          icons: [
            'faCircleNotch',
            'faExclamationCircle',
            'faAngleDoubleDown',
            'faAngleDoubleRight',
          ],
        },
      ]
    }],
  ],
  /*
  ** Axios module configuration
  */
  axios: {
    host: '127.0.0.1',
    port: 3000,
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    },
    postcss: {
      plugins: {
        autoprefixer: require('autoprefixer')
      }
    }
  },
  buildModules: [
    '@nuxt/postcss8',
    '@nuxtjs/tailwindcss'
  ],
  resolve: {
    extensions: ['.js', '.json', '.vue', '.ts'],
    root: path.resolve(__dirname),
    alias: {
      '@': path.resolve(__dirname),
      '~': path.resolve(__dirname),
    },
  }
}
