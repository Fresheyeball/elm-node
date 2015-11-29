(defn- make
  [localRuntime] (let
  [fs     (require "fs")
   Task   (Elm.Native.Task.make  localRuntime)]
  (do
    (sanitize localRuntime :Native :FS :Streams)
    (if localRuntime.Native.FS.Streams.values
        localRuntime.Native.FS.Streams.values
        (set! localRuntime.Native.FS.Streams.values {
          :createWriteStream (F2 (fn [options path]
            (Task.succeed (.createWriteStream fs path options))))
          :createReadStream  (F2 (fn [options path]
            (Task.succeed (.createReadStream  fs path options)))) })))))

(sanitize Elm :Native :FS :Streams)
(set! Elm.Native.FS.Streams.make make)
