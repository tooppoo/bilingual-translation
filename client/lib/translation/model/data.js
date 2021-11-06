
const empty = () => ({
  origin: {
    body: '',
  },
  source: {
    body: '',
    isEmpty: function () {
      return [null, '', (void 0)].some(v => this.body === v)
    },
  },
  target: '',
  language: {
    from: 'en',
    to: 'ja',
  },
  clone() {
    return {
      origin: { ...this.origin },
      source: { ...this.source },
      target: this.target,
      language: { ...this.language },
      clone: this.clone,
    }
  }
})

export const data = {
  empty
}
