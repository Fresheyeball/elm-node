module Main (..) where

import Task exposing (Task, andThen)
import Signal as S
import FileSystem.Types exposing (..)
import FileSystem.Write.String exposing (..)
import FileSystem.Watch exposing (..)
import FileSystem exposing (..)


flow : S.Mailbox (Maybe ( Stat, Stat ))
flow =
    S.mailbox Nothing


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
        logAs s =
            Task.map <| always () << Debug.log s

        (>|) f f' =
            f `andThen` always f'
    in
        writeFile testFile "I feel like I'm being watched"
            >| watchFileWith opts testFile (Just >> S.send (.address flow))
            >| appendFile testFile ". Wait who are you?"
            >| logAs "stat" (stat testFile)
            >| logAs "access" (canAccess testFile)
            >| unlink testFile
            >| Task.succeed ()


port showWatch : Signal (Task x ())
port showWatch =
    let
        weGoodhere =
            Task.succeed ()

        parse ms =
            case ms of
                Just stat ->
                    always weGoodhere (Debug.log "stat" stat)

                Nothing ->
                    weGoodhere
    in
        Signal.map parse flow.signal
