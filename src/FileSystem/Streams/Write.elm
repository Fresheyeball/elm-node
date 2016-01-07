module FileSystem.Streams.Write (create, createWithOptions) where

{-|
# Create Writable Streams
@docs create, createWithOptions, defaultOptions
-}

import Task exposing (Task)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Pattern.Get exposing (get2)
import Streams.Types exposing (..)
import Streams.Marshall exposing (marshallWritable, marshallReadable)
import FileSystem.Types exposing (..)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
default options for creating write streams
-}
defaultOptions : WriteOptions
defaultOptions =
    defaultWriteOptions


{-|
fs.createWriteStream(path[, options])

**Regarding Options**
Start, End and FileDescriptor have been disabled for Elm, they are less useful and can be added back in later.

Modifying a file rather than replacing it may require a flags mode of r+ rather than the default mode w. The defaultEncoding can be any one of those accepted by Buffer.
-}
createWithOptions : WriteOptions -> FilePath -> Task x (Writable {})
createWithOptions opts path =
    get2 "createWriteStream" fs path (marshallWriteOptions opts)
        |> Task.map marshallWritable


{-|
Same as `createWriteStream'` with default options passed
-}
create : FilePath -> Task x (Writable {})
create =
    createWithOptions defaultWriteOptions
