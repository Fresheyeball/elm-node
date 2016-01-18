module Cardinal (..) where


type Cardinal number
    = Finite number
    | PosInfinity
    | NegInfinity


withDefault : a -> (number -> a) -> Cardinal number -> a
withDefault default f card =
    case card of
        Finite x ->
            f x

        _ ->
            default


map : (number -> number) -> Cardinal number -> Cardinal number
map f card =
    case card of
        Finite x ->
            Finite (f x)

        infinity ->
            infinity
