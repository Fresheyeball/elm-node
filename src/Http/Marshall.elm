module Http.Marshall (..) where

import Http.Types exposing (..)
import Cardinal exposing (Cardinal(..))
import Network.Marshall exposing (marshallFamily)
import Foreign.Marshall as Marshall
import Foreign.Types exposing (JSRaw)
import Tuple
import Json.Encode as Json
import Time


type alias AgentOptionsRaw =
    { keepAlive : Bool
    , keepAliveMsecs : Time.Time
    , maxSockets : Int
    , maxFreeSockets : Int
    }


marshallResponse : JSRaw -> Response
marshallResponse rawResponse =
    { writable = Marshall.unsafeIdentity rawResponse
    , response = Marshall.unsafeIdentity rawResponse
    }


marshallRequest : JSRaw -> Request
marshallRequest rawRequest =
    { readable = Marshall.unsafeIdentity rawRequest
    , request = Marshall.unsafeIdentity rawRequest
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


type alias ClientOptionsPartialRaw a =
    { a
        | protocol : String
        , hostname : String
        , family : Int
        , localAddress : String
        , method : String
        , path : String
        , headers : Json.Value
        , auth : String
    }


marshallClientOptions : ClientOptionsPartial a -> ClientOptionsPartialRaw a
marshallClientOptions o =
    { o
        | protocol = showProtocol o.protocol
        , family =
            Maybe.map marshallFamily o.family
                |> Marshall.unsafeNothingIsUndefined
        , method = showMethod o.method
        , headers =
            o.headers
                |> List.map (Tuple.mapSnd Json.string)
                |> Json.object
    }


marshallClientRequest : JSRaw -> ClientRequest
marshallClientRequest raw =
    { writable = Marshall.unsafeIdentity raw
    , request = Marshall.unsafeIdentity raw
    }
