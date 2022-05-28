import { defineContext } from '../../../../lib/shared/context/define-context'

describe(defineContext.name, () => {
  const context1 = defineContext(
    (d) => {
      d.double = function () {
        const c = Object.create(this)
        c.value = this.value * 2

        return c
      }
    },
    (d) => delete d.double
  )
  const context2 = defineContext(
    (d) => {
      d.plusTen = function () {
        const c = Object.create(this)
        c.value = this.value + 10

        return c
      }
    },
    (d) => delete d.plusTen
  )

  describe('apply', () => {
    describe('without callback', () => {
      it('should add behavior to data object', () => {
        const sut = { value: 3 }
        context1.apply(sut)

        expect(sut.double().value).toStrictEqual(6)
      })
    })
    describe('with callback', () => {
      it('should add behavior to data object, but the behavior is available only in callback', () => {
        const data = { value: 3 }
        let value = 0
        context1.apply(data, (sut) => {
          value = sut.double().value
        })

        expect(value).toStrictEqual(6)
        expect(data.double).toBeUndefined()
      })
    })
  })

  describe('and', () => {
    it('should provide concatenated new context', () => {
      const ctx = context1.and(context2)

      const sut = { value: 3 }
      ctx.apply(sut)

      expect(sut.double().plusTen().value).toStrictEqual(16)

      ctx.unapply(sut)
      expect(sut.double).toBeUndefined()
      expect(sut.plusTen).toBeUndefined()
    })
  })
})
