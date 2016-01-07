module FileSystem.Write.Buffer (..) where


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.write(fd, buffer, offset, length[, position], callback)
-}
writeFileFromBuffer' : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FileSystemError ( Int, Buffer )
writeFileFromBuffer' =
    getAsync5_2E FileSystemError "write" fs


{-| fs.write(fd, buffer, offset, length[, position], callback)
-}
writeFileFromBuffer : FileDescriptor -> Buffer -> Offset -> Length -> Task FileSystemError ( Int, Buffer )
writeFileFromBuffer =
    getAsync4_2E FileSystemError "write" fs


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileBuffer' : WriteFileOptions -> FilePath -> Buffer -> Task FileSystemError ()
writeFileBuffer' options path data =
    methodAsync3E
        FileSystemError
        "writeFile"
        fs
        path
        data
        (marshallWriteFileOptions options)


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileBuffer : FilePath -> Buffer -> Task FileSystemError ()
writeFileBuffer =
    writeFileBuffer' defaultWriteFileOptions
