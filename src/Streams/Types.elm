module Streams.Types (..) where

{-|
@docs ReadableEvent, WritableEvent, Readable, Writable, Duplex, ReadableRaw, WritableRaw, StreamError

-}

import Foreign.Types exposing (JSRaw)


{-|
A Runtime Error thrown by a Stream
-}
type StreamError
    = StreamError String


{-|
Events genericaly available to all Readable Streams
-}
type ReadableEvent
    = Data
    | Read
    | Close
    | End
    | ReadError


{-|
Events generically available to all Writable Streams
-}
type WritableEvent
    = Drain
    | Pipe
    | Unpipe
    | Finish
    | WriteError


{-|
Raw instance of Node's Readable Stream class
-}
type ReadableRaw
    = ReadableRaw JSRaw


{-|
Raw instance of Node's Writable Stream class
-}
type WritableRaw
    = WritableRaw JSRaw


{-|
The Readable stream interface is the abstraction for a source of data that you are reading
from. In other words, data comes out of a Readable stream.

A Readable stream will not start emitting data until you indicate that you are ready to
receive it.

Readable streams have two "modes": a flowing mode and a paused mode. When in flowing mode,
data is read from the underlying system and provided to your program as fast as possible.
In paused mode, you must explicitly call stream.read() to get chunks of data out. Streams
start out in paused mode.

Note: If no data event handlers are attached, and there are no pipe() destinations, and the
stream is switched into flowing mode, then data will be lost.

You can switch to flowing mode by doing any of the following:

Adding a 'data' event handler to listen for data.
Calling the resume() method to explicitly open the flow.
Calling the pipe() method to send the data to a Writable.
You can switch back to paused mode by doing either of the following:

If there are no pipe destinations, by calling the pause() method.
If there are pipe destinations, by removing any 'data' event handlers, and removing all
pipe destinations by calling the unpipe() method.
Note that, for backwards compatibility reasons, removing 'data' event handlers will not
automatically pause the stream. Also, if there are piped destinations, then calling pause()
will not guarantee that the stream will remain paused once those destinations drain and ask
for more data.
-}
type alias Memberable a =
    { a | readable : ReadableRaw }


{-|
stream.Writable is an abstract class designed to be extended with an underlying implementation of the _write(chunk, encoding, callback) method.

Please see above under API for Stream Consumers for how to consume writable streams in your programs. What follows is an explanation of how to implement Writable streams in your programs
-}
type alias Writable a =
    { a | writable : WritableRaw }


{-|
A stream both readable and writable. In reality the `Readable` and `Writable` half of
the `Duplex` Tuple may reffer to the same Node.js Stream.
-}
type alias Duplex a =
    { a
        | writable : WritableRaw
        , readable : ReadableRaw
    }
