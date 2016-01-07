module FileSystem.Types (..) where

{-|
@docs Encoding, FilePath, Mode, Offset, Position, Length, GroupID, UserID

@docs Stat, SymbolicLinkType

@docs ReadOptions, ReadFileOptions, defaultReadOptions, defaultReadFileOptions

@docs WatchEvent, FileSystemWatcher, WatchFileListener, WatchFileOptions, WatchOptions, defaultWatchOptions, defaultWatchFileOptions

@docs WriteFileOptions, WriteOptions, defaultWriteOptions, defaultWriteFileOptions

@docs AppendOptions, defaultAppendOptions

@docs FileSystemError, FileDescriptor, Flags
-}

import Foreign.Types exposing (JSRaw, JSDate)
import Chunks as C
import Time exposing (Time)


{-|
Re-export of `Encoding` from `Chunks`
-}
type alias Encoding =
    C.Encoding


{-|
The path to a file
-}
type alias FilePath =
    String


{-|
File mode
-}
type alias Mode =
    Int


{-|
Offset within a file
-}
type alias Offset =
    Int


{-|
Position within a file
-}
type alias Position =
    Int


{-|
Length of a file
-}
type alias Length =
    Int


{-|
Unix style gid
-}
type alias GroupID =
    Int


{-|
Unix style uid
-}
type alias UserID =
    Int


{-|
A runtime error thrown by the file system
-}
type FileSystemError
    = FileSystemError String


{-|
Raw node FileDescriptor
-}
type FileDescriptor
    = FileDescriptor JSRaw


{-|
Unix style file system Flags
-}
type Flags
    = R
    | Rplus
    | RS
    | RSplus
    | W
    | Wplus
    | WX
    | WXplus
    | A
    | AX
    | Aplus
    | AXplus


{-|
Read options
-}
type alias ReadOptions =
    { flags : Flags
    , encoding : Encoding
    , mode : Mode
    , autoClose : Bool
    }


{-|
Read file options
-}
type alias ReadFileOptions =
    { flag : Flags
    , encoding : Encoding
    }


{-|
Read file options default as specified by Node
-}
defaultReadFileOptions : ReadFileOptions
defaultReadFileOptions =
    { flag = R
    , encoding = C.Binary
    }


{-|
Read options default as specified by Node
-}
defaultReadOptions : ReadOptions
defaultReadOptions =
    { flags = R
    , mode =
        438
        -- 666
    , autoClose = True
    , encoding = C.Binary
    }


{-|
Wrtie options
-}
type alias WriteOptions =
    { flags : Flags
    , defaultEncoding : Encoding
    , mode : Mode
    }


{-|
Write options default as specified by Node
-}
defaultWriteOptions : WriteOptions
defaultWriteOptions =
    { flags = W
    , mode =
        438
        -- 0o666
    , defaultEncoding = C.Binary
    }


{-|
Append options
-}
type alias AppendOptions =
    { flag : Flags
    , encoding : Encoding
    , mode : Mode
    }


{-|
Append options default as specified by Node
-}
defaultAppendOptions : AppendOptions
defaultAppendOptions =
    { flag = A
    , mode =
        438
        -- 0o666
    , encoding = C.Binary
    }


{-|
File status object
-}
type alias Stat =
    { dev : Int
    , mode : Int
    , nlink : Int
    , uid : Int
    , gid : Int
    , rdev : Int
    , blksize : Int
    , ino : Int
    , size : Int
    , blocks : Int
    , atime : Time
    , mtime : Time
    , ctime : Time
    , birthtime : Time
    }


{-|
Types of symbolic links
[learn more](https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback)
-}
type SymbolicLinkType
    = File
    | Dir
    | Junction


{-|
Watch options
-}
type alias WatchOptions =
    { persistent : Bool
    , recursive : Bool
    }


{-|
Watch options default as specified by Node
-}
defaultWatchOptions : WatchOptions
defaultWatchOptions =
    { persistent = True
    , recursive = False
    }


{-|
Raw Node filesystem watcher object
-}
type FileSystemWatcher
    = FileSystemWatcher JSRaw


{-|
Listenable watch events
-}
type WatchEvent
    = Update
    | WatchError


{-|
This represents a JavaScript closure that can be used to `unlisten`
-}
type WatchFileListener
    = WatchFileListener JSRaw


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
Write file options
-}
type alias WriteFileOptions =
    { encoding : Encoding
    , mode : Mode
    , flag : Flags
    }


{-|
Default write file options as specified by Node
-}
defaultWriteFileOptions : WriteFileOptions
defaultWriteFileOptions =
    { encoding = C.Utf8
    , mode =
        438
        -- 0o666
    , flag = W
    }
