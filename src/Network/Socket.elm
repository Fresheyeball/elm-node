module Network.Socket where


import Task exposing (Task)


import Foreign.Pattern exposing (..)
import Foreign.Marshall exposing (unsafeToString)


import Emitter.Unsafe exposing (on0, on1)
import Network.Types exposing (..)
import Chunk exposing (Chunk)


-- Class: net.Socket
-- new net.Socket([options])


onClose : Socket -> Task x () -> Task x (Task x ())
onClose =
  on0 "close"


onConnect : Socket -> Task x () -> Task x (Task x ())
onConnect =
  on0 "connect"


onData : Socket -> (Chunk -> Task x ()) -> Task x (Task x ())
onData s f =
  on1 "data" s (f << Chunk.marshall)


onDrain : Socket -> Task x () -> Task x (Task x ())
onDrain =
  on0 "drain"


onEnd : Socket -> Task x () -> Task x (Task x ())
onEnd =
  on0 "end"


onError : Socket -> (String -> Task x ()) -> Task x (Task x ())
onError s f =
  on1 "error" s (f << unsafeToString)


onTimeout : Socket -> Task x () -> Task x (Task x ())
onTimeout =
  on0 "timeout"


address : Socket -> Task x SocketAddress
address =
  get0 "address"
  >> Task.map marshallSocketAddress

-- socket.bufferSize

-- socket.bytesRead
-- socket.bytesWritten
-- socket.connect(options[, connectListener])
-- socket.connect(path[, connectListener])
-- socket.connect(port[, host][, connectListener])
-- socket.destroy()
-- socket.end([data][, encoding])
-- socket.localAddress
-- socket.localPort
-- socket.pause()
-- socket.ref()
-- socket.remoteAddress
-- socket.remoteFamily
-- socket.remotePort
-- socket.resume()
-- socket.setEncoding([encoding])
-- socket.setKeepAlive([enable][, initialDelay])
-- socket.setNoDelay([noDelay])
-- socket.setTimeout(timeout[, callback])
-- socket.unref()
-- socket.write(data[, encoding][, callback])
