module FileSystem.Watch (watchFileWith, watchFile, watchWith, watch, defaultWatchFileOptions, defaultWatchOptions, WatchFileOptions, WatchOptions) where

{-|
# Watch File
A watch flavor that is more efficient but only works for files
@docs watchFile, watchFileWith, defaultWatchFileOptions, WatchFileOptions

# Watch
A watch flavor that works for both files and directories but is less efficient
@docs watch, watchWith, defaultWatchOptions, WatchOptions
-}

import Task exposing (Task)
import Foreign.Pattern.Listen exposing (listen2_2)
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (..)
import Time exposing (Time)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
type for options passed to `watch`
-}
type alias WatchOptions =
    { persistent : Bool
    , recursive : Bool
    }


{-|
default watch options as specified by Node
-}
defaultWatchOptions : WatchOptions
defaultWatchOptions =
    { persistent = True
    , recursive = False
    }


{-|
Watch file options
-}
type alias WatchFileOptions =
    { persistent : Bool
    , interval : Time
    }


{-|
Default watch file options as specified by Node
-}
defaultWatchFileOptions : WatchFileOptions
defaultWatchFileOptions =
    { persistent = True
    , interval = 5007
    }


{-|
fs.watchFile(filename[, options], listener
fs.unwatchFile(filename[, listener])

Watch for changes on filename. The callback listener will be called each time the file is accessed.

The options argument may be omitted. If provided, it should be an object. The options object may contain a
boolean named persistent that indicates whether the process should continue to run as long as files are being
watched. The options object may specify an interval property indicating how often the target should be polled
in milliseconds. The default is { persistent: true, interval: 5007 }.
-}
watchFileWith : WatchFileOptions -> FilePath -> (Stat -> Stat -> Task x ()) -> Task x (Task x ())
watchFileWith opts path handler =
    listen2_2 "watchFile" "unwatchFile" fs path opts
        <| \( sraw, sraw' ) ->
            handler
                (marshallStat sraw)
                (marshallStat sraw')


{-| fs.watchFile(filename[, options], listener
Same as `watchFileWith` but with defaults filled in
-}
watchFile : FilePath -> (Stat -> Stat -> Task x ()) -> Task x (Task x ())
watchFile =
    watchFileWith defaultWatchFileOptions


{-|
fs.watch(filename[, options][, listener])
Watch for changes on filename, where filename is either a file or a directory.
The returned object is a fs.FSWatcher.

The second argument is optional. The options if provided should be an object. The supported boolean members are
persistent and recursive. persistent indicates whether the process should continue to run as long as files are
being watched. recursive indicates whether all subdirectories should be watched, or only the current directory.
This applies when a directory is specified, and only on supported platforms (See Caveats below).
-}
watchWith : WatchOptions -> FilePath -> (WatchEvent -> FilePath -> Task x ()) -> Task x (Task x ())
watchWith opts path handler =
    listen2_2 "watch" "unwatch" fs path opts
        <| \( weRaw, path' ) ->
            case watchEventFromString weRaw of
                Just x ->
                    handler x path'

                Nothing ->
                    Task.succeed ()


{-|
fs.watch(filename[, options][, listener])
Same as `watchWithOptions` but with defaults filled in
-}
watch : FilePath -> (WatchEvent -> FilePath -> Task x ()) -> Task x (Task x ())
watch =
    watchWith defaultWatchOptions
