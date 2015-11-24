; fs.close(fd, callback)
; fs.exists(path, callback)
; fs.fchmod(fd, mode, callback)
; fs.fchown(fd, uid, gid, callback)
; fs.fstat(fd, callback)
; fs.fsync(fd, callback)
; fs.ftruncate(fd, len, callback)
; fs.futimes(fd, atime, mtime, callback)
; fs.lchmod(path, mode, callback)
; fs.lchown(path, uid, gid, callback)
; fs.link(srcpath, dstpath, callback)
; fs.lstat(path, callback)
; fs.mkdir(path[, mode], callback)
; fs.open(path, flags[, mode], callback)
; fs.read(fd, buffer, offset, length, position, callback)
; fs.readdir(path, callback)
; fs.readFile(file[, options], callback)
; fs.readlink(path, callback)
; fs.realpath(path[, cache], callback)
; fs.rename(oldPath, newPath, callback)
; fs.rmdir(path, callback)
; fs.stat(path, callback)
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

(defn- taskCB
  [Task Tuple0 f]
  (.asyncFunction Task (fn
    [callback]
    (f (fn
      [err]
      (callback (if err
        (Task.error err)
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
  [path data]
  (taskCB Task Tuple0 (fn
    [cb]
    (.appendFile fs path data cb)))))

; fs.chmod(path, mode, callback)
(defn- chmod
  [fs Task Tuple0] (fn
  [path]
  (taskCB Task Tuple0 (fn
    [cb]
    (.chmod fs path cb)))))

; fs.chown(path, uid, gid, callback)
(defn- chown
  [fs Task Tuple0] (fn
  [path uid gid]
  (taskCB Task Tuple0 (fn
    [cb]
    (.chown fs path uid gid cb)))))

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
   Tuple0 (:Tuple0 Utils)]
  (do
    (sanitize localRuntime :Native :Node :FS)
    (if localRuntime.Native.Node.FS.values
        localRuntime.Native.Node.FS.values
        (set! localRuntime.Native.Node.FS.values {
          :access (access fs Task)
          :appendFile (F2 (appendFile fs Task Tuple0))
          :chmod (chmod fs Task Tuple0)
          :chown (chown fs Task Tuple0) })))))

(sanitize Elm :Native :Node :FS)
(set! Elm.Native.Node.FS.make make)
