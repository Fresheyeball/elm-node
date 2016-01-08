module Compression (..) where

{-|

-}

import Foreign.Types exposing (JSRaw)
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Pattern.Get as Get
import Task exposing (Task)
import Streams.Types exposing (..)
import Streams.Marshall exposing (..)
import Compression.Marshall exposing (..)
import Compression.Types exposing (..)


zlib : JSRaw
zlib =
    unsafeRequire "zlib"


{-|
zlib.createDeflate(options)#
Returns a new Deflate object with an options.
-}
{-|

zlib.createDeflateRaw(options)#
Returns a new DeflateRaw object with an options.
-}
{-|

zlib.createGunzip(options)#
Returns a new Gunzip object with an options.
-}
{-|

zlib.createGzip(options)#
Returns a new Gzip object with an options.
-}
{-|

zlib.createInflate(options)#
Returns a new Inflate object with an options.
-}
{-|

zlib.createInflateRaw(options)
Returns a new InflateRaw object with an options.
-}
createInflateRawWith : DecompressionOptions -> Task x (Duplex {})
createInflateRawWith opts =
    Get.get1
        "createInflateRaw"
        zlib
        (marshallDecompressionOptions opts)
        |> Task.map marshallDuplex


{-|

zlib.createUnzip(options)#
Returns a new Unzip object with an options.
-}
