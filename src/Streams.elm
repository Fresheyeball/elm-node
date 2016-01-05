module Streams (..) where

{-|
# Methods
@docs isPaused, pause, resume, cork, uncork, end

# Listeners
@docs on, onString, onBuffer

# Piping
@docs pipe, pipe', pipe'', unpipe, unpipeAll

# Write
@docs write, write', writeBuffer, writeString, writeString'

# Read
@docs read, readWithSize

# Encoding
@docs setDefaultEncoding, setEncoding, unshiftBuffer, unshiftString, unshift

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


on : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x (Task x ())
on f event readable =
    on1 (toNameR event) readable (Chunks.marshall >> f)


onString : ReadableEvent -> (String -> Task x ()) -> Readable -> Task x (Task x ())
onString event action readable =
    on
        (\chunk ->
            case chunk of
                Left string ->
                    action string

                Right _ ->
                    Task.succeed ()
        )
        event
        readable


onBuffer : ReadableEvent -> (Buffer -> Task x ()) -> Readable -> Task x (Task x ())
onBuffer event action readable =
    on
        (\chunk ->
            case chunk of
                Left _ ->
                    Task.succeed ()

                Right buffer ->
                    action buffer
        )
        event
        readable


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


{-| writable.setDefaultEncoding(encoding)
-}
setDefaultEncoding : Writable -> Encoding -> Task x ()
setDefaultEncoding writable encoding =
    method1 "setDefaultEncoding" writable (showEncoding encoding)


{-| writable.write(chunk[, encoding][, callback])
-}
writeString' : Writable -> Encoding -> String -> Task x ()
writeString' writable encoding string =
    methodAsync2 "write" writable string (showEncoding encoding)


{-| writable.write(chunk[, encoding][, callback])
-}
writeString : Writable -> String -> Task x ()
writeString writable s =
    writeString' writable defaultEncoding s


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
            writeString' writable encoding s

        Right b ->
            writeBuffer writable b


{-|
writable.write(chunk[, encoding][, callback])
Same as `writeWithEncoding`, defaulting to Utf8
-}
write : Writable -> Chunk -> Task x ()
write =
    writeWithEncoding defaultEncoding


{-| writable.write(chunk[, encoding][, callback])
-}
writeBuffer : Writable -> Buffer -> Task x ()
writeBuffer =
    methodAsync1 "write"


withSignal : Signal a -> (a -> Task x ()) -> Task x ()
withSignal =
    Native.Streams.withSignal
