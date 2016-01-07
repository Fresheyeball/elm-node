module Chunk.Types (..) where

{-|
@docs Buffer, Chunk, Encoding
-}

import Foreign.Types exposing (JSRaw)
import Either exposing (Either)


{-|
Represents a raw instance of the Node.js binary Buffer class
-}
type Buffer
    = Buffer JSRaw


{-|
Chunks are either strings or buffers in node world, so `Either String Buffer` in Elm.
-}
type alias Chunk =
    Either String Buffer


{-|
Varaious encodings to get a `Buffer` as a `String`
-}
type Encoding
    = Ascii
    | Utf8
    | Hex
    | Base64
    | Binary
