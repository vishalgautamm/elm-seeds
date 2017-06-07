module Main exposing (..)

import Model exposing (..)
import Update exposing (..)
import View exposing (..)
import Html exposing (beginnerProgram)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
