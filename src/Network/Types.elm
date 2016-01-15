module Network.Types (..) where

import Foreign.Types exposing (JSRaw)


type Socket
    = Socket JSRaw


type Server
    = Server JSRaw


type alias Port =
    Int


type Family
    = IPv4
    | IPv6


type Error
    = Error String


type alias SocketAddress =
    { port' : Port
    , family : Family
    , address : String
    }
