module FS.Raw where

import FS.Types exposing (..)
import Streams.Types exposing
  ( unsafeToNameE
  , toNameE
  , Buffer
  , Chunk
  , Encoding(Binary))
import Task exposing (Task)
import Time exposing (Time)
import Either exposing (..)
import OOFFI exposing (..)
import Native.FS

type FSRaw = FSRaw

fs : FSRaw
fs = unsafeRequire "fs"

dirname : FilePath
dirname = unsafeGetGlobalConstant "__dirname"

f_ok : Mode
f_ok = unsafeGet0 "F_OK" fs

r_ok : Mode
r_ok = unsafeGet0 "R_OK" fs

w_ok : Mode
w_ok = unsafeGet0 "W_OK" fs

x_ok : Mode
x_ok = unsafeGet0 "X_OK" fs

defaultReadOptions : ReadOptions
defaultReadOptions =
  { flags          = R
  , mode           = 438 -- 666
  , autoClose      = True
  , encoding       = Binary }

marshallReadOptions : ReadOptions -> ReadOptionsRaw
marshallReadOptions o =
  { o | flags    = flagsToString    (.flags o)
      , encoding = unsafeToNameE (.encoding o) }

access : FilePath -> Mode -> Task x Bool
access path mode =
  getAsync2 "access" fs path mode
  |> Task.map truthy

{-| fs.appendFile(file, data[, options], callback) -}
appendFile : FilePath -> String -> Task FSError ()
appendFile = methodAsync2E FSError "appendFile" fs

{-| fs.chmod(path, mode, callback) -}
chmod : FilePath -> Mode -> Task FSError ()
chmod = methodAsync2E FSError "chmod" fs

{-| fs.chown(path, uid, gid, callback) -}
chown : FilePath -> UID -> GID -> Task FSError ()
chown = methodAsync3E FSError "chown" fs

{-| fs.close(fd, callback) -}
close : FileDescriptor -> Task FSError ()
close =  methodAsync1E FSError "close" fs

{-| fs.fchmod(fd, mode, callback) -}
fchmod : FileDescriptor -> Mode -> Task FSError ()
fchmod = methodAsync2E FSError "fchmod" fs

{-| fs.fchown(fd, uid, gid, callback) -}
fchown : FileDescriptor -> UID -> GID -> Task FSError ()
fchown = methodAsync3E FSError "fchown" fs

{-| fs.fstat(fd, callback) -}
fstat : FileDescriptor -> Task FSError Stat
fstat fd = getAsync1E FSError "fstat" fs fd
  |> Task.map Native.FS.marshallStat

{-| fs.fsync(fd, callback) -}
fsync : FileDescriptor -> Task FSError ()
fsync = getAsync1E FSError "fsync" fs

{-| fs.ftruncate(fd, len, callback) -}
ftruncate : Length -> FileDescriptor -> Task FSError ()
ftruncate len fd = getAsync2E FSError "ftruncate" fs fd len

{-| fs.link(srcpath, dstpath, callback) -}
link : FilePath -> FilePath -> Task FSError ()
link srcpath dstpath =
  methodAsync2E FSError "link" fs srcpath dstpath

{-| fs.mkdir(path[, mode], callback) -}
mkdir' : FilePath -> Mode -> Task FSError ()
mkdir' = methodAsync2E FSError "mkdir" fs

{-| fs.mkdir(path[, mode], callback) -}
mkdir : FilePath -> Task FSError ()
mkdir path = mkdir' path
  511 -- 777

{-| fs.open(path, flags[, mode], callback) -}
open' : FilePath -> Flags -> Mode -> Task FSError FileDescriptor
open' path flags mode =
  getAsync3E FSError "open" fs path (flagsToString flags) mode

{-| fs.open(path, flags[, mode], callback) -}
open : FilePath -> Flags -> Task FSError FileDescriptor
open path flags = open' path flags
  438 -- 666

{-| fs.read(fd, buffer, offset, length, position, callback) -}
read : FileDescriptor
    -> Buffer
    -> Offset
    -> Length
    -> Position
    -> Task FSError (String, Buffer)
read =
  get2Async5E FSError "read" fs

{-| fs.readFile(file[, options], callback) -}
readFile' : ReadFileOptions -> FilePath -> Task FSError String
readFile' opts path =
  getAsync2E FSError "readFile" fs path (marshallReadFileOptions opts)

{-| fs.readFile(file[, options], callback) -}
readFile : FilePath -> Task FSError String
readFile = readFile' defaultReadFileOptions

{-| fs.readdir(path, callback) -}
readdir : FilePath -> Task FSError (List FilePath)
readdir = getAsync1E FSError "readdir" fs

{-| fs.readlink(path, callback) -}
readlink : FilePath -> Task FSError String
readlink = getAsync1E FSError "readLink" fs

{-| fs.rename(oldPath, newPath, callback) -}
rename : FilePath -> FilePath -> Task FSError ()
rename oldPath newPath =
  methodAsync2E FSError "rename" fs oldPath newPath

{-| fs.rmdir(path, callback) -}
rmdir : FilePath -> Task FSError ()
rmdir = methodAsync1E FSError "rmdir" fs

{-| fs.stat(path, callback) -}
stat : FilePath -> Task FSError Stat
stat = getAsync1E FSError "stat" fs

{-| fs.symlink(destination, path[, type], callback) -}
symlink : FilePath -> FilePath -> SymType -> Task FSError ()
symlink destination path t =
  methodAsync3E FSError "symlink" fs destination path (symTypeToString t)

{-| fs.truncate(path, len, callback) -}
truncate : Length -> FilePath -> Task FSError ()
truncate len path = methodAsync2E FSError "truncate" fs path len

{-| fs.unlink(path, callback) -}
unlink : FilePath -> Task FSError ()
unlink = methodAsync1E FSError "unlink" fs



{-| fs.watchFile(filename[, options], listener -}
watchFile'
   : WatchFileOptions
  -> FilePath
  -> ((Stat, Stat) -> Task x ())
  -> Task x (Task x ())
watchFile' =
  Native.FS.watchFile

{-| fs.watchFile(filename[, options], listener -}
watchFile
   : FilePath
  -> ((Stat, Stat) -> Task x ())
  -> Task x (Task x ())
watchFile = watchFile' defaultWatchFileOptions

{-| fs.utimes(path, atime, mtime, callback) -}
utimes : FilePath -> Time -> Time -> Task x ()
utimes = methodAsync3 "utimes" fs

writeFileFromString
   : FileDescriptor
  -> String
  -> Position
  -> Encoding
  -> Task FSError (Int, String)
writeFileFromString fd data position encoding =
  get2Async4E FSError "write" fs fd data position (toNameE encoding)

-- writeFileFromBuffer
--    : FileDescriptor
--   -> Buffer
--   -> Offset
--   -> Length
--   -> Position
--   -> Task FSError (Int, Buffer)
-- writeFileFromBuffer = Native.FS.write

{-| fs.writeFile(file, data[, options], callback) -}
writeFileString' : WriteFileOptions -> FilePath -> String -> Task FSError ()
writeFileString' options path data =
  methodAsync3E FSError "writeFile" fs path data
    (marshallWriteFileOptions options)

{-| fs.writeFile(file, data[, options], callback) -}
writeFileString : FilePath -> String -> Task FSError ()
writeFileString =
  writeFileString' defaultWriteFileOptions

{-| fs.writeFile(file, data[, options], callback) -}
writeFileBuffer' : WriteFileOptions -> FilePath -> Buffer -> Task FSError ()
writeFileBuffer' options path data =
  methodAsync3E FSError "writeFile" fs path data
    (marshallWriteFileOptions options)

{-| fs.writeFile(file, data[, options], callback) -}
writeFileBuffer : FilePath -> Buffer -> Task FSError ()
writeFileBuffer =
  writeFileBuffer' defaultWriteFileOptions

{-| fs.writeFile(file, data[, options], callback) -}
writeFile' : WriteFileOptions -> FilePath -> Chunk -> Task FSError ()
writeFile' options path chunk =
  case chunk of
    Left  s -> writeFileString' options path s
    Right b -> writeFileBuffer' options path b

{-| fs.writeFile(file, data[, options], callback) -}
writeFile : FilePath -> Chunk -> Task FSError ()
writeFile = writeFile' defaultWriteFileOptions
