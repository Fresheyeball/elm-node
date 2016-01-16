module Compression.Marshall (..) where

import Compression.Types exposing (..)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Pattern.Member as Member


zlib : JSRaw
zlib =
    unsafeRequire "zlib"


constant : String -> JSRaw
constant s =
    Member.unsafeRead s zlib


marshallFlush : Flush -> JSRaw
marshallFlush flush =
    case flush of
        NoFlush ->
            constant "Z_NO_FLUSH"

        PartialFlush ->
            constant "Z_PARTIAL_FLUSH"

        SyncFlush ->
            constant "Z_SYNC_FLUSH"

        FullFlush ->
            constant "Z_FULL_FLUSH"

        Finish ->
            constant "Z_FINISH"

        Block ->
            constant "Z_BLOCK"

        Trees ->
            constant "Z_TREES"


marshallLevel : Level -> JSRaw
marshallLevel level =
    case level of
        None ->
            constant "Z_NO_COMPRESSION"

        Speed ->
            constant "Z_BEST_SPEED"

        Compression ->
            constant "Z_BEST_COMPRESSION"

        DefaultCompression ->
            constant "Z_DEFAULT_COMPRESSION"


marshallStradegy : Stradegy -> JSRaw
marshallStradegy stradegy =
    case stradegy of
        Filtered ->
            constant "Z_FILTERED"

        HuffmanOnly ->
            constant "Z_HUFFMAN_ONLY"

        RLE ->
            constant "Z_RLE"

        Fixed ->
            constant "Z_FIXED"

        DefaultStradegy ->
            constant "Z_DEFAULT_STRATEGY"


type alias CompressionOptionsRaw =
    { flush : JSRaw
    , chunkSize : Int
    , windowBits : Int
    , level : JSRaw
    , memLevel : Int
    , stradegy : JSRaw
    }


marshallCompressionOptions : CompressionOptions -> CompressionOptionsRaw
marshallCompressionOptions o =
    { o
        | flush = marshallFlush o.flush
        , level = marshallLevel o.level
        , stradegy = marshallStradegy o.stradegy
    }


type alias DecompressionOptionsRaw =
    { flush : JSRaw
    , chunkSize : Int
    , windowBits : Int
    }


marshallDecompressionOptions : DecompressionOptions -> DecompressionOptionsRaw
marshallDecompressionOptions o =
    { o | flush = marshallFlush o.flush }
