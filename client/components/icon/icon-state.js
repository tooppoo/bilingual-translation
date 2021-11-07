import NoticeLoading from "./NoticeLoading";
import NoticeError from "./NoticeError";
import DummyIcon from "./DummyIcon";

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
