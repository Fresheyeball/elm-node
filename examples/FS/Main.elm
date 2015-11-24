module Main where

import Node.Streams.Types exposing (foo)

import Task
import Debug

port run : Task x ()
port run = Task.succeed <| Debug.log ("foo: " ++ foo) ()
