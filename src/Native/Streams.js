var make = function make(localRuntime) {
    return function () {
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        var Signalø1 = Elm.Native.Signal.make(localRuntime);
        var Tuple0ø1 = (Elm.Native.Utils.make(localRuntime) || 0)['Tuple0'];
        return (function () {
            foreign.sanitize(localRuntime, 'Native', 'Streams');
            return localRuntime.Native.Streams.values ? localRuntime.Native.Streams.values : localRuntime.Native.Streams.values = {
                'withSignal': F2(function (signal, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            Signalø1.output('withSignal', function (value) {
                                return Taskø1.perform(f(value));
                            }, signal);
                            return Taskø1.succeed(Tuple0ø1);
                        })();
                    });
                }),
                'marshallDuplex': function (raw) {
                    return {
                        'readable': raw,
                        'writable': raw
                    };
                }
            };
        })();
    }.call(this);
};
foreign.sanitize(Elm, 'Native', 'Streams');
Elm.Native.Streams.make = make;