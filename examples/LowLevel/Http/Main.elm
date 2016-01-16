module Main (..) where

import Streams.String exposing (write)
import Http.Server exposing (..)
import Console
import Task exposing (..)


(>|) : Task x a -> Task x b -> Task x b
(>|) t t' =
    t `andThen` always t'


port serve : Task x ()
port serve =
    createServer
        `andThen` \server ->
                    listen server 8080
                        >| Console.blue "Listening on port 8080"
                        >| onRequest
                            server
                            (\( _, res ) -> write res "Request heard")
                        >| succeed ()
