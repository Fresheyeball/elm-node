module FileSystem.Write.String (writeFile, writeFileWith) where

{-|
# Write to disk using a `String`
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
writeFileWith : WriteFileOptions -> FilePath -> String -> Task FileSystemError ()
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
writeFile : FilePath -> String -> Task FileSystemError ()
writeFile =
    writeFileWith defaultWriteFileOptions
