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

toNameR : ReadableEvent -> String
toNameR e = case e of
  Data -> "data"
  Read -> "read"
  Close -> "close"
  End -> "end"
  ReadError -> "error"

toNameW : WritableEvent -> String
toNameW e = case e of
  Drain -> "drain"
  Pipe -> "pipe"
  Unpipe -> "unpipe"
  Finish -> "finish"
  WriteError -> "error"

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
