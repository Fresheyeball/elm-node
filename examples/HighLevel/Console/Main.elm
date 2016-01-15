module Main (..) where

import Console exposing (..)
import Console.Color exposing (..)
import Task exposing (Task)


wow : String
wow =
    regular Green "Colors make things more interesting"
        ++ "\n"
        ++ regular Green "Whether they are"
        ++ "\n"
        ++ underline Blue "Underlined"
        ++ "\n"
        ++ boldHighIntensity Purple "Intense"
        ++ "\n"
        ++ background Red "Or Scary"


port run : Task x ()
port run =
    log wow
