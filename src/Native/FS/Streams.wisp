(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- createReadStream
  [fs Task] (fn
  [options path]
  (Task.succeed (.createReadStream fs path options))))

(defn- createWriteStream
  [fs Task] (fn
  [options path]
  (Task.succeed (.createWriteStream fs path options))))

(defn- make
  [localRuntime] (let
  [fs     (require "fs")
   Task   (Elm.Native.Task.make  localRuntime)]
  (do
    (sanitize localRuntime :Native :FS :Streams)
    (if localRuntime.Native.FS.Streams.values
        localRuntime.Native.FS.Streams.values
        (set! localRuntime.Native.FS.Streams.values {
          :createReadStream  (F2 (createReadStream  fs Task))
          :createWriteStream (F2 (createWriteStream fs Task)) })))))

(sanitize Elm :Native :FS :Streams)
(set! Elm.Native.FS.Streams.make make)
