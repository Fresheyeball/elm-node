module FileSystem.Read (read, readFileWith, readFile, readDirectory, readLink) where

{-|
# Read from disk
@docs read, readFileWith, readFile, readDirectory, readLink
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Get as Get
import Foreign.Marshall exposing (unsafeRequire)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (marshallReadFileOptions)
import Task exposing (Task)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
fs.read(fd, buffer, offset, length, position, callback)
Read data from the file specified by fd.

buffer is the buffer that the data will be written to.

offset is the offset in the buffer to start writing at.

length is an integer specifying the number of bytes to read.

position is an integer specifying where to begin reading from in the file. If position is
null, data will be read from the current file position.
-}
read : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FileSystemError ( String, Buffer )
read =
    Get.getAsync5_2E FileSystemError "read" fs


{-|
fs.readFile(file[, options], callback)
Note: Specified file descriptors will not be closed automatically.
-}
readFileWith : ReadFileOptions -> FilePath -> Task FileSystemError Buffer
readFileWith opts path =
    Get.getAsync2E FileSystemError "readFile" fs path (marshallReadFileOptions opts)


{-| fs.readFile(file[, options], callback)
Same as `readFileWith` but with default options filled in
-}
readFile : FilePath -> Task FileSystemError Buffer
readFile =
    readFileWith defaultReadFileOptions


{-|
fs.readdir(path, callback)
Asynchronous readdir(3). Reads the contents of a directory. The callback gets two
arguments (err, files) where files is an array of the names of the files in the
directory excluding '.' and '..'.
-}
readDirectory : FilePath -> Task FileSystemError (List FilePath)
readDirectory =
    Get.getAsync1E FileSystemError "readdir" fs


{-|
fs.readlink(path, callback)
Asynchronous readlink(2).
-}
readLink : FilePath -> Task FileSystemError String
readLink =
    Get.getAsync1E FileSystemError "readLink" fs
