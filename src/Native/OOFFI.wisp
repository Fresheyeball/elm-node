(set! global.oo {

  :sanitize (fn
    [record & spaces]
      (spaces.reduce (fn [r space] (do
        (if (aget r space) nil (set! (aget r space) {}))
        (aget r space)))
      record))

  :method0 (fn [name Task Tuple0] (fn [x]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name))
        (callback (.succeed Task Tuple0)))))))

  :method1 (fn [name Task Tuple0] (fn [x a]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a)
        (callback (.succeed Task Tuple0)))))))

  :method2 (fn [name Task Tuple0] (fn [x a b]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a b)
        (callback (.succeed Task Tuple0)))))))

  :method3 (fn [name Task Tuple0] (fn [x a b c]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a b c)
        (callback (.succeed Task Tuple0)))))))

  :method4 (fn [name Task Tuple0] (fn [x a b c d]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a b c d)
        (callback (.succeed Task Tuple0)))))))

  :method5 (fn [name Task Tuple0] (fn [x a b c d e]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a b c d e)
        (callback (.succeed Task Tuple0)))))))

  :method6 (fn [name Task Tuple0] (fn [x a b c d e f]
    (.asyncFunction Task (fn [callback]
      (do
        ((aget x name) a b c d e f)
        (callback (.succeed Task Tuple0)))))))

  :method0cb (fn [name Task Tuple0] (fn [x]
    (.asyncFunction Task (fn [callback]
      ((aget x name) (fn []
        (callback (.succeed Task Tuple0))))))))

  :method1cb (fn [name Task Tuple0] (fn [x a]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a (fn []
        (callback (.succeed Task Tuple0))))))))

  :method2cb (fn [name Task Tuple0] (fn [x a b]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a b (fn []
        (callback (.succeed Task Tuple0))))))))

  :method3cb (fn [name Task Tuple0] (fn [x a b c]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a b c (fn []
        (callback (.succeed Task Tuple0))))))))

  :method4cb (fn [name Task Tuple0] (fn [x a b c d]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a b c d (fn []
        (callback (.succeed Task Tuple0))))))))

  :method5cb (fn [name Task Tuple0] (fn [x a b c d e]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a b c d e (fn []
        (callback (.succeed Task Tuple0))))))))

  :method6cb (fn [name Task Tuple0] (fn [x a b c d e f]
    (.asyncFunction Task (fn [callback]
      ((aget x name) a b c d e f (fn []
        (callback (.succeed Task Tuple0))))))))

  :get0 (fn [name Task] (fn [x]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name))))))))

  :get1 (fn [name Task] (fn [x a]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a)))))))

  :get2 (fn [name Task] (fn [x a b]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a b)))))))

  :get3 (fn [name Task] (fn [x a b c]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a b c)))))))

  :get4 (fn [name Task] (fn [x a b c d]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a b c d)))))))

  :get5 (fn [name Task] (fn [x a b c d e]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a b c d e)))))))

  :get6 (fn [name Task] (fn [x a b c d e f]
    (.asyncFunction Task (fn [callback]
      (callback (.succeed Task ((aget x name) a b c d e f)))))))

})

(if (== (typeof window) :undefined) (set! window global))
