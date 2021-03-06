module FileSystem.Write.Buffer (writeFile, writeFileWith) where

{-|
# Write to disk using a `Buffer`
@docs writeFile, writeFileWith
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Method as Method
import Foreign.Marshall exposing (unsafeRequire)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (marshallWriteFileOptions)
import Task exposing (Task)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
fs.writeFile(file, data[, options], callback)
Asynchronously writes data to a file, replacing the file if it already exists.
-}
writeFileWith : WriteFileOptions -> FilePath -> Buffer -> Task FileSystemError ()
writeFileWith options path data =
    Method.methodAsync3E
        FileSystemError
        "writeFile"
        fs
        path
        data
        (marshallWriteFileOptions options)


{-| fs.writeFile(file, data[, options], callback)
Same as `writeFileWith` but using default options
-}
writeFile : FilePath -> Buffer -> Task FileSystemError ()
writeFile =
    writeFileWith defaultWriteFileOptions
