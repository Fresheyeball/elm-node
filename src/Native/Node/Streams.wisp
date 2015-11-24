(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- make [localRuntime] (do
    (sanitize localRuntime :Native :Node :Streams)
    (if localRuntime.Native.Node.Streams.values
        localRuntime.Native.Node.Streams.values
        (set! localRuntime.Native.Node.Streams.values {
          :foo "foo" }))))

(sanitize Elm :Native :Node :Streams)
(set! Elm.Native.Node.Streams.make make)
