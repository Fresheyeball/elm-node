module Streams.Raw where

import Task exposing (Task)
import Signal

import Streams.Types exposing (..)
import Native.Streams

on' : (Chunk -> Task x b) -> ReadableEvent -> Readable -> Task x ()
on' f e r = Native.Streams.on (toNameR e) (.readable r) f

on : Signal.Address Chunk -> ReadableEvent -> Readable -> Task x ()
on address e r = on' (Signal.send address) e r

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Streams.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w = pipe' (.readable r) (.writable w)

logBuffer' : String -> Chunk -> Task x ()
logBuffer' =
  Native.Streams.logBuffer

logBuffer : Encoding -> Chunk -> Task x ()
logBuffer = logBuffer' << unsafeToNameE
