import { httpRequestContext } from '~/lib/translation/model/context/http-request-context'

describe('onTranslationRequest', () => {
  const sut = httpRequestContext.onTranslationRequest

  it('allow to use #translate only in clojure', () => {
    const data = {
      language: {
        from: 'en',
        to: 'ja',
      },
      source: {
        body: `
text 1
text 2

text 3`,
      },
    }

    expect(sut.apply(data, (d) => d.toPostParams())).toStrictEqual({
      language: {
        from: 'en',
        to: 'ja',
      },
      text: [`\ntext 1\ntext 2`, `text 3`],
    })
  })

  it('not allow to use #translate out of clojure', () => {
    const data = {
      language: {
        from: 'en',
        to: 'ja',
      },
      source: {
        body: `
text 1
text 2

text 3`,
      },
    }

    sut.apply(data, (d) => d.toPostParams())

    expect(data.toPostParams).toBeUndefined()
  })
})
