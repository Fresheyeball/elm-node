module Chunk (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeNull)
import Either exposing (Either(..))
import Native.Chunks


type Buffer
    = Buffer JSRaw


type alias Chunk =
    Either String Buffer


type Encoding
    = Ascii
    | Utf8
    | Hex
    | Base64
    | Binary


defaultEncoding : Encoding
defaultEncoding =
    Utf8


{-| Empty Buffer useful for "no op" use cases
  Think of this value like `Nil` for `Lists`
-}
emptyBuffer : Buffer
emptyBuffer =
    Native.Chunks.emptyBuffer


encodeBufferWith : Buffer -> Encoding -> String
encodeBufferWith buffer encoding =
    Native.Chunks.encodeBuffer buffer (showEncoding encoding)


encodeBuffer : Buffer -> String
encodeBuffer buffer =
    encodeBufferWith buffer defaultEncoding


encodeChunkWith : Chunk -> Encoding -> String
encodeChunkWith chunk encoding =
    Either.elim identity (flip encodeBufferWith encoding) chunk


encodeChunk : Chunk -> String
encodeChunk =
    Either.elim identity encodeBuffer
