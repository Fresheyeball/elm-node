module Compression.Types (..) where

{-| -}


{-|
Allowed flush values.

zlib.Z_NO_FLUSH
zlib.Z_PARTIAL_FLUSH
zlib.Z_SYNC_FLUSH
zlib.Z_FULL_FLUSH
zlib.Z_FINISH
zlib.Z_BLOCK
zlib.Z_TREES
-}
type Flush
    = NoFlush
    | PartialFlush
    | SyncFlush
    | FullFlush
    | Finish
    | Block
    | Trees


{-|
Return codes for the compression/decompression functions. Negative values are errors, positive values are used for special but normal events.

zlib.Z_OK
zlib.Z_STREAM_END
zlib.Z_NEED_DICT
zlib.Z_ERRNO
zlib.Z_STREAM_ERROR
zlib.Z_DATA_ERROR
zlib.Z_MEM_ERROR
zlib.Z_BUF_ERROR
zlib.Z_VERSION_ERROR
-}
type CompressionCode
    = OK
    | StreamEnd
    | NeedDict
    | Errno
    | StreamError
    | DateError
    | MemError
    | BufError
    | VersionError


{-|
Compression levels.

zlib.Z_NO_COMPRESSION
zlib.Z_BEST_SPEED
zlib.Z_BEST_COMPRESSION
zlib.Z_DEFAULT_COMPRESSION
-}
type Level
    = None
    | Speed
    | Compression
    | DefaultCompression


{-|
Compression strategy.

zlib.Z_FILTERED
zlib.Z_HUFFMAN_ONLY
zlib.Z_RLE
zlib.Z_FIXED
zlib.Z_DEFAULT_STRATEGY
-}
type Stradegy
    = Filtered
    | HuffmanOnly
    | RLE
    | Fixed
    | DefaultStradegy


{-|
Possible values of the data_type field.

zlib.Z_BINARY
zlib.Z_TEXT
zlib.Z_ASCII
zlib.Z_UNKNOWN
-}
type DataType
    = Binary
    | Text
    | ASCII
    | Unknown


{-|
The deflate compression method (the only one supported in this version).

zlib.Z_DEFLATED
-}
type Deflation
    = Deflated


{-|
For initializing zalloc, zfree, opaque.

zlib.Z_NULL
-}
type Null
    = Null


{-|
Each class takes an options object. All options are optional.

Note that some options are only relevant when compressing, and are ignored by
the decompression classes.

flush (default: zlib.Z_NO_FLUSH)
chunkSize (default: 16*1024)
windowBits
level (compression only)
memLevel (compression only)
strategy (compression only)
dictionary (deflate/inflate only, empty dictionary by default)
See the description of deflateInit2 and inflateInit2 at

http://zlib.net/manual.html#Advanced for more information on these.
-}
type alias CompressionOptions =
    { flush : Flush
    , chunkSize : Int
    , windowBits : Int
    , level : Level
    , memLevel : Int
    , stradegy : Stradegy
    }


{-|
encoded defaults for compression options
-}
defaultCompressionOptions : CompressionOptions
defaultCompressionOptions =
    { flush = NoFlush
    , chunkSize = 16 * 1024
    , windowBits = 15
    , level = DefaultCompression
    , memLevel = 8
    , stradegy = DefaultStradegy
    }


{-|
options for decompression
-}
type alias DecompressionOptions =
    { flush : Flush
    , chunkSize : Int
    , windowBits : Int
    }


{-|
encoded defaults for decompression options
-}
defaultDecompressionOptions : DecompressionOptions
defaultDecompressionOptions =
    { flush = NoFlush
    , chunkSize = 16 * 1024
    , windowBits = 15
    }
