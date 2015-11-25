module Main where

import FS.Streams.Raw exposing (..)
import Streams.Types exposing (..)
import Streams.Raw exposing (..)

import Task exposing (Task, andThen)

port run : Task x ()
port run = let
  src  = createReadStream "README.md"
  sync = createWriteStream "README-CLONE.md"
  go r w = on (logBuffer Utf8) Data r
         `andThen` always (pipe r w)
  in Task.map2 go src sync `andThen` identity
