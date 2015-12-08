module Streams.Raw where

import Task exposing (Task)
import Either exposing (..)

import OOFFI exposing (..)
import Streams.Types exposing (..)
import Native.Streams

{-| readable.isPaused() -}
isPaused : Readable -> Task x Bool
isPaused = get0 "isPaused"

{-| readable.pause() -}
pause : Readable -> Task x ()
pause = method0 "pause"

{-| Empty Buffer useful for "no op" use cases
  Think of this value like `Nil` for `Lists` -}
emptyBuffer : Buffer
emptyBuffer = Native.Streams.emptyBuffer

{-| Chunks from Node can be either a string or a buffer
    the type is checked on the native side and marshalled into an `Either` -}
marshallChunk : JSRaw -> Chunk
marshallChunk = Native.Streams.marshallChunk Left Right

-- Class: stream.Readable

on : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x (Task x ())
on f e readable =
  listen1_1 "on" "removeListener" readable (toNameR e) (marshallChunk >> f)

onString : ReadableEvent -> (String -> Task x ()) -> Readable -> Task x (Task x ())
onString e f r =
  on (\chunk -> case chunk of
      Left s -> f s
      Right _ -> Task.succeed ()
    ) e r

onBuffer : ReadableEvent -> (Buffer -> Task x ()) -> Readable -> Task x (Task x ())
onBuffer e f r =
  on (\chunk -> case chunk of
      Left _ -> Task.succeed ()
      Right b -> f b
    ) e r

{-| readable.pipe(destination[, options]) -}
pipe : Readable -> Writable -> Task x ()
pipe = method1 "pipe"

{-| readable.pipe(destination[, options]) -}
pipe' : Readable -> Duplex -> Task x ()
pipe' r (_,w) = method1 "pipe" r w

{-| readable.pipe(destination[, options]) -}
pipe'' : Duplex -> Duplex -> Task x ()
pipe'' (r,_) (_,w) = method1 "pipe" r w

{-| readable.unpipe([destination]) -}
unpipe : Readable -> Writable -> Task x ()
unpipe = method1 "unpipe"

{-| readable.unpipe([destination]) -}
unpipeAll : Readable -> Task x ()
unpipeAll = method0 "unpipe"

{-| readable.read([size]) -}
read : Readable -> Task x (Maybe Chunk)
read r = get0 "read" r |> Task.map (\raw ->
  if truthy raw
  then Just (marshallChunk raw)
  else Nothing)

{-| readable.read([size]) -}
read' : Readable -> Int -> Task x (Maybe Chunk)
read' r size = get1 "read" r size |> Task.map (\raw ->
  if truthy raw
  then Just (marshallChunk raw)
  else Nothing)

{-| readable.resume() -}
resume : Readable -> Task x ()
resume = method0 "resume"

{-| readable.setEncoding(encoding) -}
setEncoding : Readable -> Encoding -> Task x ()
setEncoding r e = method1 "setEncoding" r (toNameE e)

{-| readable.unshift(chunk) -}
unshiftString : Readable -> String -> Task x ()
unshiftString = method1 "unshift"

{-| readable.unshift(chunk) -}
unshiftBuffer : Readable -> Buffer -> Task x ()
unshiftBuffer = method1 "unshift"

{-| readable.unshift(chunk) -}
unshift : Readable -> Chunk -> Task x ()
unshift r c = case c of
  Left  s -> unshiftString r s
  Right b -> unshiftBuffer r b

-- Class: stream.Writable

{-| writable.cork() -}
cork : Writable -> Task x ()
cork = method0 "cork"

{-| writable.uncork() -}
uncork : Writable -> Task x ()
uncork = method0 "uncork"

{-| writable.end([chunk][, encoding][, callback]) -}
end : Writable -> Task x ()
end = method0 "end"

{-| writable.end([chunk][, encoding][, callback]) -}
endWithBuffer : Writable -> Buffer -> Task x ()
endWithBuffer = method1 "end"

{-| writable.end([chunk][, encoding][, callback]) -}
endWithString' : Writable -> Encoding -> String -> Task x ()
endWithString' w e s = method2 "end" w s (toNameE e)

{-| writable.end([chunk][, encoding][, callback]) -}
endWithString : Writable -> String -> Task x ()
endWithString w s = endWithString' w defaultEncoding s

{-| writable.end([chunk][, encoding][, callback]) -}
endWith' : Writable -> Encoding -> Chunk -> Task x ()
endWith' w e c = case c of
  Left s -> endWithString' w e s
  Right b -> endWithBuffer w b

{-| writable.end([chunk][, encoding][, callback]) -}
endWith : Writable -> Chunk -> Task x ()
endWith w c = endWith' w defaultEncoding c

{-| writable.setDefaultEncoding(encoding) -}
setDefaultEncoding : Writable -> Encoding -> Task x ()
setDefaultEncoding w e = method1 "setDefaultEncoding" w (toNameE e)

{-| writable.write(chunk[, encoding][, callback]) -}
writeString' : Writable -> Encoding -> String -> Task x ()
writeString' w e s = methodAsync2 "write" w s (toNameE e)

{-| writable.write(chunk[, encoding][, callback]) -}
writeString : Writable -> String -> Task x ()
writeString w s = writeString' w defaultEncoding s

{-| writable.write(chunk[, encoding][, callback]) -}
writeBuffer : Writable -> Buffer -> Task x ()
writeBuffer = methodAsync1 "write"

suck : (a -> Task x ()) -> Signal a -> Task x ()
suck = Debug.crash "suck"

writeSignalBuffer : Writable -> Signal Buffer -> Task x ()
writeSignalBuffer w = suck <| writeBuffer w

{-| writable.write(chunk[, encoding][, callback]) -}
write' : Writable -> Encoding -> Chunk -> Task x ()
write' w e c = case c of
  Left  s -> writeString' w e s
  Right b -> writeBuffer w b

{-| writable.write(chunk[, encoding][, callback]) -}
write : Writable -> Chunk -> Task x ()
write w c = write' w defaultEncoding c

bufferToString' : Encoding -> Buffer -> Task x String
bufferToString' e b =
  get1 "toString" b (toNameE e)

bufferToString : Buffer -> Task x String
bufferToString = bufferToString' defaultEncoding
