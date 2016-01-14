module Http.Types (..) where

import Time exposing (Time)


type MaxSockets
    = Finite Int
    | Infinite


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
    , maxSockets : MaxSockets
    , maxFreeSockets : Int
    }


defaultAgentOptions : AgentOptions
defaultAgentOptions =
    { keepAlive = False
    , keepAliveMsecs = 1000
    , maxSockets = Infinite
    , maxFreeSockets = 256
    }
