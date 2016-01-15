module Network.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall as Marshall
import Network.Types exposing (..)
import Native.Network


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


marshallSocketAddress : JSRaw -> SocketAddress
marshallSocketAddress =
    Native.Network.marshallSocketAddress IPv4 IPv6 SocketAddress
