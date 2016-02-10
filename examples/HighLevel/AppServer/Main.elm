module Main (..) where

import Effects exposing (..)
import Task exposing (Task, andThen)
import Http.Types exposing (..)
import Http.Server.Request exposing (emptyRequest)
import Http.Server.Response exposing (emptyResponse, end)
import Http.Server exposing (createServer, onRequest, listen)
import Http.StatusCode exposing (StatusCode)
import Streams.String exposing (write)
import Foreign.Pattern.Member as Member
import Foreign.Marshall as Marshall
import Signal exposing (..)
import Console


(=>) : Task x a -> Task x b -> Task x b
(=>) t t' =
    t `andThen` always t'


type alias RequestRaw =
    Http.Types.Request


type alias ResponseRaw =
    Http.Types.Response


type ServerAction action
    = Incoming RequestRaw
    | Outgoing ResponseRaw
    | Cycle action


type alias Request =
    { url : String
    , method : Http.Types.METHOD
    , statusCode : StatusCode
    }


marshallRequest : RequestRaw -> Request
marshallRequest { request } =
    let
        read = flip Member.unsafeRead request

        marshallStatusCode =
            Http.StatusCode.fromInt
                >> Marshall.unsafeNothingIsUndefined

        marshallMETHOD =
            readMethod
                >> Marshall.unsafeNothingIsUndefined
    in
        Request
            (read "url")
            (read "method" |> marshallMETHOD)
            (read "statusCode" |> marshallStatusCode)


type Response
    = Html String
    | Json String
    | Text String


type alias Model =
    Int


connection : Mailbox ( RequestRaw, ResponseRaw )
connection =
    mailbox ( emptyRequest, emptyResponse )


respond : String -> ResponseRaw -> Task Never ()
respond message res =
    write (Debug.log "res" res) message => end res


port response : Signal (Task Never ())
port response =
    Signal.map (\( _, res ) -> respond "hello" res) connection.signal


port serve : Task Never ()
port serve =
    createServer
        `andThen` \server ->
                    Console.blue "listening on 8000"
                        => listen server 8000
                        => onRequest server (send connection.address)
                        => Task.succeed ()
