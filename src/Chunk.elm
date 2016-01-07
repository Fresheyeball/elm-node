module Chunk (..) where

{-|
In Node's native api, many function work with either a `Buffer` or a `String`. Here those
concepts have been split out and made explicit as `Chunk`.

# String
@docs defaultEncoding

# Buffer
@docs emptyBuffer, encodeBufferWith, encodeBuffer

# Chunk
@docs encodeChunk, encodeChunkWith
-}

import Either exposing (Either(..))
import Chunk.Types exposing (..)
import Chunk.Marshall exposing (..)
import Native.Chunks


{-|
Default encoding is `Utf8` as specified by Nodes
-}
defaultEncoding : Encoding
defaultEncoding =
    Utf8


{-| Empty Buffer useful for "no op" use cases
  Think of this value like `Nil` for `Lists`
-}
emptyBuffer : Buffer
emptyBuffer =
    Native.Chunks.emptyBuffer


{-|
Encode a binary buffer to a string, using a specific encoding
-}
encodeBufferWith : Buffer -> Encoding -> String
encodeBufferWith buffer encoding =
    Native.Chunks.encodeBuffer buffer (showEncoding encoding)


{-|
Same as `encodeBufferWith` but defaulting to `Utf8`
-}
encodeBuffer : Buffer -> String
encodeBuffer buffer =
    encodeBufferWith buffer defaultEncoding


{-|
Encode a chunk to a string, if its a binary buffer use the specified encoding,
if its a string just return the string.
-}
encodeChunkWith : Chunk -> Encoding -> String
encodeChunkWith chunk encoding =
    Either.elim identity (flip encodeBufferWith encoding) chunk


{-|
Same as `encodeChunkWith` but defaulting to `Utf8`
-}
encodeChunk : Chunk -> String
encodeChunk =
    Either.elim identity encodeBuffer
