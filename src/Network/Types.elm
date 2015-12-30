module Network.Types (..) where

import Foreign.Types exposing (JSRaw)


type Socket
    = Socket JSRaw


type alias Port =
    Int


type Family
    = IPv4
    | IPv6


type alias SocketAddress =
    { port' : Port
    , family : Family
    , address : String
    }


type alias Connection =
    { port' : Port
    , host : String
    , localAddress : String
    , localPort : Port
    , family : Family
    }


type alias LocalConnection =
    { port' : Port
    , host : String
    , localAddress : String
    , localPort : Port
    , family : Family
    , path : String
    }


marshallSocketAddress : JSRaw -> SocketAddress
marshallSocketAddress =
    Native.Network.marshallSocketAddress IPv4 IPv6 SocketAddress
