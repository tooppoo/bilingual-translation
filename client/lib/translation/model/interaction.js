import { data } from './data'
import { httpRequestContext } from './context/http-request-context'
import { cleanUpContext } from "./context/clean-up-context";

export const initialize = () => data.empty()

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
export const cleanUp = (state) => cleanUpContext.onCleanUp.apply(
  state,
  s => s.cleanUp()
)

export const Interaction = {
  initialize,
  writeSource,
  translate,
  cleanUp,
}
