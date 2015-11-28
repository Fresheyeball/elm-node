module FS.Raw where

import FS.Types exposing (..)
import Signal exposing (Address)
import Task exposing (Task)
import Native.FS

access : FilePath -> Task x Bool
access = Native.FS.access

appendFile : FilePath -> String -> Task FSError ()
appendFile = Native.FS.appendFile FSError

chmod : FilePath -> Mode -> Task FSError ()
chmod = Native.FS.chmod FSError

chown : FilePath -> Int -> Int -> Task FSError ()
chown = Native.FS.chown FSError

close : FileDescriptor -> Task FSError ()
close = Native.FS.close FSError

fchmod : FileDescriptor -> Mode -> Task FSError ()
fchmod = Native.FS.fchmod FSError

fchown : FileDescriptor -> Int -> Int -> Task FSError ()
fchown = Native.FS.fchown FSError

fstat : FileDescriptor -> Task FSError Stats
fstat = Native.FS.fstat FSError

fsync : FileDescriptor -> Task FSError ()
fsync = Native.FS.fsync FSError

ftruncate : Int -> FileDescriptor -> Task FSError ()
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

read : { fd       : FileDescriptor
       , buffer   : Buffer
       , offset   : Int
       , length   : Int
       , position : Int}
    -> Task FSError (String, Buffer)
read {fd, buffer, offset, length, position} =
  Native.FS.read FSError fd buffer offset length position

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

stat : FilePath -> Task FSError Stats
stat = Native.FS.stat FSError

symlink : FilePath -> FilePath -> SymType -> Task FSError ()
symlink destination path t =
  Native.FS.symlink FSError destination path (symTypeToString t)

truncate : Int -> FilePath -> Task FSError ()
truncate = Native.FS.truncate FSError

unlink : FilePath -> Task FSError ()
unlink = Native.FS.unlink FSError

watch
    : String
   -> Address (WatchEvent, FilePath)
   -> Task x FSWatcher
watch path address =
  watch' path defaultWatchOptions address

watch'
   : String
  -> WatchOptions
  -> Address (WatchEvent, FilePath)
  -> Task x FSWatcher
watch' path options address =
  watchRaw path options (Signal.send address)

watchRaw
   : String
  -> WatchOptions
  -> ((WatchEvent, FilePath) -> Task x ())
  -> Task x FSWatcher
watchRaw path options handler =
  Native.FS.watch path options <|
    \(event, path') ->
      case watchEventFromString event of
        Just watchEvent -> handler (watchEvent, path')
        _               -> Task.succeed ()

watchFile
   : FilePath
  -> Address ()
  ->
