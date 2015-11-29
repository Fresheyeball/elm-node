module Main where

import FS.Streams.Raw exposing (..)
import FS.Types exposing (..)
import Streams.Types exposing (..)
import Streams.Raw exposing (..)

import Signal exposing (..)
import Task exposing (Task, andThen, succeed)

flow : Mailbox Buffer
flow = mailbox BufferEmpty

port read : Task x ()
port read =
  createReadStream "README.md"
  `andThen` onBuffer Data flow.address

port write : Task x ()
port write =
  createWriteStream "README-CLONE.md"
  `andThen` writeBuffer flow.signal
