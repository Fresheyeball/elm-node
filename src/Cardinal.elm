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


map2 : (number -> number -> number) -> Cardinal number -> Cardinal number -> Cardinal number
map2 f card card' =
    case ( card, card' ) of
        ( Finite x, Finite x' ) ->
            Finite (f x x')

        ( infinity, _ ) ->
            infinity
