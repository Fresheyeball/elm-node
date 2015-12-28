module Network (..) where

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Read exposing (unsafeRead)
import Foreign.Marshall exposing (unsafeRequire)
import Network.Types as N


type Network
    = Network JSRaw


net : Network
net =
    unsafeRequire "net"


isIP : String -> Maybe N.Family
isIP couldBeIP =
    case unsafeRead "isIP" net couldBeIP of
        4 ->
            Just N.IPv4

        6 ->
            Just N.IPv6

        _ ->
            Nothing



-- net.connect(options[, connectListener])
-- net.connect(path[, connectListener])
-- net.connect(port[, host][, connectListener])
-- net.createConnection(options[, connectListener])
-- net.createConnection(path[, connectListener])
-- net.createConnection(port[, host][, connectListener])
-- net.createServer([options][, connectionListener])
