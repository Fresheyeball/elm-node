module Streams.Raw where

import Task exposing (Task)

import Streams.Types exposing (..)
import Native.Streams

on' : String -> Read -> (Chunk -> Task x b) -> Task x b
on' =
  Native.Streams.on

on : (Chunk -> Task x b) -> ReadableEvent -> Readable -> Task x b
on f e r = on' (toNameR e) (.readable r) f

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
