import { data } from '../lib/translation/model/data.js'

export const state = () => ({
  data: data.empty()
})

const internalMessages = {
  mutations: {
    overwrite: 'overwrite',
  },
}
export const messages = {
  mutations: {
    overwrite: `translation/${internalMessages.mutations.overwrite}`,
  }
}

export const mutations = {
  [internalMessages.mutations.overwrite]: (state, data) => {
    state.data = data
  }
}
