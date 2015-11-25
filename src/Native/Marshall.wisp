(defn- sanitize [record & spaces]
  (spaces.reduce (fn [r space] (do
    (if (aget r space) nil (set! (aget r space) {}))
    (aget r space)))
  record))

(defn- make
  [localRuntime]
  (do
    (sanitize localRuntime :Native :Marshall)
    (if localRuntime.Native.Marshall.values
        localRuntime.Native.Marshall.values
        (set! localRuntime.Native.Marshall.values {
          :unsafeNull null }))))

(sanitize Elm :Native :Marshall)
(set! Elm.Native.Marshall.make make)
