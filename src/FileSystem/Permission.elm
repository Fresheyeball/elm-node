module FileSystem.Permission (..) where


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.fchmod(fd, mode, callback)
-}
fchmod : FileDescriptor -> Mode -> Task FileSystemError ()
fchmod =
    methodAsync2E FileSystemError "fchmod" fs


{-| fs.fchown(fd, uid, gid, callback)
-}
fchown : FileDescriptor -> UserID -> GroupID -> Task FileSystemError ()
fchown =
    methodAsync3E FileSystemError "fchown" fs


{-| fs.chmod(path, mode, callback)
-}
chmod : FilePath -> Mode -> Task FileSystemError ()
chmod =
    methodAsync2E FileSystemError "chmod" fs


{-| fs.chown(path, uid, gid, callback)
-}
chown : FilePath -> UserID -> GroupID -> Task FileSystemError ()
chown =
    methodAsync3E FileSystemError "chown" fs
