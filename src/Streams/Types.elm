module Streams.Types where

import OOFFI
import Either exposing (..)

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

type Buffer = BufferRaw
            | BufferEmpty
type alias Chunk = Either String Buffer

type Encoding
  = Ascii
  | Utf8
  | Hex
  | Base64
  | Binary

toNameE : Encoding -> String
toNameE e = case e of
  Ascii -> "ascii"
  Utf8 -> "utf8"
  Hex -> "hex"
  Base64 -> "base64"
  Binary -> "null"

unsafeToNameE : Encoding -> String
unsafeToNameE e =
  let x = toNameE e in case x of
    "null" -> OOFFI.unsafeNull
    _ -> x

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
