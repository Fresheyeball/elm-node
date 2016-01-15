module Http.Marshall (..) where

import Http.Types exposing (..)
import Network.Marshall exposing (..)
import Foreign.Marshall as Marshall
import Foreign.Types exposing (JSRaw)
import Time


type alias AgentOptionsRaw =
    { keepAlive : Bool
    , keepAliveMsecs : Time.Time
    , maxSockets : Int
    , maxFreeSockets : Int
    }


marshallMaxSocketsToInt : MaxSockets -> Int
marshallMaxSocketsToInt maxsockets =
    case maxsockets of
        Finite x ->
            x

        _ ->
            Marshall.rawInfinity


marshallMaxSocketsFromInt : Int -> MaxSockets
marshallMaxSocketsFromInt rawInt =
    if rawInt == Marshall.rawInfinity then
        Infinite
    else
        Finite rawInt


marshallAgentOptions : AgentOptions -> AgentOptionsRaw
marshallAgentOptions options =
    { options
        | maxSockets = marshallMaxSocketsToInt options.maxSockets
    }


marshallConnection : Connection -> JSRaw
marshallConnection { port', host, localAddress, localPort, family, path } =
    Marshall.portPrimeToPort
        { port' = port'
        , host = host
        , localAddress = Marshall.unsafeNothingIsUndefined localAddress
        , localPort = Marshall.unsafeNothingIsUndefined localPort
        , family = marshallFamily family
        , path = Marshall.unsafeNothingIsUndefined path
        }
