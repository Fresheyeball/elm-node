module Http.Server where


import Task exposing (Task, succeed, andThen)
import Signal exposing (Address, Mailbox, mailbox)
import Json.Encode as Json


import Foreign.Pattern exposing (..)


import Native.Http.Server
import Emitter exposing (..)


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
