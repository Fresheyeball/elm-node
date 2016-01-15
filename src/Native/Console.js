var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'Console');
        return localRuntime.Native.Console.values ? localRuntime.Native.Console.values : localRuntime.Native.Console.values = {
          'end' : '\033[0m',
          'encode' : function(v){
            return '\033[' + v + 'm';
          }

        };
    })();
};
foreign.sanitize(Elm, 'Native', 'Console');
Elm.Native.Console.make = make;
