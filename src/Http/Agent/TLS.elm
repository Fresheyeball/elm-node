module Http.Agent.TLS (..) where

{-|
Just exposing the constructor for the TLS version of the http Agent.

@docs newAgent
-}

import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Pattern.Instantiate exposing (newOn1)
import Http.Types exposing (..)
import Http.Marshall exposing (..)
import Task exposing (Task)


{-| -}
newAgent : AgentOptions -> Task x Agent
newAgent =
    marshallAgentOptions
        >> newOn1
            "Agent"
            (unsafeRequire "https")
