var createReadStream = function createReadStream(fs, Task) {
    return function (options, path) {
        return Task.succeed(fs.createReadStream(path, options));
    };
};
var createWriteStream = function createWriteStream(fs, Task) {
    return function (options, path) {
        return Task.succeed(fs.createWriteStream(path, options));
    };
};
var sanitize = function sanitize(record) {
    var spaces = Array.prototype.slice.call(arguments, 1);
    return spaces.reduce(function (r, space) {
        return (function () {
            r[space] ? void 0 : r[space] = {};
            return r[space];
        })();
    }, record);
};
var make = function make(localRuntime) {
    return function () {
        var fsø1 = require('fs');
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        return (function () {
            sanitize(localRuntime, 'Native', 'FS', 'Streams');
            return localRuntime.Native.FS.Streams.values ? localRuntime.Native.FS.Streams.values : localRuntime.Native.FS.Streams.values = {
                'createReadStream': F2(createReadStream(fsø1, Taskø1)),
                'createWriteStream': F2(createWriteStream(fsø1, Taskø1))
            };
        })();
    }.call(this);
};
sanitize(Elm, 'Native', 'FS', 'Streams');
Elm.Native.FS.Streams.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbImNyZWF0ZVJlYWRTdHJlYW0iLCJmcyIsIlRhc2siLCJvcHRpb25zIiwicGF0aCIsInN1Y2NlZWQiLCJjcmVhdGVXcml0ZVN0cmVhbSIsInNhbml0aXplIiwicmVjb3JkIiwic3BhY2VzIiwicmVkdWNlIiwiciIsInNwYWNlIiwibWFrZSIsImxvY2FsUnVudGltZSIsImZzw7gxIiwicmVxdWlyZSIsIlRhc2vDuDEiLCJFbG0iLCJOYXRpdmUuVGFzay5tYWtlIiwiTmF0aXZlLkZTLlN0cmVhbXMudmFsdWVzIiwiRjIiLCJOYXRpdmUuRlMuU3RyZWFtcy5tYWtlIl0sIm1hcHBpbmdzIjoiQUFBQSxJQUFPQSxnQkFBQSxHQUFQLFNBQU9BLGdCQUFQLENBQ0dDLEVBREgsRUFDTUMsSUFETixFQUNZO0FBQUEscUJBQ1RDLE9BRFMsRUFDREMsSUFEQyxFQUVWO0FBQUEsZUFBQ0YsSUFBQSxDQUFLRyxPQUFOLENBQWlDSixFQUFsQixDQUFDRCxnQkFBRixDQUFzQkksSUFBdEIsRUFBMkJELE9BQTNCLENBQWQ7QUFBQSxLQUZVO0FBQUEsQ0FEWjtBQUtBLElBQU9HLGlCQUFBLEdBQVAsU0FBT0EsaUJBQVAsQ0FDR0wsRUFESCxFQUNNQyxJQUROLEVBQ1k7QUFBQSxxQkFDVEMsT0FEUyxFQUNEQyxJQURDLEVBRVY7QUFBQSxlQUFDRixJQUFBLENBQUtHLE9BQU4sQ0FBa0NKLEVBQW5CLENBQUNLLGlCQUFGLENBQXVCRixJQUF2QixFQUE0QkQsT0FBNUIsQ0FBZDtBQUFBLEtBRlU7QUFBQSxDQURaLENBTEE7QUFVQSxJQUFPSSxRQUFBLEdBQVAsU0FBT0EsUUFBUCxDQUFpQkMsTUFBakIsRTtRQUEwQkMsTUFBQSxHO0lBQ3hCLE9BQUNBLE1BQUEsQ0FBT0MsTUFBUixDQUFlLFVBQUtDLENBQUwsRUFBT0MsS0FBUCxFQUFjO0FBQUEsZSxhQUMzQjtBQUFBLFlBQVVELENBQU4sQ0FBUUMsS0FBUixDQUFKLEcsTUFBQSxHQUFtQ0QsQ0FBTixDQUFRQyxLQUFSLENBQU4sR0FBcUIsRUFBNUM7QUFBQSxZQUNBLE9BQU1ELENBQU4sQ0FBUUMsS0FBUixFQURBO0FBQUEsUyxDQUFBLEVBRDJCO0FBQUEsS0FBN0IsRUFHQUosTUFIQSxFO0NBREYsQ0FWQTtBQWdCQSxJQUFPSyxJQUFBLEdBQVAsU0FBT0EsSUFBUCxDQUNHQyxZQURILEVBQ2lCO0FBQUEsVyxZQUNkO0FBQUEsWUFBQUMsSSxHQUFRQyxPQUFELENBQVMsSUFBVCxDQUFQO0FBQUEsUUFDQSxJQUFBQyxNLEdBQVFDLEdBQUEsQ0FBSUMsZ0JBQUwsQ0FBdUJMLFlBQXZCLENBQVAsQ0FEQTtBQUFBLFFBRUQsTyxhQUNFO0FBQUEsWUFBQ1AsUUFBRCxDQUFVTyxZQUFWLEUsUUFBQSxFLElBQUEsRSxTQUFBO0FBQUEsWUFDQSxPQUFJQSxZQUFBLENBQWFNLHdCQUFqQixHQUNJTixZQUFBLENBQWFNLHdCQURqQixHQUVVTixZQUFBLENBQWFNLHdCQUFuQixHQUE0QztBQUFBLGdCLG9CQUN0QkMsRUFBRCxDQUFLckIsZ0JBQUQsQ0FBbUJlLElBQW5CLEVBQXNCRSxNQUF0QixDQUFKLENBRHVCO0FBQUEsZ0IscUJBRXRCSSxFQUFELENBQUtmLGlCQUFELENBQW1CUyxJQUFuQixFQUFzQkUsTUFBdEIsQ0FBSixDQUZ1QjtBQUFBLGFBRmhELENBREE7QUFBQSxTLENBQUEsRUFERixDQUZDO0FBQUEsSyxLQURjLEMsSUFBQTtBQUFBLENBRGpCLENBaEJBO0FBNEJDVixRQUFELENBQVVXLEdBQVYsRSxRQUFBLEUsSUFBQSxFLFNBQUEsRUE1QkE7QUE2Qk1BLEdBQUEsQ0FBSUksc0JBQVYsR0FBaUNULElBQWpDIiwic291cmNlc0NvbnRlbnQiOlsiKGRlZm4tIGNyZWF0ZVJlYWRTdHJlYW1cbiAgW2ZzIFRhc2tdIChmblxuICBbb3B0aW9ucyBwYXRoXVxuICAoVGFzay5zdWNjZWVkICguY3JlYXRlUmVhZFN0cmVhbSBmcyBwYXRoIG9wdGlvbnMpKSkpXG5cbihkZWZuLSBjcmVhdGVXcml0ZVN0cmVhbVxuICBbZnMgVGFza10gKGZuXG4gIFtvcHRpb25zIHBhdGhdXG4gIChUYXNrLnN1Y2NlZWQgKC5jcmVhdGVXcml0ZVN0cmVhbSBmcyBwYXRoIG9wdGlvbnMpKSkpXG5cbihkZWZuLSBzYW5pdGl6ZSBbcmVjb3JkICYgc3BhY2VzXVxuICAoc3BhY2VzLnJlZHVjZSAoZm4gW3Igc3BhY2VdIChkb1xuICAgIChpZiAoYWdldCByIHNwYWNlKSBuaWwgKHNldCEgKGFnZXQgciBzcGFjZSkge30pKVxuICAgIChhZ2V0IHIgc3BhY2UpKSlcbiAgcmVjb3JkKSlcblxuKGRlZm4tIG1ha2VcbiAgW2xvY2FsUnVudGltZV0gKGxldFxuICBbZnMgICAgIChyZXF1aXJlIFwiZnNcIilcbiAgIFRhc2sgICAoRWxtLk5hdGl2ZS5UYXNrLm1ha2UgIGxvY2FsUnVudGltZSldXG4gIChkb1xuICAgIChzYW5pdGl6ZSBsb2NhbFJ1bnRpbWUgOk5hdGl2ZSA6RlMgOlN0cmVhbXMpXG4gICAgKGlmIGxvY2FsUnVudGltZS5OYXRpdmUuRlMuU3RyZWFtcy52YWx1ZXNcbiAgICAgICAgbG9jYWxSdW50aW1lLk5hdGl2ZS5GUy5TdHJlYW1zLnZhbHVlc1xuICAgICAgICAoc2V0ISBsb2NhbFJ1bnRpbWUuTmF0aXZlLkZTLlN0cmVhbXMudmFsdWVzIHtcbiAgICAgICAgICA6Y3JlYXRlUmVhZFN0cmVhbSAgKEYyIChjcmVhdGVSZWFkU3RyZWFtICBmcyBUYXNrKSlcbiAgICAgICAgICA6Y3JlYXRlV3JpdGVTdHJlYW0gKEYyIChjcmVhdGVXcml0ZVN0cmVhbSBmcyBUYXNrKSkgfSkpKSkpXG5cbihzYW5pdGl6ZSBFbG0gOk5hdGl2ZSA6RlMgOlN0cmVhbXMpXG4oc2V0ISBFbG0uTmF0aXZlLkZTLlN0cmVhbXMubWFrZSBtYWtlKVxuIl19
