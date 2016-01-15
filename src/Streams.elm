module Streams (..) where

{-|
# Writable Streams
@docs cork, uncork, end

# Readable Streams
@docs on, pipe, unpipe, unpipeAll, read, readWithSize, resume, pause, isPaused

@docs withSignal
-}

import Task exposing (Task)
import Foreign.Marshall exposing (truthy)
import Foreign.Pattern.Get exposing (..)
import Foreign.Pattern.Method as Method
import Streams.Types exposing (..)
import Streams.Marshall exposing (..)
import Emitter.Unsafe exposing (on1)
import Chunk.Types exposing (Chunk)
import Chunk.Marshall exposing (marshallChunk)
import Native.Streams


{-|
readable.isPaused()
This method returns whether or not the readable has been explicitly paused by client
code (using readable.pause() without a corresponding readable.resume()).
-}
isPaused : Readable a -> Task x Bool
isPaused { readable } =
    get0 "isPaused" readable


{-|
readable.pause()
This method will cause a stream in flowing mode to stop emitting 'data' events, switching out of
flowing mode. Any data that becomes available will remain in the internal buffer.
-}
pause : Readable a -> Task x ()
pause { readable } =
    Method.method0 "pause" readable


{-|
Listen to an event on a Readable Stream
-}
on : ReadableEvent -> (Chunk -> Task x ()) -> Readable a -> Task x (Task x ())
on event f { readable } =
    on1 (toNameR event) readable (marshallChunk >> f)


{-| readable.pipe(destination[, options])
This is emitted whenever the pipe() method is called on a readable stream, adding this
writable to its set of destinations.
-}
pipe : Readable a -> Writable b -> Task x ()
pipe { readable } { writable } =
    Method.method1 "pipe" readable writable


{-|
readable.unpipe([destination])
This method will remove the hooks set up for a previous pipe() call.
If no pipe is set up for it, then this is a no-op.
-}
unpipe : Readable a -> Writable b -> Task x ()
unpipe { readable } { writable } =
    Method.method1 "unpipe" readable writable


{-|
readable.unpipe([destination])
All pipes are removed.
-}
unpipeAll : Readable a -> Task x ()
unpipeAll { readable } =
    Method.method0 "unpipe" readable


{-|
readable.read([size])
There are some cases where you want to trigger a refresh of the underlying readable stream mechanisms, without
actually consuming any data. In that case, you can call stream.read(0), which will always return null.

If the internal read buffer is below the highWaterMark, and the stream is not currently reading, then calling
read(0) will trigger a low-level _read call.

There is almost never a need to do this. However, you will see some cases in Node.js's internals where this is
done, particularly in the Readable stream class internals.
-}
read : Readable a -> Task x (Maybe Chunk)
read { readable } =
    get0 "read" readable
        |> Task.map
            (\raw ->
                if truthy raw then
                    Just (marshallChunk raw)
                else
                    Nothing
            )


{-| readable.read([size])
Same as `read` but with size argument
-}
readWithSize : Readable a -> Int -> Task x (Maybe Chunk)
readWithSize { readable } size =
    get1 "read" readable size
        |> Task.map
            (\raw ->
                if truthy raw then
                    Just (marshallChunk raw)
                else
                    Nothing
            )


{-|
readable.resume()
This method will cause the readable stream to resume emitting data events.
This method will switch the stream into flowing mode. If you do not want to consume the data from a stream,
but you do want to get to its 'end' event, you can call readable.resume() to open the flow of data.
-}
resume : Readable a -> Task x ()
resume { readable } =
    Method.method0 "resume" readable


{-|
writable.cork()
Forces buffering of all writes.
Buffered data will be flushed either at .uncork() or at .end() call.
-}
cork : Writable a -> Task x ()
cork { writable } =
    Method.method0 "cork" writable


{-|
writable.uncork()
Flush all data, buffered since .cork() call.
-}
uncork : Writable a -> Task x ()
uncork { writable } =
    Method.method0 "uncork" writable


{-|
writable.end([chunk][, encoding][, callback])
Call this method when no more data will be written to the stream.
If supplied, the callback is attached as a listener on the 'finish' event.
-}
end : Writable a -> Task StreamError ()
end { writable } =
    Method.method0E StreamError "end" writable


{-|
withSignal
-}
withSignal : Signal a -> (a -> Task x ()) -> Task x ()
withSignal =
    Native.Streams.withSignal
