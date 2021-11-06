
const empty = () => ({
  source: '',
  target: '',
  language: {
    from: 'en',
    to: 'ja',
  },
  sourceIsEmpty: function () {
    return [null, '', (void 0)].some(v => this.source === v)
  }
})

export const data = {
  empty
}
