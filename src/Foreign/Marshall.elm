module Foreign.Marshall where

import Foreign.Types exposing (JSRaw)
import Native.Foreign

unsafeNull : a
unsafeNull = Native.Foreign.unsafeNull

unsafeRequire : String -> a
unsafeRequire = Native.Foreign.unsafeRequire

unsafeGetGlobalConstant : String -> a
unsafeGetGlobalConstant = Native.Foreign.unsafeGetGlobalConstant

truthy : JSRaw -> Bool
truthy = Native.Foreign.truthy

unsafeTypeAs : JSRaw -> a
unsafeTypeAs = Native.Foreign.unsafeTypeAs
