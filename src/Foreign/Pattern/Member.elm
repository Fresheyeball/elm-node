module Foreign.Pattern.Member (..) where

import Task exposing (Task)
import Foreign.Types exposing (MemberName)
import Native.Foreign


unsafeRead : MemberName -> object -> a
unsafeRead =
    Native.Foreign.unsafeRead


read : MemberName -> object -> Task x a
read =
    Native.Foreign.read


modify : MemberName -> object -> (a -> a) -> Task x ()
modify =
    Native.Foreign.modify


set : MemberName -> object -> a -> Task x ()
set name object value =
    modify name object (always value)
