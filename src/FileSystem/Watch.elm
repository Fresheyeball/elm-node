module FileSystem.Watch (watchFileWithOptions, watchFile, watchWithOptions, watch, defaultWatchFileOptions, defaultWatchOptions) where

{-|
# Watch File
A watch flavor that is more efficient but only works for files
@docs watchFile, watchFileWithOptions, defaultWatchFileOptions

# Watch
A watch flavor that works for both files and directories but is less efficient
@docs watch, watchWithOptions, defaultWatchOptions
-}

import Task exposing (Task)
import Foreign.Pattern.Listen exposing (listen2_2)
import Foreign.Types exposing (..)
import Foreign.Marshall exposing (..)
import FileSystem.Types exposing (..)
import FileSystem.Marshall exposing (..)


fs : JSRaw
fs =
    unsafeRequire "fs"


{-|
Re-export of default options for watch file
-}
defaultWatchFileOptions : WatchFileOptions
defaultWatchFileOptions =
    defaultWatchFileOptions


{-|
Re-export of default options for watch
-}
defaultWatchOptions : WatchOptions
defaultWatchOptions =
    defaultWatchOptions


{-|
fs.watchFile(filename[, options], listener
fs.unwatchFile(filename[, listener])

Watch for changes on filename. The callback listener will be called each time the file is accessed.

The options argument may be omitted. If provided, it should be an object. The options object may contain a
boolean named persistent that indicates whether the process should continue to run as long as files are being
watched. The options object may specify an interval property indicating how often the target should be polled
in milliseconds. The default is { persistent: true, interval: 5007 }.
-}
watchFileWithOptions : WatchFileOptions -> FilePath -> (Stat -> Stat -> Task x ()) -> Task x (Task x ())
watchFileWithOptions opts path handler =
    listen2_2 "watchFile" "unwatchFile" fs path opts
        <| \( sraw, sraw' ) ->
            handler
                (marshallStat sraw)
                (marshallStat sraw')


{-| fs.watchFile(filename[, options], listener
Same as `watchFileWithOptions` but with defaults filled in
-}
watchFile : FilePath -> (Stat -> Stat -> Task x ()) -> Task x (Task x ())
watchFile =
    watchFileWithOptions defaultWatchFileOptions


{-|
fs.watch(filename[, options][, listener])
Watch for changes on filename, where filename is either a file or a directory.
The returned object is a fs.FSWatcher.

The second argument is optional. The options if provided should be an object. The supported boolean members are
persistent and recursive. persistent indicates whether the process should continue to run as long as files are
being watched. recursive indicates whether all subdirectories should be watched, or only the current directory.
This applies when a directory is specified, and only on supported platforms (See Caveats below).
-}
watchWithOptions : WatchOptions -> FilePath -> (WatchEvent -> FilePath -> Task x ()) -> Task x (Task x ())
watchWithOptions opts path handler =
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
    watchWithOptions defaultWatchOptions
