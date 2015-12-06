(set! global.ooffi {

  :sanitize (fn
    [record & spaces]
      (spaces.reduce (fn [r space] (do
        (if (aget r space) nil (set! (aget r space) {}))
        (aget r space)))
      record))

  :taskCB (fn [merr Task Tuple0 f]
    (.asyncFunction Task (fn [callback]
      (f (fn [err]
        (callback (if err
          (Task.error (merr (.toString err)))
          (Task.succeed Tuple0))))))))

})

(defn- make
  [localRuntime] (let
  [Task   (Elm.Native.Task.make   localRuntime)
   Utils  (Elm.Native.Utils.make  localRuntime)
   Tuple0 (:Tuple0 Utils)]
   (do
     (ooffi.sanitize localRuntime :Native :OOFFI)
     (if localRuntime.Native.OOFFI.values
         localRuntime.Native.OOFFI.values
         (set! localRuntime.Native.OOFFI.values {

  :method0 (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name))
        (callback (.succeed Task Tuple0)))))))

  :method1 (F3 (fn [name object a]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a)
        (callback (.succeed Task Tuple0)))))))

  :method2 (F4 (fn [name object a b]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a b)
        (callback (.succeed Task Tuple0)))))))

  :method3 (F5 (fn [name object a b c]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a b c)
        (callback (.succeed Task Tuple0)))))))

  :method4 (F6 (fn [name object a b c d]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a b c d)
        (callback (.succeed Task Tuple0)))))))

  :method5 (F7 (fn [name object a b c d e]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a b c d e)
        (callback (.succeed Task Tuple0)))))))

  :method6 (F8 (fn [name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget object name) a b c d e f)
        (callback (.succeed Task Tuple0)))))))

  :methodAsync0 (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync1 (F3 (fn [name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync2 (F4 (fn [name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync3 (F5 (fn [name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync4 (F6 (fn [name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync5 (F7 (fn [name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync6 (F8 (fn [name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn []
        (callback (.succeed Task Tuple0))))))))

  :methodAsync0E (F3 (fn [merr name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync1E (F4 (fn [merr name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync2E (F5 (fn [merr name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync3E (F6 (fn [merr name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync4E (F7 (fn [merr name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync5E (F8 (fn [merr name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :methodAsync6E (F9 (fn [merr name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [err]
        (callback
          (if err
            (.fail Task (merr (.toString err)))
            (.succeed Task Tuple0)))))))))

  :get0 (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name))))))))

  :get1 (F3 (fn [name object a]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a)))))))

  :get2 (F4 (fn [name object a b]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a b)))))))

  :get3 (F5 (fn [name object a b c]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a b c)))))))

  :get4 (F6 (fn [name object a b c d]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a b c d)))))))

  :get5 (F7 (fn [name object a b c d e]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a b c d e)))))))

  :get6 (F8 (fn [name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget object name) a b c d e f)))))))

  :getAsync0 (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync1 (F3 (fn [name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync2 (F4 (fn [name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync3 (F5 (fn [name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync4 (F6 (fn [name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync5 (F7 (fn [name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync6 (F2 (fn [name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [x]
        (callback (.succeed Task x))))))))

  :getAsync0E (F3 (fn [merr name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync1E (F4 (fn [merr name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync2E (F5 (fn [merr name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync3E (F6 (fn [merr name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync4E (F7 (fn [merr name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync5E (F8 (fn [merr name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :getAsync6E (F9 (fn [merr name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (x))))))))))

  :unsafeGetGlobalConstant (fn [name] (aget window name))

  :unsafeNull null

  :unsafeRequire (fn [module] (require module))

  :unsafeGet0 (F2 (fn [name x] (aget x name)))

  :truthy (fn [x] (if x true false))

  })))))

(if (== (typeof window) :undefined) (set! window global))
(ooffi.sanitize Elm :Native :OOFFI)
(set! Elm.Native.OOFFI.make make)
