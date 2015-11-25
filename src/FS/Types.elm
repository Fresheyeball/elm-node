module FS.Types where

import Streams.Types as T

type alias FilePath = String
type ReadError      = ReadError String
type WriteError     = WriteError String
type FileDescriptor = FileDescriptor
type alias Encoding = T.Encoding

type alias ReadOptions =
  { flags     : String
  , encoding  : Encoding
  , mode      : Int
  , autoClose : Bool }

type alias ReadOptionsRaw =
  { flags     : String
  , encoding  : String
  , mode      : Int
  , autoClose : Bool }

defaultReadOptions : ReadOptions
defaultReadOptions =
  { flags          = "r"
  , mode           = 438 -- 0o666
  , autoClose      = True
  , encoding       = T.Binary }

marshallReadOptions : ReadOptions -> ReadOptionsRaw
marshallReadOptions o =
  { o | encoding = T.toNameE (.encoding o) }

type alias WriteOptions =
  { flags           : String
  , defaultEncoding : Encoding
  , mode            : Int }

type alias WriteOptionsRaw =
  { flags           : String
  , defaultEncoding : String
  , mode            : Int }

defaultWriteOptions : WriteOptions
defaultWriteOptions =
  { flags           = "w"
  , mode            = 438 -- 0o666
  , defaultEncoding = T.Binary }

marshallWriteOptions : WriteOptions -> WriteOptionsRaw
marshallWriteOptions o =
  { o | defaultEncoding = T.toNameE (.defaultEncoding o) }
