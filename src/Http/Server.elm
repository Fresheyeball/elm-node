module Http.Server (..) where

{-|
Class: http.Server

# Events
@docs onCheckContinue, onConnection, onConnect, onClientError, onClose, onRequest, onUpgrade

# Operations
@docs close, listen, createServer

# Max Headers
@docs getMaxHeaders, setMaxHeaders, modifyMaxHeaders

# Socket Timeout
@docs getSocketTimeout, setSocketTimeout, modifySocketTimeout

# Listen
@docs listen, listenOn, listenOnWithBacklog

# Response
@docs end

-}

import Foreign.Marshall as Marshall
import Foreign.Pattern.Method as Method
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Member as Member
import Foreign.Pattern.Member as Member
import Http.Types exposing (..)
import Http.Marshall exposing (..)
import Network.Types as Net
import Emitter.Unsafe as Emitter
import Chunk.Types as Chunk
import Task exposing (Task)
import Time exposing (Time)


{-|
Event: 'checkContinue'
Emitted each time a request with an http Expect: 100-continue is received. If this event isn't
listened for, the server will automatically respond with a 100 Continue as appropriate.
Handling this event involves calling response.writeContinue() if the client should continue to
send the request body, or generating an appropriate HTTP response (e.g., 400 Bad Request) if
the client should not continue to send the request body.
Note that when this event is emitted and handled, the 'request' event will not be emitted.
-}
onCheckContinue : Server -> (( RequestRaw, Response ) -> Task x ()) -> Task x (Task x ())
onCheckContinue server f =
    Emitter.on2 "checkContinue" server (\( req, res ) -> f ( req, marshallResponse res ))


{-|
Event: 'clientError'
If a client connection emits an 'error' event, it will be forwarded here.
socket is the net.Socket object that the error originated from.
-}
onClientError : Server -> (Error -> Net.Socket -> Task x ()) -> Task x (Task x ())
onClientError server f =
    Emitter.on2
        "clientError"
        server
        (\( rawErr, socket ) ->
            f (Error <| Marshall.unsafeToString rawErr) socket
        )


{-|
Event: 'close'
Emitted when the server closes.
-}
onClose : Server -> Task x () -> Task x (Task x ())
onClose =
    Emitter.on0 "close"


{-|
Event: 'connect'
Emitted each time a client requests a http CONNECT method. If this event isn't listened for,
then clients requesting a CONNECT method will have their connections closed.
request is the arguments for the http request, as it is in the request event.
socket is the network socket between the server and client.
head is an instance of Buffer, the first packet of the tunneling stream, this may be empty.
After this event is emitted, the request's socket will not have a 'data' event listener,
meaning you will need to bind to it in order to handle data sent to the server on that socket.
-}
onConnect : Server -> (RequestRaw -> Net.Socket -> Chunk.Buffer -> Task x ()) -> Task x (Task x ())
onConnect server f =
    Emitter.on3 "connect" server (\( x, y, z ) -> f x y z)


{-|
Event: 'connection'
When a new TCP stream is established. socket is an object of type net.Socket. Usually users will not want to access this event. In particular, the socket will not emit 'readable' events because of how the protocol parser attaches to the socket. The socket can also be accessed at request.connection.
-}
onConnection : Server -> (Net.Socket -> Task x ()) -> Task x (Task x ())
onConnection =
    Emitter.on1 "connection"


{-|
Event: 'request'
Emitted each time there is a request. Note that there may be multiple requests per connection (in the case of
keep-alive connections). request is an instance of http.IncomingMessage and response is an instance of
http.ServerResponse.
-}
onRequest : Server -> (( RequestRaw, Response ) -> Task x ()) -> Task x (Task x ())
onRequest server f =
    Emitter.on2 "request" server (\( req, res ) -> f ( req, marshallResponse res ))


{-|
Event: 'upgrade'
Emitted each time a client requests a http upgrade. If this event isn't listened for, then clients requesting an
upgrade will have their connections closed.
request is the arguments for the http request, as it is in the request event.
socket is the network socket between the server and client.
head is an instance of Buffer, the first packet of the upgraded stream, this may be empty.
After this event is emitted, the request's socket will not have a 'data' event listener, meaning you will need to bind
to it in order to handle data sent to the server on that socket.
-}
onUpgrade : Server -> (RequestRaw -> Net.Socket -> Chunk.Buffer -> Task x ()) -> Task x (Task x ())
onUpgrade server f =
    Emitter.on3 "upgrade" server (\( x, y, z ) -> f x y z)


{-|
server.close([callback])
Stops the server from accepting new connections. See net.Server.close().
-}
close : Server -> Task x ()
close =
    Method.method0 "close"


{-|
server.listen(port[, hostname][, backlog][, callback])
Begin accepting connections on the specified port and hostname.  A port value of zero will assign a random port.
To listen to a unix socket, supply a filename instead of port and hostname.
Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS
through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux.
The default value of this parameter is 511 (not 512).
This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See
also net.Server.listen(port).
-}
listenOnWithBacklog : Server -> { port' : Net.Port, hostname : String, backlog : Int } -> Task x ()
listenOnWithBacklog server { port', hostname, backlog } =
    Method.method3 "listen" server port' hostname backlog


{-|
server.listen(port[, hostname][, backlog][, callback])
Begin accepting connections on the specified port and hostname. A port value of zero will assign a random port.
To listen to a unix socket, supply a filename instead of port and hostname.
This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See
also net.Server.listen(port).
-}
listenOn : Server -> { port' : Net.Port, hostname : String } -> Task x ()
listenOn server { port', hostname } =
    Method.method2 "listen" server port' hostname


{-|
server.listen(port[, hostname][, backlog][, callback])
Begin accepting connections on the specified port. The server will accept
connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise.
A port value of zero will assign a random port.
-}
listen : Server -> Net.Port -> Task x ()
listen =
    Method.method1 "listen"


{-|
server.maxHeadersCount
Limits maximum incoming headers count, equal to 1000 by default. If set to 0 - no limit will be applied.
-}
getMaxHeaders : Server -> Task x Int
getMaxHeaders =
    Member.read "maxHeadersCount"


{-|
server.maxHeadersCount
Limits maximum incoming headers count, equal to 1000 by default. If set to 0 - no limit will be applied.
-}
modifyMaxHeaders : Server -> (Int -> Int) -> Task x ()
modifyMaxHeaders =
    Member.modify "maxHeadersCount"


{-|
server.maxHeadersCount
Limits maximum incoming headers count, equal to 1000 by default. If set to 0 - no limit will be applied.
-}
setMaxHeaders : Server -> Int -> Task x ()
setMaxHeaders =
    Member.set "maxHeadersCount"


{-|
server.timeout
Number Default = 120000 (2 minutes)
The number of milliseconds of inactivity before a socket is presumed to have timed out.
Note that the socket timeout logic is set up on connection, so changing this value
only affects new connections to the server, not any existing connections.
Set to 0 to disable any kind of automatic timeout behavior on incoming connections.
-}
getSocketTimeout : Server -> Task x Time
getSocketTimeout =
    Member.read "timeout"


{-|
server.timeout
Number Default = 120000 (2 minutes)
The number of milliseconds of inactivity before a socket is presumed to have timed out.
Note that the socket timeout logic is set up on connection, so changing this value
only affects new connections to the server, not any existing connections.
Set to 0 to disable any kind of automatic timeout behavior on incoming connections.
-}
modifySocketTimeout : Server -> (Time -> Time) -> Task x ()
modifySocketTimeout =
    Member.modify "timeout"


{-|
server.timeout
Number Default = 120000 (2 minutes)
The number of milliseconds of inactivity before a socket is presumed to have timed out.
Note that the socket timeout logic is set up on connection, so changing this value
only affects new connections to the server, not any existing connections.
Set to 0 to disable any kind of automatic timeout behavior on incoming connections.
-}
setSocketTimeout : Server -> Time -> Task x ()
setSocketTimeout =
    Member.set "setTimeout"


{-|
http.createServer([requestListener])
Returns a new instance of http.Server.
The requestListener is a function which is automatically added to the 'request' event.
-}
createServer : Task x Server
createServer =
    Get.get0 "createServer" (Marshall.unsafeRequire "http")


{-|
Close the response
-}
end : Response -> Task x ()
end { response } =
    Method.method0 "end" response
