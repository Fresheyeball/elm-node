module FileSystem.Write.Buffer.Descriptor (..) where

{-|
# Write to disk using a `Buffer` and a `FileDescriptor`
@docs writeFile, writeFileWithPosition
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Get as Get
import Foreign.Marshall exposing (unsafeRequire)
import FileSystem.Types exposing (..)
import Task exposing (Task)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
fs.write(fd, buffer, offset, length[, position], callback)
Write buffer to the file specified by fd.

offset and length determine the part of the buffer to be written.

position refers to the offset from the beginning of the file where this data should be written.
If typeof position !== 'number', the data will be written at the current position.
See pwrite(2).

On Linux, positional writes don't work when the file is opened in append mode.
The kernel ignores the position argument and always appends the data to the end of the file.
-}
writeFileWithPosition : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FileSystemError ( Int, Buffer )
writeFileWithPosition =
    Get.getAsync5_2E FileSystemError "write" fs


{-| fs.write(fd, buffer, offset, length[, position], callback)
Same as `writeFileWithPosition` but without `Position`
-}
writeFile : FileDescriptor -> Buffer -> Offset -> Length -> Task FileSystemError ( Int, Buffer )
writeFile =
    Get.getAsync4_2E FileSystemError "write" fs
