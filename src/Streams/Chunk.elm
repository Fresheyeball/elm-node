module Streams.Chunk (..) where

{-|
Stream helpers oriented around `Chunk`s. For the less common instance where your code cares about both `String`s and `Buffer`s.

@docs write, writeWithEncoding, on
-}

import Chunks exposing (..)
import Streams.Types exposing (..)
import Streams as S
import Streams.String as String
import Streams.Buffer as Buffer
import Either exposing (Either(..))
import Task exposing (Task)


{-|
writable.write(chunk[, encoding][, callback])
This method writes some data to the underlying system, and calls the supplied
callback once the data has been fully handled.

The return value indicates if you should continue writing right now. If the data had
to be buffered internally, then it will return false. Otherwise, it will return true.

This return value is strictly advisory. You MAY continue to write, even if it
returnsfalse. However, writes will be buffered in memory, so it is best not to do
this excessively. Instead, wait for the 'drain' event before writing more data.
-}
writeWithEncoding : Encoding -> Writable -> Chunk -> Task x ()
writeWithEncoding encoding writable c =
    case c of
        Left s ->
            String.writeWithEncoding writable encoding s

        Right b ->
            Buffer.write writable b


{-|
writable.write(chunk[, encoding][, callback])
Same as `writeWithEncoding`, defaulting to Utf8
-}
write : Writable -> Chunk -> Task x ()
write =
    writeWithEncoding defaultEncoding


{-|
Listen to an event on a Readable Stream
-}
on : ReadableEvent -> (Chunk -> Task x ()) -> Readable -> Task x (Task x ())
on =
    S.on
