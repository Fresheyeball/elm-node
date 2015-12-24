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
                })
            };
        })();
    }.call(this);
};
foreign.sanitize(Elm, 'Native', 'Streams');
Elm.Native.Streams.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbIm1ha2UiLCJsb2NhbFJ1bnRpbWUiLCJUYXNrw7gxIiwiRWxtIiwiTmF0aXZlLlRhc2subWFrZSIsIlNpZ25hbMO4MSIsIk5hdGl2ZS5TaWduYWwubWFrZSIsIlR1cGxlMMO4MSIsIk5hdGl2ZS5VdGlscy5tYWtlIiwiZm9yZWlnbiIsInNhbml0aXplIiwiTmF0aXZlLlN0cmVhbXMudmFsdWVzIiwiRjIiLCJzaWduYWwiLCJmIiwiYXN5bmNGdW5jdGlvbiIsImNhbGxiYWNrIiwib3V0cHV0IiwidmFsdWUiLCJwZXJmb3JtIiwic3VjY2VlZCIsIk5hdGl2ZS5TdHJlYW1zLm1ha2UiXSwibWFwcGluZ3MiOiJBQUFBLElBQU9BLElBQUEsR0FBUCxTQUFPQSxJQUFQLENBQ0dDLFlBREgsRUFDaUI7QUFBQSxXLFlBQ2Q7QUFBQSxZQUFBQyxNLEdBQWlCQyxHQUFBLENBQUlDLGdCQUFMLENBQXdCSCxZQUF4QixDQUFoQjtBQUFBLFFBQ0EsSUFBQUksUSxHQUFpQkYsR0FBQSxDQUFJRyxrQkFBTCxDQUF3QkwsWUFBeEIsQ0FBaEIsQ0FEQTtBQUFBLFFBRUEsSUFBQU0sUSxJQUFpQkosR0FBQSxDQUFJSyxpQkFBTCxDQUF3QlAsWUFBeEIsQyxNQUFULEMsUUFBQSxDQUFQLENBRkE7QUFBQSxRQUdELE8sYUFDRTtBQUFBLFlBQUNRLE9BQUEsQ0FBUUMsUUFBVCxDQUFrQlQsWUFBbEIsRSxRQUFBLEUsU0FBQTtBQUFBLFlBQ0EsT0FBSUEsWUFBQSxDQUFhVSxxQkFBakIsR0FDSVYsWUFBQSxDQUFhVSxxQkFEakIsR0FFVVYsWUFBQSxDQUFhVSxxQkFBbkIsR0FBeUM7QUFBQSxnQixjQUVsQ0MsRUFBRCxDQUFJLFVBQUtDLE1BQUwsRUFBWUMsQ0FBWixFQUNkO0FBQUEsMkJBQWdCWixNQUFmLENBQUNhLGFBQUYsQ0FBcUIsVUFBS0MsUUFBTCxFQUNuQjtBQUFBLCtCLGFBQ0U7QUFBQSw0QkFBU1gsUUFBUixDQUFDWSxNQUFGLENBQWdCLFlBQWhCLEVBQTZCLFVBQUtDLEtBQUwsRUFDM0I7QUFBQSx1Q0FBVWhCLE1BQVQsQ0FBQ2lCLE9BQUYsQ0FBZ0JMLENBQUQsQ0FBR0ksS0FBSCxDQUFmO0FBQUEsNkJBREYsRUFDNkJMLE1BRDdCO0FBQUEsNEJBRUEsT0FBVVgsTUFBVCxDQUFDa0IsT0FBRixDQUFlYixRQUFmLEVBRkE7QUFBQSx5QixDQUFBLEVBREY7QUFBQSxxQkFERjtBQUFBLGlCQURVLENBRm1DO0FBQUEsYUFGN0MsQ0FEQTtBQUFBLFMsQ0FBQSxFQURGLENBSEM7QUFBQSxLLEtBRGMsQyxJQUFBO0FBQUEsQ0FEakI7QUFvQkNFLE9BQUEsQ0FBUUMsUUFBVCxDQUFrQlAsR0FBbEIsRSxRQUFBLEUsU0FBQSxFQXBCQTtBQXFCTUEsR0FBQSxDQUFJa0IsbUJBQVYsR0FBOEJyQixJQUE5QiIsInNvdXJjZXNDb250ZW50IjpbIihkZWZuLSBtYWtlXG4gIFtsb2NhbFJ1bnRpbWVdIChsZXRcbiAgW1Rhc2sgICAgICAgICAgICAoRWxtLk5hdGl2ZS5UYXNrLm1ha2UgICBsb2NhbFJ1bnRpbWUpXG4gICBTaWduYWwgICAgICAgICAgKEVsbS5OYXRpdmUuU2lnbmFsLm1ha2UgbG9jYWxSdW50aW1lKVxuICAgVHVwbGUwICg6VHVwbGUwIChFbG0uTmF0aXZlLlV0aWxzLm1ha2UgIGxvY2FsUnVudGltZSkpXVxuICAoZG9cbiAgICAoZm9yZWlnbi5zYW5pdGl6ZSBsb2NhbFJ1bnRpbWUgOk5hdGl2ZSA6U3RyZWFtcylcbiAgICAoaWYgbG9jYWxSdW50aW1lLk5hdGl2ZS5TdHJlYW1zLnZhbHVlc1xuICAgICAgICBsb2NhbFJ1bnRpbWUuTmF0aXZlLlN0cmVhbXMudmFsdWVzXG4gICAgICAgIChzZXQhIGxvY2FsUnVudGltZS5OYXRpdmUuU3RyZWFtcy52YWx1ZXMge1xuXG4gIDp3aXRoU2lnbmFsIChGMiAoZm4gW3NpZ25hbCBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKC5vdXRwdXQgU2lnbmFsIFwid2l0aFNpZ25hbFwiIChmbiBbdmFsdWVdXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGYgdmFsdWUpKSkgc2lnbmFsKVxuICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSlcblxufSkpKSkpXG5cbihmb3JlaWduLnNhbml0aXplIEVsbSA6TmF0aXZlIDpTdHJlYW1zKVxuKHNldCEgRWxtLk5hdGl2ZS5TdHJlYW1zLm1ha2UgbWFrZSlcbiJdfQ==
