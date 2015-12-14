module Http.Server
  ( createServer, listen
  , createServer'
  , writeHead, write, end
  , writeHtml, writeJson, writeText
  , Port, Code, Echo, Header, Url
  , Server, Method(..)
  , emptyReq, Request
  , emptyRes, Response
  , url, method, statusCode
  , textHtml, applicationJson, plainText
  , onRequest
  , onClose, onCloseReq
  , onCloseRes, onFinishRes) where

import Emitter exposing (..)
import OOFFI exposing (..)
import Task exposing (Task, succeed, andThen)
import Signal exposing (Address, Mailbox, mailbox)
import Json.Encode as Json
import Native.Http.Server

-- HTTP


-- Class: http.Server
-- Event: 'checkContinue'
-- Event: 'clientError'
-- Event: 'close'
-- Event: 'connect'
-- Event: 'connection'
-- Event: 'request'
-- Event: 'upgrade'
-- server.close([callback])
-- server.listen(handle[, callback])
-- server.listen(path[, callback])
-- server.listen(port[, hostname][, backlog][, callback])
-- server.maxHeadersCount
-- server.setTimeout(msecs, callback)
-- server.timeout

-- http.METHODS
-- http.STATUS_CODES
-- http.createClient([port][, host])
-- http.createServer([requestListener])
-- http.get(options[, callback])
-- http.globalAgent
-- http.request(options[, callback])


{-| Port number for the server to listen -}
type alias Port   = Int
{-| StatusCode ie 200 or 404 -}
type alias Code   = Int
{-| Echo is a message to send to the console, effectfully -}
type alias Echo   = String
{-| Url the url of a request -}
type alias Url    = String
{-| An http header, such as content type -}
type alias Header = (String, String)

{-| Node.js native Server object
[Node Docs](https://nodejs.org/api/http.html#http_class_http_server) -}
type Server       = Server JSRaw
{-| Node.js native Request object
[Node Docs](https://nodejs.org/api/http.html#http_http_incomingmessage) -}
type Request      = Request JSRaw
{-| Node.js native Response object
[Node Docs](https://nodejs.org/api/http.html#http_class_http_serverresponse) -}
type Response     = Response JSRaw

{-| Standard Http Methods, useful for routing -}
type Method
  = GET
  | POST
  | PUT
  | DELETE

http : JSRaw
http = unsafeRequire "http"

{-| "Request" events as a Signal.
[Node docs](https://nodejs.org/api/http.html#http_event_request) -}
onRequest : Server -> ((Request,Response) -> Task x ()) -> Task x (Task x ())
onRequest =
  on2 "request"

{-| "Close" events as a Signal for Servers.
[Node docs](https://nodejs.org/api/http.html#http_event_close) -}
onClose : Server -> Task x () -> Task x (Task x ())
onClose =
  on0 "close"

{-| "Close" events as a Signal for Request objects.
[Node docs](https://nodejs.org/api/http.html#http_event_close_2) -}
onCloseReq : Request -> Task x () -> Task x (Task x ())
onCloseReq =
  on0 "close"

onCloseRes : Response -> Task x () -> Task x (Task x ())
onCloseRes =
  on0 "close"

onFinishRes : Response -> Task x () -> Task x (Task x ())
onFinishRes =
  on0 "finish"
