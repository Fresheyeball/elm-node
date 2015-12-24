var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'FS');
        return localRuntime.Native.FS.values ? localRuntime.Native.FS.values : localRuntime.Native.FS.values = {
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
foreign.sanitize(Elm, 'Native', 'FS');
Elm.Native.FS.make = make;