module Main where


import Task exposing (Task, andThen)
import Signal as S
import Network.Socket
import FS.Types exposing (..)
import FS exposing (..)


flow : S.Mailbox (Maybe (Stat, Stat))
flow =
  S.mailbox Nothing


(>|) : Task a b -> Task a c -> Task a c
(>|) t t' =
  t `andThen` always t'


opts : WatchFileOptions
opts =
  { defaultWatchFileOptions
  | interval = 1000 }


testFile : FilePath
testFile =
  "testFile"


logAs : String -> Task x b -> Task x ()
logAs s = Task.map (Debug.log s >> always())


port run : Task FSError ()
port run =
  writeFileString testFile "I feel like I'm being watched"
  >| watchFile' opts testFile (Just >> S.send (.address flow))
  >| appendFile testFile ". Wait who are you?"
  >| Task.map (Debug.log "stat" >> always ()) (stat testFile)
  >| Task.map (Debug.log "access" >> always ()) (access testFile)
  >| Task.succeed ()


port showWatch : Signal (Task x ())
port showWatch =
  let
    weGoodhere =
      Task.succeed ()

    parse ms =
      case ms of
        Just stat -> always weGoodhere (Debug.log "stat" stat)
        Nothing   -> weGoodhere

  in
    Signal.map parse flow.signal
