export const TappableContext = {
  apply(obj, f) {
    obj.tap = (f2) => {
      f2(obj)

      return obj
    }

    const r = f(obj)

    delete obj.tap

    return r
  },
}
