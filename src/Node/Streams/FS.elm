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

on' : String -> Read -> (a -> Task x b) -> Task x b
on' =
  Native.Node.Streams.FS.on

on : (a -> Task x b) -> ReadableEvent -> Readable -> Task x b
on f e r = on' (toNameR e) (.readable r) f
