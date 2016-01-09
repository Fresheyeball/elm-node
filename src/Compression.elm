module Compression (createDeflate, createDeflateWith, createDeflateRaw, createDeflateRawWith, createInflate, createInflateWith, createInflateRaw, createInflateRawWith, createGzip, createGzipWith, createUnzip, createUnzipWith, createGunzip, createGunzipWith) where

{-|
# Deflate
@docs createDeflate, createDeflateWith, createDeflateRaw, createDeflateRawWith

# Inflate
@docs createInflate, createInflateWith, createInflateRaw, createInflateRawWith

# Zip
@docs createGzip, createGzipWith

# Unzip
@docs createUnzip, createUnzipWith, createGunzip, createGunzipWith
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


createDecompression : String -> DecompressionOptions -> Task x (Duplex {})
createDecompression name opts =
    Get.get1
        name
        zlib
        (marshallDecompressionOptions opts)
        |> Task.map marshallDuplex


createCompression : String -> CompressionOptions -> Task x (Duplex {})
createCompression name opts =
    Get.get1
        name
        zlib
        (marshallCompressionOptions opts)
        |> Task.map marshallDuplex


{-|
zlib.createDeflate(options)
Returns a new Deflate object with an options.
-}
createDeflateWith : CompressionOptions -> Task x (Duplex {})
createDeflateWith =
    createCompression "createDeflate"


{-|
Same as `createDeflateWith` but with default options filled in
-}
createDeflate : Task x (Duplex {})
createDeflate =
    createDeflateWith defaultCompressionOptions


{-|
zlib.createDeflateRaw(options)
Returns a new DeflateRaw object with an options.
-}
createDeflateRawWith : CompressionOptions -> Task x (Duplex {})
createDeflateRawWith =
    createCompression "createGzip"


{-|
Same as `createDeflateRawWith` but with default options filled in
-}
createDeflateRaw : Task x (Duplex {})
createDeflateRaw =
    createDeflateRawWith defaultCompressionOptions


{-|
zlib.createGunzip(options)
Returns a new Gunzip object with an options.
-}
createGunzipWith : DecompressionOptions -> Task x (Duplex {})
createGunzipWith =
    createDecompression "createGunzip"


{-|
Same as `createGunzipWith` but with default options filled in
-}
createGunzip : Task x (Duplex {})
createGunzip =
    createGunzipWith defaultDecompressionOptions


{-|
zlib.createGzip(options)
Returns a new Gzip object with an options.
-}
createGzipWith : CompressionOptions -> Task x (Duplex {})
createGzipWith =
    createCompression "createGzip"


{-|
Same as `createGzipWith` but with default options filled in
-}
createGzip : Task x (Duplex {})
createGzip =
    createGzipWith defaultCompressionOptions


{-|
zlib.createInflate(options)
Returns a new Inflate object with an options.
-}
createInflateWith : DecompressionOptions -> Task x (Duplex {})
createInflateWith =
    createDecompression "createInflate"


{-|
Same as `createInflateWith` but with default options filled in
-}
createInflate : Task x (Duplex {})
createInflate =
    createInflateWith defaultDecompressionOptions


{-|
zlib.createInflateRaw(options)
Returns a new InflateRaw object with an options.
-}
createInflateRawWith : DecompressionOptions -> Task x (Duplex {})
createInflateRawWith =
    createDecompression "createInflateRaw"


{-|
Same as `createInflateRawWith` but with default options filled in
-}
createInflateRaw : Task x (Duplex {})
createInflateRaw =
    createInflateRawWith defaultDecompressionOptions


{-|
zlib.createUnzip(options)
Returns a new Unzip object with an options.
-}
createUnzipWith : DecompressionOptions -> Task x (Duplex {})
createUnzipWith =
    createDecompression "createUnzip"


{-|
Same as `createUnzipWith` but with default options filled in
-}
createUnzip : Task x (Duplex {})
createUnzip =
    createUnzipWith defaultDecompressionOptions
