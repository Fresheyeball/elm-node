module FileSystem (currentDirectory, f_ok, r_ok, w_ok, x_ok, accessWithMode, access, appendFile, stat, fstat, fsync, ftruncate, truncate, link, unlink, mkdirWithMode, mkdir, openWithMode, open, rename, rmdir, symlink, close, utimes) where

import Task exposing (Task)
import Time exposing (Time)
import Foreign.Pattern.Method exposing (..)
import Foreign.Pattern.Get exposing (..)
import Foreign.Pattern.Read exposing (..)
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (..)
import Native.FileSystem


fs : JSRaw
fs =
    unsafeRequire "fs"


currentDirectory : FilePath
currentDirectory =
    Native.FileSystem.dirname


f_ok : Mode
f_ok =
    unsafeRead "F_OK" fs


r_ok : Mode
r_ok =
    unsafeRead "R_OK" fs


w_ok : Mode
w_ok =
    unsafeRead "W_OK" fs


x_ok : Mode
x_ok =
    unsafeRead "X_OK" fs


accessWithMode : FilePath -> Mode -> Task x Bool
accessWithMode path mode =
    getAsync2 "access" fs path mode
        |> Task.map truthy


access : FilePath -> Task x Bool
access path =
    accessWithMode path f_ok


{-| fs.appendFile(file, data[, options], callback)
-}
appendFile : FilePath -> String -> Task FileSystemError ()
appendFile =
    methodAsync2E FileSystemError "appendFile" fs


{-| fs.close(fd, callback)
-}
close : FileDescriptor -> Task FileSystemError ()
close =
    methodAsync1E FileSystemError "close" fs


{-| fs.fstat(fd, callback)
-}
fstat : FileDescriptor -> Task FileSystemError Stat
fstat =
    getAsync1E FileSystemError "fstat" fs
        >> Task.map marshallStat


{-| fs.fsync(fd, callback)
-}
fsync : FileDescriptor -> Task FileSystemError ()
fsync =
    getAsync1E FileSystemError "fsync" fs


{-| fs.ftruncate(fd, len, callback)
-}
ftruncate : Length -> FileDescriptor -> Task FileSystemError ()
ftruncate len fd =
    getAsync2E FileSystemError "ftruncate" fs fd len


{-| fs.link(srcpath, dstpath, callback)
-}
link : FilePath -> FilePath -> Task FileSystemError ()
link srcpath dstpath =
    methodAsync2E FileSystemError "link" fs srcpath dstpath


{-| fs.mkdir(path[, mode], callback)
-}
mkdirWithMode : FilePath -> Mode -> Task FileSystemError ()
mkdirWithMode =
    methodAsync2E FileSystemError "mkdir" fs


{-| fs.mkdir(path[, mode], callback)
-}
mkdir : FilePath -> Task FileSystemError ()
mkdir path =
    mkdirWithMode
        path
        511



-- 777


{-| fs.open(path, flags[, mode], callback)
-}
openWithMode : FilePath -> Flags -> Mode -> Task FileSystemError FileDescriptor
openWithMode path flags mode =
    getAsync3E FileSystemError "open" fs path (flagsToString flags) mode


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
    methodAsync2E FileSystemError "rename" fs oldPath newPath


{-| fs.rmdir(path, callback)
-}
rmdir : FilePath -> Task FileSystemError ()
rmdir =
    methodAsync1E FileSystemError "rmdir" fs


{-| fs.stat(path, callback)
-}
stat : FilePath -> Task FileSystemError Stat
stat =
    Task.map marshallStat << getAsync1E FileSystemError "stat" fs


{-| fs.symlink(destination, path[, type], callback)
-}
symlink : FilePath -> FilePath -> SymbolicLinkType -> Task FileSystemError ()
symlink destination path t =
    methodAsync3E FileSystemError "symlink" fs destination path (symTypeToString t)


{-| fs.truncate(path, len, callback)
-}
truncate : Length -> FilePath -> Task FileSystemError ()
truncate len path =
    methodAsync2E FileSystemError "truncate" fs path len


{-| fs.unlink(path, callback)
-}
unlink : FilePath -> Task FileSystemError ()
unlink =
    methodAsync1E FileSystemError "unlink" fs


{-| fs.utimes(path, atime, mtime, callback)
-}
utimes : FilePath -> Time -> Time -> Task x ()
utimes =
    methodAsync3 "utimes" fs
