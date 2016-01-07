module Main (..) where

import Process exposing (..)
import Streams.String exposing (write)
import Task exposing (..)


-- import Foreign.Marshall exposing (log)
--
-- port out : Task x ()
-- port out =
--     getEnvironment
--         `andThen` (log
--                     >> toString
--                     >> log
--                     >> writeString standardOut
--                   )


port out : Task x ()
port out =
    write standardOut "wowzers"
