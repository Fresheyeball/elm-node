module Http.Marshall (..) where

import Foreign.Marshall as Marshall
import Time


type alias AgentOptionsRaw =
    { keepAlive : Bool
    , keepAliveMsecs : Time.Time
    , maxSockets : Int
    , maxFreeSockets : Int
    }


marshallAgentOptions : AgentOptions -> AgentOptionsRaw
marshallAgentOptions options =
    { options
        | maxSockets =
            case .maxSockets options of
                Finite x ->
                    x

                _ ->
                    Marshall.rawInfinity
    }
