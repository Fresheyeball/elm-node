module FS.Raw where

import FS.Types exposing (..)
import Task exposing (Task)
import Native.FS

access : FilePath -> Task x Bool
access = Native.FS.access

appendFile : FilePath -> String -> Task WriteError ()
appendFile = Native.FS.appendFile

readFile_ : (String -> ReadError) -> String -> Task ReadError String
readFile_ = Native.FS.readFile

readFile : String -> Task ReadError String
readFile = readFile_ ReadError
