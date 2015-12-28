module Foreign.Types (..) where


type JSRaw
    = JSRaw JSRaw


type JSDate
    = JSDate JSRaw


type alias MethodName =
    String


type alias MemberName =
    String


type alias KeyName =
    String


type alias ErrorType x =
    String -> x


type alias ListenName =
    String


type alias UnlistenName =
    String
