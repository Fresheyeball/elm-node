module Process.User (getEffectiveUserId, getEffectiveGroupId, getUserId, getGroupId, getGroups, setUserId, setEffectiveUserId, setGroupId, setEffectiveGroupId) where

{-|
# User and Group
@docs getEffectiveUserId, getEffectiveGroupId, getUserId, getGroupId, getGroups, setUserId, setEffectiveUserId, setGroupId, setEffectiveGroupId
-}

import Task exposing (Task)
import Foreign.Types exposing (JSRaw)
import Foreign.Marshall as Marshall
import Foreign.Pattern.Get as Get
import Foreign.Pattern.Read as Read
import Foreign.Pattern.Method as Method


process : JSRaw
process =
    Marshall.unsafeGetGlobalConstant "process"


getIfFunction : String -> Task x (Maybe a)
getIfFunction methodName =
    if Marshall.truthy (Read.unsafeRead methodName process) then
        Get.get0 methodName process
            |> Task.map Just
    else
        Task.succeed Nothing


{-|
process.getegid()
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)

Gets the effective group identity of the process. (See getegid(2).) This is the numerical group id, not the group name.

if (process.getegid) {
  console.log('Current gid: ' + process.getegid());
}
-}
getEffectiveGroupId : Task x (Maybe Int)
getEffectiveGroupId =
    getIfFunction "getegid"


{-|
process.geteuid()
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)

Gets the effective user identity of the process. (See geteuid(2).) This is the numerical userid, not the username.

if (process.geteuid) {
  console.log('Current uid: ' + process.geteuid());
}
-}
getEffectiveUserId : Task x (Maybe Int)
getEffectiveUserId =
    getIfFunction "geteuid"


{-|
process.getgid()
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)

Gets the group identity of the process. (See getgid(2).) This is the numerical group id, not the group name.

if (process.getgid) {
  console.log('Current gid: ' + process.getgid());
}
-}
getGroupId : Task x (Maybe Int)
getGroupId =
    getIfFunction "getgid"


{-|
process.getgroups()
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)

Returns an array with the supplementary group IDs. POSIX leaves it unspecified if the effective group ID is included but Node.js ensures it always is.
-}
getGroups : Task x (Maybe (List Int))
getGroups =
    getIfFunction "getgroups"


{-|
process.getuid()
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)

Gets the user identity of the process. (See getuid(2).) This is the numerical userid, not the username.

if (process.getuid) {
  console.log('Current uid: ' + process.getuid());
}
-}
getUserId : Task x (Maybe Int)
getUserId =
    getIfFunction "getuid"


{-|
process.setegid(id)
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)
Sets the effective group identity of the process. (See setegid(2).)
-}
setEffectiveGroupId : Maybe (Int -> Task x ())
setEffectiveGroupId =
    method1IfFunction "setegid"


{-|
process.seteuid(id)
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)
Sets the effective user identity of the process. (See seteuid(2).)
-}
setEffectiveUserId : Maybe (Int -> Task x ())
setEffectiveUserId =
    method1IfFunction "seteuid"


{-|
process.setgid(id)
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)
Sets the group identity of the process. (See setgid(2).)
-}
setGroupId : Maybe (Int -> Task x ())
setGroupId =
    method1IfFunction "setgid"


{-|
process.setuid(id)
Note: this function is only available on POSIX platforms (i.e. not Windows, Android)
Sets the user identity of the process. (See setuid(2).)
-}
setUserId : Maybe (Int -> Task x ())
setUserId =
    method1IfFunction "setuid"


method1IfFunction : String -> Maybe (a -> Task x ())
method1IfFunction name =
    if Marshall.truthy <| Read.unsafeRead name process then
        Just <| Method.method1 name process
    else
        Nothing
