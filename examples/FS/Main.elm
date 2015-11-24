module Main where

import Node.Streams.Types exposing (..)
import Node.Streams.FS exposing (..)

import Task exposing (Task)

itsCool : a -> Task x ()
itsCool = always (Task.succeed ())

port run : Task x ()
port run = createReadStream "README.md"
  `Task.andThen` on itsCool Data
