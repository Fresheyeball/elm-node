# Node.js Namespaces

Judgement calls on what to bind, what not to bind, why and how.

## :raised_hand: Buffer
Since Elm does not have support for binary, using the methods on Buffer is not currently useful or advisable. So limited support for interacting with Buffers has been included as a part of `Chunk`.

## :-1: C/C++ Addons
No plans to support this at the moment.

## :+1: Child Processes
**TODO** this is useful

## :+1: Cluster
**TODO** this is useful

## :metal: Console
Logging is all wrappers on standards, so this should be written in pure Elm, based on `Process.Streams`.

## :+1: Crypto
**TODO** this is useful

## :-1: Debugger
Theoretically no runtime errors will exist. This might be handy once Elm has source maps

## :+1: DNS
In **progress**

## :-1: Domain
Deprecated, will not bind

## :-1: Errors
Philosophical difference from Elm, no introducing new ways to throw and handle errors

## :+1: Events
This is a base class, helpers bindings are **complete**

## :+1: File System
**Complete**

## :-1: Globals
Specific to Node, will not bind

## :+1: HTTP
**TODO** Needs to be tied into `Network`

## :+1: HTTPS
**TODO** Needs to be tied into `Network`

## :-1: Modules
Specific to Node, will not bind

## :+1: Net
May or may not end up including `Http`. Development in **progress**.

## :-1: OS
Does not look particularly useful beyond overlap with `Process`

## :metal: Path
No need to bind, this can be written in pure Elm

## :+1: Process
**Complete**

## :worried: Punycode
Not sure if there is value here

## :metal: Query Strings
No need to bind, this can be written in pure Elm

## :-1: Readline
Weird, just weird

## :-1: REPL
Specific to Node, will not bind

## :+1: Stream
**Complete**

## :-1: String Decoder
Overlaps with `Chunk`, **complete**

## :-1: Timers
Elm has this one covered

## :+1: TLS/SSL
**TODO** May or may not end up bound up in `Network`

## :-1: TTY
Not useful enough

## :worried: UDP/Datagram
Not sure if there is value here

## :metal: URL
No need to bind, this can be written in pure Elm

## :-1: Utilities
Specific to Node, will not bind

## :-1: V8
Unstable

## :-1: VM
Basically eval, disallowed

## :+1: ZLIB
**TODO** this is useful for so many reasons
