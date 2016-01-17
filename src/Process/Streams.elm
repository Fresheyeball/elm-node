module Process.Streams (standardIn, standardOut, standardError) where

{-|
# Streams
@docs standardIn, standardOut, standardError
-}

import Foreign.Pattern.Member as Member
import Foreign.Marshall as Marshall
import Foreign.Types exposing (JSRaw)
import Streams.Types as Streams
import Streams.Marshall exposing (..)


process : JSRaw
process =
    Marshall.unsafeGetGlobalConstant "process"


{-|
process.stderr
A writable stream to stderr (on fd 2).

process.stderr and process.stdout are unlike other streams in Node.js in that they
cannot be closed (end() will throw), they never emit the finish event and that writes
can block when output is redirected to a file (although disks are fast and operating
systems normally employ write-back caching so it should be a very rare occurrence indeed.)
-}
standardError : Streams.Writable {}
standardError =
    Member.unsafeRead "stderr" process
        |> Streams.Marshall.marshallWritable


{-|
process.stdin
A Readable Stream for stdin (on fd 0).
-}
standardIn : Streams.Readable {}
standardIn =
    Member.unsafeRead "stdin" process
        |> Streams.Marshall.marshallReadable


{-|
process.stdout
A Writable Stream to stdout (on fd 1).

process.stderr and process.stdout are unlike other streams in Node.js in that they cannot be closed
(end() will throw), they never emit the 'finish' event and that writes can block when output is
redirected to a file (although disks are fast and operating systems normally employ
write-back caching so it should be a very rare occurrence indeed.)
-}
standardOut : Streams.Writable {}
standardOut =
    Member.unsafeRead "stdout" process
        |> Streams.Marshall.marshallWritable
