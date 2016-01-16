module Http.Marshall (..) where

import Http.Types exposing (..)
import Cardinal exposing (Cardinal(..))
import Foreign.Marshall as Marshall
import Time


type alias AgentOptionsRaw =
    { keepAlive : Bool
    , keepAliveMsecs : Time.Time
    , maxSockets : Int
    , maxFreeSockets : Int
    }


marshallCardinalToInt : Cardinal Int -> Int
marshallCardinalToInt card =
    case card of
        Finite x ->
            x

        PosInfinity ->
            Marshall.rawPosInfinity

        NegInfinity ->
            Marshall.rawNegInfinity


marshallCardinalFromInt : Int -> Cardinal Int
marshallCardinalFromInt rawInt =
    if rawInt == Marshall.rawPosInfinity then
        PosInfinity
    else if rawInt == Marshall.rawNegInfinity then
        NegInfinity
    else
        Finite rawInt


marshallAgentOptions : AgentOptions -> AgentOptionsRaw
marshallAgentOptions options =
    { options
        | maxSockets = marshallCardinalToInt options.maxSockets
    }
