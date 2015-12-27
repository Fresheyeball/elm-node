module Streams (..) where

import Task exposing (Task)
import Either exposing (..)
import Foreign.Marshall exposing (truthy)
import Foreign.Pattern exposing (..)
import Streams.Types exposing (..)
import Emitter.Unsafe exposing (on1)
import Chunks exposing (..)
import Native.Streams


{-| readable.isPaused()
-}
isPaused : Readable -> Task x Bool
isPaused =
    get0 "isPaused"


{-| readable.pause()
-}
pause : Readable -> Task x ()
pause =
    method0 "pause"



-- Class: stream.Readable


on : (Chunk -> Task x ()) -> ReadableEvent -> Readable -> Task x (Task x ())
on f event readable =
    on1 (toNameR event) readable (Chunks.marshall >> f)


onString : ReadableEvent -> (String -> Task x ()) -> Readable -> Task x (Task x ())
onString event f r =
    on
        (\chunk ->
            case chunk of
                Left s ->
                    f s

                Right _ ->
                    Task.succeed ()
        )
        event
        r


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
read' : Readable -> Int -> Task x (Maybe Chunk)
read' readable size =
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


{-| writable.end([chunk][, encoding][, callback])
-}
endWithBuffer : Writable -> Buffer -> Task x ()
endWithBuffer =
    method1 "end"


{-| writable.end([chunk][, encoding][, callback])
-}
endWithString' : Writable -> Encoding -> String -> Task x ()
endWithString' writable encoding string =
    method2 "end" writable string (showEncoding encoding)


{-| writable.end([chunk][, encoding][, callback])
-}
endWithString : Writable -> String -> Task x ()
endWithString writable s =
    endWithString' writable defaultEncoding s


{-| writable.end([chunk][, encoding][, callback])
-}
endWith' : Writable -> Encoding -> Chunk -> Task x ()
endWith' writable encoding chunk =
    case chunk of
        Left string ->
            endWithString' writable encoding string

        Right buffer ->
            endWithBuffer writable buffer


{-| writable.end([chunk][, encoding][, callback])
-}
endWith : Writable -> Chunk -> Task x ()
endWith writable c =
    endWith' writable defaultEncoding c


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


{-| writable.write(chunk[, encoding][, callback])
-}
writeBuffer : Writable -> Buffer -> Task x ()
writeBuffer =
    methodAsync1 "write"


{-| writable.write(chunk[, encoding][, callback])
-}
write' : Writable -> Encoding -> Chunk -> Task x ()
write' writable encoding c =
    case c of
        Left s ->
            writeString' writable encoding s

        Right b ->
            writeBuffer writable b


{-| writable.write(chunk[, encoding][, callback])
-}
write : Writable -> Chunk -> Task x ()
write writable chunk =
    write' writable defaultEncoding chunk


bufferToString' : Encoding -> Buffer -> Task x String
bufferToString' encoding buffer =
    get1 "toString" buffer (showEncoding encoding)


bufferToString : Buffer -> Task x String
bufferToString =
    bufferToString' defaultEncoding


withSignal : Signal a -> (a -> Task x ()) -> Task x ()
withSignal =
    Native.Streams.withSignal
