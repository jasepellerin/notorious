module Note exposing (Note, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Time exposing (..)
import TimeHelpers exposing (..)



-- NOTE


type alias Note =
    { title : String
    , id : String
    , content : String
    , timeCreated : Posix
    }



-- VIEW


view : Zone -> Note -> Html msg
view timeZone model =
    let
        postDate =
            getHumanReadableDate model.timeCreated timeZone

        postTime =
            getHumanReadableTime model.timeCreated timeZone
    in
    article
        []
        [ h1 [] [ text model.title ]
        , small [] [ text ("Created " ++ postDate ++ " "), time [ datetime postTime ] [ text postTime ] ]
        , p [] [ text model.content ]
        ]