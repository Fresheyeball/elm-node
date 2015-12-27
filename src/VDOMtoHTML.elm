module VDOMtoHTML (toHTML) where


import VirtualDom exposing (Node)
import Foreign.Marshall exposing (unsafeRequire)


toHTML : Node -> String
toHTML =
    unsafeRequire "vdom-to-html"
