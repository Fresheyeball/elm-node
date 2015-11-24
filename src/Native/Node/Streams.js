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
    return (function () {
        sanitize(localRuntime, 'Native', 'Node', 'Streams');
        return localRuntime.Native.Node.Streams.values ? localRuntime.Native.Node.Streams.values : localRuntime.Native.Node.Streams.values = { 'foo': 'foo' };
    })();
};
sanitize(Elm, 'Native', 'Node', 'Streams');
Elm.Native.Node.Streams.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbInNhbml0aXplIiwicmVjb3JkIiwic3BhY2VzIiwicmVkdWNlIiwiciIsInNwYWNlIiwibWFrZSIsImxvY2FsUnVudGltZSIsIk5hdGl2ZS5Ob2RlLlN0cmVhbXMudmFsdWVzIiwiRWxtIiwiTmF0aXZlLk5vZGUuU3RyZWFtcy5tYWtlIl0sIm1hcHBpbmdzIjoiQUFBQSxJQUFPQSxRQUFBLEdBQVAsU0FBT0EsUUFBUCxDQUFpQkMsTUFBakIsRTtRQUEwQkMsTUFBQSxHO0lBQ3hCLE9BQUNBLE1BQUEsQ0FBT0MsTUFBUixDQUFlLFVBQUtDLENBQUwsRUFBT0MsS0FBUCxFQUFjO0FBQUEsZSxhQUMzQjtBQUFBLFlBQVVELENBQU4sQ0FBUUMsS0FBUixDQUFKLEcsTUFBQSxHQUFtQ0QsQ0FBTixDQUFRQyxLQUFSLENBQU4sR0FBcUIsRUFBNUM7QUFBQSxZQUNBLE9BQU1ELENBQU4sQ0FBUUMsS0FBUixFQURBO0FBQUEsUyxDQUFBLEVBRDJCO0FBQUEsS0FBN0IsRUFHQUosTUFIQSxFO0NBREY7QUFNQSxJQUFPSyxJQUFBLEdBQVAsU0FBT0EsSUFBUCxDQUFhQyxZQUFiLEVBQTJCO0FBQUEsVyxhQUN2QjtBQUFBLFFBQUNQLFFBQUQsQ0FBVU8sWUFBVixFLFFBQUEsRSxNQUFBLEUsU0FBQTtBQUFBLFFBQ0EsT0FBSUEsWUFBQSxDQUFhQywwQkFBakIsR0FDSUQsWUFBQSxDQUFhQywwQkFEakIsR0FFVUQsWUFBQSxDQUFhQywwQkFBbkIsR0FBOEMsRSxPQUN2QyxLQUR1QyxFQUZsRCxDQURBO0FBQUEsSyxDQUFBLEVBRHVCO0FBQUEsQ0FBM0IsQ0FOQTtBQWFDUixRQUFELENBQVVTLEdBQVYsRSxRQUFBLEUsTUFBQSxFLFNBQUEsRUFiQTtBQWNNQSxHQUFBLENBQUlDLHdCQUFWLEdBQW1DSixJQUFuQyIsInNvdXJjZXNDb250ZW50IjpbIihkZWZuLSBzYW5pdGl6ZSBbcmVjb3JkICYgc3BhY2VzXVxuICAoc3BhY2VzLnJlZHVjZSAoZm4gW3Igc3BhY2VdIChkb1xuICAgIChpZiAoYWdldCByIHNwYWNlKSBuaWwgKHNldCEgKGFnZXQgciBzcGFjZSkge30pKVxuICAgIChhZ2V0IHIgc3BhY2UpKSlcbiAgcmVjb3JkKSlcblxuKGRlZm4tIG1ha2UgW2xvY2FsUnVudGltZV0gKGRvXG4gICAgKHNhbml0aXplIGxvY2FsUnVudGltZSA6TmF0aXZlIDpOb2RlIDpTdHJlYW1zKVxuICAgIChpZiBsb2NhbFJ1bnRpbWUuTmF0aXZlLk5vZGUuU3RyZWFtcy52YWx1ZXNcbiAgICAgICAgbG9jYWxSdW50aW1lLk5hdGl2ZS5Ob2RlLlN0cmVhbXMudmFsdWVzXG4gICAgICAgIChzZXQhIGxvY2FsUnVudGltZS5OYXRpdmUuTm9kZS5TdHJlYW1zLnZhbHVlcyB7XG4gICAgICAgICAgOmZvbyBcImZvb1wiIH0pKSkpXG5cbihzYW5pdGl6ZSBFbG0gOk5hdGl2ZSA6Tm9kZSA6U3RyZWFtcylcbihzZXQhIEVsbS5OYXRpdmUuTm9kZS5TdHJlYW1zLm1ha2UgbWFrZSlcbiJdfQ==
