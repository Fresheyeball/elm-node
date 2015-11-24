(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- createReadStream
  [fs Task] (fn
  [path]
  (Task.succeed (.createReadStream fs path))))

(defn- createWriteStream
  [fs Task] (fn
  [path]
  (Task.succeed (.createWriteStream fs path))))

(defn- pipe
  [fs Task Tuple0] (fn
  [readable writable]
  (do
    (.pipe readable writable)
    (.succeed Task Tuple0))))

(defn- logBuffer
  [Task Tuple0] (fn
  [encoding chunk]
  (do
    (.log console (if chunk (.toString chunk encoding) chunk))
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
  [fs     (require "fs")
   Task   (Elm.Native.Task.make  localRuntime)
   Utils  (Elm.Native.Utils.make localRuntime)
   Tuple0 (:Tuple0 Utils) ]
  (do
    (sanitize localRuntime :Native :Node :Streams :FS)
    (if localRuntime.Native.Node.Streams.FS.values
        localRuntime.Native.Node.Streams.FS.values
        (set! localRuntime.Native.Node.Streams.FS.values {
          :on (F3 (on Task))
          :pipe (F2 (pipe fs Task Tuple0))
          :logBuffer (F2 (logBuffer Task Tuple0))
          :createReadStream  (createReadStream  fs Task)
          :createWriteStream (createWriteStream fs Task) })))))

(sanitize Elm :Native :Node :Streams :FS)
(set! Elm.Native.Node.Streams.FS.make make)
