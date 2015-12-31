module Foreign.Pattern.Set (..) where

import Task exposing (Task)
import Foreign.Types exposing (..)
import Native.Foreign


modify : KeyName -> object -> (a -> a) -> Task x ()
modify =
    Native.Foreign.modify


set : KeyName -> object -> a -> Task x ()
set name object value =
    modify name object (always value)
