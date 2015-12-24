module Network.Server where

import Foreign.Patterns exposing (..)


import Emitter


--
-- Class: net.Server
-- Event: 'close'
-- Event: 'connection'
-- Event: 'error'
-- Event: 'listening'

-- server.address()
-- server.close([callback])
-- server.connections
-- server.getConnections(callback)
-- server.listen(handle[, callback])
-- server.listen(options[, callback])
-- server.listen(path[, callback])
-- server.listen(port[, hostname][, backlog][, callback])
-- server.maxConnections
-- server.ref()
-- server.unref()
