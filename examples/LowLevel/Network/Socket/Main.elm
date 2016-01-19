module Main (..) where

import Network.Socket as Socket
import Network
import Chunk
import Task exposing (..)
import Console exposing (log)


port echo : Task x ()
port echo =
    let
        (=>) t t' =
            t `andThen` always t'

        connected =
            log "connected"

        data socket chunk =
            log ("data: " ++ Chunk.encodeChunk chunk)
                => Socket.end socket

        end = log "disconnected from server"
    in
        Network.connectOnPort 8080
            `andThen` \socket ->
                        Socket.onConnect socket connected
                            => Socket.onEnd socket end
                            => Socket.onData socket (data socket)
                            => succeed ()
