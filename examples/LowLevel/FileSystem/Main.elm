module Main (..) where

import Task exposing (Task, andThen, succeed)
import Signal exposing (Signal, Mailbox, mailbox, send, map)
import FileSystem.Types exposing (..)
import FileSystem.Write.String exposing (..)
import FileSystem.Watch exposing (..)
import FileSystem exposing (..)
import Process exposing (exit)
import Console exposing (printAs)


flow : Mailbox (Maybe ( Stat, Stat ))
flow =
    mailbox Nothing


opts : WatchFileOptions
opts =
    { defaultWatchFileOptions
        | interval = 1000
    }


testFile : FilePath
testFile =
    "testFile"


port run : Task FileSystemError ()
port run =
    let
        (=>) f f' =
            f `andThen` always f'
    in
        writeFile testFile "I feel like I'm being watched"
            => watchFileWith opts testFile (curry <| Just >> send flow.address)
            => appendFile testFile ". Wait who are you?"
            => printAs "stat" (stat testFile)
            => printAs "access" (canAccess testFile)
            => unlink testFile
            => exit


port showWatch : Signal (Task x ())
port showWatch =
    let
        parse ms =
            case ms of
                Just stat ->
                    "stat"
                        ++ toString stat
                        |> Console.log

                Nothing ->
                    succeed ()
    in
        parse `map` flow.signal
