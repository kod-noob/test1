-- The first thing of your web application is the Main module.
-- It exposes (make available externally of this module) one function "main".


module Main exposing (fromFahrenheit, main)

-- The import statements list modules that we want to use.

import Browser
import Html exposing (Html, button, div, input, p, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick, onInput)



-- The main function where everything begins. It returns a program that is a record of four functions, init, view,
-- update and subscriptions. They are found further down in the code.


main : Program () Model Message
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- We declare our model here. It has one field 'count' that can store an integer.


type alias Model =
    { count : Int
    , fahrenheit : Maybe Float
    , celsius : Maybe Float
    }



-- The init function gives the initial model. We declare that the initial model has a count of 0.


init : flags -> ( Model, Cmd message )
init _ =
    ( { count = 0
      , fahrenheit = Nothing
      , celsius = Nothing
      }
    , Cmd.none
    )



-- We declare that there is a type called Message and it can have the values Increment and Decrement.


type Message
    = Increment
    | Decrement
    | ChangedFahrenheit String



-- The update function takes two parameters, message and model. The result is a new model and a command
-- for possible side effects.


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    -- First we consider which message we have received.
    case message of
        -- The increment message! Let's increment. We create a copy of the model with count that is one more
        -- than we started with.
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        -- The decrement message! Let's decrement.
        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )

        ChangedFahrenheit s ->
            ( { model
                | fahrenheit = String.toFloat s
                , celsius =
                    case String.toFloat s of
                        Nothing ->
                            Nothing

                        Just f ->
                            fromFahrenheit f |> Just
              }
            , Cmd.none
            )



-- The view function takes the current model and illustrates it in HTML.
-- When we describe HTML in Elm, we have a pattern of 'tag [] []'. That is a tag is a function that takes two lists
-- as parameters. The first one is attributes, the other one is the content, ie what is between the start and end tags.


view : Model -> Html Message
view model =
    -- The HTML div tag is a divider that is used to group other elements.
    div []
        [ -- A button tag shows a button on the page. The attribute onClick is telling which message
          -- should be sent when the user clicks it.
          button [ onClick Increment ]
            -- The contents of the button tag is what should be on its face.
            [ text "+1" ]

        -- Let's add a div within the div to make things less cluttered.
        , div []
            [ -- Here we take the model's count field, convert it to a string and puts the result as
              -- content of the div tag. The expression that converts from integer to string is within
              -- parenthesis so that the compiler understands that it is a single argument for the text
              -- function.
              text (String.fromInt model.count)
            ]

        -- The third thing is the decrement button which is similar to the increment button.
        , button [ onClick Decrement ] [ text "-1" ]
        , viewConverter model
        ]


viewConverter : Model -> Html Message
viewConverter model =
    div [ style "border" "solid" ]
        [ div [ style "width" "350px" ]
            [ text "Fahrenheit to Celsius"
            ]
        , div []
            [ input [ onInput ChangedFahrenheit ] []
            ]
        , div []
            [ text "Celsius: "
            , text <|
                case model.celsius of
                    Nothing ->
                        " "

                    Just c ->
                        String.fromFloat c
            ]
        ]



-- Currently, we have no subscriptions. We will use it later to receive events from the outside of our
-- program, such as that time has passed.


subscriptions : Model -> Sub message
subscriptions model =
    Sub.none



-- Here goes my biz logic


fromFahrenheit : Float -> Float
fromFahrenheit fahrenheit =
    (fahrenheit - 32) * 5 / 9
