(defn- marshallStat [stat] (do
  (set! stat.atime     (.getTime stat.atime))
  (set! stat.mtime     (.getTime stat.mtime))
  (set! stat.ctime     (.getTime stat.ctime))
  (set! stat.birthtime (.getTime stat.birthtime))
  stat))

(defn- make
  [localRuntime] (let
  [fs     (require "fs")
   Task   (Elm.Native.Task.make   localRuntime)
   Utils  (Elm.Native.Utils.make  localRuntime)
   Tuple0 (:Tuple0 Utils)
   Tuple2 (:Tuple2 Utils)]
  (do
    (ooffi.sanitize localRuntime :Native :FS)
    (if localRuntime.Native.FS.values
        localRuntime.Native.FS.values
        (set! localRuntime.Native.FS.values {


  ; fs.read(fd, buffer, offset, length, position, callback)
  :read (F6 (fn [merr fd buffer offset length position]
    (.asyncFunction Task (fn [callback]
      (.read fs fd buffer offset length position (fn [err bytesRead buffer_]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed (Tuple2 bytesRead buffer_))))))))))

  ; fs.unwatchFile(filename[, listener])
  ; fs.utimes(path, atime, mtime, callback)

  ; fs.watch(filename[, options][, listener])
  :watch (F3 (fn [path options handler]
    (.asyncFunction Task (fn [callback]
      (do
        (.watch fs path options (fn [event filename]
          (.perform Task
            (handler (Tuple2 event filename)))))
        (callback (.succeed Task Tuple0)))))))

  ; fs.watchFile(filename[, options], listener
  :watchFile (F3 (fn [options path handler]
    (let
      [handler_
        (fn [curr prev]
          (.perform Task (handler
            (Tuple2 (marshallStat curr) (marshallStat prev)))))]
      (.asyncFunction Task (fn [callback] (do
        (.watchFile fs path options handler_)
        (callback (.succeed Task (.asyncFunction Task (fn [callback_] (do
          (.unwatchFile fs path handler_)
          (callback_ (.succeed Task Tuple0)))))))))))))

  ; fs.write(fd, buffer, offset, length[, position], callback)
  ; fs.write(fd, data[, position[, encoding]], callback)

  ; fs.writeFile(file, data[, options], callback)
  :writeFile (F4 (fn [merr file data options]
    (.asyncFunction Task (fn [callback]
      (.writeFile fs file data (fn [err]
        (callback (if err
          (.error Task (merr (.toString err)))
          (.succeed Task Tuple0)))))))))

        } )))))

(ooffi.sanitize Elm :Native :FS)
(set! Elm.Native.FS.make make)
