module Node.FS where

import Task exposing (Task)

import Node.FS.Types exposing (FilePath)
import Native.Node.FS

access : FilePath -> Task x Bool
access = Native.Node.FS.access
