module Main (..) where

import FileSystem.Types exposing (FilePath, FileSystemError)
import FileSystem exposing (..)
import FileSystem.Streams.Read as Read
import FileSystem.Streams.Write as Write
import Streams exposing (..)
import Streams.Buffer as Buffer
import Streams.Types exposing (..)
import Process.Streams exposing (standardOut)
import Chunks exposing (..)
import Signal exposing (Signal, mailbox, Mailbox)
import Task exposing (Task, andThen, succeed)


testFile : FilePath
testFile =
    dirname ++ "/testfile"


flow : Mailbox Buffer
flow =
    mailbox emptyBuffer


port log : Signal (Task x ())
port log =
    Signal.map
        (Buffer.write standardOut)
        flow.signal


port read : Task FileSystemError ()
port read =
    let
        sendBuffer =
            Maybe.withDefault emptyBuffer >> Signal.send flow.address
    in
        writeFileString testFile "success"
            `andThen` always (Read.create testFile)
            `andThen` Buffer.on Data sendBuffer
            `andThen` always (succeed ())


port write : Task x ()
port write =
    Write.create (testFile ++ "-clone")
        `andThen` \stream ->
                    flow.signal `withSignal` Buffer.write stream
