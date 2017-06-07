module Model exposing (..)

import Array exposing (Array)
import Random exposing (Seed)


type Card
    = InvalidCard
    | Ace CardSuit
    | King CardSuit
    | Queen CardSuit
    | Jack CardSuit
    | Ten CardSuit
    | Nine CardSuit
    | Eight CardSuit
    | Seven CardSuit
    | Six CardSuit
    | Five CardSuit
    | Four CardSuit
    | Three CardSuit
    | Two CardSuit


type CardSuit
    = Clubs
    | Diamonds
    | Hearts
    | Spades


type alias Model =
    { card : Maybe Card
    , remainingCards : List Card
    }


model : Model
model =
    { card = Nothing, remainingCards = shuffledDeck }


shuffledDeck : List Card
shuffledDeck =
    let
        suits =
            [ Clubs, Diamonds, Hearts, Spades ]

        cardsWithSuit s =
            List.map (\c -> c s)
                [ Ace, King, Queen, Jack, Ten, Nine, Eight, Seven, Six, Five, Four, Three, Two ]

        fullDeck =
            Array.fromList (List.concatMap cardsWithSuit suits)

        seed =
            Random.initialSeed 1
    in
        Array.toList (shuffle fullDeck 0 seed)


shuffle : Array Card -> Int -> Seed -> Array Card
shuffle unshuffled i seed =
    let
        g =
            Random.int 0 ((Array.length unshuffled) - i - 1)

        ( j, nextSeed ) =
            Random.step g seed

        atI =
            Maybe.withDefault InvalidCard (Array.get i unshuffled)

        atIJ =
            Maybe.withDefault InvalidCard (Array.get (i + j) unshuffled)

        shuffled =
            Array.set i atIJ unshuffled |> Array.set (i + j) atI
    in
        if i > (Array.length shuffled) - 2 then
            shuffled
        else
            shuffle shuffled (i + 1) nextSeed
