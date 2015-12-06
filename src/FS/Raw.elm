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

access : FilePath -> Task x Bool
access = Task.map truthy << getAsync1 "access" fs

appendFile : FilePath -> String -> Task FSError ()
appendFile = Native.FS.appendFile FSError

chmod : FilePath -> Mode -> Task FSError ()
chmod = Native.FS.chmod FSError

chown : FilePath -> UID -> GID -> Task FSError ()
chown = Native.FS.chown FSError

close : FileDescriptor -> Task FSError ()
close = Native.FS.close FSError

fchmod : FileDescriptor -> Mode -> Task FSError ()
fchmod = Native.FS.fchmod FSError

fchown : FileDescriptor -> UID -> GID -> Task FSError ()
fchown = Native.FS.fchown FSError

fstat : FileDescriptor -> Task FSError Stat
fstat = Native.FS.fstat FSError

fsync : FileDescriptor -> Task FSError ()
fsync = Native.FS.fsync FSError

ftruncate : Length -> FileDescriptor -> Task FSError ()
ftruncate = Native.FS.ftruncate FSError

link : FilePath -> FilePath -> Task FSError ()
link srcpath dstpath =
  Native.FS.link FSError srcpath dstpath

mkdir' : FilePath -> Mode -> Task FSError ()
mkdir' = Native.FS.mkdir FSError

mkdir : FilePath -> Task FSError ()
mkdir fp = mkdir' fp
  511 -- 0o777

open' : FilePath -> Flags -> Mode -> Task FSError FileDescriptor
open' fp flags mode =
  Native.FS.open FSError fp (flagsToString flags) mode

open : FilePath -> Flags -> Task FSError FileDescriptor
open fp flags = open' fp flags
  438 -- 0o666

read : FileDescriptor
    -> Buffer
    -> Offset
    -> Length
    -> Position
    -> Task FSError (String, Buffer)
read =
  Native.FS.read FSError

readFile' : ReadFileOptions -> FilePath -> Task FSError String
readFile' o =
  Native.FS.readFile FSError (marshallReadFileOptions o)

readFile : FilePath -> Task FSError String
readFile = readFile' defaultReadFileOptions

readdir : FilePath -> Task FSError (List FilePath)
readdir = Native.FS.readdir FSError

readlink : FilePath -> Task FSError String
readlink = Native.FS.readlink FSError

rename : FilePath -> FilePath -> Task FSError ()
rename oldPath newPath =
  Native.FS.rename FSError oldPath newPath

rmdir : FilePath -> Task FSError ()
rmdir = Native.FS.rmdir FSError

stat : FilePath -> Task FSError Stat
stat = Native.FS.stat FSError

symlink : FilePath -> FilePath -> SymType -> Task FSError ()
symlink destination path t =
  Native.FS.symlink FSError destination path (symTypeToString t)

truncate : Length -> FilePath -> Task FSError ()
truncate = Native.FS.truncate FSError

unlink : FilePath -> Task FSError ()
unlink = Native.FS.unlink FSError

-- watch
--     : String
--    -> Address (WatchEvent, Maybe FilePath)
--    -> Task x FSWatcher
-- watch path address =
--   watch' path defaultWatchOptions address
--
-- watch'
--    : String
--   -> WatchOptions
--   -> Address (WatchEvent, Maybe FilePath)
--   -> Task x FSWatcher
-- watch' path options address =
--   watchRaw path options (Signal.send address)

watchFile'
   : WatchFileOptions
  -> FilePath
  -> ((Stat, Stat) -> Task x ())
  -> Task x (Task x ())
watchFile' =
  Native.FS.watchFile

watchFile
   : FilePath
  -> ((Stat, Stat) -> Task x ())
  -> Task x (Task x ())
watchFile = watchFile' defaultWatchFileOptions
--
-- watchFile'
--    : FilePath
--   -> WatchFileOptions
--   -> Address (Stat, Stat)
--   -> Task x WatchFileListener
-- watchFile' = Debug.crash ""

utimes : FilePath -> { atime : Time, mtime : Time} -> Task x ()
utimes = Native.FS.utimes

-- writeFileFromString
--    : FileDescriptor
--   -> String
--   -> Position
--   -> Encoding
--   -> Task FSError (Int, String)
-- writeFileFromString fd data position encoding =
--   Native.FS.write FSError fd data position (toNameE encoding)
--
-- writeFileFromBuffer
--    : FileDescriptor
--   -> Buffer
--   -> Offset
--   -> Length
--   -> Position
--   -> Task FSError (Int, Buffer)
-- writeFileFromBuffer = Native.FS.write

writeFileString' : WriteFileOptions -> FilePath -> String -> Task FSError ()
writeFileString' options path data =
  Native.FS.writeFile FSError path data (marshallWriteFileOptions options)

writeFileString : FilePath -> String -> Task FSError ()
writeFileString =
  writeFileString' defaultWriteFileOptions

writeFileBuffer' : WriteFileOptions -> FilePath -> Buffer -> Task FSError ()
writeFileBuffer' options path data =
  Native.FS.writeFile FSError path data (marshallWriteFileOptions options)

writeFileBuffer : FilePath -> Buffer -> Task FSError ()
writeFileBuffer =
  writeFileBuffer' defaultWriteFileOptions

writeFile' : WriteFileOptions -> FilePath -> Chunk -> Task FSError ()
writeFile' options path chunk =
  case chunk of
    Left  s -> writeFileString' options path s
    Right b -> writeFileBuffer' options path b

writeFile : FilePath -> Chunk -> Task FSError ()
writeFile = writeFile' defaultWriteFileOptions
