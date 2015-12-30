module Foreign.Marshall (..) where

import Json.Decode as Json
import Foreign.Types exposing (JSRaw)
import Native.Foreign


unsafeNull : a
unsafeNull =
    Native.Foreign.unsafeNull


unsafeUndefined : a
unsafeUndefined =
    Native.Foreign.unsafeUndefined


unsafeRequire : String -> a
unsafeRequire =
    Native.Foreign.unsafeRequire


unsafeGetGlobalConstant : String -> a
unsafeGetGlobalConstant =
    Native.Foreign.unsafeGetGlobalConstant


truthy : JSRaw -> Bool
truthy =
    Native.Foreign.truthy


unsafeTypeAsJson : JSRaw -> Json.Value
unsafeTypeAsJson =
    Native.Foreign.unsafeTypeAs


unsafeToString : JSRaw -> String
unsafeToString =
    Native.Foreign.toString


portPrimeToPort : { a | port' : b } -> JSRaw
portPrimeToPort =
    Native.Foreign.portPrimeToPort


unsafeNothingIsUndefined : Maybe a -> a
unsafeNothingIsUndefined optional =
    case optional of
        Just value ->
            value

        Nothing ->
            unsafeUndefined


unsafeNothingIsNull : Maybe a -> a
unsafeNothingIsNull optional =
    case optional of
        Just value ->
            value

        Nothing ->
            unsafeNull
