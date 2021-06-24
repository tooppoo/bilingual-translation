
const onTranslationRequest = {
  apply(data, f) {
    data.toPostParams = () => ({
      language: data.language,
      text: data.source.split(/\n{2,}/)
    })

    const res = f(data)

    delete data.toPostParams

    return res
  }
}

export const httpRequestContext = {
  onTranslationRequest
}
