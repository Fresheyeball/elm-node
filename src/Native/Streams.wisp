(defn- make
  [localRuntime] (let
  [Task   (Elm.Native.Task.make  localRuntime)
   Utils  (Elm.Native.Utils.make localRuntime)
   Signal (Elm.Native.Signal.make localRuntime)
   Tuple0 (:Tuple0 Utils)]
  (do
    (sanitize localRuntime :Native :Streams)
    (if localRuntime.Native.Streams.values
        localRuntime.Native.Streams.values
        (set! localRuntime.Native.Streams.values {

  :logBuffer (F2 (fn [encoding chunk]
    (do
      (.log console
        (if chunk (.toString chunk encoding) chunk))
      (.succeed Task Tuple0))))

  ; Class: stream.Readable

  :on (F5 (fn [Left Right eventName stream f]
    (do
      (.on stream eventName (fn [chunk]
        (.perform Task (f
          (if (== (typeof chunk) "string")
            (Left chunk)
            (Right chunk))))))
      (.succeed Task Tuple0))))

  ; readable.isPaused()
  :isPaused (oo.get0 "isPaused" Task)

  ; readable.pause()
  :pause (oo.method0 "pause" Task Tuple0)

  ; readable.pipe(destination[, options])
  :pipe (F2 (oo.method2 "pipe" Task Tuple0))

  ; readable.read([size])
  :read (F5 (fn [Left Right Just Nothing stream]
    (.succeed Task (let [x (.read stream)]
      (if x
        (Just (if (== "string" (typeof x))
          (Left  x)
          (Right x)))
        Nothing)))))
  :readSize (F6 (fn [Left Right Just Nothing stream size]
    (.succeed Task (let [x (.read stream size)]
      (if x
        (Just (if (== "string" (typeof x))
          (Left  x)
          (Right x)))
        Nothing)))))

  ; readable.resume()
  :resume (oo.method0 "resume" Task Tuple0)

  ; readable.setEncoding(encoding)
  :setEncoding (F2 (oo.method1 "setEncoding" Task Tuple0))

  ; readable.unpipe([destination])
  :unpipe (F2 (oo.method1 "unpipe" Task Tuple0))
  :unpipeAll (oo.method0 "unpipe" Task Tuple0)

  ; readable.unshift(chunk)
  :unshift (F2 (oo.method1 "unshift" Task Tuple0))

  ; Class: stream.Writable

  ; writable.cork()
  :cork (oo.method0 "cork" Task Tuple0)

  ; writable.end([chunk][, encoding][, callback])
  :endString (F3 (oo.method2cb "end" Task Tuple0))
  :endBuffer (F2 (oo.method1cb "end" Task Tuple0))

  ; writable.setDefaultEncoding(encoding)
  :setDefaultEncoding (F2 (oo.method1 "setDefaultEncoding" Task Tuple0))

  ; writable.uncork()
  :uncork (oo.method0 "uncork" Task Tuple0)

  ; writable.write(chunk[, encoding][, callback])
  :writeString (F2 (oo.method1cb "write" Task Tuple0))
  :writeBuffer (F3 (oo.method2cb "write" Task Tuple0))

  :writeStringSignal (F3 (fn
    [encoding signal stream]
    (do
      (.output Signal "write-stream-buffer" (fn [chunk]
        (if chunk (.write stream chunk encoding))) signal)
      (.succeed Task Tuple0))))

  :writeBufferSignal (F2 (fn
    [signal stream]
    (do
      (.output Signal "write-stream-buffer" (fn [chunk]
        (if chunk (.write stream chunk))) signal)
      (.succeed Task Tuple0))))

})))))

(sanitize Elm :Native :Streams)
(set! Elm.Native.Streams.make make)
