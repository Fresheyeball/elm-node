module Streams.Buffer (..) where

{-|
Stream helpers oriented around `Buffer`s. Rarely in practices is code about streams about both `Buffer`s and `String`s (as Node allows both), so they have been split into seporate `modules`.

@docs write, on
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
write : Writable -> Buffer -> Task x ()
write =
    Method.methodAsync1 "write"


{-|
On event listener for `Buffer`s and readable events. Annoyingly Node.js sends
either a `String` or a `Buffer`, in this case `String`s are dropped as `Nothing`.
-}
on : ReadableEvent -> (Maybe Buffer -> Task x ()) -> Readable -> Task x (Task x ())
on event action =
    S.on
        event
        (\chunk ->
            action
                <| case chunk of
                    Left _ ->
                        Nothing

                    Right buffer ->
                        Just buffer
        )
