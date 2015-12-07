module OOFFI where

import Task exposing (Task)
import Native.OOFFI

type JSRaw = JSRaw

method0 : String -> object -> Task x ()
method0 = Native.OOFFI.method0

method1 : String -> object -> a -> Task x ()
method1 = Native.OOFFI.method1

method2 : String -> object -> a -> b -> Task x ()
method2 = Native.OOFFI.method2

method3 : String -> object -> a -> b -> c -> Task x ()
method3 = Native.OOFFI.method3

method4 : String -> object -> a -> b -> c -> d -> Task x ()
method4 = Native.OOFFI.method4

method5 : String -> object -> a -> b -> c -> d -> e -> Task x ()
method5 = Native.OOFFI.method5

method6 : String -> object -> a -> b -> c -> d -> e -> f -> Task x ()
method6 = Native.OOFFI.method6

methodAsync0 : String -> object -> Task x ()
methodAsync0 = Native.OOFFI.methodAsync0

methodAsync1 : String -> object -> a -> Task x ()
methodAsync1 = Native.OOFFI.methodAsync1

methodAsync2 : String -> object -> a -> b -> Task x ()
methodAsync2 = Native.OOFFI.methodAsync2

methodAsync3 : String -> object -> a -> b -> c -> Task x ()
methodAsync3 = Native.OOFFI.methodAsync3

methodAsync4 : String -> object -> a -> b -> c -> d -> Task x ()
methodAsync4 = Native.OOFFI.methodAsync4

methodAsync5 : String -> object -> a -> b -> c -> d -> e -> Task x ()
methodAsync5 = Native.OOFFI.methodAsync5

methodAsync6 : String -> object -> a -> b -> c -> d -> e -> f -> Task x ()
methodAsync6 = Native.OOFFI.methodAsync6

methodAsync0E : (String -> x) -> String -> object -> Task x ()
methodAsync0E = Native.OOFFI.methodAsync0E

methodAsync1E : (String -> x) -> String -> object -> a -> Task x ()
methodAsync1E = Native.OOFFI.methodAsync1E

methodAsync2E : (String -> x) -> String -> object -> a -> b -> Task x ()
methodAsync2E = Native.OOFFI.methodAsync2E

methodAsync3E : (String -> x) -> String -> object -> a -> b -> c -> Task x ()
methodAsync3E = Native.OOFFI.methodAsync3E

methodAsync4E : (String -> x) -> String -> object -> a -> b -> c -> d -> Task x ()
methodAsync4E = Native.OOFFI.methodAsync4E

methodAsync5E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> Task x ()
methodAsync5E = Native.OOFFI.methodAsync5E

methodAsync6E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> f -> Task x ()
methodAsync6E = Native.OOFFI.methodAsync6E

listen0 : String -> String -> object -> Task x () -> Task x (Task x ())
listen0 = Native.OOFFI.listen0

listen1 : String -> String -> object -> a -> Task x () -> Task x (Task x ())
listen1 = Native.OOFFI.listen1

listen2 : String -> String -> object -> a -> b -> Task x () -> Task x (Task x ())
listen2 = Native.OOFFI.listen2

listen3 : String -> String -> object -> a -> b -> c -> Task x () -> Task x (Task x ())
listen3 = Native.OOFFI.listen3

listen4 : String -> String -> object -> a -> b -> c -> d -> Task x () -> Task x (Task x ())
listen4 = Native.OOFFI.listen4

listen0_2 : String -> String -> object -> ((a,b) -> Task x ()) -> Task x (Task x ())
listen0_2 = Native.OOFFI.listen0_2

listen1_2 : String -> String -> object -> a -> ((b,c) -> Task x ()) -> Task x (Task x ())
listen1_2 = Native.OOFFI.listen1_2

listen2_2 : String -> String -> object -> a -> b -> ((c,d) -> Task x ()) -> Task x (Task x ())
listen2_2 = Native.OOFFI.listen2_2

listen3_2 : String -> String -> object -> a -> b -> c -> ((d,e) -> Task x ()) -> Task x (Task x ())
listen3_2 = Native.OOFFI.listen3_2

listen4_2 : String -> String -> object -> a -> b -> c -> d -> ((e,f) -> Task x ()) -> Task x (Task x ())
listen4_2 = Native.OOFFI.listen4_2

get0 : String -> object -> Task x a
get0 = Native.OOFFI.get0

get1 : String -> object -> a -> Task x b
get1 = Native.OOFFI.get1

get2 : String -> object -> a -> b -> Task x c
get2 = Native.OOFFI.get2

get3 : String -> object -> a -> b -> c -> Task x d
get3 = Native.OOFFI.get3

get4 : String -> object -> a -> b -> c -> d -> Task x e
get4 = Native.OOFFI.get4

get5 : String -> object -> a -> b -> c -> d -> e -> Task x f
get5 = Native.OOFFI.get5

get6 : String -> object -> a -> b -> c -> d -> e -> f -> Task x g
get6 = Native.OOFFI.get6

getAsync0 : String -> object -> Task x a
getAsync0 = Native.OOFFI.getAsync0

getAsync1 : String -> object -> a -> Task x b
getAsync1 = Native.OOFFI.getAsync1

getAsync2 : String -> object -> a -> b -> Task x c
getAsync2 = Native.OOFFI.getAsync2

getAsync3 : String -> object -> a -> b -> c -> Task x d
getAsync3 = Native.OOFFI.getAsync3

getAsync4 : String -> object -> a -> b -> c -> d -> Task x e
getAsync4 = Native.OOFFI.getAsync4

getAsync5 : String -> object -> a -> b -> c -> d -> e -> Task x f
getAsync5 = Native.OOFFI.getAsync5

getAsync6 : String -> object -> a -> b -> c -> d -> e -> f -> Task x g
getAsync6 = Native.OOFFI.getAsync6

getAsync0E : (String -> x) -> String -> object -> Task x a
getAsync0E = Native.OOFFI.getAsync0E

getAsync1E : (String -> x) -> String -> object -> a -> Task x b
getAsync1E = Native.OOFFI.getAsync1E

getAsync2E : (String -> x) -> String -> object -> a -> b -> Task x c
getAsync2E = Native.OOFFI.getAsync2E

getAsync3E : (String -> x) -> String -> object -> a -> b -> c -> Task x d
getAsync3E = Native.OOFFI.getAsync3E

getAsync4E : (String -> x) -> String -> object -> a -> b -> c -> d -> Task x e
getAsync4E = Native.OOFFI.getAsync4E

getAsync5E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> Task x f
getAsync5E = Native.OOFFI.getAsync5E

getAsync6E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> f -> Task x g
getAsync6E = Native.OOFFI.getAsync6E

getAsync0_2E : (String -> x) -> String -> object -> Task x (a, b)
getAsync0_2E = Native.OOFFI.getAsync0_2E

getAsync1_2E : (String -> x) -> String -> object -> a -> Task x (b, c)
getAsync1_2E = Native.OOFFI.getAsync1_2E

getAsync2_2E : (String -> x) -> String -> object -> a -> b -> Task x (c, d)
getAsync2_2E = Native.OOFFI.getAsync2_2E

getAsync3_2E : (String -> x) -> String -> object -> a -> b -> c -> Task x (d, e)
getAsync3_2E = Native.OOFFI.getAsync3_2E

getAsync4_2E : (String -> x) -> String -> object -> a -> b -> c -> d -> Task x (e, f)
getAsync4_2E = Native.OOFFI.getAsync4_2E

getAsync5_2E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> Task x (f, g)
getAsync5_2E = Native.OOFFI.getAsync5_2E

getAsync6_2E : (String -> x) -> String -> object -> a -> b -> c -> d -> e -> f -> Task x (g, h)
getAsync6_2E = Native.OOFFI.getAsync6_2E

getAsync0_2 : String -> object -> Task x (a, b)
getAsync0_2 = Native.OOFFI.getAsync0_2

getAsync1_2 : String -> object -> a -> Task x (b, c)
getAsync1_2 = Native.OOFFI.getAsync1_2

getAsync2_2 : String -> object -> a -> b -> Task x (c, d)
getAsync2_2 = Native.OOFFI.getAsync2_2

getAsync3_2 : String -> object -> a -> b -> c -> Task x (d, e)
getAsync3_2 = Native.OOFFI.getAsync3_2

getAsync4_2 : String -> object -> a -> b -> c -> d -> Task x (e, f)
getAsync4_2 = Native.OOFFI.getAsync4_2

getAsync5_2 : String -> object -> a -> b -> c -> d -> e -> Task x (f, g)
getAsync5_2 = Native.OOFFI.getAsync5_2

getAsync6_2 : String -> object -> a -> b -> c -> d -> e -> f -> Task x (g, h)
getAsync6_2 = Native.OOFFI.getAsync6_2

unsafeNull : a
unsafeNull = Native.OOFFI.unsafeNull

unsafeRequire : String -> a
unsafeRequire = Native.OOFFI.unsafeRequire

unsafeGetGlobalConstant : String -> a
unsafeGetGlobalConstant = Native.OOFFI.unsafeGetGlobalConstant

unsafeGet0 : String -> object -> a
unsafeGet0 = Native.OOFFI.unsafeGet0

truthy : JSRaw -> Bool
truthy = Native.OOFFI.truthy
