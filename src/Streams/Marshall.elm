module Streams.Marshall (..) where

import Streams.Types exposing (ReadableEvent(..), WritableEvent(..))


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
