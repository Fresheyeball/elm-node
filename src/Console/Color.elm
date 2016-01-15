module Console.Color (Color(..), regular, bold, underline, highIntensity, boldHighIntensity, background, highIntensityBackgrounds) where

{-|
# Style your console messages

@docs Color, regular, bold, underline, highIntensity, boldHighIntensity, background, highIntensityBackgrounds
-}

import Native.Console


end : String
end =
    Native.Console.end


encode : String -> String
encode =
    Native.Console.encode


{-|
Colors supported for bash
-}
type Color
    = Black
    | Red
    | Green
    | Yellow
    | Blue
    | Purple
    | Cyan
    | White


{-|
Apply a background color to some string
-}
background : Color -> String -> String
background =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "40"

                    Red ->
                        "41"

                    Green ->
                        "42"

                    Yellow ->
                        "43"

                    Blue ->
                        "44"

                    Purple ->
                        "45"

                    Cyan ->
                        "46"

                    White ->
                        "47"


{-|
Color the text of a Sting
-}
regular : Color -> String -> String
regular =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "0;30"

                    Red ->
                        "0;31"

                    Green ->
                        "0;32"

                    Yellow ->
                        "0;33"

                    Blue ->
                        "0;34"

                    Purple ->
                        "0;35"

                    Cyan ->
                        "0;36"

                    White ->
                        "0;37"


{-|
Color the text of some String and display it bold
-}
bold : Color -> String -> String
bold =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "1;30"

                    Red ->
                        "1;31"

                    Green ->
                        "1;32"

                    Yellow ->
                        "1;33"

                    Blue ->
                        "1;34"

                    Purple ->
                        "1;35"

                    Cyan ->
                        "1;36"

                    White ->
                        "1;37"


{-|
Color some String and display underlined
-}
underline : Color -> String -> String
underline =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "4;30"

                    Red ->
                        "4;31"

                    Green ->
                        "4;32"

                    Yellow ->
                        "4;33"

                    Blue ->
                        "4;34"

                    Purple ->
                        "4;35"

                    Cyan ->
                        "4;36"

                    White ->
                        "4;37"


{-|
Same as regular but more intense
-}
highIntensity : Color -> String -> String
highIntensity =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "0;90"

                    Red ->
                        "0;91"

                    Green ->
                        "0;92"

                    Yellow ->
                        "0;93"

                    Blue ->
                        "0;94"

                    Purple ->
                        "0;95"

                    Cyan ->
                        "0;96"

                    White ->
                        "0;97"


{-|
Same as bold, but more intense
-}
boldHighIntensity : Color -> String -> String
boldHighIntensity =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "1;90"

                    Red ->
                        "1;91"

                    Green ->
                        "1;92"

                    Yellow ->
                        "1;93"

                    Blue ->
                        "1;94"

                    Purple ->
                        "1;95"

                    Cyan ->
                        "1;96"

                    White ->
                        "1;97"


{-|
Same as background but more intense
-}
highIntensityBackgrounds : Color -> String -> String
highIntensityBackgrounds =
    apply
        <| \c ->
            encode
                <| case c of
                    Black ->
                        "0;100"

                    Red ->
                        "0;101"

                    Green ->
                        "0;102"

                    Yellow ->
                        "0;103"

                    Blue ->
                        "0;104"

                    Purple ->
                        "0;105"

                    Cyan ->
                        "0;106"

                    White ->
                        "0;107"


apply : (Color -> String) -> Color -> String -> String
apply color c message =
    color c
        ++ message
        ++ end
        ++ end
