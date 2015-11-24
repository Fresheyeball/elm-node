# elm-node

This project is a temporary monolith. Ideally getting broken into multiple packages. But for the sake of progress development its a cluster.

## Goals

### Low level bindings to node things

- Streams
- File System
- Request Response
- Isomorphic templating
- Type Safe messaging

### High Level API to node things

([pure flavor](http://vignette2.wikia.nocookie.net/en.futurama/images/0/00/TheEssenceofPureFlavour.png/revision/latest?cb=20110627121631)s most likely as IO builders, that consumers must eventually `run : pureFlavor -> Task x ()`)

- Streams
  - Either a pure flavor that is really a `list` kinda like [streams](https://www.stackage.org/lts-3.15/package/streams-3.2.1)
  - Or a higher level bindings that is still impure like the popular [io-streams](https://www.stackage.org/lts-3.15/package/io-streams-1.3.2.0)
- Pure File System
  - `FS` as a `type`, coupled with `runFS : FS FSError () -> Task FSError ()`
- Basic server abstraction
  - Marshall-able pure `Request` and `Response` types
  - Server side code as `Request -> Response`
  - Startapp flavor to based on `foldp` on routes
  - Sinatra style routing abstraction
    - `param` capture
  - `Elm` as a `Response` constructor
- Shared `Mailbox` between the client and server backed with websockets.

### Not on the table right now (but maybe later)

- SQLlite bindings
- Mongo DB persistence and querying around native Elm types.
General purpose node bindings

## Examples

```bash
sh examples/<someexample>/run.sh
```
