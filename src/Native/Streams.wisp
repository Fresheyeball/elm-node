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

  :emptyBuffer (.Buffer [])

  :marshallChunk (F3 (fn [Left Right chunk]
    (if (== (typeof chunk) "string")
        (Left chunk)
        (Right chunk))))

})))))

(sanitize Elm :Native :Streams)
(set! Elm.Native.Streams.make make)
