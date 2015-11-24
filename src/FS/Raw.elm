module FS.Raw where

import FS.Types exposing (FilePath)
import Task exposing (Task)
import Native.FS

type ReadError = ReadError

readFile : String -> Task ReadError String
readFile = Native.FS.readFile

access : FilePath -> Task x Bool
access = Native.FS.access
