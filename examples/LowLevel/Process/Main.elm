module Main (..) where

import Process exposing (..)
import Process.Streams exposing (standardOut)
import Streams.String exposing (write)
import Task exposing (..)


port out : Task x ()
port out =
    getEnvironment
        `andThen` (toString >> write standardOut)



-- port murf : Task x ()
-- port murf =
--     write standardOut "wowzerss"
