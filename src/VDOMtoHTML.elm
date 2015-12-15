module VDOMtoHTML where

import VirtualDom exposing (Node)
import Foreign.Pattern exposing (..)

toHTML : Node -> String
toHTML = unsafeRequire "vdom-to-html"
