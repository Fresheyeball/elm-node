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
    (sanitize localRuntime :Native :FS)
    (if localRuntime.Native.FS.values
        localRuntime.Native.FS.values
        (set! localRuntime.Native.FS.values {

  :dirname __dirname

  :f_ok (:F_OK fs)
  :r_ok (:R_OK fs)
  :w_ok (:W_OK fs)
  :x_ok (:X_OK fs)

  ; fs.access(path[, mode], callback)
  :access (fn [path]
    (.asyncFunction Task (fn [callback]
      (.access fs path (fn [err]
        (callback (.succeed Task (if err false true))))))))

  ; fs.appendFile(file, data[, options], callback)
  :appendFile (F3 (fn [merr path data]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.appendFile fs path data cb)))))

  ; fs.chmod(path, mode, callback)
  :chmod (F3 (fn [merr path mode]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.chmod fs path mode cb)))))

  ; fs.chown(path, uid, gid, callback)
  :chown (F4 (fn [merr path uid gid]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.chown fs path uid gid cb)))))

  ; fs.fchown(fd, uid, gid, callback)
  :fchown (F4 (fn [merr fd uid gid]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.fchown fs fd uid gid cb)))))

  ; fs.close(fd, callback)
  :close (F2 (fn [merr fd]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.close fs fd cb)))))

  ; fs.fchmod(fd, mode, callback)
  :fchmod (F3 (fn [merr fd mode]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.fchmod fs fd mode cb)))))

  ; fs.fstat(fd, callback)
  :fstat (F2 (fn [merr fd]
    (.asyncFunction Task (fn [callback]
      (.fstat fs fd (fn [err stats]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed (marshallStat stats))))))))))

  ; fs.fsync(fd, callback)
  :fsync (F2 (fn [merr fd]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.fsync fs fd cb)))))

  ; fs.ftruncate(fd, len, callback)
  :ftruncate (F3 (fn [merr len fd]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.ftruncate fs fd len cb)))))

  ; fs.link(srcpath, dstpath, callback)
  :link (F3 (fn [merr srcpath dstpath]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.link fs srcpath dstpath cb)))))

  ; fs.mkdir(path[, mode], callback)
  :mkdir (F3 (fn [merr path mode]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.mkdir fs path mode cb)))))

  ; fs.readFile(file[, options], callback)
  :readFile (F3 (fn [merr options path]
    (.asyncFunction Task (fn [callback]
      (.readFile fs path options (fn [err data]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed data)))))))))

  ; fs.open(path, flags[, mode], callback)
  :open (F4 (fn [merr path flags mode]
    (.asyncFunction Task (fn [callback]
      (.open fs path flags mode (fn [err fd]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed fd)))))))))

  ; fs.read(fd, buffer, offset, length, position, callback)
  :read (F6 (fn [merr fd buffer offset length position]
    (.asyncFunction Task (fn [callback]
      (.read fs fd buffer offset length position (fn [err bytesRead buffer_]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed (Tuple2 bytesRead buffer_))))))))))

  ; fs.readdir(path, callback)
  :readdir (F2 (fn [merr path]
    (.asyncFunction Task (fn [callback]
      (.readdir fs path (fn [err files]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed files)))))))))

  ; fs.readlink(path, callback)
  :readlink (F2 (fn [merr path]
    (.asyncFunction Task (fn [callback]
      (.readlink fs path (fn [err linkString]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed linkString)))))))))

  ; fs.rename(oldPath, newPath, callback)
  :rename (F3 (fn [merr oldPath newPath]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.rename fs oldPath newPath cb)))))

  ; fs.rmdir(path, callback)
  :rmdir (F2 (fn [merr path]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.rmdir fs path cb)))))

  ; fs.stat(path, callback)
  :stat (F2 (fn [merr path]
    (.asyncFunction Task (fn [callback]
      (.stat fs path (fn [err stats]
        (callback (if err
          (Task.fail (merr (.toString err)))
          (Task.succeed (marshallStat stats))))))))))

  ; fs.symlink(destination, path[, type], callback)
  :symlink (F4 (fn [merr destination path type]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.symlink fs destination path type cb)))))

  ; fs.truncate(path, len, callback)
  :truncate (F3 (fn [merr path len]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.truncate fs path len cb)))))

  ; fs.unlink(path, callback)
  :unlink (F2 (fn [merr path]
    (oo.taskCB merr Task Tuple0 (fn [cb]
      (.unlink fs path cb)))))

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

(sanitize Elm :Native :FS)
(set! Elm.Native.FS.make make)
