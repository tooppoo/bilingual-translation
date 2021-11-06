import { data } from './data'
import { httpRequestContext } from './context/http-request-context'
import { cleanUpContext } from "./context/clean-up-context";
import { splitContext } from "./context/split-context";

const initialize = (source) => source
  ? { ...data.empty(), source }
  : data.empty()

const changeOrigin = (newOrigin, current) => {
  const next = Object.create(current)
  next.origin = {
    ...current.origin,
    body: newOrigin
  }

  if (current.source.isEmpty()) {
    next.source = {
      ...current.source,
      body: newOrigin
    }
  }

  return next
}

const writeSource = (source, current) => ({
  ...current,
  source: {
    ...current.source,
    body: source,
  },
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
const splitBySentence =
  (period) =>
  (state) => splitContext.bySentence.apply(state, s => s.split(period))

export const Interaction = {
  initialize,
  changeOrigin,
  writeSource,
  translate,
  cleanUp,
  splitBySentence,
}
