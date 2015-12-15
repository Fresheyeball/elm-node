var make = function make(localRuntime) {
    return function () {
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        var Signalø1 = Elm.Native.Signal.make(localRuntime);
        var Tuple0ø1 = (Elm.Native.Utils.make(localRuntime) || 0)['Tuple0'];
        return (function () {
            foreign.sanitize(localRuntime, 'Native', 'Streams');
            return localRuntime.Native.Streams.values ? localRuntime.Native.Streams.values : localRuntime.Native.Streams.values = {
                'emptyBuffer': new Buffer([]),
                'marshallChunk': F3(function (Left, Right, chunk) {
                    return typeof(chunk) == 'string' ? Left(chunk) : Right(chunk);
                }),
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbIm1ha2UiLCJsb2NhbFJ1bnRpbWUiLCJUYXNrw7gxIiwiRWxtIiwiTmF0aXZlLlRhc2subWFrZSIsIlNpZ25hbMO4MSIsIk5hdGl2ZS5TaWduYWwubWFrZSIsIlR1cGxlMMO4MSIsIk5hdGl2ZS5VdGlscy5tYWtlIiwiZm9yZWlnbiIsInNhbml0aXplIiwiTmF0aXZlLlN0cmVhbXMudmFsdWVzIiwiRjMiLCJMZWZ0IiwiUmlnaHQiLCJjaHVuayIsInR5cGVvZiIsIkYyIiwic2lnbmFsIiwiZiIsImFzeW5jRnVuY3Rpb24iLCJjYWxsYmFjayIsIm91dHB1dCIsInZhbHVlIiwicGVyZm9ybSIsInN1Y2NlZWQiLCJOYXRpdmUuU3RyZWFtcy5tYWtlIl0sIm1hcHBpbmdzIjoiQUFBQSxJQUFPQSxJQUFBLEdBQVAsU0FBT0EsSUFBUCxDQUNHQyxZQURILEVBQ2lCO0FBQUEsVyxZQUNkO0FBQUEsWUFBQUMsTSxHQUFpQkMsR0FBQSxDQUFJQyxnQkFBTCxDQUF3QkgsWUFBeEIsQ0FBaEI7QUFBQSxRQUNBLElBQUFJLFEsR0FBaUJGLEdBQUEsQ0FBSUcsa0JBQUwsQ0FBd0JMLFlBQXhCLENBQWhCLENBREE7QUFBQSxRQUVBLElBQUFNLFEsSUFBaUJKLEdBQUEsQ0FBSUssaUJBQUwsQ0FBd0JQLFlBQXhCLEMsTUFBVCxDLFFBQUEsQ0FBUCxDQUZBO0FBQUEsUUFHRCxPLGFBQ0U7QUFBQSxZQUFDUSxPQUFBLENBQVFDLFFBQVQsQ0FBa0JULFlBQWxCLEUsUUFBQSxFLFNBQUE7QUFBQSxZQUNBLE9BQUlBLFlBQUEsQ0FBYVUscUJBQWpCLEdBQ0lWLFlBQUEsQ0FBYVUscUJBRGpCLEdBRVVWLFlBQUEsQ0FBYVUscUJBQW5CLEdBQXlDO0FBQUEsZ0IsZUFFbEMsSSxNQUFBLENBQVMsRUFBVCxDQUZrQztBQUFBLGdCLGlCQUkvQkMsRUFBRCxDQUFJLFVBQUtDLElBQUwsRUFBVUMsS0FBVixFQUFnQkMsS0FBaEIsRUFDakI7QUFBQSwyQkFBU0MsTUFBRCxDQUFRRCxLQUFSLENBQUosSUFBbUIsUUFBdkIsR0FDS0YsSUFBRCxDQUFNRSxLQUFOLENBREosR0FFS0QsS0FBRCxDQUFPQyxLQUFQLENBRko7QUFBQSxpQkFEYSxDQUpnQztBQUFBLGdCLGNBU2xDRSxFQUFELENBQUksVUFBS0MsTUFBTCxFQUFZQyxDQUFaLEVBQ2Q7QUFBQSwyQkFBZ0JqQixNQUFmLENBQUNrQixhQUFGLENBQXFCLFVBQUtDLFFBQUwsRUFDbkI7QUFBQSwrQixhQUNFO0FBQUEsNEJBQVNoQixRQUFSLENBQUNpQixNQUFGLENBQWdCLFlBQWhCLEVBQTZCLFVBQUtDLEtBQUwsRUFDM0I7QUFBQSx1Q0FBVXJCLE1BQVQsQ0FBQ3NCLE9BQUYsQ0FBZ0JMLENBQUQsQ0FBR0ksS0FBSCxDQUFmO0FBQUEsNkJBREYsRUFDNkJMLE1BRDdCO0FBQUEsNEJBRUEsT0FBVWhCLE1BQVQsQ0FBQ3VCLE9BQUYsQ0FBZWxCLFFBQWYsRUFGQTtBQUFBLHlCLENBQUEsRUFERjtBQUFBLHFCQURGO0FBQUEsaUJBRFUsQ0FUbUM7QUFBQSxhQUY3QyxDQURBO0FBQUEsUyxDQUFBLEVBREYsQ0FIQztBQUFBLEssS0FEYyxDLElBQUE7QUFBQSxDQURqQjtBQTJCQ0UsT0FBQSxDQUFRQyxRQUFULENBQWtCUCxHQUFsQixFLFFBQUEsRSxTQUFBLEVBM0JBO0FBNEJNQSxHQUFBLENBQUl1QixtQkFBVixHQUE4QjFCLElBQTlCIiwic291cmNlc0NvbnRlbnQiOlsiKGRlZm4tIG1ha2VcbiAgW2xvY2FsUnVudGltZV0gKGxldFxuICBbVGFzayAgICAgICAgICAgIChFbG0uTmF0aXZlLlRhc2subWFrZSAgIGxvY2FsUnVudGltZSlcbiAgIFNpZ25hbCAgICAgICAgICAoRWxtLk5hdGl2ZS5TaWduYWwubWFrZSBsb2NhbFJ1bnRpbWUpXG4gICBUdXBsZTAgKDpUdXBsZTAgKEVsbS5OYXRpdmUuVXRpbHMubWFrZSAgbG9jYWxSdW50aW1lKSldXG4gIChkb1xuICAgIChmb3JlaWduLnNhbml0aXplIGxvY2FsUnVudGltZSA6TmF0aXZlIDpTdHJlYW1zKVxuICAgIChpZiBsb2NhbFJ1bnRpbWUuTmF0aXZlLlN0cmVhbXMudmFsdWVzXG4gICAgICAgIGxvY2FsUnVudGltZS5OYXRpdmUuU3RyZWFtcy52YWx1ZXNcbiAgICAgICAgKHNldCEgbG9jYWxSdW50aW1lLk5hdGl2ZS5TdHJlYW1zLnZhbHVlcyB7XG5cbiAgOmVtcHR5QnVmZmVyIChCdWZmZXIuIFtdKVxuXG4gIDptYXJzaGFsbENodW5rIChGMyAoZm4gW0xlZnQgUmlnaHQgY2h1bmtdXG4gICAgKGlmICg9PSAodHlwZW9mIGNodW5rKSBcInN0cmluZ1wiKVxuICAgICAgICAoTGVmdCBjaHVuaylcbiAgICAgICAgKFJpZ2h0IGNodW5rKSkpKVxuXG4gIDp3aXRoU2lnbmFsIChGMiAoZm4gW3NpZ25hbCBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKC5vdXRwdXQgU2lnbmFsIFwid2l0aFNpZ25hbFwiIChmbiBbdmFsdWVdXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGYgdmFsdWUpKSkgc2lnbmFsKVxuICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSlcblxufSkpKSkpXG5cbihmb3JlaWduLnNhbml0aXplIEVsbSA6TmF0aXZlIDpTdHJlYW1zKVxuKHNldCEgRWxtLk5hdGl2ZS5TdHJlYW1zLm1ha2UgbWFrZSlcbiJdfQ==
