module VDOMtoHTML where

import VirtualDom exposing (Node)
import OOFFI exposing (..)

toHTML : Node -> String
toHTML = unsafeRequire "vdom-to-html"
