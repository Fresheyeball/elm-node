module Http.Server.Response (..) where

{-|

# Events
@docs onClose, onFinish

# Response
@docs end

# Write
@docs write, writeBuffer, writeChunk, writeHead, writeContinue

# Memebers
@docs getStatusCode, setStatusCode, getStatusMessage, setStatusMessage, setTimeout, isFinished

# Headers
@docs addTrailers, areHeadersSent, removeHeader, setHeader

-}

import Foreign.Pattern.Method as Method
import Foreign.Pattern.Member as Member
import Streams.Chunk
import Streams.String
import Streams.Buffer
import Http.Types exposing (..)
import Emitter.Unsafe as Emitter
import Chunk.Types as Chunk
import Task exposing (Task)
import Time exposing (Time)
import Tuple
import Json.Encode as Encode
import Http.StatusCode exposing (StatusCode)


{-|
Event: 'close'
Indicates that the underlying connection was terminated before response.end() was called or able to flush.
-}
onClose : Response -> Task x () -> Task x (Task x ())
onClose { response } =
    Emitter.on0 "close" response


{-|
Event: 'finish'
Emitted when the response has been sent.
More specifically, this event is emitted when the last segment of the response headers
and body have been handed off to the operating system for transmission over the network.
It does not imply that the client has received anything yet.
After this event, no more events will be emitted on the response object.
-}
onFinish : Response -> Task x () -> Task x (Task x ())
onFinish { response } =
    Emitter.on0 "finish" response


{-|
response.addTrailers(headers)
This method adds HTTP trailing headers (a header but at the end of the message) to the response.
Trailers will only be emitted if chunked encoding is used for the response; if it is not
(e.g., if the request was HTTP/1.0), they will be silently discarded.
Attempting to set a trailer field name that contains invalid characters will result in a
TypeError being thrown.
-}
addTrailers : Response -> List Header -> Task x ()
addTrailers { response } trailers =
    trailers
        |> List.map (Tuple.mapSnd Encode.string)
        |> Method.method1 "addTrailers" response


{-|
response.end([data][, encoding][, callback])
This method signals to the server that all of the response headers and body have been sent; that server should consider this message complete. The method, response.end(), MUST be called on each response.
If data is specified, it is equivalent to calling response.write(data, encoding) followed by response.end(callback).
If callback is specified, it will be called when the response stream is finished.
-}
end : Response -> Task x ()
end { response } =
    Method.method0 "end" response


{-|
response.finished
Boolean value that indicates whether the response has completed. Starts as false. After response.end() executes, the value will be true.
-}
isFinished : Response -> Task x Bool
isFinished { response } =
    Member.read "finished" response


{-|
response.headersSent
Boolean (read-only). True if headers were sent, false otherwise.
-}
areHeadersSent : Response -> Task x Bool
areHeadersSent { response } =
    Member.read "headersSent" response


{-|
response.removeHeader(name)
Removes a header that's queued for implicit sending.
-}
removeHeader : Response -> String -> Task x ()
removeHeader { response } =
    Method.method1 "removeHeader" response


{-|
response.setHeader(name, value)
Sets a single header value for implicit headers. If this header already exists in the to-be-sent headers,
its value will be replaced. Use an array of strings here if you need to send multiple headers with the
same name.Attempting to set a header field name that contains invalid characters will
result in a TypeError being thrown.
-}
setHeader : Response -> Header -> Task x ()
setHeader { response } ( k, v ) =
    Method.method2 "setHeader" response k v


{-|
response.setTimeout(msecs, callback)
msecs Number
callback Function
Sets the Socket's timeout value to msecs. If a callback is provided, then it is added as a
listener on the 'timeout' event on the response object.
If no 'timeout' listener is added to the request, the response, or the server, then sockets are
destroyed when they time out. If you assign a handler on the request, the response, or the
server's 'timeout' events, then it is your responsibility to handle timed out sockets.
-}
setTimeout : Response -> Time -> Task x ()
setTimeout { response } time =
    Method.method1 "setTimeout" response time


{-|
response.statusCode
When using implicit headers (not calling response.writeHead() explicitly),
this property controls the status code that will be sent to the
client when the headers get flushed.
After response header was sent to the client, this property indicates the status code which was sent out.
-}
getStatusCode : Response -> Task x (Maybe StatusCode)
getStatusCode { response } =
    Member.read "statusCode" response
        |> Task.map Http.StatusCode.fromInt


{-|
response.statusCode
When using implicit headers (not calling response.writeHead() explicitly),
this property controls the status code that will be sent to the
client when the headers get flushed.
After response header was sent to the client, this property indicates the status code which was sent out.
-}
setStatusCode : Response -> StatusCode -> Task x ()
setStatusCode { response } statuscode =
    Member.set "statusCode" response
        <| Http.StatusCode.toInt statuscode


{-|
response.statusMessage
When using implicit headers (not calling response.writeHead() explicitly), this property controls the
status message that will be sent to the client when the headers get flushed. If this is left as
undefined then the standard message for the status code will be used.
After response header was sent to the client, this property indicates the status message which was sent out.
-}
getStatusMessage : Response -> Task x String
getStatusMessage { response } =
    Member.read "statusMessage" response


{-|
response.statusMessage
When using implicit headers (not calling response.writeHead() explicitly), this property controls the
status message that will be sent to the client when the headers get flushed. If this is left as
undefined then the standard message for the status code will be used.
After response header was sent to the client, this property indicates the status message which was sent out.
-}
setStatusMessage : Response -> String -> Task x ()
setStatusMessage { response } =
    Member.set "statusMessage" response


{-|
response.write(chunk[, encoding][, callback])
If this method is called and response.writeHead() has not been called, it will switch to implicit
header mode and flush the implicit headers.
This sends a chunk of the response body. This method may be called multiple times to provide
successive parts of the body.
chunk can be a string or a buffer. If chunk is a string, the second parameter specifies how to encode
it into a byte stream. By default the encoding is 'utf8'. The last parameter callback will be called
when this chunk of data is flushed.
Note: This is the raw HTTP body and has nothing to do with higher-level multi-part body encodings
that may be used.
The first time response.write() is called, it will send the buffered header information and the first
body to the client. The second time response.write() is called, Node.js assumes you're going to be
streaming data, and sends that separately. That is, the response is buffered up to the first chunk of body.
Returns true if the entire data was flushed successfully to the kernel buffer. Returns false if all or
part of the data was queued in user memory. 'drain' will be emitted when the buffer is free again.
-}
write : Response -> String -> Task x ()
write =
    Streams.String.write


{-| -}
writeBuffer : Response -> Chunk.Buffer -> Task x ()
writeBuffer =
    Streams.Buffer.write


{-| -}
writeChunk : Response -> Chunk.Chunk -> Task x ()
writeChunk =
    Streams.Chunk.write


{-|
response.writeContinue()
Sends a HTTP/1.1 100 Continue message to the client, indicating that the request body should be sent.
See the 'checkContinue' event on Server.
-}
writeContinue : Response -> Task x ()
writeContinue { response } =
    Method.method0 "writeContinue" response


{-|
response.writeHead(statusCode[, statusMessage][, headers])
Sends a response header to the request. The status code is a 3-digit HTTP status code, like 404.
The last argument, headers, are the response headers. Optionally one can give a human-readable
statusMessage as the second argument.
This method must only be called once on a message and it must be called before response.end() is called.
If you call response.write() or response.end() before calling this, the implicit/mutable
headers will be calculated and call this function for you.
Note that Content-Length is given in bytes not characters. The above example works because the string
'hello world' contains only single byte characters. If the body contains higher coded characters then
Buffer.byteLength() should be used to determine the number of bytes in a given encoding.
And Node.js does not check whether Content-Length and the length of the body which
has been transmitted are equal or not.
-}
writeHead : Response -> StatusCode -> List Header -> Task x ()
writeHead { response } statuscode headers =
    Method.method3
        "writeHead"
        response
        (Http.StatusCode.toInt statuscode)
        (Http.StatusCode.show statuscode)
        (List.map (Tuple.mapSnd Encode.string) headers
            |> Encode.object
        )
