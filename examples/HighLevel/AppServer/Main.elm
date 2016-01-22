module Main (..) where

import Effects exposing (..)
import Task exposing (Task)
import Server.StartApp exposing (..)
import Signal exposing (..)
import Server exposing (..)


type Action
    = Incoming Request
    | Created Server


type alias Model =
    Int


update : Action -> Model -> ( Model, Effects Action )
update _ _ =
    ( 0, none )


config : Config Model Action
config =
    { init = ( 0, none )
    , update = update
    , inputs = []
    }


app : App Model
app =
    start config


server : Mailbox ( Request, Response )
server =
    mailbox ( emptyReq, emptyRes )


port tasks : Signal (Task Never ())
port tasks =
    app.tasks


port serve : Task Never ()
port serve =
    createServer
        `andThen` \server ->
flip                    flionRequest server ()
