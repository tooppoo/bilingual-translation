import { TappableContext } from '~/lib/shared/context/tappable'

describe('tappable', () => {
  it('allow to use #tap via object only in clojure', () => {
    const data = { name: 'test' }

    const actual = TappableContext.apply(data, (d) =>
      d.tap(() => {
        d.name = 'mutated'
      })
    )

    expect(actual.name).toStrictEqual('mutated')
  })
  it('mutate also original object when mutate the object in clojure', () => {
    const data = { name: 'test' }

    TappableContext.apply(data, (d) =>
      d.tap(() => {
        d.name = 'mutated'
      })
    )
    expect(data.name).toStrictEqual('mutated')
  })
  it('not allow to use #tap out of clojure', () => {
    const data = { name: 'test' }

    TappableContext.apply(data, (d) =>
      d.tap(() => {
        d.name = 'mutated'
      })
    )
    expect(data.tap).toBeUndefined()
  })
})
