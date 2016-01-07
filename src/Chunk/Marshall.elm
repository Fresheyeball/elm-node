module Chunk.Marshall (..) where

import Chunk.Types exposing (..)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeNull)
import Either exposing (Either(..))
import Native.Chunks


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


{-| Chunks from Node can be either a string or a buffer
    the type is checked on the native side and marshalled into an `Either`
-}
marshallChunk : JSRaw -> Chunk
marshallChunk =
    Native.Chunks.marshall Left Right
