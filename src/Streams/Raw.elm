module Streams.Raw where

import Task exposing (Task)
import Either exposing (..)

import OOFFI exposing (..)
import Streams.Types exposing (..)
import Native.Streams

isPaused : Read -> Task x Bool
isPaused = get0 "isPaused"

pause : Read -> Task x ()
pause = method0 "pause"

on : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x ()
on f e {readable} =
  Native.Streams.on Left Right (toNameR e) readable f

onString : ReadableEvent -> (String -> Task x ()) -> Readable -> Task x ()
onString e f r =
  on (\chunk -> case chunk of
      Left s -> f s
      Right _ -> Task.succeed ()
    ) e r

onBuffer : ReadableEvent -> (Buffer -> Task x ()) -> Readable -> Task x ()
onBuffer e f r =
  on (\chunk -> case chunk of
      Left _ -> Task.succeed ()
      Right b -> f b
    ) e r

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Streams.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w =
  pipe' (.readable r) (.writable w)

writeString' :  Encoding -> String -> Writable -> Task x ()
writeString' e data {writable} =
  Native.Streams.writeString writable (toNameE e) data

writeBuffer' : Buffer -> Writable -> Task x ()
writeBuffer' buffer {writable} =
  Native.Streams.writeBuffer writable buffer

write' : Encoding -> Writable -> Chunk -> Task x ()
write' e w data = case data of
  Left string  -> writeString' e string w
  Right buffer -> writeBuffer' buffer w

writeString : Encoding -> Signal String -> Writable -> Task x ()
writeString =
  Native.Streams.writeStringSignal

writeBuffer : Signal Buffer -> Writable -> Task x ()
writeBuffer s {writable} =
  Native.Streams.writeBufferSignal s writable

write : Writable -> Encoding -> Signal Chunk -> Task x ()
write w e s =
  Debug.crash "no"

bufferToString : Encoding -> Buffer -> Task x String
bufferToString e b =
  Native.Streams.bufferToString (unsafeToNameE e) b
