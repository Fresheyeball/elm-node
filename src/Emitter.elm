module Emitter where

import Foreign.Pattern exposing (..)
import Task exposing (Task)

type alias EventName = String

on_ :
  ( String -> String -> emitter   -> EventName -> handler -> Task x (Task x ()))
                     -> EventName -> emitter   -> handler -> Task x (Task x ())
on_ listenHelper event emitter handler =
  listenHelper "addListener" "removeListener" emitter event handler

on0 : EventName -> emitter -> Task x () -> Task x (Task x ())
on0 =
  on_ listen1

on1 : EventName -> emitter -> (a -> Task x ()) -> Task x (Task x ())
on1 =
  on_ listen1_1

on2 : EventName -> emitter -> ((a,b) -> Task x ()) -> Task x (Task x ())
on2 =
  on_ listen1_2

once_ :
  ( String -> String -> emitter   -> EventName -> handler -> Task x (Task x ()))
                     -> EventName -> emitter   -> handler -> Task x ()
once_ listenHelper event emitter handler =
  listenHelper "once" "_" emitter event handler
  |> Task.map (always ())

once0 : EventName -> emitter -> Task x () -> Task x ()
once0 =
  once_ listen1

once1 : EventName -> emitter -> (a -> Task x ()) -> Task x ()
once1 =
  once_ listen1_1

once2 : EventName -> emitter -> ((a,b) -> Task x ()) -> Task x ()
once2 =
  once_ listen1_2

-- emitter.listenerCount(type)
listenerCount : EventName -> emitter -> Task x Int
listenerCount event emitter =
  get1 "listenerCount" emitter event

removeAllListeners : EventName -> emitter -> Task x ()
removeAllListeners event emitter =
  method1 "removeAllListeners" emitter event

removeAllListeners' : emitter -> Task x ()
removeAllListeners' =
  method0 "removeAllListeners"

setMaxListeners : Int -> emitter -> Task x ()
setMaxListeners max emitter =
  method1 "setMaxListeners" emitter max

emit_ :
  (String -> emitter   -> EventName -> arityToTask)
          -> EventName -> emitter   -> arityToTask
emit_ methodHelper event emitter =
  methodHelper "emit" emitter event

emit1 : EventName -> emitter -> a -> Task x ()
emit1 =
  emit_ method2

emit2 : EventName -> emitter -> a -> b -> Task x ()
emit2 =
  emit_ method3

emit3 : EventName -> emitter -> a -> b -> c -> Task x ()
emit3 =
  emit_ method4
