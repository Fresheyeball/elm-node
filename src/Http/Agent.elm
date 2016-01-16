module Http.Agent (newAgent, destroy, getFreeSockets, getMaxFreeSockets, modifyMaxFreeSockets, setMaxFreeSockets, getMaxSockets, setMaxSockets, modifyMaxSockets, getActiveSockets) where

{-|
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

@docs newAgent, destroy

# Free Sockets
@docs getFreeSockets, getMaxFreeSockets, modifyMaxFreeSockets, setMaxFreeSockets

# Max Sockets
@docs getMaxSockets, setMaxSockets, modifyMaxSockets

# Active Sockets
@docs getActiveSockets

-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Instantiate as Inst
import Foreign.Pattern.Method as Method
import Foreign.Pattern.Member as Member
import Foreign.Marshall exposing (unsafeRequire, unsafeFromArray)
import Task exposing (Task)
import Network.Types exposing (..)
import Http.Marshall exposing (..)
import Http.Types exposing (..)


http : JSRaw
http =
    unsafeRequire "http"


{-|
new Agent([options])

options Object Set of configurable options to set on the agent. Can have the following fields:
keepAlive Boolean Keep sockets around in a pool to be used by other requests in the future.
keepAliveMsecs Integer When using HTTP KeepAlive,
how often to send TCP KeepAlive packets over sockets
being kept alive. Default = 1000. Only relevant if keepAlive is set to true.
maxSockets Number Maximum number of sockets to allow per host. Default = Infinity.
maxFreeSockets Number Maximum number of sockets to leave open in a free state. Only relevant if
keepAlive is set to true. Default = 256.
The default http.globalAgent that is used by http.request() has all of these values set to their
respective defaults.
To configure any of them, you must create your own http.Agent object.
-}
newAgent : AgentOptions -> Task x Agent
newAgent =
    marshallAgentOptions
        >> Inst.newOn1 "Agent" http


{-|
agent.destroy()
Destroy any sockets that are currently in use by the agent.
It is usually not necessary to do this. However, if you are using an agent with KeepAlive enabled,
then it is best to explicitly shut down the agent when you know that it will no longer be used.
Otherwise, sockets may hang open for quite a long time before the server terminates them.
-}
destroy : Agent -> Task x ()
destroy =
    Method.method0 "destroy"


{-|
agent.freeSockets
An object which contains arrays of sockets currently awaiting use by the Agent when HTTP
KeepAlive is used.
-}
getFreeSockets : Agent -> Task x (List Socket)
getFreeSockets =
    Member.read "freeSockets"
        >> Task.map unsafeFromArray


{-|
agent.maxFreeSockets
By default set to 256.
-}
getMaxFreeSockets : Agent -> Task x Int
getMaxFreeSockets =
    Member.read "maxFreeSockets"


{-|
agent.maxFreeSockets
For Agents supporting HTTP KeepAlive, this sets the maximum number of
sockets that will be left open in the free state.
-}
modifyMaxFreeSockets : Agent -> (Int -> Int) -> Task x ()
modifyMaxFreeSockets =
    Member.modify "maxFreeSockets"


{-|
agent.maxFreeSockets
For Agents supporting HTTP KeepAlive, this sets the maximum number of
sockets that will be left open in the free state.
-}
setMaxFreeSockets : Agent -> Int -> Task x ()
setMaxFreeSockets =
    Member.set "maxFreeSockets"


{-|
agent.maxSockets
By default set to Infinity. Determines how many concurrent sockets the agent can have open per
origin. Origin is either a 'host:port' or 'host:port:localAddress' combination.
-}
getMaxSockets : Agent -> Task x MaxSockets
getMaxSockets =
    Member.read "maxSockets"
        >> Task.map marshallMaxSocketsFromInt


{-|
agent.maxSockets
Determines how many concurrent sockets the agent can have open per
origin. Origin is either a 'host:port' or 'host:port:localAddress' combination.
-}
modifyMaxSockets : Agent -> (MaxSockets -> MaxSockets) -> Task x ()
modifyMaxSockets agent endo =
    Member.modify
        "maxSockets"
        agent
        (marshallMaxSocketsFromInt
            >> endo
            >> marshallMaxSocketsToInt
        )


{-|
agent.maxSockets
Determines how many concurrent sockets the agent can have open per
origin. Origin is either a 'host:port' or 'host:port:localAddress' combination.
-}
setMaxSockets : Agent -> MaxSockets -> Task x ()
setMaxSockets agent maxsockets =
    Member.set
        "maxSockets"
        agent
        (marshallMaxSocketsToInt maxsockets)


{-|
agent.sockets
An object which contains arrays of sockets currently in use by the Agent. Do not modify.
-}
getActiveSockets : Agent -> Task x (List Socket)
getActiveSockets =
    Member.read "sockets"
        >> Task.map unsafeFromArray
