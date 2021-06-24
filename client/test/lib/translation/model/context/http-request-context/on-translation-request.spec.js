import { httpRequestContext } from "~/lib/translation/model/context/http-request-context"

describe('onTranslationRequest', () => {
  const sut = httpRequestContext.onTranslationRequest

  it('should add #translate, which enable only between callback, to data object', () => {
    const data = {
      language: {
        from: 'en',
        to: 'ja',
      },
      source: `
text 1
text 2

text 3`
    }

    expect(
      sut.apply(data, d => d.toPostParams())
    ).toStrictEqual({
      language: {
        from: 'en',
        to: 'ja'
      },
      text: [
        `\ntext 1\ntext 2`,
        `text 3`
      ]
    })
  })
})
