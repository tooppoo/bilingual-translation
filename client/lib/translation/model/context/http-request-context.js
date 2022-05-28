import { defineContext } from '../../../shared/context/define-context'

const onTranslationRequest = defineContext(
  (d) => {
    d.toPostParams = () => ({
      language: d.language,
      text: d.source.body.split(/\n{2,}/),
    })
  },
  (d) => {
    delete d.toPostParams
  }
)

export const httpRequestContext = {
  onTranslationRequest,
}
