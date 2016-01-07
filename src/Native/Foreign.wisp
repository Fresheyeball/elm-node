(set! global.foreign {

  :sanitize (fn
    [record & spaces]
      (spaces.reduce (fn [r space] (do
        (if (aget r space) nil (set! (aget r space) {}))
        (aget r space)))
      record))

})

(defn- make
  [localRuntime] (let
  [Task   (Elm.Native.Task.make   localRuntime)
   Utils  (Elm.Native.Utils.make  localRuntime)
   List   (Elm.Native.List.make   localRuntime)
   Dict   (Elm.Dict.make          localRuntime)
   Tuple0 (:Tuple0 Utils)
   Tuple2 (:Tuple2 Utils)]
   (do
     (foreign.sanitize localRuntime :Native :Foreign)
     (if localRuntime.Native.Foreign.values
         localRuntime.Native.Foreign.values
         (set! localRuntime.Native.Foreign.values {

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

  :method0E (F3 (fn [merr name object]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name))
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method1E (F4 (fn [merr name object a]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method2E (F5 (fn [merr name object a b]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a b)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method3E (F6 (fn [merr name object a b c]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a b c)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method4E (F7 (fn [merr name object a b c d]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a b c d)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method5E (F8 (fn [merr name object a b c d e]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a b c d e)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

  :method6E (F9 (fn [merr name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      (try
        (do
          ((aget object name) a b c d e f)
          (callback (.succeed Task Tuple0)))
        (catch error
          (callback (.fail Task (merr (.toString error))))))))))

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

  :listen0 (F4 (fn [onname offname object handler]
    (let
      [handler_ (fn [] (.perform Task handler))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen1 (F5 (fn [onname offname object a handler]
    (let
      [handler_ (fn [] (.perform Task handler))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen2 (F6 (fn [onname offname object a b handler]
    (let
      [handler_ (fn [] (.perform Task handler))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen3 (F7 (fn [onname offname object a b c handler]
    (let
      [handler_ (fn [] (.perform Task handler))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen4 (F8 (fn [onname offname object a b c d handler]
    (let
      [handler_ (fn [] (.perform Task handler))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c d handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))


  :listen0_1 (F4 (fn [onname offname object handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen1_1 (F5 (fn [onname offname object a handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen2_1 (F6 (fn [onname offname object a b handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen3_1 (F7 (fn [onname offname object a b c handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen4_1 (F8 (fn [onname offname object a b c d handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c d handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen5_1 (F9 (fn [onname offname object a b c d e handler]
    (let
      [handler_ (fn [x]
          (.perform Task (handler x)))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c d e handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen0_2 (F4 (fn [onname offname object handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen1_2 (F5 (fn [onname offname object a handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen2_2 (F6 (fn [onname offname object a b handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen3_2 (F7 (fn [onname offname object a b c handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen4_2 (F8 (fn [onname offname object a b c d handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c d handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

  :listen5_2 (F9 (fn [onname offname object a b c d e handler]
    (let
      [handler_ (fn [x y]
          (.perform Task (handler (Tuple2 x y))))]
      (.asyncFunction Task (fn [callback]
        (do
          ((aget object onname) a b c d e handler_)
          (callback (.succeed Task (.asyncFunction Task (fn [callback_]
            (do
              ((aget object offname) a handler_)
              (callback_ (.succeed Task Tuple0)))))))))))))

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
          (.succeed Task x)))))))))

  :getAsync1E (F4 (fn [merr name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync2E (F5 (fn [merr name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync3E (F6 (fn [merr name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync4E (F7 (fn [merr name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync5E (F8 (fn [merr name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync6E (F9 (fn [merr name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [err x]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task x)))))))))

  :getAsync0_2 (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync1_2 (F3 (fn [name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync2_2 (F4 (fn [name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync3_2 (F5 (fn [name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync4_2 (F6 (fn [name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync5_2 (F7 (fn [name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync6_2 (F8 (fn [name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [x y]
        (callback (.succeed Task (Tuple2 x y)))))))))

  :getAsync0_2E (F3 (fn [merr name object]
    (.asyncFunction Task (fn [callback]
      ((aget object name) (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync1_2E (F4 (fn [merr name object a]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync2_2E (F5 (fn [merr name object a b]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync3_2E (F6 (fn [merr name object a b c]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync4_2E (F7 (fn [merr name object a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync5_2E (F8 (fn [merr name object a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :getAsync6_2E (F9 (fn [merr name object a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget object name) a b c d e f (fn [err x y]
        (callback (if err
          (.fail Task (merr (.toString err)))
          (.succeed Task (Tuple2 x y))))))))))

  :get (F2 (fn [name object]
    (.asyncFunction Task (fn [callback]
      (callback (.success Task (aget object name)))))))

  :modify (F3 (fn [name object f]
    (.asyncFunction Task (fn [callback]
      (do
        (set! (aget object name) (f (aget object name)))
        (callback (.success Task Tuple0)))))))

  :read (F2 (fn [name x]
    (.asyncFunction Task (fn [callback]
      (callback (.success Task (aget x name)))))))

  :unsafeRead (F2 (fn [name x] (aget x name)))

  :unsafeGetGlobalConstant (fn [name] (aget global name))

  :unsafeNull null

  :unsafeUndefined undefined

  :portPrimeToPort (fn [x]
      (do
        (set! x.port (.port$ x))
        (set! x.port$ undefined)
        x))

  :unsafeToDict (fn [obj]
    (let [ keys (.keys Object obj)
         , keyPair (.map keys (fn [key]
             (Tuple2 key, (aget obj key)))) ]
      (.fromList Dict (.toList List keyPair))))

  :unsafeRequire (fn [module] (require module))

  :truthy (fn [x] (if x true false))

  :toString (fn [x] (.toString x))

  :log (fn [x]
    (do
        (.log console x)
        x))

  })))))

(if (== (typeof window) :undefined) (set! window global))
(foreign.sanitize Elm :Native :Foreign)
(set! Elm.Native.Foreign.make make)
