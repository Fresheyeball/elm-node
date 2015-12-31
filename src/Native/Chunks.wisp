(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :Chunks)
    (if localRuntime.Native.Chunks.values
        localRuntime.Native.Chunks.values
        (set! localRuntime.Native.Chunks.values {

  :emptyBuffer (Buffer. [])

  :marshall (F3 (fn [Left Right chunk]
    (if (== (typeof chunk) "string")
        (Left chunks)
        (Right chunk))))

  :encodeBuffer (F2 (fn [buffer encoding]
    (.toString buffer encoding)))

  } ))))

(foreign.sanitize Elm :Native :Chunks)
(set! Elm.Native.Chunks.make make)
