(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- pipe
  [Task Tuple0] (fn
  [readable writable] (do
    (.pipe readable writable)
    (.succeed Task Tuple0))))

(defn- copeWithNull
  [encoding]
  (if (== encoding "null") null encoding))

(defn- logBuffer
  [Task Tuple0] (fn
  [encoding chunk] (do
    (.log console
      (if chunk (.toString chunk (codeWithNull encoding)) chunk))
    (.succeed Task Tuple0))))

(defn- on
  [Task] (fn
  [eventName stream aToTask]
  (.asyncFunction Task (fn
    [callback]
    (.on stream eventName (fn
      [chunk]
      (callback (aToTask chunk))))))))

(defn- make
  [localRuntime] (let
  [Task   (Elm.Native.Task.make  localRuntime)
   Utils  (Elm.Native.Utils.make localRuntime)
   Tuple0 (:Tuple0 Utils) ]
  (do
    (sanitize localRuntime :Native :Node :Streams)
    (if localRuntime.Native.Node.Streams.values
        localRuntime.Native.Node.Streams.values
        (set! localRuntime.Native.Node.Streams.values {
          :on (F3 (on Task))
          :pipe (F2 (pipe Task Tuple0))
          :logBuffer (F2 (logBuffer Task Tuple0)) })))))

(sanitize Elm :Native :Node :Streams)
(set! Elm.Native.Node.Streams.make make)
