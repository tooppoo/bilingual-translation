import DummyIcon from '../DummyIcon'
import NoticeLoading from './NoticeLoading'
import NoticeError from './NoticeError'

export const loading = {
  id: 'loading',
  view: NoticeLoading,
}
export const error = {
  id: 'error',
  view: NoticeError,
}
export const idle = {
  id: 'idle',
  view: DummyIcon,
}
