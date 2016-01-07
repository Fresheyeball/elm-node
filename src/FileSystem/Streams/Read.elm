module FileSystem.Streams.Read (create, createWithOptions, defaultOptions) where

{-|
# Create Readable Streams
@docs create, createWithOptions, defaultOptions
-}

import Task exposing (Task)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import Streams.Marshall exposing (marshallReadable)
import Foreign.Pattern.Get exposing (get2)
import Streams.Types exposing (..)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (..)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
default options for creating read streams
-}
defaultOptions : ReadOptions
defaultOptions =
    defaultReadOptions


{-|
fs.createReadStream(path[, options])

Be aware that, unlike the default value set for highWaterMark on a readable stream
(16 kb), the stream returned by this method has a default value of 64 kb
for the same parameter.

**Regarding Options*
Start and End have been disabled for Elm, as well as FileDescriptor.
These are less useful and can always be added back later.

If autoClose is false, then the file descriptor won't be closed, even if there's an error.
It is your responsibility to close it and make sure there's no file descriptor leak.
If autoClose is set to true (default behavior), on error or end the file descriptor will be closed automatically.

mode sets the file mode (permission and sticky bits), but only if the file was created.
-}
createWithOptions : ReadOptions -> FilePath -> Task x (Readable {})
createWithOptions opts path =
    get2 "createReadStream" fs path (marshallReadOptions opts)
        |> Task.map marshallReadable


{-|
Same as `createReadStream'` with default options passed
-}
create : FilePath -> Task x (Readable {})
create =
    createWithOptions defaultReadOptions
