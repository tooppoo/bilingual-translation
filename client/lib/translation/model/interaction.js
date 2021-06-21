
export const initialize = () => ({
  source: '',
  target: '',
  language: {
    from: 'en',
    to: 'ja',
  }
})

export const writeSource = (source, current) => ({
  ...current,
  source,
})

export const translate = (gateway) => (state) =>
  gateway.translate(state).then(data => ({
    ...state,
    target: data.translated.body,
  }))
