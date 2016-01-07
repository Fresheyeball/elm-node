module FileSystem (dirname, f_ok, r_ok, w_ok, x_ok, access', access, appendFile, chmod, fchmod, chown, fchown, stat, fstat, fsync, ftruncate, truncate, link, unlink, mkdir', mkdir, open', open, read, readFile', readFile, readdir, readlink, rename, rmdir, symlink, watchFile', watchFile, watch', watch, writeFileFromString', writeFileFromString, writeFileFromBuffer', writeFileFromBuffer, writeFileString', writeFileString, writeFileBuffer', writeFileBuffer, writeFile', writeFile, close, utimes) where

import Task exposing (Task)
import Time exposing (Time)
import Either exposing (Either(..))
import Foreign.Pattern.Method exposing (..)
import Foreign.Pattern.Get exposing (..)
import Foreign.Pattern.Listen exposing (listen2_2)
import Foreign.Pattern.Read exposing (..)
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FileSystem.Types exposing (..)
import Chunks exposing (unsafeShowEncoding, showEncoding, Buffer, Chunk, Encoding(Binary))
import Native.FileSystem


fs : JSRaw
fs =
    unsafeRequire "fs"


dirname : FilePath
dirname =
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


access' : FilePath -> Mode -> Task x Bool
access' path mode =
    getAsync2 "access" fs path mode
        |> Task.map truthy


access : FilePath -> Task x Bool
access path =
    access' path f_ok


{-| fs.appendFile(file, data[, options], callback)
-}
appendFile : FilePath -> String -> Task FileSystemError ()
appendFile =
    methodAsync2E FileSystemError "appendFile" fs


{-| fs.chmod(path, mode, callback)
-}
chmod : FilePath -> Mode -> Task FileSystemError ()
chmod =
    methodAsync2E FileSystemError "chmod" fs


{-| fs.chown(path, uid, gid, callback)
-}
chown : FilePath -> UID -> GID -> Task FileSystemError ()
chown =
    methodAsync3E FileSystemError "chown" fs


{-| fs.close(fd, callback)
-}
close : FileDescriptor -> Task FileSystemError ()
close =
    methodAsync1E FileSystemError "close" fs


{-| fs.fchmod(fd, mode, callback)
-}
fchmod : FileDescriptor -> Mode -> Task FileSystemError ()
fchmod =
    methodAsync2E FileSystemError "fchmod" fs


{-| fs.fchown(fd, uid, gid, callback)
-}
fchown : FileDescriptor -> UID -> GID -> Task FileSystemError ()
fchown =
    methodAsync3E FileSystemError "fchown" fs


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
mkdir' : FilePath -> Mode -> Task FileSystemError ()
mkdir' =
    methodAsync2E FileSystemError "mkdir" fs


{-| fs.mkdir(path[, mode], callback)
-}
mkdir : FilePath -> Task FileSystemError ()
mkdir path =
    mkdir'
        path
        511



-- 777


{-| fs.open(path, flags[, mode], callback)
-}
open' : FilePath -> Flags -> Mode -> Task FileSystemError FileDescriptor
open' path flags mode =
    getAsync3E FileSystemError "open" fs path (flagsToString flags) mode


{-| fs.open(path, flags[, mode], callback)
-}
open : FilePath -> Flags -> Task FileSystemError FileDescriptor
open path flags =
    open'
        path
        flags
        438



-- 666


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
symlink : FilePath -> FilePath -> SymType -> Task FileSystemError ()
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


{-| fs.watchFile(filename[, options], listener
    fs.unwatchFile(filename[, listener])
-}
watchFile' : WatchFileOptions -> FilePath -> (( Stat, Stat ) -> Task x ()) -> Task x (Task x ())
watchFile' opts path handler =
    listen2_2 "watchFile" "unwatchFile" fs path opts
        <| \( sraw, sraw' ) ->
            handler
                ( (marshallStat sraw)
                , (marshallStat sraw')
                )


{-| fs.watchFile(filename[, options], listener
-}
watchFile : FilePath -> (( Stat, Stat ) -> Task x ()) -> Task x (Task x ())
watchFile =
    watchFile' defaultWatchFileOptions


{-| fs.watch(filename[, options][, listener])
-}
watch' : WatchOptions -> FilePath -> (( WatchEvent, FilePath ) -> Task x ()) -> Task x (Task x ())
watch' opts path handler =
    listen2_2 "watch" "unwatch" fs path opts
        <| \( weRaw, path' ) ->
            case watchEventFromString weRaw of
                Just x ->
                    handler ( x, path' )

                Nothing ->
                    Task.succeed ()


{-| fs.watch(filename[, options][, listener])
-}
watch : FilePath -> (( WatchEvent, FilePath ) -> Task x ()) -> Task x (Task x ())
watch =
    watch' defaultWatchOptions


{-| fs.utimes(path, atime, mtime, callback)
-}
utimes : FilePath -> Time -> Time -> Task x ()
utimes =
    methodAsync3 "utimes" fs


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


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile' : WriteFileOptions -> FilePath -> Chunk -> Task FileSystemError ()
writeFile' options path chunk =
    case chunk of
        Left s ->
            writeFileString' options path s

        Right b ->
            writeFileBuffer' options path b


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile : FilePath -> Chunk -> Task FileSystemError ()
writeFile =
    writeFile' defaultWriteFileOptions
