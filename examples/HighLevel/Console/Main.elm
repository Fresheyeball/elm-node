module Main (..) where

import Console exposing (..)
import Task exposing (Task)


(>|) : Task x a -> Task x b -> Task x b
(>|) t t' =
    t `Task.andThen` always t'


port run : Task x ()
port run =
    log "Everything is more fun with colors!"
        >| green "success is more vibrant"
        >| caution "warnings are more warny"
        >| scare "terror more terrifying!"
        >| cyan "Devo more subversive"
        >| purple "Prince more fabulous"
