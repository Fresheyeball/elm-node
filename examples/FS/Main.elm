module Main where

import Node.FS.Streams exposing (..)
import Node.Streams.Types exposing (..)
import Node.Streams exposing (..)

import Task exposing (Task, andThen)

port run : Task x ()
port run = let
  src  = createReadStream "README.md"
  sync = createWriteStream "README-CLONE.md"
  go r w = on (logBuffer utf8) Data r
         `andThen` always (pipe r w)
  in Task.map2 go src sync `andThen` identity
