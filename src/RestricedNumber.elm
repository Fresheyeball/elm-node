module RestricedNumber (NonZero, toNonZero, fromNonZero, Positive, toPositive, fromPositive, Negative, toNegative, fromNegative) where


type NonZero number
    = NonZero number


toNonZero : number -> Maybe (NonZero number)
toNonZero num =
    case num of
        0 ->
            Nothing

        x ->
            Just (NonZero x)


fromNonZero : NonZero number -> number
fromNonZero (NonZero x) =
    x


type Positive number
    = Positive number


toPositive : number -> Maybe (Positive number)
toPositive x =
    if x <= 0 then
        Nothing
    else
        Just (Positive x)


fromPositive : Positive number -> number
fromPositive (Positive x) =
    x


type Negative number
    = Negative number


toNegative : number -> Maybe (Negative number)
toNegative x =
    if x >= 0 then
        Nothing
    else
        Just (Negative x)


fromNegative : Negative number -> number
fromNegative (Negative x) =
    x
