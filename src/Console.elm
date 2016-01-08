module Console (..) where

import Process.Streams exposing (standardOut, standardError)
import Streams.String exposing (..)
import Task exposing (Task)


print : a -> Task x ()
print =
    toString >> log


log : String -> Task x ()
log =
    flip (++) "\n"
        >> write standardOut
