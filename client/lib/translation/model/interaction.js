import { data } from './data'
import { httpRequestContext } from './context/http-request-context'

export const initialize = () => data.empty

export const writeSource = (source, current) => ({
  ...current,
  source,
})

export const translate = (gateway) => (state) =>
  httpRequestContext.onTranslationRequest.apply(state, (s) =>
    gateway.translate(s.toPostParams()).then(data => ({
      ...state,
      target: data.translated.body,
    }))
  )

