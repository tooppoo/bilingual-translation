const empty = () => ({
  origin: {
    body: '',
  },
  source: {
    body: '',
    isEmpty: function () {
      return [null, '', undefined].includes(this.body)
    },
  },
  translated: '',
  language: {
    from: 'en',
    to: 'ja',
  },
  clone() {
    return {
      origin: { ...this.origin },
      source: { ...this.source },
      translated: this.translated,
      language: { ...this.language },
      clone: this.clone,
    }
  },
})

export const data = {
  empty,
}
