module Http.Server.TLS (..) where

{-|
Basically exposing the constructor for an
`https.Server`

@docs createServer
-}

import Http.Types exposing (..)
import Http.Marshall exposing (..)
import Foreign.Pattern.Get as Get
import Foreign.Marshall as Marshall
import Task exposing (Task)


{-|
https.createServer(options[, requestListener])
Returns a new HTTPS web server object. The options is similar to tls.createServer().
The requestListener is a function which is automatically added to the 'request' event.
-}
createServer : TLSOptions -> Task x Server
createServer options =
    Get.get1
        "createServer"
        (Marshall.unsafeRequire "https")
        (marshallTLSOptions options)
