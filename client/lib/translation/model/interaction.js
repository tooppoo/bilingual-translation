import { data } from './data'
import { httpRequestContext } from './context/http-request-context'
import { cleanUpContext } from './context/clean-up-context'
import { splitContext } from './context/split-context'

const initialize = (source) =>
  source ? { ...data.empty(), source } : data.empty()

const changeOrigin = (newOrigin, current) => {
  const next = Object.create(current)
  next.origin.body = newOrigin

  if (current.source.isEmpty()) {
    next.source.body = newOrigin
  }

  return next
}

const writeSource = (source, current) => {
  const next = Object.create(current)
  next.source.body = source

  return next
}

const translate = (gateway) => (state) =>
  httpRequestContext.onTranslationRequest.apply(state, (s) =>
    gateway.translate(s.toPostParams()).then((data) => ({
      ...state,
      translated: data.translated.body,
    }))
  )
const removeNewLines = (state) =>
  cleanUpContext.removeNewLines.apply(state, (s) => s.removeNewLines())
const removeExcessiveBlank = (state) =>
  cleanUpContext.removeExcessiveBlank.apply(state, (s) =>
    s.removeExcessiveBlank()
  )
const splitBySentence = (period) => (state) =>
  splitContext.bySentence.apply(state, (s) => s.split(period))

export const Interaction = {
  initialize,
  changeOrigin,
  writeSource,
  translate,
  removeNewLines,
  removeExcessiveBlank,
  splitBySentence,
}
