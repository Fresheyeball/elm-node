module FS.Streams.Raw where

import Task exposing (Task)

import Streams.Types exposing (..)
import FS.Types exposing (..)
import Native.FS.Streams

createReadStream' : ReadOptions -> FilePath -> Task x Readable
createReadStream' o =
  Native.FS.Streams.createReadStream (marshallReadOptions o)

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' defaultReadOptions

createWriteStream' : WriteOptions -> FilePath -> Task x Writable
createWriteStream' o =
  Native.FS.Streams.createWriteStream (marshallWriteOptions o)

createWriteStream : FilePath -> Task x Writable
createWriteStream = createWriteStream' defaultWriteOptions
