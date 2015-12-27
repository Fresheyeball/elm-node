module Foreign.Pattern.Unsafe.Read (..) where

import Task exposing (Task)
import Foreign.Types exposing (MethodName)
import Native.Foreign


unsafeRead0 : MethodName -> object -> a
unsafeRead0 =
    Native.Foreign.unsafeRead0


read0 : MethodName -> object -> Task x a
read0 =
    Native.Foreign.read0
