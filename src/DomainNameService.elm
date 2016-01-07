module DomainNameService (lookup) where

{-|
@docs lookup
-}

import Foreign.Pattern.Method as Method
import Foreign.Marshall exposing (unsafeRequire)
import Foreign.Types exposing (JSRaw)
import Task exposing (Task)


dns : JSRaw
dns =
    unsafeRequire "dns"


{-|
dns.lookup(hostname[, options], callback)

Resolves a hostname (e.g. 'google.com') into the first found A (IPv4) or
AAAA (IPv6) record. options can be an object or integer.
If options is not provided, then IP v4 and v6 addresses are both valid.
If options is an integer, then it must be 4 or 6.
-}
lookup : String -> Task x ()
lookup =
    Method.methodAsync1 "lookup" dns
