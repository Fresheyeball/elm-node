module Main (..) where

import Process.Types exposing (ExitCode(Success))
import Process exposing (..)
import Process.Streams exposing (standardOut)
import Streams.String exposing (write)
import Task exposing (..)


(>|) : Task a b -> Task a c -> Task a c
(>|) f f' =
    f `andThen` always f'


logDirect : a -> Task x ()
logDirect =
    toString >> write standardOut


title : String -> Task x ()
title s =
    write standardOut ("\n\n" ++ s ++ ":\n")


logTask : Task a b -> Task a ()
logTask =
    flip andThen logDirect


port info : Task x ()
port info =
    title "environment"
        >| logTask getEnvironment
        >| title "architecture"
        >| logDirect architecture
        >| title "version"
        >| logDirect version
        >| title "versions"
        >| logDirect versions
        >| title "platform"
        >| logDirect platform
        >| title "argumentVector"
        >| logDirect argumentVector
        >| title "getTitle"
        >| logTask getTitle
        >| title "setTitle to testapp"
        >| setTitle "testapp"
        >| title "getTitle"
        >| logTask getTitle
        >| title "processId"
        >| logDirect processId
        >| title "uptime"
        >| logTask uptime
        >| title "getMemoryUsage"
        >| logTask getMemoryUsage
        >| title "getHighResolutionTime"
        >| logTask getHighResolutionTime
        >| exitWithCode Success
