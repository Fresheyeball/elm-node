module Network (isIP, connect, connectOnPort, connectOnPath) where

{-|
@docs isIP

# Socket Connection
@docs connect, connectOnPath, connectOnPort
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Read exposing (unsafeRead)
import Foreign.Marshall exposing (unsafeRequire)
import Task exposing (Task)
import Network.Types exposing (..)


net : JSRaw
net =
    unsafeRequire "net"


{-|
Tests if input is an IP address.
-}
isIP : String -> Maybe Family
isIP couldBeIP =
    case unsafeRead "isIP" net couldBeIP of
        4 ->
            Just IPv4

        6 ->
            Just IPv6

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
    connect { defaultConnection | port' = 8080 }
    `andThen` \socket ->
        onConnect socket <| Signal.send "Connection established on port 8080"
```
-}
connect : Connection -> Task x Socket
connect connection =
    Get.get1 "connect" net (marshallConnection connection)


{-|
connectOnPort port' = connect { defaultConnection | port' = port' }
-}
connectOnPort : Port -> Task x Socket
connectOnPort =
    Get.get1 "connect" net


{-|
connectOnPort path = connect { defaultConnection | path = path }
This also makes the Socket a "local domain socket",
learn more [here](https://nodejs.org/api/net.html#net_socket_connect_options_connectlistener)
-}
connectOnPath : String -> Task x Socket
connectOnPath =
    Get.get1 "connect" net



-- TODO: net.createServer([options][, connectionListener])
