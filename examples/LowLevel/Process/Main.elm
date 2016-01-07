module Main (..) where

import Process exposing (..)
import Process.Streams exposing (standardOut)
import Streams.String exposing (write)
import Task exposing (..)


(>|) : Task a b -> Task a c -> Task a c
(>|) f f' =
    f `andThen` always f'


out : a -> Task x ()
out =
    toString >> write standardOut


port info : Task x ()
port info =
    out "environment"
        >| (getEnvironment `andThen` out)
        >| out "architecture"
        >| out architecture
