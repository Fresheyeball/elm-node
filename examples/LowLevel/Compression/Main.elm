module Main (..) where

import Streams exposing (..)
import FileSystem.Types exposing (FileSystemError(..))
import FileSystem.Streams.Write as FSWrite
import FileSystem.Streams.Member as FSRead
import FileSystem.Write.String exposing (writeFile)
import FileSystem.Member exposing (readFile)
import FileSystem exposing (remove)
import Compression exposing (createGzip, createGunzip)
import Task exposing (..)
import Chunk exposing (encodeBuffer)
import Console exposing (print, log)


infixr 2 >|
(>|) : Task x a -> Task x b -> Task x b
(>|) t t' =
    t `andThen` always t'


port run : Task FileSystemError ()
port run =
    let
        originalFile =
            "test.foo"

        resultedFile =
            originalFile ++ ".bar"

        reader =
            FSMember.create originalFile

        writer =
            FSWrite.create resultedFile

        pipey =
            let
                f read gzip gunzip write' =
                    (read `pipe` gzip)
                        >| (gzip `pipe` gunzip)
                        >| (gunzip `pipe` write')
            in
                map4
                    f
                    reader
                    createGzip
                    createGunzip
                    writer
                    `andThen` identity
    in
        log "writing file..."
            >| writeFile originalFile "sweet success"
            >| log "file wrote, piping..."
            >| pipey
            >| log "piped, removing original"
            >| remove originalFile
            >| log "original removed reading new file"
            >| (readFile resultedFile `andThen` (encodeBuffer >> log))
            >| log "cleaning up resulting file"
            >| remove resultedFile
