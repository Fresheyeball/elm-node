module FileSystem.Write.String.Descriptor (writeFile, writeFileWithPosition) where

{-|
# Write to disk using a `String` and a `FileDescriptor`
@docs writeFile, writeFileWithPosition
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Get as Get
import Foreign.Marshall exposing (unsafeRequire)
import FileSystem.Types exposing (..)
import Chunk.Marshall exposing (showEncoding)
import Task exposing (Task)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
fs.write(fd, data[, position[, encoding]], callback)
Write data to the file specified by fd.
If data is not a Buffer instance then the value will be coerced to a string.

position refers to the offset from the beginning of the file where this data should be written.
If typeof position !== 'number' the data will be written at the current position.
See pwrite(2).

The callback will receive the arguments (err, written, string) where written specifies how
many bytes the passed string required to be written. Note that bytes written is not the same
as string characters. See Buffer.byteLength.

Unlike when writing buffer, the entire string must be written. No substring may be specified.
This is because the byte offset of the resulting data may not be the same as the string offset.

On Linux, positional writes don't work when the file is opened in append mode. The kernel
ignores the position argument and always appends the data to the end of the file.
-}
writeFileWithPosition : FileSystem.Types.Encoding -> FileDescriptor -> String -> Position -> Task FileSystemError ( Int, String )
writeFileWithPosition encoding fd data position =
    Get.getAsync4_2E FileSystemError "write" fs fd data position (showEncoding encoding)


{-|
fs.write(fd, data[, position[, encoding]], callback)
Same as `writeFileWithPosition` except disregarding `Position`
-}
writeFile : FileSystem.Types.Encoding -> FileDescriptor -> String -> Task FileSystemError ( Int, String )
writeFile encoding fd data =
    Get.getAsync3_2E FileSystemError "write" fs fd data (showEncoding encoding)
