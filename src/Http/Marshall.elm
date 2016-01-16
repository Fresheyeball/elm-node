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


type alias TLSOptionsRaw =
    { pfx : String
    , key : String
    , passphrase : String
    , cert : String
    , ca : String
    , requestCert : Bool
    , rejectUnauthorized : Bool
    }


marshallTLSOptions : TLSOptions -> TLSOptionsRaw
marshallTLSOptions o =
    { pfx = Marshall.unsafeNothingIsUndefined o.pfx
    , key = Marshall.unsafeNothingIsUndefined o.key
    , passphrase = Marshall.unsafeNothingIsUndefined o.passphrase
    , cert = Marshall.unsafeNothingIsUndefined o.cert
    , ca = Marshall.unsafeNothingIsUndefined o.ca
    , requestCert = Marshall.unsafeNothingIsUndefined o.requestCert
    , rejectUnauthorized = Marshall.unsafeNothingIsUndefined o.rejectUnauthorized
    }
