module Foreign.Pattern (..) where

import Task exposing (Task)
import Foreign.Types exposing (..)
import Native.Foreign


method0 : MethodName -> object -> Task x ()
method0 =
    Native.Foreign.method0


method1 : MethodName -> object -> a -> Task x ()
method1 =
    Native.Foreign.method1


method2 : MethodName -> object -> a -> b -> Task x ()
method2 =
    Native.Foreign.method2


method3 : MethodName -> object -> a -> b -> c -> Task x ()
method3 =
    Native.Foreign.method3


method4 : MethodName -> object -> a -> b -> c -> d -> Task x ()
method4 =
    Native.Foreign.method4


method5 : MethodName -> object -> a -> b -> c -> d -> e -> Task x ()
method5 =
    Native.Foreign.method5


method6 : MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x ()
method6 =
    Native.Foreign.method6


methodAsync0 : MethodName -> object -> Task x ()
methodAsync0 =
    Native.Foreign.methodAsync0


methodAsync1 : MethodName -> object -> a -> Task x ()
methodAsync1 =
    Native.Foreign.methodAsync1


methodAsync2 : MethodName -> object -> a -> b -> Task x ()
methodAsync2 =
    Native.Foreign.methodAsync2


methodAsync3 : MethodName -> object -> a -> b -> c -> Task x ()
methodAsync3 =
    Native.Foreign.methodAsync3


methodAsync4 : MethodName -> object -> a -> b -> c -> d -> Task x ()
methodAsync4 =
    Native.Foreign.methodAsync4


methodAsync5 : MethodName -> object -> a -> b -> c -> d -> e -> Task x ()
methodAsync5 =
    Native.Foreign.methodAsync5


methodAsync6 : MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x ()
methodAsync6 =
    Native.Foreign.methodAsync6


methodAsync0E : ErrorType x -> MethodName -> object -> Task x ()
methodAsync0E =
    Native.Foreign.methodAsync0E


methodAsync1E : ErrorType x -> MethodName -> object -> a -> Task x ()
methodAsync1E =
    Native.Foreign.methodAsync1E


methodAsync2E : ErrorType x -> MethodName -> object -> a -> b -> Task x ()
methodAsync2E =
    Native.Foreign.methodAsync2E


methodAsync3E : ErrorType x -> MethodName -> object -> a -> b -> c -> Task x ()
methodAsync3E =
    Native.Foreign.methodAsync3E


methodAsync4E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> Task x ()
methodAsync4E =
    Native.Foreign.methodAsync4E


methodAsync5E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> Task x ()
methodAsync5E =
    Native.Foreign.methodAsync5E


methodAsync6E : ErrorType x -> MethodName -> object -> a -> b -> c -> d -> e -> f -> Task x ()
methodAsync6E =
    Native.Foreign.methodAsync6E


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


get : KeyName -> object -> Task x a
get =
    Native.Foreign.get


modify : KeyName -> object -> (a -> b) -> Task x ()
modify =
    Native.Foreign.modify


set : KeyName -> object -> a -> Task x ()
set name object value =
    modify name object (always value)


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


unsafeGet0 : MethodName -> object -> a
unsafeGet0 =
    Native.Foreign.unsafeGet0
