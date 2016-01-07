module Streams.Buffer (..) where

{-|
Stream helpers oriented around `Buffer`s. Rarely in practices is code about streams about both `Buffer`s and `String`s (as Node allows both), so they have been split into seporate `modules`.

@docs write, on, unshift
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
write : Writable a -> Buffer -> Task x ()
write { writable } =
    Method.methodAsync1 "write" writable


{-|
On event listener for `Buffer`s and readable events. Annoyingly Node.js sends
either a `String` or a `Buffer`, in this case `String`s are dropped as `Nothing`.
-}
on : ReadableEvent -> (Maybe Buffer -> Task x ()) -> Readable a -> Task x (Task x ())
on event action =
    S.on event
        <| \chunk ->
            action
                <| case chunk of
                    Left _ ->
                        Nothing

                    Right buffer ->
                        Just buffer


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
unshift : Readable a -> Buffer -> Task StreamError ()
unshift { readable } =
    Method.method1E StreamError "unshift" readable
