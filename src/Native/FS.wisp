(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :FS)
    (if localRuntime.Native.FS.values
        localRuntime.Native.FS.values
        (set! localRuntime.Native.FS.values {

  :dirname __dirname

  :marshallStat (fn [stat] (do
    (set! stat.atime     (.getTime stat.atime))
    (set! stat.mtime     (.getTime stat.mtime))
    (set! stat.ctime     (.getTime stat.ctime))
    (set! stat.birthtime (.getTime stat.birthtime))
    stat))

  } ))))

(foreign.sanitize Elm :Native :FS)
(set! Elm.Native.FS.make make)
