
const empty = () => ({
  origin: {
    body: '',
  },
  source: {
    body: '',
    isEmpty: function () {
      return [null, '', (void 0)].some(v => this.source === v)
    },
  },
  target: '',
  language: {
    from: 'en',
    to: 'ja',
  },
})

export const data = {
  empty
}
