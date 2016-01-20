module Http.Types (Agent, AgentOptions, defaultAgentOptions, METHOD, showMethod, readMethod, Header, Server, Request, IncomingRaw, Response, ResponseRaw, TLSOptions, Error, Protocol, showProtocol, ClientRequest, ClientOptions, ClientOptionsWithPort, ClientOptionsWithSocketPath, ClientOptionsPartial, ClientResponse) where

{-|
# Agent
@docs Agent, AgentOptions, defaultAgentOptions

# Method
@docs METHOD, showMethod, readMethod

# Header
@docs Header

# Server
@docs Server, Request, IncomingRaw, Response, ResponseRaw

# TLS
@docs TLSOptions

# Error
@docs Error

# Protocol
@docs Protocol, showProtocol

# Client
@docs ClientRequest, ClientOptions, ClientOptionsWithPort, ClientOptionsWithSocketPath, ClientOptionsPartial, ClientResponse
-}

import Cardinal exposing (Cardinal(PosInfinity, Finite))
import Time exposing (Time)
import Foreign.Types exposing (JSRaw)
import Streams.Types exposing (..)
import Network.Types exposing (..)


{-| Http Error
-}
type Error
    = Error String


{-|
Http header as a tuple of Strings
-}
type alias Header =
    ( String, String )


{-|
options Object Set of configurable options to set on the agent. Can have the following fields:
keepAlive Boolean Keep sockets around in a pool to be used by other requests in the future.
Default = false
keepAliveMsecs Integer When using HTTP KeepAlive, how often to send TCP KeepAlive packets over sockets
being kept alive. Default = 1000. Only relevant if keepAlive is set to true.
maxSockets Number Maximum number of sockets to allow per host. Default = Infinity.
maxFreeSockets Number Maximum number of sockets to leave open in a free state. Only relevant if keepAlive is set to true. Default = 256.
The default http.globalAgent that is used by http.request() has all of these values set to their respective defaults.
-}
type alias AgentOptions =
    { keepAlive : Bool
    , keepAliveMsecs : Time
    , maxSockets : Cardinal Int
    , maxFreeSockets : Int
    }


{-| -}
defaultAgentOptions : AgentOptions
defaultAgentOptions =
    { keepAlive = False
    , keepAliveMsecs = 1000
    , maxSockets = PosInfinity
    , maxFreeSockets = 256
    }


{-|
Represents a raw instance of Node.js's http.Agent class
-}
type Agent
    = Agent JSRaw


{-|
Represents a raw instance of Node.js's http.Server class
-}
type Server
    = Server JSRaw


{-|
Requests are also Streams, both values are the same underlying object
-}
type alias Request =
    { readable : WritableRaw
    , request : IncomingRaw
    }


{-| Incoming message to a http client
-}
type alias ClientResponse =
    Request


{-|
Represents a raw instance of Node.js's http.IncomingMessage class
-}
type IncomingRaw
    = IncomingRaw JSRaw


{-|
Responses are also Streams, both values are the same underlying object
-}
type alias Response =
    { writable : WritableRaw
    , response : ResponseRaw
    }


{-|
Represents a raw instance of Node.js's http.ServerResponse class
-}
type ResponseRaw
    = ResponseRaw JSRaw


{-|
HTTP methods that are supported by the parser.
-}
type METHOD
    = ACL
    | BIND
    | CHECKOUT
    | CONNECT
    | COPY
    | DELETE
    | GET
    | HEAD
    | LINK
    | LOCK
    | MSEARCH
    | MERGE
    | MKACTIVITY
    | MKCALENDAR
    | MKCOL
    | MOVE
    | NOTIFY
    | OPTIONS
    | PATCH
    | POST
    | PROPFIND
    | PROPPATCH
    | PURGE
    | PUT
    | REBIND
    | REPORT
    | SEARCH
    | SUBSCRIBE
    | TRACE
    | UNBIND
    | UNLINK
    | UNLOCK
    | UNSUBSCRIBE


{-|
To standard human readable string
-}
showMethod : METHOD -> String
showMethod method =
    case method of
        ACL ->
            "ACL"

        BIND ->
            "BIND"

        CHECKOUT ->
            "CHECKOUT"

        CONNECT ->
            "CONNECT"

        COPY ->
            "COPY"

        DELETE ->
            "DELETE"

        GET ->
            "GET"

        HEAD ->
            "HEAD"

        LINK ->
            "LINK"

        LOCK ->
            "LOCK"

        MSEARCH ->
            "M-SEARCH"

        MERGE ->
            "MERGE"

        MKACTIVITY ->
            "MKACTIVITY"

        MKCALENDAR ->
            "MKCALENDAR"

        MKCOL ->
            "MKCOL"

        MOVE ->
            "MOVE"

        NOTIFY ->
            "NOTIFY"

        OPTIONS ->
            "OPTIONS"

        PATCH ->
            "PATCH"

        POST ->
            "POST"

        PROPFIND ->
            "PROPFIND"

        PROPPATCH ->
            "PROPPATCH"

        PURGE ->
            "PURGE"

        PUT ->
            "PUT"

        REBIND ->
            "REBIND"

        REPORT ->
            "REPORT"

        SEARCH ->
            "SEARCH"

        SUBSCRIBE ->
            "SUBSCRIBE"

        TRACE ->
            "TRACE"

        UNBIND ->
            "UNBIND"

        UNLINK ->
            "UNLINK"

        UNLOCK ->
            "UNLOCK"

        UNSUBSCRIBE ->
            "UNSUBSCRIBE"


{-| parse from string
-}
readMethod : String -> Maybe METHOD
readMethod method =
    case method of
        "ACL" ->
            Just ACL

        "BIND" ->
            Just BIND

        "CHECKOUT" ->
            Just CHECKOUT

        "CONNECT" ->
            Just CONNECT

        "COPY" ->
            Just COPY

        "DELETE" ->
            Just DELETE

        "GET" ->
            Just GET

        "HEAD" ->
            Just HEAD

        "LINK" ->
            Just LINK

        "LOCK" ->
            Just LOCK

        "M-SEARCH" ->
            Just MSEARCH

        "MERGE" ->
            Just MERGE

        "MKACTIVITY" ->
            Just MKACTIVITY

        "MKCALENDAR" ->
            Just MKCALENDAR

        "MKCOL" ->
            Just MKCOL

        "MOVE" ->
            Just MOVE

        "NOTIFY" ->
            Just NOTIFY

        "OPTIONS" ->
            Just OPTIONS

        "PATCH" ->
            Just PATCH

        "POST" ->
            Just POST

        "PROPFIND" ->
            Just PROPFIND

        "PROPPATCH" ->
            Just PROPPATCH

        "PURGE" ->
            Just PURGE

        "PUT" ->
            Just PUT

        "REBIND" ->
            Just REBIND

        "REPORT" ->
            Just REPORT

        "SEARCH" ->
            Just SEARCH

        "SUBSCRIBE" ->
            Just SUBSCRIBE

        "TRACE" ->
            Just TRACE

        "UNBIND" ->
            Just UNBIND

        "UNLINK" ->
            Just UNLINK

        "UNLOCK" ->
            Just UNLOCK

        "UNSUBSCRIBE" ->
            Just UNSUBSCRIBE

        _ ->
            Nothing


{-|
pfx: A string or Buffer containing the private key, certificate and CA certs of the server in PFX or PKCS12
format. (Mutually exclusive with the key, cert and ca options.)

key: A string or Buffer containing the private key of the server in PEM format. To support multiple keys
using different algorithms, an array can be provided. It can either be a plain array of keys, or an array of
objects in the format {pem: key, passphrase: passphrase}. (Required)

passphrase: A string of passphrase for the private key or pfx.

cert: A string or Buffer containing the certificate key of the server in PEM format. (Could be an array of
certs). (Required)

ca: A string, Buffer or array of strings or Buffers of trusted certificates in PEM format. If this is
omitted several well known "root" CAs will be used, like VeriSign. These are used to authorize connections.

requestCert: If true the server will request a certificate from clients that connect and attempt to verify that certificate. Default: false.

rejectUnauthorized: If true the server will reject any connection which is not authorized with the list of supplied CAs. This option only has an effect if requestCert is true. Default: false.
-}
type alias TLSOptions =
    { pfx : Maybe String
    , key : Maybe String
    , passphrase : Maybe String
    , cert : Maybe String
    , ca : Maybe String
    , requestCert : Maybe Bool
    , rejectUnauthorized : Maybe Bool
    }


{-| -}
type Protocol
    = Http
    | Https


{-| -}
showProtocol : Protocol -> String
showProtocol protocol =
    case protocol of
        Http ->
            "http"

        Https ->
            "https"


{-| This should not be exported, dont use it
-}
type alias ClientOptionsPartial a =
    { a
        | protocol : Protocol
        , hostname : String
        , family : Maybe Family
        , localAddress : String
        , method : METHOD
        , path : String
        , headers : List Header
        , auth : String
    }


{-|
protocol: Protocol to use. Defaults to 'http'.
host: A domain name or IP address of the server to issue the request to. Defaults to 'localhost'.
hostname: Alias for host. To support url.parse() hostname is preferred over host.
family: IP address family to use when resolving host and hostname. Valid values are 4 or 6. When unspecified, both IP v4 and v6 will be used.
port: Port of remote server. Defaults to 80.
localAddress: Local interface to bind for network connections.
socketPath: Unix Domain Socket (use one of host:port or socketPath).
method: A string specifying the HTTP request method. Defaults to 'GET'.
path: Request path. Defaults to '/'. Should include query string if any. E.G. '/index.html?page=12'. An exception is thrown when the request path contains illegal characters. Currently, only spaces are rejected but that may change in the future.
headers: An object containing request headers.
auth: Basic authentication i.e. 'user:password' to compute an Authorization header.
agent: Controls Agent behavior. When an Agent is used request will default to Connection: keep-alive. Possible values:
undefined (default): use http.globalAgent for this host and port.
Agent object: explicitly use the passed in Agent.
false: opts out of connection pooling with an Agent, defaults request to Connection: close.
The optional callback parameter will be added as a one time listener for the 'response' event.
-}
type alias ClientOptions =
    ClientOptionsPartial { hostname : String }


{-| -}
type alias ClientOptionsWithPort =
    ClientOptionsPartial { port' : Int }


{-| -}
type alias ClientOptionsWithSocketPath =
    ClientOptionsPartial { socketPath : String }


{-|
Represents a raw instance of the Node.js ClientRequest class
-}
type ClientRequestRaw
    = ClientRequestRaw JSRaw


{-|
Client requests are writable streams, here both are the same underlying object
-}
type alias ClientRequest =
    { request : ClientRequestRaw
    , writable : WritableRaw
    }
