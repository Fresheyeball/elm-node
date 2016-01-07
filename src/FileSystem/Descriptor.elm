module FileSytem.Descriptor (changeMode, changeOwner, stat, sync, truncate) where

{-|
# `FileDescriptor` oriented file system functions
@docs changeMode, changeOwner, stat, sync, truncate
-}

import Foreign.Pattern.Method as Method
import Foreign.Pattern.Get as Get
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Types exposing (JSRaw)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (marshallStat)
import Task exposing (Task)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.fchmod(fd, mode, callback)
-}
changeMode : FileDescriptor -> Mode -> Task FileSystemError ()
changeMode =
    Method.methodAsync2E FileSystemError "fchmod" fs


{-| fs.fchown(fd, uid, gid, callback)
-}
changeOwner : FileDescriptor -> UserID -> GroupID -> Task FileSystemError ()
changeOwner =
    Method.methodAsync3E FileSystemError "fchown" fs


{-| fs.fstat(fd, callback)
-}
stat : FileDescriptor -> Task FileSystemError Stat
stat =
    Get.getAsync1E FileSystemError "fstat" fs
        >> Task.map marshallStat


{-| fs.fsync(fd, callback)
-}
sync : FileDescriptor -> Task FileSystemError ()
sync =
    Get.getAsync1E FileSystemError "fsync" fs


{-| fs.ftruncate(fd, len, callback)
-}
truncate : Length -> FileDescriptor -> Task FileSystemError ()
truncate len fd =
    Get.getAsync2E FileSystemError "ftruncate" fs fd len
