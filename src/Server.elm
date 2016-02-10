module Server (..) where

import Http.Types
import Http.Server.Request
import Http.Server.Response
import Http.Server exposing (createServer, listen, onRequest)
import Signal exposing (..)
import Task exposing (..)


type alias Request =
    Http.Types.Request


type alias Response =
    Http.Types.Response


type alias Server =
    Http.Types.Server


emptyRequest : Request
emptyRequest =
    Http.Server.Request.emptyRequest


emptyResponse : Response
emptyResponse =
    Http.Server.Response.emptyResponse


(=>) : Task x a -> Task x b -> Task x b
(=>) t t' =
    t `andThen` always t'


serve : Int -> Address ( Request, Response ) -> Task never Server
serve port' address =
    createServer
        `andThen` \server ->
                    listen server port'
                        => onRequest server (send address)
                        => succeed server
