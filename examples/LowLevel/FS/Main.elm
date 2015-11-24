module Main where

import Task exposing (Task)
import FS.Raw exposing (..)

port run : Task x ()
port run = access "README.md"
  |> Task.map (always () << Debug.log "access")
