module Node.Streams.Types where

import Native.Node.Streams

type ReadableEvent
  = Data
  | Read
  | Close
  | End
  | ReadError

type WritableEvent
  = Drain
  | Pipe
  | Unpipe
  | Finish
  | WriteError

type Read  = ReadRaw
type Write = WriteRaw

type alias Readable =
  { readable : Read }

type alias Writable =
  { writable : Write }

type alias Duplex =
  { readable : Read
  , writable : Write }

foo : String
foo = Native.Node.Streams.foo
