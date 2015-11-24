module Main where

import Task exposing (Task)
import Node.FS exposing (..)

port run : Task x ()
port run = access "README.md"
  |> Task.map (always () << Debug.log "access")
