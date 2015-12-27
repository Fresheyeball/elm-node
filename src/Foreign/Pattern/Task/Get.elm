module Foreign.Pattern.Task.Get (..) where

import Task exposing (Task)
import Foreign.Types exposing (..)
import Native.Foreign


get : KeyName -> object -> Task x a
get =
    Native.Foreign.get


get0 : MethodName -> object -> Task x a
get0 =
    Native.Foreign.get0


get1 : MethodName -> object -> a -> Task x b
get1 =
    Native.Foreign.get1


get2 : MethodName -> object -> a -> b -> Task x c
get2 =
    Native.Foreign.get2


get3 : MethodName -> object -> a -> b -> c -> Task x d
get3 =
    Native.Foreign.get3


get4 : MethodName -> object -> a -> b -> c -> d -> Task x e
get4 =
    Native.Foreign.get4


get5 : MethodName -> object -> a -> b -> c -> d -> e -> Task x f
get5 =
    Native.Foreign.get5


get6 : MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x g
get6 =
    Native.Foreign.get6


getAsync0 : MethodName -> object -> Task x a
getAsync0 =
    Native.Foreign.getAsync0


getAsync1 : MethodName -> object -> a -> Task x b
getAsync1 =
    Native.Foreign.getAsync1


getAsync2 : MethodName -> object -> a -> b -> Task x c
getAsync2 =
    Native.Foreign.getAsync2


getAsync3 : MethodName -> object -> a -> b -> c -> Task x d
getAsync3 =
    Native.Foreign.getAsync3


getAsync4 : MethodName -> object -> a -> b -> c -> d -> Task x e
getAsync4 =
    Native.Foreign.getAsync4


getAsync5 : MethodName -> object -> a -> b -> c -> d -> e -> Task x f
getAsync5 =
    Native.Foreign.getAsync5


getAsync6 : MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x g
getAsync6 =
    Native.Foreign.getAsync6


getAsync0E : ErrorType x -> MethodName -> object -> Task x a
getAsync0E =
    Native.Foreign.getAsync0E


getAsync1E : ErrorType x -> MethodName -> object -> a -> Task x b
getAsync1E =
    Native.Foreign.getAsync1E


getAsync2E : ErrorType x -> MethodName -> object -> a -> b -> Task x c
getAsync2E =
    Native.Foreign.getAsync2E


getAsync3E : ErrorType x -> MethodName -> object -> a -> b -> c -> Task x d
getAsync3E =
    Native.Foreign.getAsync3E


getAsync4E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> Task x e
getAsync4E =
    Native.Foreign.getAsync4E


getAsync5E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> Task x f
getAsync5E =
    Native.Foreign.getAsync5E


getAsync6E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x g
getAsync6E =
    Native.Foreign.getAsync6E


getAsync0_2E : ErrorType x -> MethodName -> object -> Task x ( a, b )
getAsync0_2E =
    Native.Foreign.getAsync0_2E


getAsync1_2E : ErrorType x -> MethodName -> object -> a -> Task x ( b, c )
getAsync1_2E =
    Native.Foreign.getAsync1_2E


getAsync2_2E : ErrorType x -> MethodName -> object -> a -> b -> Task x ( c, d )
getAsync2_2E =
    Native.Foreign.getAsync2_2E


getAsync3_2E : ErrorType x -> MethodName -> object -> a -> b -> c -> Task x ( d, e )
getAsync3_2E =
    Native.Foreign.getAsync3_2E


getAsync4_2E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> Task x ( e, f )
getAsync4_2E =
    Native.Foreign.getAsync4_2E


getAsync5_2E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> Task x ( f, g )
getAsync5_2E =
    Native.Foreign.getAsync5_2E


getAsync6_2E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x ( g, h )
getAsync6_2E =
    Native.Foreign.getAsync6_2E


getAsync0_2 : MethodName -> object -> Task x ( a, b )
getAsync0_2 =
    Native.Foreign.getAsync0_2


getAsync1_2 : MethodName -> object -> a -> Task x ( b, c )
getAsync1_2 =
    Native.Foreign.getAsync1_2


getAsync2_2 : MethodName -> object -> a -> b -> Task x ( c, d )
getAsync2_2 =
    Native.Foreign.getAsync2_2


getAsync3_2 : MethodName -> object -> a -> b -> c -> Task x ( d, e )
getAsync3_2 =
    Native.Foreign.getAsync3_2


getAsync4_2 : MethodName -> object -> a -> b -> c -> d -> Task x ( e, f )
getAsync4_2 =
    Native.Foreign.getAsync4_2


getAsync5_2 : MethodName -> object -> a -> b -> c -> d -> e -> Task x ( f, g )
getAsync5_2 =
    Native.Foreign.getAsync5_2


getAsync6_2 : MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x ( g, h )
getAsync6_2 =
    Native.Foreign.getAsync6_2
