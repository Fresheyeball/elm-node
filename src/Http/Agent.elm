module Http.Agent (..) where

{-|
Class: http.Agent#
The HTTP Agent is used for pooling sockets used in HTTP client requests.

The HTTP Agent also defaults client requests to using Connection:keep-alive. If no pending HTTP requests
are waiting on a socket to become free the socket is closed. This means that Node.js's pool has the
benefit of keep-alive when under load but still does not require developers to manually close the HTTP
clients using KeepAlive.

If you opt into using HTTP KeepAlive, you can create an Agent object with that flag set to true. (See the
constructor options.) Then, the Agent will keep unused sockets in a pool for later use. They will be
explicitly marked so as to not keep the Node.js process running. However, it is still a good idea to
explicitly destroy() KeepAlive agents when they are no longer in use,
so that the Sockets will be shut down.

Sockets are removed from the agent's pool when the socket emits either a 'close' event or a special
'agentRemove' event. This means that if you intend to keep one HTTP request open for a long time and
don't want it to stay in the pool you can do something along the lines of:

-}


{-|
new Agent([options])#

options Object Set of configurable options to set on the agent. Can have the following fields:
keepAlive Boolean Keep sockets around in a pool to be used by other requests in the future.
Default = false
keepAliveMsecs Integer When using HTTP KeepAlive, how often to send TCP KeepAlive packets over sockets
being kept alive. Default = 1000. Only relevant if keepAlive is set to true.
maxSockets Number Maximum number of sockets to allow per host. Default = Infinity.
maxFreeSockets Number Maximum number of sockets to leave open in a free state. Only relevant if keepAlive is set to true. Default = 256.
The default http.globalAgent that is used by http.request() has all of these values set to their respective defaults.

To configure any of them, you must create your own http.Agent object.

const http = require('http');
var keepAliveAgent = new http.Agent({ keepAlive: true });
options.agent = keepAliveAgent;
http.request(options, onResponseCallback);
-}
{-|
agent.destroy()#

Destroy any sockets that are currently in use by the agent.

It is usually not necessary to do this. However, if you are using an agent with KeepAlive enabled, then it is best to explicitly shut down the agent when you know that it will no longer be used. Otherwise, sockets may hang open for quite a long time before the server terminates them.
-}
{-|
agent.freeSockets#

An object which contains arrays of sockets currently awaiting use by the Agent when HTTP KeepAlive is used. Do not modify.
-}
{-|
agent.getName(options)#

Get a unique name for a set of request options, to determine whether a connection can be reused. In the http agent, this returns host:port:localAddress. In the https agent, the name includes the CA, cert, ciphers, and other HTTPS/TLS-specific options that determine socket reusability.
-}
{-|
agent.maxFreeSockets#

By default set to 256. For Agents supporting HTTP KeepAlive, this sets the maximum number of sockets that will be left open in the free state.
-}
{-|
agent.maxSockets#

By default set to Infinity. Determines how many concurrent sockets the agent can have open per origin. Origin is either a 'host:port' or 'host:port:localAddress' combination.
-}
{-|
agent.requests#

An object which contains queues of requests that have not yet been assigned to sockets. Do not modify.
-}
{-|
agent.sockets#

An object which contains arrays of sockets currently in use by the Agent. Do not modify.
-}
