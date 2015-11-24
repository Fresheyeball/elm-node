module Node.FS.Streams where

import Task exposing (Task)

import Node.Streams.Types exposing (..)
import Node.FS.Types exposing (FilePath)
import Native.Node.FS.Streams

createReadStream' : FilePath -> Task x Read
createReadStream' =
  Native.Node.FS.Streams.createReadStream

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' >> Task.map Readable

createWriteStream' : FilePath -> Task x Write
createWriteStream' =
  Native.Node.FS.Streams.createWriteStream

createWriteStream : FilePath -> Task x Writable
createWriteStream =
  createWriteStream' >> Task.map Writable
