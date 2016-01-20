module Main (..) where

import FileSystem.Types exposing (FilePath, FileSystemError)
import FileSystem exposing (..)
import FileSystem.Streams.Read as Read
import FileSystem.Streams.Write as Write
import FileSystem.Write.String as S
import Streams exposing (withSignal, on)
import Streams.Buffer as Buffer
import Streams.Types exposing (..)
import Process.Streams exposing (standardOut)
import Process
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


(=>) : Task x a -> Task x b -> Task x b
(=>) t t' =
    t `andThen` always t'


port read : Task FileSystemError ()
port read =
    let
        sendBuffer =
            Maybe.withDefault emptyBuffer
                >> Signal.send flow.address
    in
        S.writeFile testFile "success"
            => (Read.create testFile)
            `andThen` \reader ->
                        Buffer.on Data sendBuffer reader
                            => on Close (always Process.exit) reader
                            => succeed ()


port write : Task x ()
port write =
    Write.create (testFile ++ "-clone")
        `andThen` \stream ->
                    flow.signal `withSignal` Buffer.write stream
