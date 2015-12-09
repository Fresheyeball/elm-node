module FS.Streams.Raw where

import Task exposing (Task)

import OOFFI exposing (..)
import Streams.Types exposing (..)
import FS.Types exposing (..)

fs : JSRaw
fs = unsafeRequire "fs"

createReadStream' : ReadOptions -> FilePath -> Task x Readable
createReadStream' opts path =
  get2 "createReadStream" fs path (marshallReadOptions opts)

createReadStream : FilePath -> Task x Readable
createReadStream =
  createReadStream' defaultReadOptions

createWriteStream' : WriteOptions -> FilePath -> Task x Writable
createWriteStream' opts path =
  get2 "createWriteStream" fs path (marshallWriteOptions opts)

createWriteStream : FilePath -> Task x Writable
createWriteStream = createWriteStream' defaultWriteOptions
