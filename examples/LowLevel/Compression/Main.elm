module Main (..) where

import Streams exposing (..)
import Streams.String exposing (write)
import Streams.Types exposing (ReadableEvent(..))
import FileSystem.Types exposing (FileSystemError)
import FileSystem.Streams.Write as FSWrite
import FileSystem.Streams.Read as FSRead
import FileSystem.Write.String exposing (writeFile)
import FileSystem exposing (remove)
import Compression exposing (createGzip)
import Task exposing (..)
import Chunk exposing (encodeChunk)
import Process.Streams exposing (standardOut)


infixr 2 >|
(>|) : Task x a -> Task x b -> Task x b
(>|) t t' =
    t `andThen` always t'


port run : Task FileSystemError ()
port run =
    let
        testFile = "test.foo"

        pipey read gzip write' =
            write standardOut "piping gzip"
            >| on Data (encodeChunk >> write standardOut) read
            >| read `pipe` gzip
            >| gzip `pipe` write'
            >| on Close (always <| remove testFile) read
    in
        write standardOut "writing file"
            >| writeFile testFile "sweet success"
            >| write standardOut "file wrote"
            >| pipey
            `map` FSRead.create testFile
            `andMap` createGzip
            `andMap` FSWrite.create (testFile ++ ".zip")
            >| succeed ()
