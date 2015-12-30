module Network (isIP) where

{-|
@docs isIP
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Read exposing (unsafeRead)
import Foreign.Marshall exposing (unsafeRequire)
import Task exposing (Task)
import Network.Types as Network


net : JSRaw
net =
    unsafeRequire "net"


{-|
Tests if input is an IP address.
-}
isIP : String -> Maybe Network.Family
isIP couldBeIP =
    case unsafeRead "isIP" net couldBeIP of
        4 ->
            Just Network.IPv4

        6 ->
            Just Network.IPv6

        _ ->
            Nothing


{-|
net.connect(options[, connectListener])
A factory function, which returns a new net.Socket and automatically connects with the supplied options.

The options are passed to both the net.Socket constructor and the socket.connect method.

```
-- TODO: Test this sample code
port foo : Task x ()
port foo =
    let
        socket = connect { defaultConnection | port' = 8080 }
    in
        onConnect socket (Signal.send "Connection established on port 8080")
```
-}
connect : Network.Connection -> Task x Network.Socket
connect connection =
    Get.get1 "connect" net (Network.marshallConnection connection)


{-|
connectOnPort port' = connect { defaultConnection | port' = port' }
-}
connectOnPort : Network.Port -> Task x Network.Socket
connectOnPort =
    Get.get1 "connect" net


{-|
connectOnPort path = connect { defaultConnection | path = path }
This also makes the Socket a "local domain socket",
learn more [here](https://nodejs.org/api/net.html#net_socket_connect_options_connectlistener)
-}
connectOnPath : String -> Task x Network.Socket
connectOnPath =
    Get.get1 "connect" net



-- TODO: net.createServer([options][, connectionListener])
