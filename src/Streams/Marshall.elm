module Streams.Marshall (..) where

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


marshallDuplex : ReadableRaw -> WritableRaw -> Duplex {}
marshallDuplex readable writable =
    { readable = readable
    , writable = writable
    }
