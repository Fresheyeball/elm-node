var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'FileSystem');
        return localRuntime.Native.FileSystem.values ? localRuntime.Native.FileSystem.values : localRuntime.Native.FileSystem.values = {
            'dirname': __dirname,
            'marshallStat': function (stat) {
                return (function () {
                    stat.atime = stat.atime.getTime();
                    stat.mtime = stat.mtime.getTime();
                    stat.ctime = stat.ctime.getTime();
                    stat.birthtime = stat.birthtime.getTime();
                    return stat;
                })();
            }
        };
    })();
};
foreign.sanitize(Elm, 'Native', 'FileSystem');
Elm.Native.FileSystem.make = make;