(defn- make
  [localRuntime]
  (do
    (foreign.sanitize localRuntime :Native :Network)
    (if localRuntime.Native.Network.values
        localRuntime.Native.Network.values
        (set! localRuntime.Native.Network.values {

  :marshallSocketAddress (F4 (fn [IPv4 IPv6 SocketAddress raw]
    (A3 (SocketAddress
      raw.port
      (if (== "IPv6" raw.family)
        IPv4
        IPv6)
      raw.address))))

  :emptyReq     {}
  :emptyRes     {
    :end          (fn [] nil)
    :write        (fn [] nil)
    :writeHead    (fn [] nil)}

  } ))))

(foreign.sanitize Elm :Native :Network)
(set! Elm.Native.Network.make make)
