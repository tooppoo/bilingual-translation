
const onTranslationRequest = {
  apply(data, f) {
    data.toPostParams = () => ({
      language: data.language,
      text: data.source.split(/\n{2,}/)
    })

    const r = f(data)

    delete data.toPostParams

    return r
  }
}

export const httpRequestContext = {
  onTranslationRequest
}
