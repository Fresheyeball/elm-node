module Http.Client.Request (..) where

import Http.Types exposing (..)
import Http.StatusCode exposing (StatusCode)
import Foreign.Pattern.Member as Member
import Task exposing (..)


infixr 4 <$>
(<$>) : (a -> b) -> Task x a -> Task x b
(<$>) =
    Task.map


{-|
message.statusCode
Only valid for response obtained from http.ClientRequest.
The 3-digit HTTP response status code. E.G. 404.
-}
getStatusCode : Request -> Task x (Maybe StatusCode)
getStatusCode { request } =
    Http.StatusCode.fromInt
        <$> Member.read "statusCode" request


{-|
message.statusMessage
Only valid for response obtained from http.ClientRequest.
-}
getStatusMessage : Request -> Task x (Maybe String)
getStatusMessage { request } =
    Member.safeRead "statusMessage" request
