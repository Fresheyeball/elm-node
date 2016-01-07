module Streams.String (..) where

{-|
Stream helpers oriented around `String`s. Rarely in practices is code about streams about both `Buffer`s and `String`s (as Node allows both), so they have been split into seporate `modules`.

@docs write, writeWithEncoding, on, setDefaultEncoding, setEncoding, unshift
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
writeWithEncoding : Writable a -> Encoding -> String -> Task x ()
writeWithEncoding { writable } encoding string =
    Method.methodAsync2 "write" writable string (showEncoding encoding)


{-|
writable.write(chunk[, encoding][, callback])
Same as `writeWithEncoding` but defaulting to `Utf8`
-}
write : Writable a -> String -> Task x ()
write { writable } s =
    Method.methodAsync1 "write" writable s


{-|
On event listener for `String`s and readable events. Annoyingly Node.js sends
either a `String` or a `Buffer`, in this case `Buffer`s are dropped as `Nothing`.
-}
on : ReadableEvent -> (Maybe String -> Task x ()) -> Readable a -> Task x (Task x ())
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
setDefaultEncoding : Writable a -> Encoding -> Task x ()
setDefaultEncoding { writable } encoding =
    Method.method1
        "setDefaultEncoding"
        writable
        (showEncoding encoding)


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
unshift : Readable a -> String -> Task StreamError ()
unshift { readable } =
    Method.method1E StreamError "unshift" readable


{-|
readable.setEncoding(encoding)
Call this function to cause the stream to return strings of the specified encoding instead of Buffer objects.
For example, if you do readable.setEncoding('utf8'), then the output data will be interpreted as UTF-8 data,
and returned as strings. If you do readable.setEncoding('hex'), then the data will be encoded in hexadecimal
string format.

This properly handles multi-byte characters that would otherwise be potentially mangled if you simply pulled
the Buffers directly and called buf.toString(encoding) on them. If you want to read the data as strings,
always use this method.
-}
setEncoding : Readable a -> Encoding -> Task x ()
setEncoding { readable } encoding =
    Method.method1 "setEncoding" readable (showEncoding encoding)
