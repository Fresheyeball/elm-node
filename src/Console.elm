module Console (..) where

{-|
Helpers for writting to Standard Out

@docs log, print

# Colors
@docs blue, cyan, green, purple, red, white, yellow
-}

import Process.Streams exposing (..)
import Streams.String exposing (..)
import Task exposing (Task)
import Console.Color exposing (..)


{-| -}
log : String -> Task x ()
log message =
    message
        |> write standardOut


{-| -}
print : a -> Task x ()
print =
    toString >> log


{-| -}
red : String -> Task x ()
red =
    regular Red >> log


{-| -}
green : String -> Task x ()
green =
    regular Green >> log


{-| -}
yellow : String -> Task x ()
yellow =
    regular Yellow >> log


{-| -}
blue : String -> Task x ()
blue =
    regular Blue >> log


{-| -}
purple : String -> Task x ()
purple =
    regular Purple >> log


{-| -}
cyan : String -> Task x ()
cyan =
    regular Cyan >> log


{-| -}
white : String -> Task x ()
white =
    regular White >> log
