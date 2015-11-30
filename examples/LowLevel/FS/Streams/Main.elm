module Main where

import FS.Streams.Raw exposing (..)
import Streams.Types exposing (..)
import Streams.Raw exposing (..)

import Signal exposing (Signal, mailbox, Mailbox)
import Task exposing (Task, andThen, succeed)

flow : Mailbox Buffer
flow = mailbox BufferEmpty

port log : Signal (Task x ())
port log =
  Signal.map (logBuffer Utf8) flow.signal

port read : Task x ()
port read =
  createReadStream "README.md"
  `andThen` onBuffer Data flow.address

port write : Task x ()
port write =
  createWriteStream "README-CLONE.md"
  `andThen` writeBuffer flow.signal
