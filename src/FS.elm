module FS (dirname, f_ok, r_ok, w_ok, x_ok, access', access, appendFile, chmod, fchmod, chown, fchown, stat, fstat, fsync, ftruncate, truncate, link, unlink, mkdir', mkdir, open', open, read, readFile', readFile, readdir, readlink, rename, rmdir, symlink, watchFile', watchFile, watch', watch, writeFileFromString', writeFileFromString, writeFileFromBuffer', writeFileFromBuffer, writeFileString', writeFileString, writeFileBuffer', writeFileBuffer, writeFile', writeFile, close, utimes) where

import Task exposing (Task)
import Time exposing (Time)
import Either exposing (Either(..))
import Foreign.Pattern exposing (..)
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FS.Types exposing (..)
import Chunk exposing (unsafeShowEncoding, showEncoding, Buffer, Chunk, Encoding(Binary))
import Native.FS


fs : JSRaw
fs =
    unsafeRequire "fs"


dirname : FilePath
dirname =
    Native.FS.dirname


f_ok : Mode
f_ok =
    unsafeGet0 "F_OK" fs


r_ok : Mode
r_ok =
    unsafeGet0 "R_OK" fs


w_ok : Mode
w_ok =
    unsafeGet0 "W_OK" fs


x_ok : Mode
x_ok =
    unsafeGet0 "X_OK" fs


access' : FilePath -> Mode -> Task x Bool
access' path mode =
    getAsync2 "access" fs path mode
        |> Task.map truthy


access : FilePath -> Task x Bool
access path =
    access' path f_ok


{-| fs.appendFile(file, data[, options], callback)
-}
appendFile : FilePath -> String -> Task FSError ()
appendFile =
    methodAsync2E FSError "appendFile" fs


{-| fs.chmod(path, mode, callback)
-}
chmod : FilePath -> Mode -> Task FSError ()
chmod =
    methodAsync2E FSError "chmod" fs


{-| fs.chown(path, uid, gid, callback)
-}
chown : FilePath -> UID -> GID -> Task FSError ()
chown =
    methodAsync3E FSError "chown" fs


{-| fs.close(fd, callback)
-}
close : FileDescriptor -> Task FSError ()
close =
    methodAsync1E FSError "close" fs


{-| fs.fchmod(fd, mode, callback)
-}
fchmod : FileDescriptor -> Mode -> Task FSError ()
fchmod =
    methodAsync2E FSError "fchmod" fs


{-| fs.fchown(fd, uid, gid, callback)
-}
fchown : FileDescriptor -> UID -> GID -> Task FSError ()
fchown =
    methodAsync3E FSError "fchown" fs


{-| fs.fstat(fd, callback)
-}
fstat : FileDescriptor -> Task FSError Stat
fstat =
    getAsync1E FSError "fstat" fs
        >> Task.map marshallStat


{-| fs.fsync(fd, callback)
-}
fsync : FileDescriptor -> Task FSError ()
fsync =
    getAsync1E FSError "fsync" fs


{-| fs.ftruncate(fd, len, callback)
-}
ftruncate : Length -> FileDescriptor -> Task FSError ()
ftruncate len fd =
    getAsync2E FSError "ftruncate" fs fd len


{-| fs.link(srcpath, dstpath, callback)
-}
link : FilePath -> FilePath -> Task FSError ()
link srcpath dstpath =
    methodAsync2E FSError "link" fs srcpath dstpath


{-| fs.mkdir(path[, mode], callback)
-}
mkdir' : FilePath -> Mode -> Task FSError ()
mkdir' =
    methodAsync2E FSError "mkdir" fs


{-| fs.mkdir(path[, mode], callback)
-}
mkdir : FilePath -> Task FSError ()
mkdir path =
    mkdir'
        path
        511



-- 777


{-| fs.open(path, flags[, mode], callback)
-}
open' : FilePath -> Flags -> Mode -> Task FSError FileDescriptor
open' path flags mode =
    getAsync3E FSError "open" fs path (flagsToString flags) mode


{-| fs.open(path, flags[, mode], callback)
-}
open : FilePath -> Flags -> Task FSError FileDescriptor
open path flags =
    open'
        path
        flags
        438



-- 666


{-| fs.read(fd, buffer, offset, length, position, callback)
-}
read : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FSError ( String, Buffer )
read =
    getAsync5_2E FSError "read" fs


{-| fs.readFile(file[, options], callback)
-}
readFile' : ReadFileOptions -> FilePath -> Task FSError String
readFile' opts path =
    getAsync2E FSError "readFile" fs path (marshallReadFileOptions opts)


{-| fs.readFile(file[, options], callback)
-}
readFile : FilePath -> Task FSError String
readFile =
    readFile' defaultReadFileOptions


{-| fs.readdir(path, callback)
-}
readdir : FilePath -> Task FSError (List FilePath)
readdir =
    getAsync1E FSError "readdir" fs


{-| fs.readlink(path, callback)
-}
readlink : FilePath -> Task FSError String
readlink =
    getAsync1E FSError "readLink" fs


{-| fs.rename(oldPath, newPath, callback)
-}
rename : FilePath -> FilePath -> Task FSError ()
rename oldPath newPath =
    methodAsync2E FSError "rename" fs oldPath newPath


{-| fs.rmdir(path, callback)
-}
rmdir : FilePath -> Task FSError ()
rmdir =
    methodAsync1E FSError "rmdir" fs


{-| fs.stat(path, callback)
-}
stat : FilePath -> Task FSError Stat
stat =
    Task.map marshallStat << getAsync1E FSError "stat" fs


{-| fs.symlink(destination, path[, type], callback)
-}
symlink : FilePath -> FilePath -> SymType -> Task FSError ()
symlink destination path t =
    methodAsync3E FSError "symlink" fs destination path (symTypeToString t)


{-| fs.truncate(path, len, callback)
-}
truncate : Length -> FilePath -> Task FSError ()
truncate len path =
    methodAsync2E FSError "truncate" fs path len


{-| fs.unlink(path, callback)
-}
unlink : FilePath -> Task FSError ()
unlink =
    methodAsync1E FSError "unlink" fs


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
writeFileFromString' : FS.Types.Encoding -> FileDescriptor -> String -> Position -> Task FSError ( Int, String )
writeFileFromString' encoding fd data position =
    getAsync4_2E FSError "write" fs fd data position (showEncoding encoding)


{-| fs.write(fd, data[, position[, encoding]], callback)
-}
writeFileFromString : FS.Types.Encoding -> FileDescriptor -> String -> Task FSError ( Int, String )
writeFileFromString encoding fd data =
    getAsync3_2E FSError "write" fs fd data (showEncoding encoding)


{-| fs.write(fd, buffer, offset, length[, position], callback)
-}
writeFileFromBuffer' : FileDescriptor -> Buffer -> Offset -> Length -> Position -> Task FSError ( Int, Buffer )
writeFileFromBuffer' =
    getAsync5_2E FSError "write" fs


{-| fs.write(fd, buffer, offset, length[, position], callback)
-}
writeFileFromBuffer : FileDescriptor -> Buffer -> Offset -> Length -> Task FSError ( Int, Buffer )
writeFileFromBuffer =
    getAsync4_2E FSError "write" fs


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileString' : WriteFileOptions -> FilePath -> String -> Task FSError ()
writeFileString' options path data =
    methodAsync3E
        FSError
        "writeFile"
        fs
        path
        data
        (marshallWriteFileOptions options)


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileString : FilePath -> String -> Task FSError ()
writeFileString =
    writeFileString' defaultWriteFileOptions


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileBuffer' : WriteFileOptions -> FilePath -> Buffer -> Task FSError ()
writeFileBuffer' options path data =
    methodAsync3E
        FSError
        "writeFile"
        fs
        path
        data
        (marshallWriteFileOptions options)


{-| fs.writeFile(file, data[, options], callback)
-}
writeFileBuffer : FilePath -> Buffer -> Task FSError ()
writeFileBuffer =
    writeFileBuffer' defaultWriteFileOptions


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile' : WriteFileOptions -> FilePath -> Chunk -> Task FSError ()
writeFile' options path chunk =
    case chunk of
        Left s ->
            writeFileString' options path s

        Right b ->
            writeFileBuffer' options path b


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile : FilePath -> Chunk -> Task FSError ()
writeFile =
    writeFile' defaultWriteFileOptions
