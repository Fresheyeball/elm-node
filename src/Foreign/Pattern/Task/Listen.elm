module Foreign.Pattern.Task.Listen (..) where

import Task exposing (Task)
import Foreign.Types exposing (..)
import Native.Foreign


listen0 : ListenName -> UnlistenName -> object -> Task x () -> Task x (Task x ())
listen0 =
    Native.Foreign.listen0


listen1 : ListenName -> UnlistenName -> object -> a -> Task x () -> Task x (Task x ())
listen1 =
    Native.Foreign.listen1


listen2 : ListenName -> UnlistenName -> object -> a -> b -> Task x () -> Task x (Task x ())
listen2 =
    Native.Foreign.listen2


listen3 : ListenName -> UnlistenName -> object -> a -> b -> c -> Task x () -> Task x (Task x ())
listen3 =
    Native.Foreign.listen3


listen4 : ListenName -> UnlistenName -> object -> a -> b -> c -> d -> Task x () -> Task x (Task x ())
listen4 =
    Native.Foreign.listen4


listen0_1 : ListenName -> UnlistenName -> object -> (a -> Task x ()) -> Task x (Task x ())
listen0_1 =
    Native.Foreign.listen0_1


listen1_1 : ListenName -> UnlistenName -> object -> a -> (b -> Task x ()) -> Task x (Task x ())
listen1_1 =
    Native.Foreign.listen1_1


listen2_1 : ListenName -> UnlistenName -> object -> a -> b -> (c -> Task x ()) -> Task x (Task x ())
listen2_1 =
    Native.Foreign.listen2_1


listen3_1 : ListenName -> UnlistenName -> object -> a -> b -> c -> (d -> Task x ()) -> Task x (Task x ())
listen3_1 =
    Native.Foreign.listen3_1


listen4_1 : ListenName -> UnlistenName -> object -> a -> b -> c -> d -> (e -> Task x ()) -> Task x (Task x ())
listen4_1 =
    Native.Foreign.listen4_1


listen0_2 : ListenName -> UnlistenName -> object -> (( a, b ) -> Task x ()) -> Task x (Task x ())
listen0_2 =
    Native.Foreign.listen0_2


listen1_2 : ListenName -> UnlistenName -> object -> a -> (( b, c ) -> Task x ()) -> Task x (Task x ())
listen1_2 =
    Native.Foreign.listen1_2


listen2_2 : ListenName -> UnlistenName -> object -> a -> b -> (( c, d ) -> Task x ()) -> Task x (Task x ())
listen2_2 =
    Native.Foreign.listen2_2


listen3_2 : ListenName -> UnlistenName -> object -> a -> b -> c -> (( d, e ) -> Task x ()) -> Task x (Task x ())
listen3_2 =
    Native.Foreign.listen3_2


listen4_2 : ListenName -> UnlistenName -> object -> a -> b -> c -> d -> (( e, f ) -> Task x ()) -> Task x (Task x ())
listen4_2 =
    Native.Foreign.listen4_2
