
export function defineContext(applier, unapplier) {
  return {
    apply(d, f) {
      applier(d)

      if (f) {
        const r = f(d)
        unapplier(d)

        return r
      } else {
        return null
      }
    },
    unapply(d) {
      unapplier(d)
    },
    and(contexts) {
      return concatContexts([this, ...contexts])
    }
  }
}

export function concatContexts(contexts) {
  return defineContext(
    (d) => {
      contexts.forEach(ctx => ctx.apply(d))
    },
    (d) => {
      contexts.forEach(ctx => ctx.unapply(d))
    }
  )
}
