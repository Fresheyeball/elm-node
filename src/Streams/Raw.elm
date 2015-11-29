module Streams.Raw where

import Task exposing (Task)
import Either exposing (..)
import Signal exposing (..)

import Streams.Types exposing (..)
import Native.OOFFI
import Native.Streams

(<$>) : (a -> b) -> Signal a -> Signal b
(<$>) = Signal.map

on' : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x ()
on' f e r =
  Native.Streams.on (toNameR e) (.readable r) f

on : Address Chunk -> ReadableEvent -> Readable -> Task x ()
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

onString : Address String -> ReadableEvent -> Readable -> Task x ()
onString address e r =
  onString' (Signal.send address) e r

onBuffer : Address Buffer -> ReadableEvent -> Readable -> Task x ()
onBuffer address e r =
  onBuffer' (Signal.send address) e r

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Streams.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w =
  pipe' (.readable r) (.writable w)

writeString' : Writable -> Encoding -> String -> Task x ()
writeString' {writable} e data =
  Native.Streams.writeString writable (toNameE e) data

writeBuffer' : Writable -> Buffer -> Task x ()
writeBuffer' {writable} buffer =
  Native.Streams.writeBuffer writable buffer

write' : Writable -> Encoding -> Chunk -> Task x ()
write' w e data = case data of
  Left string  -> writeString' w e string
  Right buffer -> writeBuffer' w buffer

writeString : Writable -> Encoding -> Signal String -> Signal (Task x ())
writeString w e s =
  writeString' w e <$> s

writeBuffer : Writable -> Signal Buffer -> Signal (Task x ())
writeBuffer w s =
  writeBuffer' w <$> s

write : Writable -> Encoding -> Signal Chunk -> Signal (Task x ())
write w e s =
  write' w e <$> s

logBuffer' : String -> Chunk -> Task x ()
logBuffer' =
  Native.Streams.logBuffer

logBuffer : Encoding -> Chunk -> Task x ()
logBuffer =
  logBuffer' << unsafeToNameE
