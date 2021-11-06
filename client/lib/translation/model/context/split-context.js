
const bySentence = {
  apply(data, f) {
    data.split = function (period) {
      const c = Object.create(this)

      c.source = this.source.replace(new RegExp(`(${period})`, 'g'), "$1\n")

      return c
    }

    const r = f(data)

    delete data.split

    return r
  }
}

export const splitContext = {
  bySentence,
}
