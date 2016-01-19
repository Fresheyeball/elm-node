(defn- make
  [localRuntime] (let
  [Task            (Elm.Native.Task.make   localRuntime)
   Signal          (Elm.Native.Signal.make localRuntime)
   Tuple0 (:Tuple0 (Elm.Native.Utils.make  localRuntime))]
  (do
    (foreign.sanitize localRuntime :Native :Streams)
    (if localRuntime.Native.Streams.values
        localRuntime.Native.Streams.values
        (set! localRuntime.Native.Streams.values {

  :withSignal (F2 (fn [signal f]
    (.asyncFunction Task (fn [callback]
      (do
        (.output Signal "withSignal" (fn [value]
          (.perform Task (f value))) signal)
        (.succeed Task Tuple0))))))

})))))

(foreign.sanitize Elm :Native :Streams)
(set! Elm.Native.Streams.make make)
