import { defineContext } from "../../../shared/context/define-context";

const bySentence = defineContext(
  (d) => {
    d.split = function (period) {
      const c = Object.create(this)

      c.source.body = this.source.body.replace(new RegExp(`(${period})[ 　\t\f]+`, 'g'), "$1\n\n")

      return c
    }
  },
  (d) => {
    delete d.split
  }
)

export const splitContext = {
  bySentence,
}
