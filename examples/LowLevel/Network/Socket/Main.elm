module Main (..) where

import Network.Socket as Socket
import Network
import Chunk
import Process exposing (standardOut)
import Streams
import Task exposing (..)


port echo : Task x ()
port echo =
    let
        (>|) t t' =
            t `andThen` always t'

        log =
            Streams.writeString standardOut

        connected =
            log "connected"

        data socket chunk =
            log ("data: " ++ Chunks.showChunk chunk)
                >| Socket.end socket

        end = log "disconnected from server"
    in
        Network.connectOnPort 8080
            `andThen` \socket ->
                        Socket.onConnect socket connected
                            >| Socket.onEnd socket end
                            >| Socket.onData socket (data socket)
                            >| succeed ()
