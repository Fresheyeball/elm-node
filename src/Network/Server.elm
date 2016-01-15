module Network.Server (..) where

{-|
# Events
-}

import Network.Types exposing (..)
import Network.Marshall exposing (..)
import Emitter.Unsafe as Emitter
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Method as Method
import Foreign.Marshall as Marshall
import Task exposing (Task)


{-|
Event: 'close'
Emitted when the server closes. Note that if connections exist,
this event is not emitted until all connections are ended.
-}
onClose : Server -> Task x () -> Task x (Task x ())
onClose =
    Emitter.on0 "close"


{-|
Event: 'connection'
Socket object The connection object
Emitted when a new connection is made. socket is an instance of net.Socket.
-}
onConnection : Server -> Task x () -> Task x (Task x ())
onConnection =
    Emitter.on0 "connection"


{-|
Event: 'error'
Error Object
Emitted when an error occurs. The 'close' event will be called directly following this event.
See example in discussion of server.listen.
-}
onError : Server -> (Error -> Task x ()) -> Task x (Task x ())
onError server f =
    Emitter.on1
        "error"
        server
        (Marshall.unsafeToString >> Error >> f)


{-|
Event: 'listening'
Emitted when the server has been bound after calling server.listen.
-}
onListening : Server -> Task x () -> Task x (Task x ())
onListening =
    Emitter.on0 "listening"


{-|
server.address()
Returns the bound address, the address family name and port of the server
as reported by the operating system.
Don't call server.address() until the 'listening' event has been emitted.
-}
address : Server -> Task x SocketAddress
address server =
    Get.get0 "address" server
        |> Task.map marshallSocketAddress


{-|
server.close([callback])

Stops the server from accepting new connections and keeps existing connections.
This function is asynchronous, the server is finally closed when all connections
are ended and the server emits a 'close' event. The optional callback will be
called once the 'close' event occurs. Unlike that event, it will be called
with an Error as its only argument if the server was not open when it was closed.
-}
close : Server -> Task x ()
close =
    Method.method0 "close"


{-|
server.getConnections(callback)
Asynchronously get the number of concurrent connections on the server.
Works when sockets were sent to forks.
Callback should take two arguments err and count.
-}
getConnections : Server -> Task x Int
getConnections =
    Get.getAsync0 "getConnections"


{-|
server.listen(handle[, backlog][, callback])#

handle Object
backlog Number
callback Function
The handle object can be set to either a server or socket (anything with an underlying _handle member), or a {fd: <n>} object.

This will cause the server to accept connections on the specified handle, but it is presumed that the file descriptor or handle has already been bound to a port or domain socket.

Listening on a file descriptor is not supported on Windows.

This function is asynchronous. When the server has been bound, 'listening' event will be emitted. The last parameter callback will be added as a listener for the 'listening' event.

The parameter backlog behaves the same as in [server.listen(port, \[host\], \[backlog\], \[callback\])][].
-}



-- listen : Server -> Port ->


{-|
server.listen(options[, callback])#

options Object - Required. Supports the following properties:
port Number - Optional.
host String - Optional.
backlog Number - Optional.
path String - Optional.
exclusive Boolean - Optional.
callback Function - Optional.
The port, host, and backlog properties of options, as well as the optional callback function, behave as they do on a call to [server.listen(port, \[host\], \[backlog\], \[callback\])][]. Alternatively, the path option can be used to specify a UNIX socket.

If exclusive is false (default), then cluster workers will use the same underlying handle, allowing connection handling duties to be shared. When exclusive is true, the handle is not shared, and attempted port sharing results in an error. An example which listens on an exclusive port is shown below.

server.listen({
  host: 'localhost',
  port: 80,
  exclusive: true
});
-}
{-|
server.listen(path[, backlog][, callback])#

path String
backlog Number
callback Function
Start a local socket server listening for connections on the given path.

This function is asynchronous. When the server has been bound, 'listening' event will be emitted. The last parameter callback will be added as a listener for the 'listening' event.

On UNIX, the local domain is usually known as the UNIX domain. The path is a filesystem path name. It is subject to the same naming conventions and permissions checks as would be done on file creation, will be visible in the filesystem, and will persist until unlinked.

On Windows, the local domain is implemented using a named pipe. The path must refer to an entry in \\?\pipe\ or \\.\pipe\. Any characters are permitted, but the latter may do some processing of pipe names, such as resolving .. sequences. Despite appearances, the pipe name space is flat. Pipes will not persist, they are removed when the last reference to them is closed. Do not forget JavaScript string escaping requires paths to be specified with double-backslashes, such as:

net.createServer().listen(
    path.join('\\\\?\\pipe', process.cwd(), 'myctl'))
The parameter backlog behaves the same as in [server.listen(port, \[host\], \[backlog\], \[callback\])][].
-}
{-|
server.listen(port[, hostname][, backlog][, callback])#

Begin accepting connections on the specified port and hostname. If the hostname is omitted, the server will accept connections on any IPv6 address (::) when IPv6 is available, or any IPv4 address (0.0.0.0) otherwise. A port value of zero will assign a random port.

Backlog is the maximum length of the queue of pending connections. The actual length will be determined by your OS through sysctl settings such as tcp_max_syn_backlog and somaxconn on linux. The default value of this parameter is 511 (not 512).

This function is asynchronous. When the server has been bound, 'listening' event will be emitted. The last parameter callback will be added as a listener for the 'listening' event.

One issue some users run into is getting EADDRINUSE errors. This means that another server is already running on the requested port. One way of handling this would be to wait a second and then try again. This can be done with

server.on('error', (e) => {
  if (e.code == 'EADDRINUSE') {
    console.log('Address in use, retrying...');
    setTimeout(() => {
      server.close();
      server.listen(PORT, HOST);
    }, 1000);
  }
});
(Note: All sockets in Node.js set SO_REUSEADDR already)
-}
{-|
server.maxConnections#

Set this property to reject connections when the server's connection count gets high.

It is not recommended to use this option once a socket has been sent to a child with child_process.fork().
-}
{-|
server.ref()
Opposite of unref, calling ref on a previously unrefd server will not
let the program exit if it's the only server left (the default behavior).
If the server is refd calling ref again will have no effect.
-}
ref : Server -> Task x ()
ref =
    Method.method0 "ref"


{-|
server.unref()
Calling unref on a server will allow the program to exit if this is the
only active server in the event system.
If the server is already unrefd calling unref again will have no effect.
-}
unref : Server -> Task x ()
unref =
    Method.method0 "unref"
