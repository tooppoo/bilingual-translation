
const removeNewLines = {
  apply(d, f) {
    d.removeNewLines = function () {
      const c = Object.create(this)

      c.source.body = this.source.body
        .replace(/- ?\n/g, '')
        .replace(/([^.])\n/g, "$1")

      return c
    }

    const r = f(d)

    delete d.removeNewLines

    return r
  }
}
const removeExcessiveBlank = {
  apply(d, f) {
    d.removeExcessiveBlank = function () {
      const c = Object.create(this)

      c.source.body = this.source.body
        .replace(/[ 　\t\f]*\n[ 　\t\f]*/g, '\n')
        .replace(/[ 　\t\f]+/g, ' ')

      return c
    }

    const r = f(d)

    delete d.removeExcessiveBlank

    return r
  }
}

export const cleanUpContext = {
  removeNewLines,
  removeExcessiveBlank,
}
