module Console (..) where

import Process.Streams exposing (..)
import Streams.String exposing (..)
import Task exposing (Task)


log : String -> Task x ()
log message =
    message
        |> write standardOut


print : a -> Task x ()
print =
    toString >> log
