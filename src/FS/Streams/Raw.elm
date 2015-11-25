module FS.Streams.Raw
  ( createReadStream
  , createReadStream'
  , createWriteStream
  , createWriteStream' ) where

import Task exposing (Task)

import Streams.Types exposing (..)
import FS.Types exposing (..)
import Native.FS.Streams

createReadStream_ : ReadOptionsRaw -> FilePath -> Task x Read
createReadStream_ =
  Native.FS.Streams.createReadStream

createReadStream' : ReadOptions -> FilePath -> Task x Readable
createReadStream' o =
  createReadStream_ (marshallReadOptions o)
  >> Task.map Readable

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' defaultReadOptions

createWriteStream_ : WriteOptionsRaw -> FilePath -> Task x Write
createWriteStream_ =
  Native.FS.Streams.createWriteStream

createWriteStream' : WriteOptions -> FilePath -> Task x Writable
createWriteStream' o =
  createWriteStream_ (marshallWriteOptions o)
  >> Task.map Writable

createWriteStream : FilePath -> Task x Writable
createWriteStream = createWriteStream' defaultWriteOptions
