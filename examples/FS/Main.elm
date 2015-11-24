module Main where

import Node.Streams.Types exposing (foo)

import Task
import Debug

port run : Task.Task x ()
port run =
  Debug.log "foo" foo
  |> Task.succeed
  |> Task.map (always ())
