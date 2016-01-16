module Http.Server (..) where

{-|
Class: http.Server
This class inherits from net.Server and has the following additional events:

-}

import Foreign.Marshall as Marshall
import Foreign.Pattern.Method as Method
import Http.Types exposing (..)
import Network.Types as Net
import Emitter.Unsafe as Emitter
import Chunk.Types as Chunk
import Task exposing (Task)


{-|
Event: 'checkContinue'
Emitted each time a request with an http Expect: 100-continue is received. If this event isn't
listened for, the server will automatically respond with a 100 Continue as appropriate.
Handling this event involves calling response.writeContinue() if the client should continue to
send the request body, or generating an appropriate HTTP response (e.g., 400 Bad Request) if
the client should not continue to send the request body.
Note that when this event is emitted and handled, the 'request' event will not be emitted.
-}
onCheckContinue : Server -> (( Request, Response ) -> Task x ()) -> Task x (Task x ())
onCheckContinue =
    Emitter.on2 "checkContinue"


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
onConnect : Server -> (Request -> Net.Socket -> Chunk.Buffer -> Task x ()) -> Task x (Task x ())
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
onRequest : Server -> (( Request, Response ) -> Task x ()) -> Task x (Task x ())
onRequest =
    Emitter.on2 "request"


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
onUpgrade : Server -> (Request -> Net.Socket -> Chunk.Buffer -> Task x ()) -> Task x (Task x ())
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
Begin accepting connections on the specified port and hostname. If the hostname is omitted, the server will accept
connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise. A port value of
zero will assign a random port.
To listen to a unix socket, supply a filename instead of port and hostname.
Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS
through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux.
The default value of this parameter is 511 (not 512).
This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See
also net.Server.listen(port).
-}
listenOn' : Server -> { port' : Net.Port, hostname : String, backlog : Int } -> Task x ()
listenOn' server { port', hostname, backlog } =
    Method.method3 "listen" server port' hostname backlog


{-|
server.listen(port[, hostname][, backlog][, callback])
Begin accepting connections on the specified port and hostname. If the hostname is omitted, the server will accept
connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise. A port value of
zero will assign a random port.
To listen to a unix socket, supply a filename instead of port and hostname.
Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS
through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux.
The default value of this parameter is 511 (not 512).
This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See
also net.Server.listen(port).
-}
listenOn : Server -> { port' : Net.Port, hostname : String } -> Task x ()
listenOn server { port', hostname } =
    Method.method2 "listen" server port' hostname


{-|
server.listen(port[, hostname][, backlog][, callback])
Begin accepting connections on the specified port and hostname. If the hostname is omitted, the server will accept
connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise. A port value of
zero will assign a random port.
To listen to a unix socket, supply a filename instead of port and hostname.
Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS
through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux.
The default value of this parameter is 511 (not 512).
This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See
also net.Server.listen(port).
-}
listen : Server -> Net.Port -> Task x ()
listen =
    Method.method1 "listen"


{-|
server.maxHeadersCount
Limits maximum incoming headers count, equal to 1000 by default. If set to 0 - no limit will be applied.
-}
{-|
server.setTimeout(msecs, callback)#

msecs Number
callback Function
Sets the timeout value for sockets, and emits a 'timeout' event on the Server object, passing the socket as an argument, if a timeout occurs.

If there is a 'timeout' event listener on the Server object, then it will be called with the timed-out socket as an argument.

By default, the Server's timeout value is 2 minutes, and sockets are destroyed automatically if they time out. However, if you assign a callback to the Server's 'timeout' event, then you are responsible for handling socket timeouts.

Returns server.
-}
{-|
server.timeout#

Number Default = 120000 (2 minutes)
The number of milliseconds of inactivity before a socket is presumed to have timed out.

Note that the socket timeout logic is set up on connection, so changing this value only affects new connections to the server, not any existing connections.

Set to 0 to disable any kind of automatic timeout behavior on incoming connections.
-}
