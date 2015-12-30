module Network (isIP) where

{-|
@docs isIP
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Read exposing (unsafeRead)
import Foreign.Marshall exposing (unsafeRequire)
import Network.Types as N


net : JSRaw
net =
    unsafeRequire "net"


{-|
Tests if input is an IP address.
-}
isIP : String -> Maybe N.Family
isIP couldBeIP =
    case unsafeRead "isIP" net couldBeIP of
        4 ->
            Just N.IPv4

        6 ->
            Just N.IPv6

        _ ->
            Nothing


{-|
net.connect(options[, connectListener])
A factory function, which returns a new net.Socket and automatically connects with the supplied options.

The options are passed to both the net.Socket constructor and the socket.connect method.

The connectListener parameter will be added as a listener for the 'connect' event once.

Here is an example of a client of the previously described echo server:

var net = require('net');
var client = net.connect({port: 8124},
    function() { //'connect' listener
  console.log('connected to server!');
  client.write('world!\r\n');
});
client.on('data', function(data) {
  console.log(data.toString());
  client.end();
});
client.on('end', function() {
  console.log('disconnected from server');
});
To connect on the socket /tmp/echo.sock the second line would just be changed to

var client = net.connect({path: '/tmp/echo.sock'});
-}



-- net.connect(options[, connectListener])
-- net.connect(path[, connectListener])
-- net.connect(port[, host][, connectListener])
-- net.createConnection(options[, connectListener])
-- net.createConnection(path[, connectListener])
-- net.createConnection(port[, host][, connectListener])
-- net.createServer([options][, connectionListener])
