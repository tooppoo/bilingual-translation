
const onCleanUp = {
  apply(d, f) {
    d.cleanUp = function () {
      const c = Object.create(this)

      c.source.body = this.source.body
        .replace(/- ?\n/g, '')
        .replace(/([^.])\n/g, "$1")

      return c
    }

    const r = f(d)

    delete d.cleanUp

    return r
  }
}

export const cleanUpContext = {
  onCleanUp,
}
