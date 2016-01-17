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


{-|
Connection options
-}
type alias Connection =
    { port' : Port
    , host : String
    , localAddress : Maybe String
    , localPort : Maybe Port
    , family : Family
    , path : Maybe String
    }


{-| -}
defaultConnection : Connection
defaultConnection =
    { port' = 0
    , host = "localhost"
    , localAddress = Nothing
    , localPort = Nothing
    , family = IPv4
    , path = Nothing
    }
