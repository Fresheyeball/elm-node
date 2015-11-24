module Streams where

import Task exposing (Task)

import Node.Streams.Types exposing (..)
import Native.Node.Streams

on' : String -> Read -> (Chunk -> Task x b) -> Task x b
on' =
  Native.Node.Streams.on

on : (Chunk -> Task x b) -> ReadableEvent -> Readable -> Task x b
on f e r = on' (toNameR e) (.readable r) f

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Node.Streams.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w = pipe' (.readable r) (.writable w)

logBuffer' : String -> Chunk -> Task x ()
logBuffer' =
  Native.Node.Streams.logBuffer

logBuffer : Encoding -> Chunk -> Task x ()
logBuffer = logBuffer' << toNameE
