module FS.Streams (createReadStream, createReadStream', createWriteStream, createWriteStream') where

{-|
# Create Readable Streams
@docs createReadStream, createReadStream'

# Create Writable Streams
@docs createWriteStream, createWriteStream'
-}

import Task exposing (Task)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Pattern.Get exposing (get2)
import Streams.Types exposing (..)
import FS.Types exposing (..)


fs : JSRaw
fs =
    unsafeRequire "fs"


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
createReadStream' : ReadOptions -> FilePath -> Task x Readable
createReadStream' opts path =
    get2 "createReadStream" fs path (marshallReadOptions opts)


{-|
Same as `createReadStream'` with default options passed
-}
createReadStream : FilePath -> Task x Readable
createReadStream =
    createReadStream' defaultReadOptions


{-|
fs.createWriteStream(path[, options])

**Regarding Options**
Start, End and FileDescriptor have been disabled for Elm, they are less useful and can be added back in later.

Modifying a file rather than replacing it may require a flags mode of r+ rather than the default mode w. The defaultEncoding can be any one of those accepted by Buffer.
-}
createWriteStream' : WriteOptions -> FilePath -> Task x Writable
createWriteStream' opts path =
    get2 "createWriteStream" fs path (marshallWriteOptions opts)


{-|
Same as `createWriteStream'` with default options passed
-}
createWriteStream : FilePath -> Task x Writable
createWriteStream =
    createWriteStream' defaultWriteOptions
