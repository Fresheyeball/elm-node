module Node.Streams.FS where

import Task exposing (Task)

import Node.Streams.Types exposing (..)
import Native.Node.Streams.FS

type alias FilePath = String

createReadStream' : FilePath -> Task x Read
createReadStream' =
  Native.Node.Streams.FS.createReadStream

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' >> Task.map Readable

createWriteStream' : FilePath -> Task x Write
createWriteStream' =
  Native.Node.Streams.FS.createWriteStream

createWriteStream : FilePath -> Task x Writable
createWriteStream =
  createWriteStream' >> Task.map Writable

on' : String -> Read -> (Chunk -> Task x b) -> Task x b
on' =
  Native.Node.Streams.FS.on

on : (Chunk -> Task x b) -> ReadableEvent -> Readable -> Task x b
on f e r = on' (toNameR e) (.readable r) f

pipe' : Read -> Write -> Task x ()
pipe' =
  Native.Node.Streams.FS.pipe

pipe : Readable -> Writable -> Task x ()
pipe r w = pipe' (.readable r) (.writable w)

logBuffer : Encoding -> Chunk -> Task x ()
logBuffer = Native.Node.Streams.FS.logBuffer
