module Main (..) where

import Process exposing (..)
import Console exposing (green, print)
import Task exposing (..)


(=>) : Task a b -> Task a c -> Task a c
(=>) f f' =
    f `andThen` always f'


printTask : Task a b -> Task a ()
printTask =
    flip andThen print


port info : Task x ()
port info =
    green "environment"
        => printTask getEnvironment
        => green "architecture"
        => print architecture
        => green "version"
        => print version
        => green "versions"
        => print versions
        => green "platform"
        => print platform
        => green "argumentVector"
        => print arguments
        => green "getTitle"
        => printTask getTitle
        => green "setTitle to testapp"
        => setTitle "testapp"
        => green "getTitle"
        => printTask getTitle
        => green "processId"
        => print processId
        => green "uptime"
        => printTask uptime
        => green "getMemoryUsage"
        => printTask getMemoryUsage
        => green "getHighResolutionTime"
        => printTask getHighResolutionTime
        => exit
