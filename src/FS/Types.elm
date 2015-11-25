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

defaultReadOptions : ReadOptions
defaultReadOptions =
  { flags     = "r"
  , encoding  = T.Binary
  , mode      = 0
  , autoClose = True }

marshallReadOptions : ReadOptions -> ReadOptionsRaw

type alias WriteOptions =
  { flags           : String
  , defaultEncoding : Encoding
  , mode            : Int }

defaultWriteOptions : WriteOptions
defaultWriteOptions =
  { flags           = "w"
  , defaultEncoding = T.Binary
  , mode            = 0 }
