module Http.Server (..) where

{-|
Class: http.Server#
This class inherits from net.Server and has the following additional events:

-}

import Http.Types exposing (..)
import Emitter.Unsafe as Emitter


{-|
Event: 'checkContinue'#

function (request, response) { }

Emitted each time a request with an http Expect: 100-continue is received. If this event isn't listened for, the server will automatically respond with a 100 Continue as appropriate.

Handling this event involves calling response.writeContinue() if the client should continue to send the request body, or generating an appropriate HTTP response (e.g., 400 Bad Request) if the client should not continue to send the request body.

Note that when this event is emitted and handled, the 'request' event will not be emitted.
-}
{-|
Event: 'clientError'#

function (exception, socket) { }

If a client connection emits an 'error' event, it will be forwarded here.

socket is the net.Socket object that the error originated from.
-}
{-|
Event: 'close'#

function () { }

Emitted when the server closes.
-}
{-|
Event: 'connect'#

function (request, socket, head) { }

Emitted each time a client requests a http CONNECT method. If this event isn't listened for, then clients requesting a CONNECT method will have their connections closed.

request is the arguments for the http request, as it is in the request event.
socket is the network socket between the server and client.
head is an instance of Buffer, the first packet of the tunneling stream, this may be empty.
After this event is emitted, the request's socket will not have a 'data' event listener, meaning you will need to bind to it in order to handle data sent to the server on that socket.
-}
{-|
Event: 'connection'#

function (socket) { }

When a new TCP stream is established. socket is an object of type net.Socket. Usually users will not want to access this event. In particular, the socket will not emit 'readable' events because of how the protocol parser attaches to the socket. The socket can also be accessed at request.connection.
-}
{-|
Event: 'request'#

function (request, response) { }

Emitted each time there is a request. Note that there may be multiple requests per connection (in the case of keep-alive connections). request is an instance of http.IncomingMessage and response is an instance of http.ServerResponse.
-}
{-|
Event: 'upgrade'#

function (request, socket, head) { }

Emitted each time a client requests a http upgrade. If this event isn't listened for, then clients requesting an upgrade will have their connections closed.

request is the arguments for the http request, as it is in the request event.
socket is the network socket between the server and client.
head is an instance of Buffer, the first packet of the upgraded stream, this may be empty.
After this event is emitted, the request's socket will not have a 'data' event listener, meaning you will need to bind to it in order to handle data sent to the server on that socket.
-}
{-|
server.close([callback])#

Stops the server from accepting new connections. See net.Server.close().
-}
{-|
server.listen(handle[, callback])#

handle Object
callback Function
The handle object can be set to either a server or socket (anything with an underlying _handle member), or a {fd: <n>} object.

This will cause the server to accept connections on the specified handle, but it is presumed that the file descriptor or handle has already been bound to a port or domain socket.

Listening on a file descriptor is not supported on Windows.

This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See also net.Server.listen().

Returns server.
-}
{-|
server.listen(path[, callback])#

Start a UNIX socket server listening for connections on the given path.

This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See also net.Server.listen(path).
-}
{-|
server.listen(port[, hostname][, backlog][, callback])#

Begin accepting connections on the specified port and hostname. If the hostname is omitted, the server will accept connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise. A port value of zero will assign a random port.

To listen to a unix socket, supply a filename instead of port and hostname.

Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux. The default value of this parameter is 511 (not 512).

This function is asynchronous. The last parameter callback will be added as a listener for the 'listening' event. See also net.Server.listen(port).
-}
{-|
server.maxHeadersCount#

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
