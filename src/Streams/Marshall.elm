module Streams.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeIdentity)
import Streams.Types exposing (..)


toNameR : ReadableEvent -> String
toNameR e =
    case e of
        Data ->
            "data"

        Read ->
            "read"

        Close ->
            "close"

        End ->
            "end"

        ReadError ->
            "error"


toNameW : WritableEvent -> String
toNameW e =
    case e of
        Drain ->
            "drain"

        Pipe ->
            "pipe"

        Unpipe ->
            "unpipe"

        Finish ->
            "finish"

        WriteError ->
            "error"


marshallWritable : WritableRaw -> Writable {}
marshallWritable raw =
    { writable = raw }


marshallReadable : ReadableRaw -> Readable {}
marshallReadable raw =
    { readable = raw }


marshallDuplex : JSRaw -> Duplex {}
marshallDuplex raw =
    { writable = unsafeIdentity raw
    , readable = unsafeIdentity raw
    }
