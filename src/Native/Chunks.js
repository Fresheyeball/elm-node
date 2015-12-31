var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'Chunks');
        return localRuntime.Native.Chunks.values ? localRuntime.Native.Chunks.values : localRuntime.Native.Chunks.values = {
            'emptyBuffer': new Buffer([]),
            'marshall': F3(function (Left, Right, chunk) {
                return typeof(chunk) == 'string' ? Left(chunks) : Right(chunk);
            }),
            'encodeBuffer': F2(function (buffer, encoding) {
                return buffer.toString(encoding);
            })
        };
    })();
};
foreign.sanitize(Elm, 'Native', 'Chunks');
Elm.Native.Chunks.make = make;