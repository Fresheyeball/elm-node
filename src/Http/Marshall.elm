module Http.Marshall (..) where

import Http.Types exposing (..)
import Foreign.Marshall as Marshall
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
