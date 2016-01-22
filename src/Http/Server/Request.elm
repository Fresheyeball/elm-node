module Http.Server.Request (..) where

{-|
Class: http.IncomingMessage
An IncomingMessage object is created by http.Server or http.ClientRequest and passed as the first argument to the 'request' and 'response' event respectively. It may be used to access response status, headers and data.

It implements the Readable Stream interface, as well as the following additional events, methods, and properties.
-}

import Http.Types exposing (..)
import Foreign.Marshall as Marshall
import Foreign.Pattern.Member as Member
import Foreign.Pattern.Method as Method
import Emitter.Unsafe as Emitter
import Network.Types exposing (..)
import Task exposing (Task)
import Time exposing (Time)
import Native.Network


infixr 4 `map`
map : (a -> b) -> Task x a -> Task x b
map =
    Task.map


{-|
none, request
-}
emptyRequest : Request
emptyRequest =
    Native.Network.emptyReq


{-|
Event: 'close'
Indicates that the underlying connection was closed.
Just like 'end', this event occurs only once per response.
-}
onClose : Request -> Task x () -> Task x (Task x ())
onClose { request } task =
    Emitter.on0 "close" request task


{-|
message.headers
The request/response headers object.
Key-value pairs of header names and values. Header names are lower-cased. Example:
Duplicates in raw headers are handled in the following ways, depending on the header name:
Duplicates of age, authorization, content-length, content-type, etag, expires, from, host,
if-modified-since, if-unmodified-since, last-modified, location, max-forwards,
 proxy-authorization, referer, retry-after, or user-agent are discarded.
set-cookie is always an array. Duplicates are added to the array.
For all other headers, the values are joined together with ', '.
-}
getHeaders : Request -> Task x (List Header)
getHeaders { request } =
    Marshall.unsafeFromArray
        `map` Member.read "headers" request


{-|
message.httpVersion
In case of server request, the HTTP version sent by the client. In the case of client response,
the HTTP version of the connected-to server. Probably either '1.1' or '1.0'.
Also response.httpVersionMajor is the first integer and response.httpVersionMinor is the second.
-}
getHttpVersion : Request -> Task x String
getHttpVersion { request } =
    Member.read "httpVersion" request


{-|
message.method
Only valid for request obtained from http.Server.
The request method as a string. Read only. Example: 'GET', 'DELETE'.
-}
getMethod : Request -> Task x (Maybe METHOD)
getMethod { request } =
    readMethod
        `map` Member.read "method" request


tupler : List a -> List ( a, a )
tupler xs =
    case xs of
        k :: (v :: rest) ->
            ( k, v ) :: tupler rest

        _ ->
            []


{-|
message.rawHeaders
The raw request/response headers list exactly as they were received.
Note that the keys and values are in the same list. It is not a list of tuples.
So, the even-numbered offsets are key values, and the odd-numbered offsets are the associated values.
Header names are not lowercased, and duplicates are not merged.
-}
getRawHeaders : Request -> Task x (List Header)
getRawHeaders { request } =
    tupler
        `map` Marshall.unsafeFromArray
        `map` Member.read "rawHeaders" request


{-|
message.rawTrailers
The raw request/response trailer keys and values exactly as they
were received. Only populated at the 'end' event.
-}
getRawTrailers : Request -> Task x (List Header)
getRawTrailers { request } =
    tupler
        `map` Marshall.unsafeFromArray
        `map` Member.read "rawTrailers" request


{-|
message.setTimeout(msecs, callback)
Calls message.connection.setTimeout(msecs, callback).
-}
setTimeout : Request -> Time -> Task x ()
setTimeout { request } =
    Method.method1 "setTimeout" request


{-|
message.socket
The net.Socket object associated with the connection.
With HTTPS support, use request.socket.getPeerCertificate() to obtain the client's authentication details.
The HTTP response status message (reason phrase). E.G. OK or Internal Server Error.
-}
getSocket : Request -> Task x Socket
getSocket { request } =
    Member.read "socket" request


{-|
message.trailers
The request/response trailers object. Only populated at the 'end' event.
-}
getTrailers : Request -> Task x (Maybe (List Header))
getTrailers { request } =
    Maybe.map Marshall.unsafeFromArray
        `map` Member.safeRead "trailers" request


{-|
message.url
Only valid for request obtained from http.Server.
Request URL string. This contains only the URL that is present in the actual HTTP request. If the request is:

```
GET /status?name=ryan HTTP/1.1\r\n
Accept: text/plain\r\n
\r\n
```
Then request.url will be: `'/status?name=ryan'`
If you would like to parse the URL into its parts, you can use `require('url').parse(request.url)``.
Example:

```
node> require('url').parse('/status?name=ryan')
{ href: '/status?name=ryan',
  search: '?name=ryan',
  query: 'name=ryan',
  pathname: '/status' }
```
If you would like to extract the params from the query string, you can use the `require('querystring').parse` function,
or pass true as the second argument to `require('url').parse`. Example:

```
node> require('url').parse('/status?name=ryan', true)
{ href: '/status?name=ryan',
  search: '?name=ryan',
  query: { name: 'ryan' },
  pathname: '/status' }
```
-}
getUrl : Request -> Task x (Maybe String)
getUrl { request } =
    Member.safeRead "url" request
