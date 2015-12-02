module Main where

import FS.Types exposing (FilePath, FSError)
import FS.Raw exposing (..)
import FS.Streams.Raw exposing (..)
import Streams.Types exposing (..)
import Streams.Raw exposing (..)

import Signal exposing (Signal, mailbox, Mailbox)
import Task exposing (Task, andThen, succeed)
import Debug

testFile : FilePath
testFile = dirname ++ "/testfile"

flow : Mailbox Buffer
flow = mailbox BufferEmpty

port log : Signal (Task x ())
port log =
  Signal.map
    (bufferToString Utf8 >> Task.map (Debug.log "flow" >> always ()))
    flow.signal

port read : Task FSError ()
port read =
  writeFileString testFile "success"
  `andThen` always (createReadStream testFile)
  `andThen` onBuffer Data flow.address

port write : Task x ()
port write =
  createWriteStream (testFile ++ "-clone")
  `andThen` writeBuffer flow.signal
