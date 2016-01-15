module Network.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import Network.Types exposing (..)
import Native.Network


marshallSocketAddress : JSRaw -> SocketAddress
marshallSocketAddress =
    Native.Network.marshallSocketAddress IPv4 IPv6 SocketAddress


marshallFamily : Family -> Int
marshallFamily family =
    case family of
        IPv4 ->
            4

        IPv6 ->
            6
