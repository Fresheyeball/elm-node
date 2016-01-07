module Process (onBeforeExit, onExit, onMessage, onSIGNAL, argumentVector, architecture, isConnected, abort, exit, exitWithCode, currentWorkingDirectory, changeCurrentWorkingDirectory, ChdirError(..), disconnect, getHighResolutionTime, version, versions, uptime, ProcessNotFound(..), kill, killWithSIGNAL, getTitle, setTitle, modifyTitle, platform, processId, getMemoryUsage, MemoryUsage, send, unmask, getEnvironment) where

{-|
# Events
@docs onBeforeExit, onExit, onMessage, onSIGNAL

# Process Info
@docs argumentVector, architecture, isConnected, version, versions, uptime, getTitle, setTitle, modifyTitle, platform, processId, getEnvironment

# Exit Methods
@docs abort, exit, exitWithCode, disconnect, kill, killWithSIGNAL, ProcessNotFound

# Working Directory
@docs currentWorkingDirectory, changeCurrentWorkingDirectory, ChdirError

# Utils
@docs getHighResolutionTime, getMemoryUsage, MemoryUsage

# Misc
@docs send, unmask
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Method as Method
import Foreign.Pattern.Read as Read
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Set as Set
import Foreign.Marshall as Marshall
import Emitter.Unsafe as Emitter
import Task exposing (Task)
import Json.Decode as Json
import Time exposing (Time)
import Dict
import Process.Types exposing (..)


process : JSRaw
process =
    Marshall.unsafeGetGlobalConstant "process"


{-|
Event: 'beforeExit'
This event is emitted when Node.js empties its event loop and has nothing else
to schedule. Normally, Node.js exits when there is no work scheduled, but a
listener for 'beforeExit' can make asynchronous calls, and cause Node.js to continue.

'beforeExit' is not emitted for conditions causing explicit termination,
such as process.exit() or uncaught exceptions, and should not be used as an
alternative to the 'exit' event unless the intention is to schedule more work.
-}
onBeforeExit : Task x () -> Task x (Task x ())
onBeforeExit =
    Emitter.on0 "beforeExit" process


{-|
Event: 'exit'
Emitted when the process is about to exit. There is no way to prevent the exiting of the event loop at this point, and once all 'exit' listeners have finished running the process will exit. Therefore you must only perform synchronous operations in this handler. This is a good hook to perform checks on the module's state (like for unit tests). The callback takes one argument, the code the process is exiting with.

This event is only emitted when Node.js exits explicitly by process.exit() or implicitly by the event loop draining.
-}
onExit : (Maybe ExitCode -> Task x ()) -> Task x (Task x ())
onExit f =
    Emitter.on1 "exit" process (f << intToExit)


{-|
Event: 'message'
message Object a parsed JSON object or primitive value
sendHandle Handle object a net.Socket or net.Server object, or undefined.
Messages sent by ChildProcess.send() are obtained using the 'message' event on the child's process object.
-}
onMessage : (JSRaw -> Task x ()) -> Task x (Task x ())
onMessage =
    Emitter.on1 "message" process


{-| Execute a task on a process signal
-}
onSIGNAL : SIGNAL -> Task x () -> Task x (Task x ())
onSIGNAL sig =
    Emitter.on0 (toString sig) process


{-|
process.abort()
This causes Node.js to emit an abort. This will cause Node.js to exit and generate a core file.
-}
abort : Task x ()
abort =
    Method.method0 "abort" process


{-|
process.arch
What processor architecture you're running on: 'arm', 'ia32', or 'x64'.
-}
architecture : Maybe Architecture
architecture =
    case Read.unsafeRead "arch" process of
        "arm" ->
            Just Arm

        "ia32" ->
            Just Ia32

        "x64" ->
            Just X64

        _ ->
            Nothing


{-|
process.argv
An array containing the command line arguments. The first element will be 'node',
the second element will be the name of the JavaScript file.
The next elements will be any additional command line arguments.

```
$ node process-2.js one two=three four
```

will result in

```
argumentVector = [ "node", "process-2.js", "one", "two=three", "four" ]
```
-}
argumentVector : List String
argumentVector =
    Read.unsafeRead "argv" process


{-| An error that changeCurrentWorkingDirectory may throw
-}
type ChdirError
    = ChdirError String


{-|
process.chdir(directory)
Changes the current working directory of the process or throws an
exception if that fails.
-}
changeCurrentWorkingDirectory : String -> Task ChdirError ()
changeCurrentWorkingDirectory =
    Method.method1E ChdirError "chdir" process


{-|
process.connected
Boolean Set to false after process.disconnect() is called
If process.connected is false, it is no longer possible to send messages.
-}
isConnected : Task x Bool
isConnected =
    Read.read "connected" process


{-|
process.cwd()
Returns the current working directory of the process.
-}
currentWorkingDirectory : Task x String
currentWorkingDirectory =
    Get.get0 "cwd" process


{-|
process.disconnect()
Close the IPC channel to the parent process, allowing this child to exit
gracefully once there are no other connections keeping it alive.

Identical to the parent process's ChildProcess.disconnect().

If Node.js was not spawned with an IPC channel, process.disconnect() will be undefined.
-}
disconnect : Task x ()
disconnect =
    Method.method0 "disconnect" process


{-|
process.env
An object containing the user environment. See environ(7).

An example of this object looks like:

{ TERM: 'xterm-256color',
  SHELL: '/usr/local/bin/bash',
  USER: 'maciej',
  PATH: '~/.bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
  PWD: '/Users/maciej',
  EDITOR: 'vim',
  SHLVL: '1',
  HOME: '/Users/maciej',
  LOGNAME: 'maciej',
  _: '/usr/local/bin/node' }
-}
getEnvironment : Task x (Dict.Dict String String)
getEnvironment =
    Marshall.unsafeToDict `Task.map` Read.read "env" process


{-|
process.exit([code])
Ends the process with the specified code.
-}
exitWithCode : ExitCode -> Task x ()
exitWithCode code =
    Method.method1 "exit" process (exitToInt code)


{-| Exit with exit code `Success` (which is 0 in C speak)
-}
exit : Task x ()
exit =
    Method.method0 "exit" process


{-|
process.hrtime()
Returns the current high-resolution real time in a [seconds, nanoseconds] tuple Array.
It is relative to an arbitrary time in the past. It is not related to the time of day
and therefore not subject to clock drift. The primary use is for measuring performance between intervals.
-}
getHighResolutionTime : Task x (Maybe ( Time, Time ))
getHighResolutionTime =
    Get.get0 "hrtime" process
        `Task.andThen` \rawTup ->
                        Json.decodeValue (Json.tuple2 (,) Json.float Json.float) rawTup
                            |> Task.fromResult
                            |> Task.toMaybe


{-| Error that may be thrown by `kill`
-}
type ProcessNotFound
    = ProcessNotFound String


{-|
process.kill(pid[, signal])
Send a signal to a process. pid is the process id and signal is the string describing the signal to send.
Signal with be SIGTERM.

Will throw an error if target does not exist, and as a special case, a signal of 0 can be used
to test for the existence of a process. Windows platforms will throw an error if the pid
is used to kill a process group.

Note that even though the name of this function is process.kill, it is really just a signal sender,
like the kill system call. The signal sent may do something other than kill the target process.
-}
kill : Int -> Task ProcessNotFound ()
kill =
    Method.method1E ProcessNotFound "kill" process


{-| same as kill but with a specific SIGNAL
-}
killWithSIGNAL : Int -> SIGNAL -> Task ProcessNotFound ()
killWithSIGNAL i sig =
    Method.method2E ProcessNotFound "kill" process i (toString sig)


{-|
Type for memoryUsage's return
-}
type alias MemoryUsage =
    { rss : Int
    , heapTotal : Int
    , heapUsed : Int
    }


{-|
process.memoryUsage()
Returns an object describing the memory usage of the Node.js process measured in bytes.
heapTotal and heapUsed refer to V8's memory usage.
-}
getMemoryUsage : Task x MemoryUsage
getMemoryUsage =
    Get.get0 "memoryUsage" process


{-|
process.pid
The PID of the process.
-}
processId : Int
processId =
    Read.unsafeRead "pid" process


{-|
process.platform
What platform you're running on: 'darwin', 'freebsd', 'linux', 'sunos' or 'win32'
-}
platform : Platform
platform =
    case Read.unsafeRead "platform" process of
        "darwin" ->
            Darwin

        "freebsd" ->
            FreeBSD

        "linux" ->
            Linux

        "sunos" ->
            SunOS

        "win32" ->
            Win32

        _ ->
            Unknown


{-|
process.send(message[, sendHandle][, callback])
When Node.js is spawned with an IPC channel attached, it can send messages to its parent process using
process.send(). Each will be received as a 'message' event on the parent's ChildProcess object.

If Node.js was not spawned with an IPC channel, process.send() will be undefined.
-}
send : Maybe (String -> Task x ())
send =
    method1IfFunction "send"


method1IfFunction : String -> Maybe (a -> Task x ())
method1IfFunction name =
    if Marshall.truthy <| Read.unsafeRead name process then
        Just <| Method.method1 name process
    else
        Nothing


{-|
process.title
To set what is displayed in `ps`.
-}
getTitle : Task x String
getTitle =
    Read.read "title" process


{-| Sets the process title
The maximum length is platform-specific and probably short.
On Linux and OS X, it's limited to the size of the binary name plus the length of the command line arguments because it overwrites the argv memory.
-}
setTitle : String -> Task x ()
setTitle =
    Set.set "title" process


{-| Same as `setTitle` but lets you read the current title at the same time.
-}
modifyTitle : (String -> String) -> Task x ()
modifyTitle =
    Set.modify "title" process


{-|
process.umask([mask])
Sets the process's file mode creation mask.
Child processes inherit the mask from the parent process.
Returns the old mask.
-}
unmask : Int -> Task x Int
unmask =
    Get.get1 "unmask" process


{-|
process.umask([mask])
Reads the process's file mode creation mask.
Child processes inherit the mask from the parent process.
Returns the current mask.
-}
currentMask : Task x Int
currentMask =
    Get.get0 "unmask" process


{-|
process.uptime()
Number of seconds Node.js has been running.
-}
uptime : Task x Time
uptime =
    Get.get0 "uptime" process


{-|
process.version
A compiled-in property that exposes NODE_VERSION.

console.log('Version: ' + process.version);
-}
version : String
version =
    Read.unsafeRead "version" process


{-|
process.versions
A property exposing version strings of Node.js and its dependencies.

console.log(process.versions);
Will print something like:

{ http_parser: '2.3.0',
  node: '1.1.1',
  v8: '4.1.0.14',
  uv: '1.3.0',
  zlib: '1.2.8',
  ares: '1.10.0-DEV',
  modules: '43',
  icu: '55.1',
  openssl: '1.0.1k' }
-}
versions : Json.Value
versions =
    Read.unsafeRead "versions" process
