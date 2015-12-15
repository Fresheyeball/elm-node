module Http.Server where

import Emitter exposing (..)
import Foreign.Pattern exposing (..)
import Task exposing (Task, succeed, andThen)
import Signal exposing (Address, Mailbox, mailbox)
import Json.Encode as Json
import Native.Http.Server

-- HTTP

type ServerEvent
  = CheckContinue
  | ClientError
  | Close
  | Connect
  | Connection
  | Request
  | Upgrade

toNameE : ServerEvent -> String
toNameE se = case se of
  CheckContinue -> "checkContinue"


-- Class: http.Server
-- Event: 'checkContinue'
-- Event: 'clientError'
-- Event: 'close'
-- Event: 'connect'
-- Event: 'connection'
-- Event: 'request'
-- Event: 'upgrade'
-- server.close([callback])
-- server.listen(handle[, callback])
-- server.listen(path[, callback])
-- server.listen(port[, hostname][, backlog][, callback])
-- server.maxHeadersCount
-- server.setTimeout(msecs, callback)
-- server.timeout

-- http.METHODS
-- http.STATUS_CODES
-- http.createClient([port][, host])
-- http.createServer([requestListener])
-- http.get(options[, callback])
-- http.globalAgent
-- http.request(options[, callback])
