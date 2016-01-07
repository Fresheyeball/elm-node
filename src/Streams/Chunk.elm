module Streams.Chunk (..) where

{-|
Stream helpers oriented around `Chunk`s. For the less common instance where your code cares about both `String`s and `Buffer`s.

@docs write, writeWithEncoding, on, unshift
-}

import Chunk.Types exposing (..)
import Chunk exposing (defaultEncoding)
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
writeWithEncoding : Encoding -> Writable a -> Chunk -> Task x ()
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
write : Writable a -> Chunk -> Task x ()
write =
    writeWithEncoding defaultEncoding


{-|
Listen to an event on a Readable Stream
-}
on : ReadableEvent -> (Chunk -> Task x ()) -> Readable a -> Task x (Task x ())
on =
    S.on


{-|
readable.unshift(chunk)
This is useful in certain cases where a stream is being consumed by a parser, which needs to "un-consume"
some data that it has optimistically pulled out of the source, so that the stream can be passed on to some
other party.

Note that stream.unshift(chunk) cannot be called after the 'end' event has been triggered; a runtime
error will be raised.

If you find that you must often call stream.unshift(chunk) in your programs, consider implementing a
Transform stream instead. (See API for Stream Implementors, below.)
-}
unshift : Readable a -> Chunk -> Task StreamError ()
unshift readable chunk =
    case chunk of
        Left string ->
            String.unshift readable string

        Right buffer ->
            Buffer.unshift readable buffer
