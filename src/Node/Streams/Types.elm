module Node.Streams.Types where

type ReadableEvent
  = Close
  | Data
  | ReadError
  | End
  | Read

type WritableEvent
  = Drain
  | WriteError
  | Finish
  | Pipe
  | Unpipe

type ReadableRaw = ReadableRaw
type WritableRaw = WritableRaw

type alias Readable =
  { readable : ReadableRaw }

type alias Writable =
  { writable : WritableRaw }

type alias Duplex =
  { readable : ReadableRaw
  , writable : WritableRaw }
