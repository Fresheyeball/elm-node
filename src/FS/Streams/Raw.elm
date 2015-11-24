module FS.Streams.Raw where

import Task exposing (Task)

import Streams.Types exposing (..)
import FS.Types exposing (FilePath)
import Native.FS.Streams

createReadStream' : FilePath -> Task x Read
createReadStream' =
  Native.FS.Streams.createReadStream

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' >> Task.map Readable

createWriteStream' : FilePath -> Task x Write
createWriteStream' =
  Native.FS.Streams.createWriteStream

createWriteStream : FilePath -> Task x Writable
createWriteStream =
  createWriteStream' >> Task.map Writable
