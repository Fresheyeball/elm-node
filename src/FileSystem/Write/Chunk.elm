module FileSystem.Write.Chunk (writeFile, writeFileWith) where

{-|
# Write to disk using a `Chunk`
@docs writeFile, writeFileWith
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import FileSystem.Types exposing (..)
import FileSystem.Write.String as String
import FileSystem.Write.Buffer as Buffer
import Task exposing (Task)
import Either


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
fs.writeFile(file, data[, options], callback)
Asynchronously writes data to a file, replacing the file if it already exists.
-}
writeFileWith : WriteFileOptions -> FilePath -> Chunk -> Task FileSystemError ()
writeFileWith options path =
    Either.elim
        (String.writeFileWith options path)
        (Buffer.writeFileWith options path)


{-| fs.writeFile(file, data[, options], callback)
Same as `writeFileWith` but using default options
-}
writeFile : FilePath -> Chunk -> Task FileSystemError ()
writeFile =
    writeFileWith defaultWriteFileOptions
