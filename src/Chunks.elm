module Chunks (..) where

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


showEncoding : Encoding -> String
showEncoding e =
    case e of
        Ascii ->
            "ascii"

        Utf8 ->
            "utf8"

        Hex ->
            "hex"

        Base64 ->
            "base64"

        Binary ->
            "null"


unsafeShowEncoding : Encoding -> String
unsafeShowEncoding e =
    let
        x = showEncoding e
    in
        case x of
            "null" ->
                unsafeNull

            _ ->
                x


{-| Empty Buffer useful for "no op" use cases
  Think of this value like `Nil` for `Lists`
-}
emptyBuffer : Buffer
emptyBuffer =
    Native.Chunks.emptyBuffer


{-| Chunks from Node can be either a string or a buffer
    the type is checked on the native side and marshalled into an `Either`
-}
marshall : JSRaw -> Chunk
marshall =
    Native.Chunks.marshall Left Right
