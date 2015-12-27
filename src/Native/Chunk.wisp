(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :Chunk)
    (if localRuntime.Native.Chunk.values
        localRuntime.Native.Chunk.values
        (set! localRuntime.Native.Chunk.values {

  :emptyBuffer (Buffer. [])

  :marshall (F3 (fn [Left Right chunk]
    (if (== (typeof chunk) "string")
        (Left chunk)
        (Right chunk))))

  } ))))

(foreign.sanitize Elm :Native :Chunk)
(set! Elm.Native.Chunk.make make)
