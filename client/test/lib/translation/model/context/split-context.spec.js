import { splitContext } from '../../../../../lib/translation/model/context/split-context'

describe('splitContext', () => {
  describe('bySentence', () => {
    it('should split text by sentence delimiter', () => {
      const data = {
        source: {
          body: 'hello. who are you? Im John Doe! lol.',
        },
      }
      splitContext.bySentence.apply(data, (sut) => {
        expect(sut.split('[.?!]').source).toStrictEqual({
          body: 'hello.\nwho are you?\nIm John Doe!\nlol.\n',
        })
      })
    })
  })
})
