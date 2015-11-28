module Streams.Raw where

import Task exposing (Task)
import Either exposing (..)
import Signal
import Debug

import Streams.Types exposing (..)
import Native.Streams

on' : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x ()
on' f e r =
  Native.Streams.on (toNameR e) (.readable r) f

on : Signal.Address Chunk -> ReadableEvent -> Readable -> Task x ()
on address e r =
  on' (Signal.send address) e r

onString' : (String -> Task x ()) -> ReadableEvent -> Readable -> Task x ()
onString' f e r =
  on' (\chunk -> case chunk of
      Left s -> f s
      Right _ -> Task.succeed ()
    ) e r

onBuffer' : (Buffer -> Task x ()) -> ReadableEvent -> Readable -> Task x ()
onBuffer' f e r =
  on' (\chunk -> case chunk of
      Left _ -> Task.succeed ()
      Right b -> f b
    ) e r

onString : Signal.Address String -> ReadableEvent -> Readable -> Task x ()
onString address e r =
  onString' (Signal.send address) e r

onBuffer : Signal.Address Buffer -> ReadableEvent -> Readable -> Task x ()
onBuffer address e r =
  onBuffer' (Signal.send address) e r

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Streams.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w =
  pipe' (.readable r) (.writable w)

write : Encoding -> Chunk -> Task x ()
write =
  Debug.crash "not \"written\" yet!"

writeString : Encoding -> String -> Task x ()
writeString =
  Debug.crash "not ready!"

writeBuffer : Buffer -> Task x ()
writeBuffer =
  Debug.crash "not ready!"

logBuffer' : String -> Chunk -> Task x ()
logBuffer' =
  Native.Streams.logBuffer

logBuffer : Encoding -> Chunk -> Task x ()
logBuffer =
  logBuffer' << unsafeToNameE
