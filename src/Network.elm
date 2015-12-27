module Network (..) where

import Foreign.Patterns
import Foreign.Marshall exposing (unsafeRequire)
import Network.Types as N


-- net.connect(options[, connectListener])
-- net.connect(path[, connectListener])
-- net.connect(port[, host][, connectListener])
-- net.createConnection(options[, connectListener])
-- net.createConnection(path[, connectListener])
-- net.createConnection(port[, host][, connectListener])
-- net.createServer([options][, connectionListener])
-- net.isIP(input)

net = unsafeRequire "net"

isIP : String -> Maybe N.Family
isIP = 



-- net.isIPv4(input)
-- net.isIPv6(input)
