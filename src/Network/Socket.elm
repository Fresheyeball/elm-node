module Network.Socket (..) where

{-|

# Events
@docs onClose, onConnect, onData, onDrain, onEnd, onError, onTimeout

# Event Emitter
@docs listenerCount, removeAllListeners, removeAllListeners', setMaxListeners

# Getters
@docs address, bufferSize, bytesRead, bytesWritten

# Methods
@docs destroy, end, pause, resume, setEncoding, setKeepAlive, setKeepAlive', setNoDelay, setTimeout, writeString, unref

# Write Data
@docs writeString, writeString', writeBuffer, writeBuffer', write, write'

# Member Variables
@docs localAddress, localPort, remoteAddress, remoteFamily, remotePort
-}

import Task exposing (Task)
import Foreign.Pattern.Get exposing (get0)
import Foreign.Pattern.Read exposing (read)
import Foreign.Pattern.Method as Method
import Foreign.Marshall exposing (unsafeToString, truthy)
import Emitter.Unsafe as Emitter
import Network.Types exposing (..)
import Chunks exposing (Chunk)
import Either
import Time exposing (Time)


{-|
Inherited from EventEmitter
Returns the number of listners currently attached
-}
listenerCount : Emitter.EventName -> Socket -> Task x Int
listenerCount =
    Emitter.listenerCount


{-|
Inherited from EventEmitter
Remove all listeners for a specific event
-}
removeAllListeners : Emitter.EventName -> Socket -> Task x ()
removeAllListeners =
    Emitter.removeAllListeners


{-|
Inherited from EventEmitter
Remove all listeners for all events
-}
removeAllListeners' : Socket -> Task x ()
removeAllListeners' =
    Emitter.removeAllListeners'


{-|
Inherited from EventEmitter
-}
setMaxListeners : Int -> Socket -> Task x ()
setMaxListeners =
    Emitter.setMaxListeners


{-|
Event: 'close'

Emitted once the socket is fully closed. The argument had_error is a boolean which says if the socket was closed due to a transmission error.
-}
onClose : Socket -> Task x () -> Task x (Task x ())
onClose =
    Emitter.on0 "close"


{-|
Event: 'connect'

Emitted when a socket connection is successfully established.
-}
onConnect : Socket -> Task x () -> Task x (Task x ())
onConnect =
    Emitter.on0 "connect"


{-|
Event: 'data'

Emitted when data is received.
-}
onData : Socket -> (Chunk -> Task x ()) -> Task x (Task x ())
onData s f =
    Emitter.on1 "data" s (f << Chunks.marshall)


{-|
Event: 'drain'

Emitted when the write buffer becomes empty. Can be used to throttle uploads.
-}
onDrain : Socket -> Task x () -> Task x (Task x ())
onDrain =
    Emitter.on0 "drain"


{-|
Event: 'end'

Emitted when the other end of the socket sends a FIN packet.

By default (allowHalfOpen == false) the socket will destroy its file descriptor once it
has written out its pending write queue. However, by setting allowHalfOpen == true the
socket will not automatically end() its side allowing the user to write arbitrary amounts
of data, with the caveat that the user is required to end() their side now.
-}
onEnd : Socket -> Task x () -> Task x (Task x ())
onEnd =
    Emitter.on0 "end"


{-|
Event: 'error'

Emitted when an error occurs.
The 'close' event will be called directly following this event.
-}
onError : Socket -> (String -> Task x ()) -> Task x (Task x ())
onError s f =
    Emitter.on1 "error" s (f << unsafeToString)


{-|
Event: 'timeout'

Emitted if the socket times out from inactivity.
This is only to notify that the socket has been idle.
The user must manually close the connection.
-}
onTimeout : Socket -> Task x () -> Task x (Task x ())
onTimeout =
    Emitter.on0 "timeout"


{-|
socket.address()

Returns the bound address, the address family name and port of the socket as reported by the operating system.
-}
address : Socket -> Task x SocketAddress
address =
    get0 "address"
        >> Task.map marshallSocketAddress


{-|
socket.bufferSize

Users who experience large or growing bufferSize should attempt to "throttle"
the data flows in their program with `pause` and `resume`.
-}
bufferSize : Socket -> Task x Int
bufferSize =
    read "bufferSize"


{-|
socket.bytesRead

The amount of received bytes.
-}
bytesRead : Socket -> Task x Int
bytesRead =
    read "bytesRead"


{-|
socket.bytesWritten

The amount of bytes sent.
-}
bytesWritten : Socket -> Task x Int
bytesWritten =
    read "bytesWritten"


{-|
socket.destroy()

Ensures that no more I/O activity happens on this socket.
Only necessary in case of errors (parse error or so).
-}
destroy : Socket -> Task x ()
destroy =
    Method.method0 "destroy"


{-|
socket.end([data][, encoding])

Half-closes the socket. i.e., it sends a FIN packet. It is possible the server will still send some data.

If data is specified, it is equivalent to calling `socket.write(data, encoding)` followed by `socket.end()`.
-}
end : Socket -> Task x ()
end =
    Method.method0 "end"


{-|
socket.localAddress

The string representation of the local IP address the remote client is connecting on.
For example, if you are listening on `"0.0.0.0"` and the client connects
on `"192.168.1.1"`, the value would be `"192.168.1.1"`.
-}
localAddress : Socket -> Task x String
localAddress =
    read "localAddress"


{-|
socket.localPort

The numeric representation of the local port. For example, `80` or `21`.
-}
localPort : Socket -> Task x Port
localPort =
    read "localPort"


{-|
socket.pause()

Pauses the reading of data. That is, 'data' events will not be emitted. Useful to throttle back an upload.
-}
pause : Socket -> Task x ()
pause =
    Method.method0 "pause"


{-|
socket.remoteAddress

The string representation of the remote IP address.
For example, '74.125.127.100' or '2001:4860:a005::68'.
Value may be undefined if the socket is destroyed (for example, if the client disconnected).
-}
remoteAddress : Socket -> Task x (Maybe String)
remoteAddress socket =
    let
        marshall raw =
            if truthy raw then
                Just (unsafeToString raw)
            else
                Nothing
    in
        Task.map marshall <| read "remoteAddress" socket


{-|
socket.remoteFamily

The string representation of the remote IP family. `"IPv4"` or `"IPv6"`.
-}
remoteFamily : Socket -> Task x (Maybe Family)
remoteFamily socket =
    let
        marshall couldBeIP =
            case couldBeIP of
                "IPv4" ->
                    Just IPv4

                "IPv6" ->
                    Just IPv6

                _ ->
                    Nothing
    in
        Task.map marshall <| read "remoteFamily" socket


{-|
socket.remotePort

The numeric representation of the remote port. For example, `80` or `21`.
-}
remotePort : Socket -> Task x Port
remotePort =
    read "remotePort"


{-|
socket.resume()

Resumes reading after a call to `pause()`.
-}
resume : Socket -> Task x ()
resume =
    Method.method0 "resume"


{-|
socket.setEncoding([encoding])

Set the encoding for the socket as a Readable Stream. See stream.setEncoding() for more information.
-}
setEncoding : Socket -> Chunks.Encoding -> Task x ()
setEncoding socket encoding =
    Method.method1 "setEncoding" socket (Chunks.showEncoding encoding)


{-|
socket.setKeepAlive([enable][, initialDelay])

Enable/disable keep-alive functionality, enable defaults to false.
-}
setKeepAlive : Socket -> Bool -> Task x ()
setKeepAlive =
    Method.method1 "setKeepAlive"


{-|
socket.setKeepAlive([enable][, initialDelay])

Enable/disable keep-alive functionality, and ~~optionally~~ set the
initial delay before the first keepalive probe is sent on an idle socket.
enable defaults to false.

Set initialDelay (in milliseconds) to set the delay between the last data packet received
and the first keepalive probe. Setting 0 for initialDelay will leave the value unchanged
from the default (or previous) setting.
-}
setKeepAlive' : Socket -> Bool -> Time -> Task x ()
setKeepAlive' =
    Method.method2 "setKeepAlive"


{-|
socket.setNoDelay([noDelay])

Disables the Nagle algorithm. By default TCP connections use the Nagle algorithm,
they buffer data before sending it off. Setting true for noDelay will immediately
fire off data each time `socket.write()` is called.
-}
setNoDelay : Socket -> Bool -> Task x ()
setNoDelay =
    Method.method1 "setNoDelay"


{-|
socket.setTimeout(timeout[, callback])

Sets the socket to timeout after timeout milliseconds of inactivity on the socket.
By default net.Socket do not have a timeout.

When an idle timeout is triggered the socket will receive a `'timeout'` event but the
connection will not be severed. The user must manually `end()` or `destroy()` the socket.

If timeout is 0, then the existing idle timeout is disabled.
-}
setTimeout : Socket -> Time -> Task x ()
setTimeout =
    Method.method1 "setTimeout"


{-|
socket.unref()

Calling unref on a socket will allow the program to exit if this is the
only active socket in the event system. If the socket is already unrefd calling unref again will have no effect.
-}
unref : Socket -> Task x ()
unref =
    Method.method0 "unref"


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket. encoding will be UTF8 encoding.
'drain' will be emitted when the buffer is again free.
-}
writeString : Socket -> String -> Task x ()
writeString =
    Method.methodAsync1 "write"


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket.
'drain' will be emitted when the buffer is again free.
-}
writeString' : Socket -> String -> Chunks.Encoding -> Task x ()
writeString' socket string encoding =
    Method.methodAsync2 "write" socket string (Chunks.showEncoding encoding)


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket. encoding will be UTF8 encoding.
'drain' will be emitted when the buffer is again free.
-}
writeBuffer : Socket -> Chunks.Buffer -> Task x ()
writeBuffer =
    Method.methodAsync1 "write"


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket.
'drain' will be emitted when the buffer is again free.
-}
writeBuffer' : Socket -> Chunks.Buffer -> Chunks.Encoding -> Task x ()
writeBuffer' socket buffer encoding =
    Method.methodAsync2 "write" socket buffer (Chunks.showEncoding encoding)


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket. encoding will be UTF8 encoding.
'drain' will be emitted when the buffer is again free.
-}
write : Socket -> Chunk -> Task x ()
write socket chunk =
    case chunk of
        Either.Left string ->
            Method.methodAsync1 "write" socket string

        Either.Right buffer ->
            Method.methodAsync1 "write" socket buffer


{-|
socket.write(data[, encoding][, callback])

Sends data on the socket.
'drain' will be emitted when the buffer is again free.
-}
write' : Socket -> Chunk -> Chunks.Encoding -> Task x ()
write' socket chunk encoding =
    let
        encoding' = Chunks.showEncoding encoding
    in
        case chunk of
            Either.Left string ->
                Method.methodAsync2 "write" socket string encoding'

            Either.Right buffer ->
                Method.methodAsync2 "write" socket buffer encoding'
