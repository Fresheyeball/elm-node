module Foreign.Pattern.Unsafe.Read (..) where

import Foreign.Types exposing (MethodName)
import Native.Foreign


unsafeRead0 : MethodName -> object -> a
unsafeRead0 =
    Native.Foreign.unsafeRead0
