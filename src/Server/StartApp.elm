module Server.StartApp (..) where

import Effects exposing (Effects, Never)
import Signal exposing (Signal, Mailbox, mailbox)
import Task exposing (Task, andThen)
import Streams.String exposing (write)
import Server exposing (..)


type alias Config model action =
    { init : ( model, Effects action )
    , update : action -> model -> ( model, Effects action )
    , inputs : List (Signal action)
    }


{-|
This type exists simply because
```
type alias ServerConfig model action =
    { Config model action | port' : Int }
```
Is NOT valid Elm for some reason?
-}
type alias ServerConfigPlus x =
    { x | port' : Int }


type alias ServerConfig model action =
    { init : ( model, Effects (Action action) )
    , update : Action action -> model -> ( model, Effects (Action action) )
    , inputs : List (Signal action)
    , port' : Int
    }


type alias App model =
    { model : Signal model
    , tasks : Signal (Task Never ())
    }


type Action action
    = Incoming Request
    | Outgoing Response
    | Cycle action


start : Config model action -> App model
start config =
    let
        singleton action = [ action ]

        -- messages : Signal.Mailbox (List action)
        messages =
            Signal.mailbox []

        -- address : Signal.Address action
        address =
            Signal.forwardTo messages.address singleton

        -- updateStep : action -> (model, Effects action) -> (model, Effects action)
        updateStep action ( oldModel, accumulatedEffects ) =
            let
                ( newModel, additionalEffects ) = config.update action oldModel
            in
                ( newModel, Effects.batch [ accumulatedEffects, additionalEffects ] )

        -- update : List action -> (model, Effects action) -> (model, Effects action)
        update actions ( model, _ ) =
            List.foldl updateStep ( model, Effects.none ) actions

        -- inputs : Signal (List action)
        inputs =
            Signal.mergeMany (messages.signal :: List.map (Signal.map singleton) config.inputs)

        -- effectsAndModel : Signal (model, Effects action)
        effectsAndModel =
            Signal.foldp update config.init inputs

        model =
            Signal.map fst effectsAndModel
    in
        { model = model
        , tasks = Signal.map (Effects.toTask messages.address << snd) effectsAndModel
        }


respond : String -> Response -> Effects (Action action)
respond message response =
    write response message
        => Task.succeed (Outgoing response)
        |> Effects.task


cycle : action -> Effects (Action action)
cycle =
    Effects.task << Task.succeed << Cycle


startServer : ServerConfig model action -> App model
startServer config =
    let
        singleton action = [ action ]

        -- messages : Signal.Mailbox (List action)
        messages =
            Signal.mailbox []

        -- address : Signal.Address action
        address =
            Signal.forwardTo messages.address singleton

        -- connection : Signal.Mailbox (Request, Response)
        connection =
            Signal.mailbox ( emptyRequest, emptyResponse )

        -- server : Task x ()
        server =
            serve config.port' connection.address
                |> Task.map (always ())

        -- updateStep : action -> (model, Effects action) -> (model, Effects action)
        updateStep action ( oldModel, accumulatedEffects ) =
            let
                ( newModel, additionalEffects ) = config.update action oldModel
            in
                ( newModel, Effects.batch [ accumulatedEffects, additionalEffects ] )

        -- update : List action -> (model, Effects action) -> (model, Effects action)
        update actions ( model, _ ) =
            List.foldl updateStep ( model, Effects.none ) actions

        -- inputs : Signal (List action)
        inputs =
            Signal.mergeMany (messages.signal :: List.map (Signal.map singleton) config.inputs)

        -- effectsAndModel : Signal (model, Effects action)
        effectsAndModel =
            Signal.foldp update config.init
                <| Signal.merge (Signal.map (List.map Cycle) inputs) <| Signal.map (List.map ...)

        model =
            Signal.map fst effectsAndModel
    in
        { model = model
        , tasks =
            Signal.map (Effects.toTask messages.address << snd) effectsAndModel
                |> Signal.merge (Signal.constant server)
        }
