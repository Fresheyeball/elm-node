module Foreign.Pattern.Task.Method (..) where

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
