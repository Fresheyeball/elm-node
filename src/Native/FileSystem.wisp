(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :FileSystem)
    (if localRuntime.Native.FileSystem.values
        localRuntime.Native.FileSystem.values
        (set! localRuntime.Native.FileSystem.values {

  :dirname __dirname

  :marshallStat (fn [stat] (do
    (set! stat.atime     (.getTime stat.atime))
    (set! stat.mtime     (.getTime stat.mtime))
    (set! stat.ctime     (.getTime stat.ctime))
    (set! stat.birthtime (.getTime stat.birthtime))
    stat))

  } ))))

(foreign.sanitize Elm :Native :FileSystem)
(set! Elm.Native.FileSystem.make make)
