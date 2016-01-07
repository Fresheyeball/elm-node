module Streams (..) where

{-|
# Methods
@docs isPaused, pause, resume, cork, uncork, end

# Listeners
@docs on

# Piping
@docs pipe, pipe', pipe'', unpipe, unpipeAll

# Read
@docs read, readWithSize

# Encoding
@docs setEncoding, unshiftBuffer, unshiftString, unshift

@docs withSignal
-}

import Task exposing (Task)
import Either exposing (..)
import Foreign.Marshall exposing (truthy)
import Foreign.Pattern.Get exposing (..)
import Foreign.Pattern.Method exposing (..)
import Streams.Types exposing (..)
import Streams.Marshall exposing (..)
import Emitter.Unsafe exposing (on1)
import Chunks exposing (..)
import Native.Streams


{-|
readable.isPaused()
This method returns whether or not the readable has been explicitly paused by client
code (using readable.pause() without a corresponding readable.resume()).
-}
isPaused : Readable -> Task x Bool
isPaused =
    get0 "isPaused"


{-|
readable.pause()
This method will cause a stream in flowing mode to stop emitting 'data' events, switching out of
flowing mode. Any data that becomes available will remain in the internal buffer.
-}
pause : Readable -> Task x ()
pause =
    method0 "pause"



-- Class: stream.Readable


{-|
Listen to an event on a Readable Stream
-}
on : ReadableEvent -> (Chunk -> Task x ()) -> Readable -> Task x (Task x ())
on event f readable =
    on1 (toNameR event) readable (Chunks.marshall >> f)


{-| readable.pipe(destination[, options])
-}
pipe : Readable -> Writable -> Task x ()
pipe =
    method1 "pipe"


{-| readable.pipe(destination[, options])
-}
pipe' : Readable -> Duplex -> Task x ()
pipe' readable ( _, writable ) =
    method1 "pipe" readable writable


{-| readable.pipe(destination[, options])
-}
pipe'' : Duplex -> Duplex -> Task x ()
pipe'' ( readable, _ ) ( _, writable ) =
    method1 "pipe" readable writable


{-| readable.unpipe([destination])
-}
unpipe : Readable -> Writable -> Task x ()
unpipe =
    method1 "unpipe"


{-| readable.unpipe([destination])
-}
unpipeAll : Readable -> Task x ()
unpipeAll =
    method0 "unpipe"


{-| readable.read([size])
-}
read : Readable -> Task x (Maybe Chunk)
read readable =
    get0 "read" readable
        |> Task.map
            (\raw ->
                if truthy raw then
                    Just (Chunks.marshall raw)
                else
                    Nothing
            )


{-| readable.read([size])
-}
readWithSize : Readable -> Int -> Task x (Maybe Chunk)
readWithSize readable size =
    get1 "read" readable size
        |> Task.map
            (\raw ->
                if truthy raw then
                    Just (Chunks.marshall raw)
                else
                    Nothing
            )


{-| readable.resume()
-}
resume : Readable -> Task x ()
resume =
    method0 "resume"


{-| readable.setEncoding(encoding)
-}
setEncoding : Readable -> Encoding -> Task x ()
setEncoding readable encoding =
    method1 "setEncoding" readable (showEncoding encoding)


{-| readable.unshift(chunk)
-}
unshiftString : Readable -> String -> Task x ()
unshiftString =
    method1 "unshift"


{-| readable.unshift(chunk)
-}
unshiftBuffer : Readable -> Buffer -> Task x ()
unshiftBuffer =
    method1 "unshift"


{-| readable.unshift(chunk)
-}
unshift : Readable -> Chunk -> Task x ()
unshift r c =
    case c of
        Left s ->
            unshiftString r s

        Right b ->
            unshiftBuffer r b



-- Class: stream.Writable


{-| writable.cork()
-}
cork : Writable -> Task x ()
cork =
    method0 "cork"


{-| writable.uncork()
-}
uncork : Writable -> Task x ()
uncork =
    method0 "uncork"


{-| writable.end([chunk][, encoding][, callback])
-}
end : Writable -> Task x ()
end =
    method0 "end"


{-|
withSignal
-}
withSignal : Signal a -> (a -> Task x ()) -> Task x ()
withSignal =
    Native.Streams.withSignal
