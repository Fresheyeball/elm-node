module Streams.String (..) where

{-|
Stream helpers oriented around `String`s. Rarely in practices is code about streams about both `Buffer`s and `String`s (as Node allows both), so they have been split into seporate `modules`.

@docs write, writeWithEncoding, on, setDefaultEncoding
-}

import Chunks exposing (..)
import Streams.Types exposing (..)
import Streams as S
import Either exposing (Either(..))
import Task exposing (Task)
import Foreign.Pattern.Method as Method


{-|
writable.write(chunk[, encoding][, callback])
This method writes some data to the underlying system, and calls the supplied callback
once the data has been fully handled.

You MAY continue to write, even if it returns false. However, writes will be buffered
in memory, so it is best not to do this excessively. Instead, wait for the 'drain'
event before writing more data.
-}
writeWithEncoding : Writable -> Encoding -> String -> Task x ()
writeWithEncoding writable encoding string =
    Method.methodAsync2 "write" writable string (showEncoding encoding)


{-|
writable.write(chunk[, encoding][, callback])
Same as `writeWithEncoding` but defaulting to `Utf8`
-}
write : Writable -> String -> Task x ()
write writable s =
    Method.methodAsync1 "write" writable s


{-|
On event listener for `String`s and readable events. Annoyingly Node.js sends
either a `String` or a `Buffer`, in this case `Buffer`s are dropped as `Nothing`.
-}
on : ReadableEvent -> (Maybe String -> Task x ()) -> Readable -> Task x (Task x ())
on event action readable =
    S.on
        event
        (\chunk ->
            action
                <| case chunk of
                    Left string ->
                        Just string

                    Right _ ->
                        Nothing
        )
        readable


{-|
writable.setDefaultEncoding(encoding)
Sets the default encoding for a writable stream.
-}
setDefaultEncoding : Writable -> Encoding -> Task x ()
setDefaultEncoding writable encoding =
    Method.method1
        "setDefaultEncoding"
        writable
        (showEncoding encoding)
