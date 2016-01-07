module FileSystem.Marshall (..) where

import Foreign.Types exposing (JSRaw)
import FileSystem.Types exposing (..)
import Chunks as C
import Native.FileSystem


type alias WriteFileOptionsRaw =
    { encoding : String
    , mode : Mode
    , flag : String
    }


marshallWriteFileOptions : WriteFileOptions -> WriteFileOptionsRaw
marshallWriteFileOptions { encoding, mode, flag } =
    { encoding = C.showEncoding encoding
    , mode = mode
    , flag = flagsToString flag
    }


type alias AppendOptionsRaw =
    { flag : String
    , encoding : String
    , mode : Mode
    }


marshallAppendOptions : AppendOptions -> AppendOptionsRaw
marshallAppendOptions o =
    { o
        | flag = flagsToString (.flag o)
        , encoding = C.unsafeShowEncoding (.encoding o)
    }


type alias ReadOptionsRaw =
    { flags : String
    , encoding : String
    , mode : Mode
    , autoClose : Bool
    }


marshallReadOptions : ReadOptions -> ReadOptionsRaw
marshallReadOptions o =
    { o
        | flags = flagsToString (.flags o)
        , encoding = C.unsafeShowEncoding (.encoding o)
    }


type alias ReadFileOptionsRaw =
    { flag : String
    , encoding : String
    }


marshallReadFileOptions : ReadFileOptions -> ReadFileOptionsRaw
marshallReadFileOptions o =
    { o
        | flag = flagsToString (.flag o)
        , encoding = C.unsafeShowEncoding (.encoding o)
    }


type alias WriteOptionsRaw =
    { flags : String
    , defaultEncoding : String
    , mode : Mode
    }


marshallWriteOptions : WriteOptions -> WriteOptionsRaw
marshallWriteOptions o =
    { o
        | flags = flagsToString (.flags o)
        , defaultEncoding = C.unsafeShowEncoding (.defaultEncoding o)
    }


marshallStat : JSRaw -> Stat
marshallStat =
    Native.FileSystem.marshallStat


watchEventFromString : String -> Maybe WatchEvent
watchEventFromString s =
    case s of
        "update" ->
            Just Update

        "error" ->
            Just WatchError

        _ ->
            Nothing


flagsToString : Flags -> String
flagsToString f =
    case f of
        R ->
            "r"

        Rplus ->
            "r+"

        RS ->
            "rs"

        RSplus ->
            "rs+"

        W ->
            "w"

        Wplus ->
            "w+"

        WX ->
            "wx"

        WXplus ->
            "wx+"

        A ->
            "a"

        AX ->
            "ax"

        Aplus ->
            "a+"

        AXplus ->
            "ax+"


symTypeToString : SymbolicLinkType -> String
symTypeToString t =
    case t of
        File ->
            "file"

        Dir ->
            "dir"

        Junction ->
            "junction"
