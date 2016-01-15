module Streams.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import Streams.Types exposing (..)
import Native.Streams


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
marshallDuplex =
    Native.Streams.marshallDuplex
