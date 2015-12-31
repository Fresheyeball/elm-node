module Process (onBeforeExit, onExit, onMessage, ExitCode(..), exitToInt, intToExit) where

{-|
# Events
@docs onBeforeExit, onExit, onMessage, exitToInt, intToExit, ExitCode
-}

import Foreign.Types exposing (JSRaw)
import Foreign.Pattern.Method as Method
import Foreign.Marshall exposing (unsafeGetGlobalConstant)
import Emitter.Unsafe as Emitter
import Task exposing (Task)


process : JSRaw
process =
    unsafeGetGlobalConstant "process"


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

{-|
Exit Codes
Node.js will normally exit with a 0 status code when no more async operations are pending. The following status codes are used in other cases:

1 Uncaught Fatal Exception - There was an uncaught exception, and it was not handled by a domain or an 'uncaughtException' event handler.
2 - Unused (reserved by Bash for builtin misuse)
3 Internal JavaScript Parse Error - The JavaScript source code internal in Node.js's bootstrapping process caused a parse error. This is extremely rare, and generally can only happen during development of Node.js itself.
4 Internal JavaScript Evaluation Failure - The JavaScript source code internal in Node.js's bootstrapping process failed to return a function value when evaluated. This is extremely rare, and generally can only happen during development of Node.js itself.
5 Fatal Error - There was a fatal unrecoverable error in V8. Typically a message will be printed to stderr with the prefix FATAL ERROR.
6 Non-function Internal Exception Handler - There was an uncaught exception, but the internal fatal exception handler function was somehow set to a non-function, and could not be called.
7 Internal Exception Handler Run-Time Failure - There was an uncaught exception, and the internal fatal exception handler function itself threw an error while attempting to handle it. This can happen, for example, if a process.on('uncaughtException') or domain.on('error') handler throws an error.
8 - Unused. In previous versions of Node.js, exit code 8 sometimes indicated an uncaught exception.
9 - Invalid Argument - Either an unknown option was specified, or an option requiring a value was provided without a value.
10 Internal JavaScript Run-Time Failure - The JavaScript source code internal in Node.js's bootstrapping process threw an error when the bootstrapping function was called. This is extremely rare, and generally can only happen during development of Node.js itself.
12 Invalid Debug Argument - The --debug and/or --debug-brk options were set, but an invalid port number was chosen.
>128 Signal Exits - If Node.js receives a fatal signal such as SIGKILL or SIGHUP, then its exit code will be 128 plus the value of the signal code. This is a standard Unix practice, since exit codes are defined to be 7-bit integers, and signal exits set the high-order bit, and then contain the value of the signal code.
Signal Events#
Emitted when the processes receives a signal. See sigaction(2) for a list of standard POSIX signal names such as SIGINT, SIGHUP, etc.
-}
type ExitCode
    = Success
    | UncaughtFatalException
    | InternalJavaScriptParseError
    | InternalJavaScriptEvaluationFailure
    | FatalError
    | NonfunctionInternalExceptionHandler
    | InvalidArgument
    | InternalJavaScriptRunTimeFailure
    | InvalidDebugArgument
    | SignalExits Int

{-| Convert an `ExitCode` to its C style `Int` representation -}
exitToInt : ExitCode -> Int
exitToInt code =
    case code of
        Success ->
            0

        UncaughtFatalException ->
            1

        InternalJavaScriptParseError ->
            3

        InternalJavaScriptEvaluationFailure ->
            4

        FatalError ->
            5

        NonfunctionInternalExceptionHandler ->
            6

        InvalidArgument ->
            7

        InternalJavaScriptRunTimeFailure ->
            9

        InvalidDebugArgument ->
            10

        SignalExits sig ->
            sig

{-| Convert a C style `Int` exit code to an `ExitCode` if possible -}
intToExit : Int -> Maybe ExitCode
intToExit i =
    case i of
        0 ->
            Just Success

        1 ->
            Just UncaughtFatalException

        3 ->
            Just InternalJavaScriptParseError

        4 ->
            Just InternalJavaScriptEvaluationFailure

        5 ->
            Just FatalError

        6 ->
            Just NonfunctionInternalExceptionHandler

        7 ->
            Just InvalidArgument

        9 ->
            Just InternalJavaScriptRunTimeFailure

        10 ->
            Just InvalidDebugArgument

        _ ->
            Nothing


{-|

Example of listening for SIGINT:

// Start reading from stdin so we don't exit.
process.stdin.resume();

process.on('SIGINT', function() {
  console.log('Got SIGINT.  Press Control-D to exit.');
});
An easy way to send the SIGINT signal is with Control-C in most terminal programs.

Note:

SIGUSR1 is reserved by Node.js to start the debugger.
It's possible to install a listener but that won't stop the debugger from starting.
SIGTERM and SIGINT have default handlers on non-Windows platforms that resets the terminal mode before exiting with code 128 + signal number. If one of these signals has a listener installed, its default behavior will be removed (Node.js will no longer exit).
SIGPIPE is ignored by default. It can have a listener installed.
SIGHUP is generated on Windows when the console window is closed, and on other platforms under various similar conditions, see signal(7). It can have a listener installed, however Node.js will be unconditionally terminated by Windows about 10 seconds later. On non-Windows platforms, the default behavior of SIGHUP is to terminate Node.js, but once a listener has been installed its default behavior will be removed.
SIGTERM is not supported on Windows, it can be listened on.
SIGINT from the terminal is supported on all platforms, and can usually be generated with CTRL+C (though this may be configurable). It is not generated when terminal raw mode is enabled.
SIGBREAK is delivered on Windows when CTRL+BREAK is pressed, on non-Windows platforms it can be listened on, but there is no way to send or generate it.
SIGWINCH is delivered when the console has been resized. On Windows, this will only happen on write to the console when the cursor is being moved, or when a readable tty is used in raw mode.
SIGKILL cannot have a listener installed, it will unconditionally terminate Node.js on all platforms.
SIGSTOP cannot have a listener installed.
Note that Windows does not support sending Signals, but Node.js offers some emulation with process.kill(), and child_process.kill(). Sending signal 0 can be used to test for the existence of a process. Sending SIGINT, SIGTERM, and SIGKILL cause the unconditional termination of the target process.
-}

{-|
process.exit([code])
Ends the process with the specified code.
-}
exitWithCode : ExitCode -> Task x ()
exitWithCode code =
    Method.method1 "exit" process (exitToInt code)

{-| Exit with exit code `Success` (which is 0 in C speak) -}
exit : Task x ()
exit =
    Method.method0 "exit" process
