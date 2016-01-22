var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'Network');
        return localRuntime.Native.Network.values ? localRuntime.Native.Network.values : localRuntime.Native.Network.values = {
            'marshallSocketAddress': F4(function (IPv4, IPv6, SocketAddress, raw) {
                return A3(SocketAddress(raw.port, 'IPv6' == raw.family ? IPv4 : IPv6, raw.address));
            }),
            'emptyReq': {},
            'emptyRes': {
                'end': function () {
                    return void 0;
                },
                'write': function () {
                    return void 0;
                },
                'writeHead': function () {
                    return void 0;
                }
            }
        };
    })();
};
foreign.sanitize(Elm, 'Native', 'Network');
Elm.Native.Network.make = make;