module Network.Types (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall as Marshall


type Socket
    = Socket JSRaw


type alias Port =
    Int


type Family
    = IPv4
    | IPv6


marshallFamily : Family -> Int
marshallFamily family =
    case family of
        IPv4 ->
            4

        IPv6 ->
            6


type alias SocketAddress =
    { port' : Port
    , family : Family
    , address : String
    }


type alias Connection =
    { port' : Port
    , host : String
    , localAddress : Maybe String
    , localPort : Maybe Port
    , family : Family
    , path : Maybe String
    }


defaultConnection : Connection
defaultConnection =
    { port' = 0
    , host = "localhost"
    , localAddress = Nothing
    , localPort = Nothing
    , family = IPv4
    , path = Nothing
    }


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
