module Main (..) where

import Streams.String exposing (write)
import Http.Server exposing (..)
import Http.Server.Response exposing (end, getStatusCode)
import String
import Result
import Process
import Console
import Task exposing (..)


(=>) : Task x a -> Task x b -> Task x b
(=>) t t' =
    t `andThen` always t'


port serve : Task x ()
port serve =
    let
        getPort argv =
            case argv of
                "--port" :: (port' :: _) ->
                    port'

                _ :: rest ->
                    getPort rest

                _ ->
                    ""

        port' =
            getPort Process.arguments
                |> String.toInt
                |> Result.withDefault 80

        respond ( _, res ) =
            write res "Howdy!"
                => end res
                => getStatusCode res
                `andThen` \status ->
                            "Request heard with: "
                                ++ toString status
                                |> Console.green
    in
        createServer
            `andThen` \server ->
                        listen server port'
                            => Console.blue ("Listening on port " ++ toString port')
                            => onRequest server respond
                            => succeed ()
