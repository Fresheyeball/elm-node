module Network.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall as Marshall
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


marshallConnection : Connection -> JSRaw
marshallConnection { port', host, localAddress, localPort, family, path } =
    Marshall.portPrimeToPort
        { port' = port'
        , host = host
        , localAddress = Marshall.unsafeNothingIsUndefined localAddress
        , localPort = Marshall.unsafeNothingIsUndefined localPort
        , family = marshallFamily family
        , path = Marshall.unsafeNothingIsUndefined path
        }
