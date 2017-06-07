module View exposing (..)

import Model exposing (..)
import Update exposing (..)
import Html exposing (Html, div, text, h2, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "row" ]
            [ div [ class "twelve columns" ]
                [ h2 [ class "card-desc" ] [ text (toString model.card) ]
                ]
            ]
        , div [ class "row" ]
            [ div [ class "one-third column" ]
                [ button [ onClick FetchNextCard ] [ text "Next Card" ] ]
            ]
        ]
