module Main (..) where

import Network.Socket as Socket
import Network
import Task exposing (..)
import Debug


port echo : Task x ()
port echo =
    let
        (>|) t t' =
            t `andThen` always t'

        log message x =
            Debug.log message x
                |> always ()
                |> succeed

        connected = Debug.log "connected" () |> succeed

        data socket chunk =
            log "data" chunk
                >| Socket.end socket

        end = log "disconnected from server" ()
    in
        Network.connectOnPath "/tmp/echo.sock"
            `andThen` \socket ->
                        Socket.onConnect socket connected
                            >| Socket.onEnd socket end
                            >| Socket.onData socket (data socket)
                            >| succeed ()
