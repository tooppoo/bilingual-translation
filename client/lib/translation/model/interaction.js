import { data } from './data'
import { httpRequestContext } from './context/http-request-context'
import { cleanUpContext } from "./context/clean-up-context";
import { splitContext } from "./context/split-context";

const initialize = () => data.empty()

const writeSource = (source, current) => ({
  ...current,
  source,
})

const translate = (gateway) => (state) =>
  httpRequestContext.onTranslationRequest.apply(state, (s) =>
    gateway.translate(s.toPostParams()).then(data => ({
      ...state,
      target: data.translated.body,
    }))
  )
const cleanUp = (state) => cleanUpContext.onCleanUp.apply(
  state,
  s => s.cleanUp()
)
const splitBySentence = (period) => (state) => splitContext.bySentence.apply(state, s => s.split(period))

export const Interaction = {
  initialize,
  writeSource,
  translate,
  cleanUp,
  splitBySentence,
}
