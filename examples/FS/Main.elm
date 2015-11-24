module Main where

import Node.Streams.Types exposing (..)
import Node.Streams.FS exposing (..)

import Task exposing (Task, andThen)

itsCool : a -> Task x ()
itsCool = always (Task.succeed ())

port run : Task x ()
port run = let
  src = createReadStream "README.md"
  sync = createWriteStream "Out.md"
  go r w = on (logBuffer utf8) Data r
         `andThen` always (pipe r w)
  in src `andThen` (\r ->
    sync `andThen` (\w -> go r w))
