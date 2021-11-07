import { defineContext } from "../../../shared/context/define-context";

const removeNewLines = defineContext(
  (d) => {
    d.removeNewLines = function () {
      const c = Object.create(this)

      c.source.body = this.source.body
        .replace(/- ?\n/g, '')
        .replace(/([^.])\n/g, "$1")

      return c
    }
  },
  (d) => {
    delete d.removeNewLines
  }
)

const removeExcessiveBlank = defineContext(
  (d) => {
    d.removeExcessiveBlank = function () {
      const c = Object.create(this)

      c.source.body = this.source.body
        .replace(/[ 　\t\f]*\n[ 　\t\f]*/g, '\n')
        .replace(/[ 　\t\f]+/g, ' ')

      return c
    }
  },
  (d) => {
    delete d.removeExcessiveBlank
  },
)

export const cleanUpContext = {
  removeNewLines,
  removeExcessiveBlank,
}
