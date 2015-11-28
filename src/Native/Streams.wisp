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

(defn- logBuffer
  [Task Tuple0] (fn
  [encoding chunk] (do
    (.log console
      (if chunk (.toString chunk encoding) chunk))
    (.succeed Task Tuple0))))

(defn- on
  [Task Tuple0] (fn
  [eventName stream aToTask]
  (do
    (.on stream eventName (fn
      [chunk]
      (.perform Task (aToTask chunk))))
    (.succeed Task Tuple0))))

(defn- make
  [localRuntime] (let
  [Task   (Elm.Native.Task.make  localRuntime)
   Utils  (Elm.Native.Utils.make localRuntime)
   Tuple0 (:Tuple0 Utils) ]
  (do
    (sanitize localRuntime :Native :Streams)
    (if localRuntime.Native.Streams.values
        localRuntime.Native.Streams.values
        (set! localRuntime.Native.Streams.values {
          :on        (F3 (on        Task Tuple0))
          :pipe      (F2 (pipe      Task Tuple0))
          :logBuffer (F2 (logBuffer Task Tuple0)) })))))

(sanitize Elm :Native :Streams)
(set! Elm.Native.Streams.make make)
