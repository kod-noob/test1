module Tests exposing (..)

import Expect exposing (FloatingPointTolerance(..))
import Main
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Converter tests"
        [ test "Test temparature convert 32" <|
            \_ -> Expect.equal (Main.fromFahrenheit 32) 0.0
        , test "Test temparature convert 100" <|
            \_ -> Expect.within (Absolute 0.1) (Main.fromFahrenheit 100) 37.7
        ]
