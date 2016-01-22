module Http.Client (..) where

import Foreign.Pattern.Get as Get
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire, portPrimeToPort)
import Http.Types exposing (..)
import Http.Marshall exposing (..)
import Emitter.Unsafe as Emitter
import Task exposing (..)


http : JSRaw
http =
    unsafeRequire "http"


infixr 9 <$>
(<$>) : (a -> b) -> Task x a -> Task x b
(<$>) =
    Task.map


{-|
http.request(options[, callback])
Node.js maintains several connections per server to make HTTP requests. This function allows one to transparently issue requests.

options can be an object or a string. If options is a string, it is automatically parsed with url.parse().

Options:

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

http.request() returns an instance of the http.ClientRequest class. The ClientRequest instance is a writable stream. If one needs to upload a file with a POST request, then write to the ClientRequest object.

Example:

var postData = querystring.stringify({
  'msg' : 'Hello World!'
});

var options = {
  hostname: 'www.google.com',
  port: 80,
  path: '/upload',
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': postData.length
  }
};

var req = http.request(options, (res) => {
  console.log(`STATUS: ${res.statusCode}`);
  console.log(`HEADERS: ${JSON.stringify(res.headers)}`);
  res.setEncoding('utf8');
  res.on('data', (chunk) => {
    console.log(`BODY: ${chunk}`);
  });
  res.on('end', () => {
    console.log('No more data in response.')
  })
});

req.on('error', (e) => {
  console.log(`problem with request: ${e.message}`);
});

// write data to request body
req.write(postData);
req.end();
Note that in the example req.end() was called. With http.request() one must always call req.end() to signify that you're done with the request - even if there is no data being written to the request body.

If any error is encountered during the request (be that with DNS resolution, TCP level errors, or actual HTTP parse errors) an 'error' event is emitted on the returned request object. As with all 'error' events, if no listeners are registered the error will be thrown.

There are a few special headers that should be noted.

Sending a 'Connection: keep-alive' will notify Node.js that the connection to the server should be persisted until the next request.

Sending a 'Content-length' header will disable the default chunked encoding.

Sending an 'Expect' header will immediately send the request headers. Usually, when sending 'Expect: 100-continue', you should both set a timeout and listen for the 'continue' event. See RFC2616 Section 8.2.3 for more information.

Sending an Authorization header will override using the auth option to compute basic authentication.
-}
request : ClientOptions -> Task x ClientRequest
request o =
    marshallClientRequest
        <$> Get.get1
                "request"
                http
                (marshallClientOptions o)


requestFromPort : ClientOptionsWithPort -> Task x ClientRequest
requestFromPort o =
    marshallClientRequest
        <$> Get.get1
                "request"
                http
                (portPrimeToPort <| marshallClientOptions o)


requestFromSocketPath : ClientOptionsWithSocketPath -> Task x ClientRequest
requestFromSocketPath o =
    marshallClientRequest
        <$> Get.get1
                "request"
                http
                (marshallClientOptions o)


onResponse : ClientRequest -> (ClientResponse -> Task x ()) -> Task x (Task x ())
onResponse { request } f =
    Emitter.on1 "response" request f
