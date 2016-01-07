module FileSystem.Read (..) where


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.read(fd, buffer, offset, length, position, callback)
-}
read : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FileSystemError ( String, Buffer )
read =
    getAsync5_2E FileSystemError "read" fs


{-| fs.readFile(file[, options], callback)
-}
readFile' : ReadFileOptions -> FilePath -> Task FileSystemError String
readFile' opts path =
    getAsync2E FileSystemError "readFile" fs path (marshallReadFileOptions opts)


{-| fs.readFile(file[, options], callback)
-}
readFile : FilePath -> Task FileSystemError String
readFile =
    readFile' defaultReadFileOptions


{-| fs.readdir(path, callback)
-}
readdir : FilePath -> Task FileSystemError (List FilePath)
readdir =
    getAsync1E FileSystemError "readdir" fs


{-| fs.readlink(path, callback)
-}
readlink : FilePath -> Task FileSystemError String
readlink =
    getAsync1E FileSystemError "readLink" fs
