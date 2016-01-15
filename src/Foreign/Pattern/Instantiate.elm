module Foreign.Pattern.Instantiate (..) where

import Foreign.Types exposing (JSRaw)
import Native.Foreign
import Task exposing (Task)


newOn0 : String -> JSRaw -> Task x a
newOn0 =
    Native.Foreign.newOn0


newOn1 : String -> JSRaw -> a -> Task x b
newOn1 =
    Native.Foreign.newOn1


newOn2 : String -> JSRaw -> a -> b -> Task x c
newOn2 =
    Native.Foreign.newOn2


newOn3 : String -> JSRaw -> a -> b -> c -> Task x d
newOn3 =
    Native.Foreign.newOn3


newOn4 : String -> JSRaw -> a -> b -> c -> d -> Task x e
newOn4 =
    Native.Foreign.newOn4


newOn5 : String -> JSRaw -> a -> b -> c -> d -> e -> Task x f
newOn5 =
    Native.Foreign.newOn5


newOn6 : String -> JSRaw -> a -> b -> c -> d -> e -> f -> Task x g
newOn6 =
    Native.Foreign.newOn6
