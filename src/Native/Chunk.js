var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'Chunk');
        return localRuntime.Native.Chunk.values ? localRuntime.Native.Chunk.values : localRuntime.Native.Chunk.values = {
            'emptyBuffer': new Buffer([]),
            'marshall': F3(function (Left, Right, chunk) {
                return typeof(chunk) == 'string' ? Left(chunk) : Right(chunk);
            })
        };
    })();
};
foreign.sanitize(Elm, 'Native', 'Chunk');
Elm.Native.Chunk.make = make;