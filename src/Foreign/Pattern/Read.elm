module Foreign.Pattern.Read (..) where

import Task exposing (Task)
import Foreign.Types exposing (MemberName)
import Native.Foreign


unsafeRead : MemberName -> object -> a
unsafeRead =
    Native.Foreign.unsafeRead


read : MemberName -> object -> Task x a
read =
    Native.Foreign.read
