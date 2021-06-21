
export const toTranslation = (state) => ({
  language: state.language,
  text: state.source.split(/\n{2,}/)
})
