module FileSystem.Write.String (..) where


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.write(fd, data[, position[, encoding]], callback)
-}
writeFileFromString' : FileSystem.Types.Encoding -> FileDescriptor -> String -> Position -> Task FileSystemError ( Int, String )
writeFileFromString' encoding fd data position =
    getAsync4_2E FileSystemError "write" fs fd data position (showEncoding encoding)


{-| fs.write(fd, data[, position[, encoding]], callback)
-}
writeFileFromString : FileSystem.Types.Encoding -> FileDescriptor -> String -> Task FileSystemError ( Int, String )
writeFileFromString encoding fd data =
    getAsync3_2E FileSystemError "write" fs fd data (showEncoding encoding)


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileString' : WriteFileOptions -> FilePath -> String -> Task FileSystemError ()
writeFileString' options path data =
    methodAsync3E
        FileSystemError
        "writeFile"
        fs
        path
        data
        (marshallWriteFileOptions options)


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileString : FilePath -> String -> Task FileSystemError ()
writeFileString =
    writeFileString' defaultWriteFileOptions
