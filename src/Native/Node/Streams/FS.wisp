(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- createReadStream
  [fs Task] (fn
  [path]
    (Task.succeed (.createReadStream fs path))))

(defn- on
  [Task] (fn
  [eventName stream aToTask]
  (.asyncFunction Task (fn
    [callback]
    (.on stream eventName (fn
      [chunk]
      (do
        (.log console (.toString chunk :utf8))
        (callback (aToTask chunk)))))))))

(defn- make
  [localRuntime] (let
  [fs   (require "fs")
   Task (Elm.Native.Task.make localRuntime)]
  (do
    (sanitize localRuntime :Native :Node :Streams :FS)
    (if localRuntime.Native.Node.Streams.FS.values
        localRuntime.Native.Node.Streams.FS.values
        (set! localRuntime.Native.Node.Streams.FS.values {
          :foo "foo"
          :on (F3 (on Task))
          :createReadStream (createReadStream fs Task) })))))

(sanitize Elm :Native :Node :Streams :FS)
(set! Elm.Native.Node.Streams.FS.make make)
