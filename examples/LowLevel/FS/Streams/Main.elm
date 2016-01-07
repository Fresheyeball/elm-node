module Main (..) where

import FileSystem.Types exposing (FilePath, FileSystemError)
import FileSystem exposing (..)
import FileSystem.Streams exposing (..)
import Streams exposing (..)
import Streams.Types exposing (..)
import Chunks exposing (..)
import Signal exposing (Signal, mailbox, Mailbox)
import Task exposing (Task, andThen, succeed)
import Debug


testFile : FilePath
testFile =
    dirname ++ "/testfile"


flow : Mailbox Buffer
flow =
    mailbox emptyBuffer


port log : Signal (Task x ())
port log =
    Signal.map
        (bufferToString >> Task.map (Debug.log "flow" >> always ()))
        flow.signal


port read : Task FileSystemError ()
port read =
    writeFileString testFile "success"
        `andThen` always (createReadStream testFile)
        `andThen` onBuffer Data (Signal.send flow.address)
        `andThen` always (succeed ())


port write : Task x ()
port write =
    createWriteStream (testFile ++ "-clone")
        `andThen` \stream ->
                    flow.signal `withSignal` writeBuffer stream
