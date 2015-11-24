module Node.Streams.Types where

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

type Chunk = ChunkRaw
type alias Encoding = String

utf8 : Encoding
utf8 = "utf8"

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

splitDuplex : Duplex -> (Readable, Writable)
splitDuplex {readable, writable} =
  ( {readable = readable}
  , {writable = writable} )
