module Streams.Types where


import Foreign.Types exposing (JSRaw)


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
toNameR e =
  case e of
    Data -> "data"
    Read -> "read"
    Close -> "close"
    End -> "end"
    ReadError -> "error"


toNameW : WritableEvent -> String
toNameW e =
  case e of
    Drain -> "drain"
    Pipe -> "pipe"
    Unpipe -> "unpipe"
    Finish -> "finish"
    WriteError -> "error"


type Readable =
  Readable JSRaw


type Writable =
  Writable JSRaw


type alias Duplex =
  (Readable, Writable)
