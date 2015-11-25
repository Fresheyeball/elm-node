(defn- taskCB
  [merr Task Tuple0 f]
  (.asyncFunction Task (fn
    [callback]
    (f (fn
      [err]
      (callback (if err
        (Task.error (merr (.toString err)))
        (Task.success Tuple0))))))))

; fs.access(path[, mode], callback)
(defn- access
  [fs Task] (fn
  [path]
  (.asyncFunction Task (fn
    [callback]
    (.access fs path (fn
      [err]
      (callback (.succeed Task (if err false true)))))))))

; fs.appendFile(file, data[, options], callback)
(defn- appendFile
  [fs Task Tuple0] (fn
  [merr path data]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.appendFile fs path data cb)))))

; fs.chmod(path, mode, callback)
(defn- chmod
  [fs Task Tuple0] (fn
  [merr path mode]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.chmod fs path mode cb)))))

; fs.chown(path, uid, gid, callback)
(defn- chown
  [fs Task Tuple0] (fn
  [merr path uid gid]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.chown fs path uid gid cb)))))

; fs.close(fd, callback)
(defn- close
  [fs Task Tuple0] (fn
  [merr fd]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.close fs fd cb))))

; fs.fchmod(fd, mode, callback)
(defn- fchmod
  [fs Task Tuple0] (fn
  [merr fd mode]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.fchmod fs fd mode cb)))))

; fs.fchown(fd, uid, gid, callback)
(defn- fchown
  [fs Task Tuple0] (fn
  [merr path uid gid]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.fchown fs path uid gid cb)))))

; fs.fstat(fd, callback)
(defn- fstat
  [fs Task] (fn
  [merr fd]
  (.asyncFunction Task (fn
    [callback]
    (.fstat fs fd (fn
      [err stats]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.success stats)))))))))

; fs.fsync(fd, callback)
(defn- fsync
  [fs Task Tuple0] (fn
  [merr fd]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.fsync fs fd cb)))))

; fs.ftruncate(fd, len, callback)
(defn- ftruncate
  [fs Task Tuple0] (fn
  [merr len fd]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.ftruncate fs fd len cb)))))

; fs.link(srcpath, dstpath, callback)
(defn- link
  [fs Task Tuple0] (fn
  [merr srcpath dstpath]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.link fs srcpath dstpath cb)))))

; fs.mkdir(path[, mode], callback)
(defn- mkdir
  [fs Task Tuple0] (fn
  [merr path mode]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.mkdir fs path mode cb)))))

; fs.open(path, flags[, mode], callback)
(defn- open
  [fs Task] (fn
  [merr path flags mode]
  (.asyncFunction Task (fn
    [callback]
    (.open fs path flags mode (fn
      [err fd]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed fd)))))))))

; fs.read(fd, buffer, offset, length, position, callback)
(defn read
  [fs Task Tuple2] (fn
  [merr fd buffer offset length position]
  (.asyncFunction Task (fn
    [callback]
    (.read fs fd buffer offset length position (fn
      [err bytesRead buffer']
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed (Tuple2 bytesRead buffer'))))))))))

; fs.readFile(file[, options], callback)
(defn- readFile
  [fs Task] (fn
  [merr options path]
  (.asyncFunction Task (fn
    [callback]
    (.readFile fs path options (fn
      [err data]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed data)))))))))

; fs.readdir(path, callback)
(defn- readdir
  [fs Task] (fn
  [merr path]
  (.asyncFunction Task (fn
    [callback]
    (.readdir fs path (fn
    [err files]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed files)))))))))

; fs.readlink(path, callback)
(defn- readlink
  [fs Task] (fn
  [merr path]
  (.asyncFunction Task (fn
    [callback]
    (.readlink fs path (fn
      [err linkString]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed linkString)))))))))

; fs.rename(oldPath, newPath, callback)
(defn- rename
  [fs Task Tuple0] (fn
  [merr oldPath newPath]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.rename fs oldPath newPath cb)))))

; fs.rmdir(path, callback)
(defn- rmdir
  [fs Task Tuple0] (fn
  [merr path]
  (taskCB merr Task Tuple0 (fn
    [cb]
    (.rmdir fs path cb)))))

; fs.stat(path, callback)
(defn stat
  [fs Task] (fn
  [merr path]
  (.asyncFunction Task (fn
    [callback]
    (.stat fs path (fn
      [err stats]
      (callback (if err
        (Task.fail (merr (.toString err)))
        (Task.succeed stats)))))))))

; fs.symlink(destination, path[, type], callback)
; fs.truncate(path, len, callback)
; fs.unlink(path, callback)
; fs.unwatchFile(filename[, listener])
; fs.utimes(path, atime, mtime, callback)
; fs.watch(filename[, options][, listener])
; fs.watchFile(filename[, options], listener)
; fs.write(fd, buffer, offset, length[, position], callback)
; fs.write(fd, data[, position[, encoding]], callback)
; fs.writeFile(file, data[, options], callback)

(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- make
  [localRuntime] (let
  [fs     (require "fs")
   Task   (Elm.Native.Task.make  localRuntime)
   Utils  (Elm.Native.Utils.make localRuntime)
   Tuple0 (:Tuple0 Utils)
   Tuple2 (:Tuple2 Utils)]
  (do
    (sanitize localRuntime :Native :FS)
    (if localRuntime.Native.FS.values
        localRuntime.Native.FS.values
        (set! localRuntime.Native.FS.values {
          :access         (access     fs Task)
          :appendFile (F3 (appendFile fs Task Tuple0))
          :chmod      (F3 (chmod      fs Task Tuple0))
          :chown      (F4 (chown      fs Task Tuple0))
          :close      (F2 (close      fs Task Tuple0))
          :fchmod     (F3 (fchmod     fs Task Tuple0))
          :fstat      (F2 (fstat      fs Task))
          :fsync      (F2 (fsync      fs Task Tuple0))
          :ftruncate  (F3 (ftruncate  fs Task Tuple0))
          :link       (F3 (link       fs Task Tuple0))
          :mkdir      (F3 (mkdir      fs Task Tuple0))
          :open       (F4 (open       fs Task))
          :read       (F6 (read       fs Task Tuple2))
          :readFile   (F3 (readFile   fs Task Tuple0))
          :readdir    (F2 (readdir    fs Task))
          :readlink   (F2 (readlink   fs Task))
          :rename     (F3 (rename     fs Task Tuple0))
          :rmdir      (F2 (rmdir      fs Task Tuple0))
          :stat       (F2 (stat       fs Task))
        })))))

(sanitize Elm :Native :FS)
(set! Elm.Native.FS.make make)
