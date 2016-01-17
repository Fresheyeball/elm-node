module Main (..) where

import FileSystem.Types exposing (FilePath, FileSystemError)
import FileSystem exposing (..)
import FileSystem.Streams.Member as Member
import FileSystem.Streams.Write as Write
import FileSystem.Write.String as S
import Streams exposing (withSignal)
import Streams.Buffer as Buffer
import Streams.Types exposing (..)
import Process.Streams exposing (standardOut)
import Chunk.Types exposing (..)
import Chunk exposing (emptyBuffer)
import Signal exposing (Signal, mailbox, Mailbox)
import Task exposing (Task, andThen, succeed)


testFile : FilePath
testFile =
    currentDirectory ++ "/testfile"


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
        S.writeFile testFile "success"
            `andThen` always (Member.create testFile)
            `andThen` Buffer.on Data sendBuffer
            `andThen` always (succeed ())


port write : Task x ()
port write =
    Write.create (testFile ++ "-clone")
        `andThen` \stream ->
                    flow.signal `withSignal` Buffer.write stream
