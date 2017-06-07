module Update exposing (..)

import Model exposing (..)


type Msg
    = FetchNextCard


update : Msg -> Model -> Model
update action model =
    let
        newCard =
            List.head model.remainingCards

        remainingCards =
            Maybe.withDefault [] (List.tail model.remainingCards)
    in
        case action of
            FetchNextCard ->
                { model | card = newCard, remainingCards = remainingCards }
