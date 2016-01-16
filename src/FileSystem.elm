module FileSystem (currentDirectory, existsOK, readOK, writeOK, executeOK, canAccessWithMode, canAccess, appendFile, stat, truncate, link, unlink, makeDirectoryWithMode, makeDirectory, openWithMode, open, rename, removeDirectory, symbolicLink, close, utimes, remove, changeMode, changeOwner) where

{-|
# Test
@docs existsOK, readOK, writeOK, executeOK, canAccessWithMode, canAccess, stat, utimes, currentDirectory

# Create
@docs makeDirectoryWithMode, makeDirectory

# Open
@docs openWithMode, open, close

# Modify
@docs changeMode, changeOwner, appendFile, truncate, link, rename, symbolicLink

# Remove
@docs unlink, remove, removeDirectory
-}

import Task exposing (Task)
import Time exposing (Time)
import Foreign.Pattern.Method as Method
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Member as Member
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (..)
import Native.FileSystem


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
Current directory of process execution. `__dirname` in Node speak
-}
currentDirectory : FilePath
currentDirectory =
    Native.FileSystem.dirname


{-|
Bitwise Int for testing existence a la f_ok
-}
existsOK : Mode
existsOK =
    Member.unsafeRead "F_OK" fs


{-|
Bitwise Int for testing readability a la r_ok
-}
readOK : Mode
readOK =
    Member.unsafeRead "R_OK" fs


{-|
Bitwise Int for testing writability a la w_ok
-}
writeOK : Mode
writeOK =
    Member.unsafeRead "W_OK" fs


{-|
Bitwise Int for testing excutability a la x_ok
-}
executeOK : Mode
executeOK =
    Member.unsafeRead "X_OK" fs


{-|
Can we access a given file with a specific `Mode`?
-}
canAccessWithMode : FilePath -> Mode -> Task x Bool
canAccessWithMode path mode =
    Get.getAsync2 "access" fs path mode
        |> Task.map truthy


{-|
Can we access a given file?
-}
canAccess : FilePath -> Task x Bool
canAccess path =
    canAccessWithMode path existsOK


{-| fs.appendFile(file, data[, options], callback)
-}
appendFile : FilePath -> String -> Task FileSystemError ()
appendFile =
    Method.methodAsync2E FileSystemError "appendFile" fs


{-| fs.close(fd, callback)
-}
close : FileDescriptor -> Task FileSystemError ()
close =
    Method.methodAsync1E FileSystemError "close" fs


{-| fs.link(srcpath, dstpath, callback)
-}
link : FilePath -> FilePath -> Task FileSystemError ()
link srcpath dstpath =
    Method.methodAsync2E FileSystemError "link" fs srcpath dstpath


{-| fs.mkdir(path[, mode], callback)
-}
makeDirectoryWithMode : FilePath -> Mode -> Task FileSystemError ()
makeDirectoryWithMode =
    Method.methodAsync2E FileSystemError "mkdir" fs


{-| fs.mkdir(path[, mode], callback)
-}
makeDirectory : FilePath -> Task FileSystemError ()
makeDirectory path =
    makeDirectoryWithMode
        path
        511



-- 777


{-| fs.open(path, flags[, mode], callback)
-}
openWithMode : FilePath -> Flags -> Mode -> Task FileSystemError FileDescriptor
openWithMode path flags mode =
    Get.getAsync3E FileSystemError "open" fs path (flagsToString flags) mode


{-| fs.open(path, flags[, mode], callback)
-}
open : FilePath -> Flags -> Task FileSystemError FileDescriptor
open path flags =
    openWithMode
        path
        flags
        438



-- 666


{-| fs.rename(oldPath, newPath, callback)
-}
rename : FilePath -> FilePath -> Task FileSystemError ()
rename oldPath newPath =
    Method.methodAsync2E FileSystemError "rename" fs oldPath newPath


{-| fs.rmdir(path, callback)
-}
removeDirectory : FilePath -> Task FileSystemError ()
removeDirectory =
    Method.methodAsync1E FileSystemError "rmdir" fs


{-| fs.stat(path, callback)
-}
stat : FilePath -> Task FileSystemError Stat
stat =
    Task.map marshallStat << Get.getAsync1E FileSystemError "stat" fs


{-| fs.symlink(destination, path[, type], callback)
-}
symbolicLink : FilePath -> FilePath -> SymbolicLinkType -> Task FileSystemError ()
symbolicLink destination path t =
    Method.methodAsync3E FileSystemError "symlink" fs destination path (symTypeToString t)


{-| fs.truncate(path, len, callback)
-}
truncate : Length -> FilePath -> Task FileSystemError ()
truncate len path =
    Method.methodAsync2E FileSystemError "truncate" fs path len


{-| fs.unlink(path, callback)
-}
unlink : FilePath -> Task FileSystemError ()
unlink =
    Method.methodAsync1E FileSystemError "unlink" fs


{-|
Alais for unlink, it will remove a file.
-}
remove : FilePath -> Task FileSystemError ()
remove =
    unlink


{-| fs.utimes(path, atime, mtime, callback)
-}
utimes : FilePath -> Time -> Time -> Task x ()
utimes =
    Method.methodAsync3 "utimes" fs


{-| fs.chmod(path, mode, callback)
-}
changeMode : FilePath -> Mode -> Task FileSystemError ()
changeMode =
    Method.methodAsync2E FileSystemError "chmod" fs


{-| fs.chown(path, uid, gid, callback)
-}
changeOwner : FilePath -> UserID -> GroupID -> Task FileSystemError ()
changeOwner =
    Method.methodAsync3E FileSystemError "chown" fs
