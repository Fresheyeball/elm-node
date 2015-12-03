var make = function make(localRuntime) {
    return function () {
        var fsø1 = require('fs');
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        var Utilsø1 = Elm.Native.Utils.make(localRuntime);
        var Tuple0ø1 = (Utilsø1 || 0)['Tuple0'];
        var Tuple2ø1 = (Utilsø1 || 0)['Tuple2'];
        return (function () {
            sanitize(localRuntime, 'Native', 'FS');
            return localRuntime.Native.FS.values ? localRuntime.Native.FS.values : localRuntime.Native.FS.values = {
                'dirname': __dirname,
                'f_ok': (fsø1 || 0)['F_OK'],
                'r_ok': (fsø1 || 0)['R_OK'],
                'w_ok': (fsø1 || 0)['W_OK'],
                'x_ok': (fsø1 || 0)['X_OK'],
                'access': function (path) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.access(path, function (err) {
                            return callback(Taskø1.succeed(err ? false : true));
                        });
                    });
                },
                'appendFile': F3(function (merr, path, data) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.appendFile(path, data, cb);
                    });
                }),
                'chmod': F3(function (merr, path, mode) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.chmod(path, mode, cb);
                    });
                }),
                'chown': F4(function (merr, path, uid, gid) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.chown(path, uid, gid, cb);
                    });
                }),
                'fchown': F4(function (merr, fd, uid, gid) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.fchown(fd, uid, gid, cb);
                    });
                }),
                'close': F2(function (merr, fd) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.close(fd, cb);
                    });
                }),
                'fchmod': F3(function (merr, fd, mode) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.fchmod(fd, mode, cb);
                    });
                }),
                'fstat': F2(function (merr, fd) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.fstat(fd, function (err, stats) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(stats));
                        });
                    });
                }),
                'fsync': F2(function (merr, fd) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.fsync(fd, cb);
                    });
                }),
                'ftruncate': F3(function (merr, len, fd) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.ftruncate(fd, len, cb);
                    });
                }),
                'link': F3(function (merr, srcpath, dstpath) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.link(srcpath, dstpath, cb);
                    });
                }),
                'mkdir': F3(function (merr, path, mode) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.mkdir(path, mode, cb);
                    });
                }),
                'readFile': F3(function (merr, options, path) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.readFile(path, options, function (err, data) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(data));
                        });
                    });
                }),
                'open': F4(function (merr, path, flags, mode) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.open(path, flags, mode, function (err, fd) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(fd));
                        });
                    });
                }),
                'read': F6(function (merr, fd, buffer, offset, length, position) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.read(fd, buffer, offset, length, position, function (err, bytesRead, buffer_) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(bytesRead, buffer_)));
                        });
                    });
                }),
                'readdir': F2(function (merr, path) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.readdir(path, function (err, files) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(files));
                        });
                    });
                }),
                'readlink': F2(function (merr, path) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.readlink(path, function (err, linkString) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(linkString));
                        });
                    });
                }),
                'rename': F3(function (merr, oldPath, newPath) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.rename(oldPath, newPath, cb);
                    });
                }),
                'rmdir': F2(function (merr, path) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.rmdir(path, cb);
                    });
                }),
                'stat': F2(function (merr, path) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.stat(path, function (err, stats) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(stats));
                        });
                    });
                }),
                'symlink': F4(function (merr, destination, path, type) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.symlink(destination, path, type, cb);
                    });
                }),
                'truncate': F3(function (merr, path, len) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.truncate(path, len, cb);
                    });
                }),
                'unlink': F2(function (merr, path) {
                    return taskCB(merr, Taskø1, Tuple0ø1, function (cb) {
                        return fsø1.unlink(path, cb);
                    });
                }),
                'watch': F3(function (path, options, handler) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            fsø1.watch(path, options, function (event, filename) {
                                return Taskø1.perform(handler(Tuple2ø1(event, filename)));
                            });
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'watchFile': F3(function (options, path, handler) {
                    return function () {
                        var handler_ø1 = function (curr, prev) {
                            return Taskø1.perform(handler(Tuple2ø1(curr, prev)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                fsø1.watchFile(path, options, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        fsø1.unwatchFile(path, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'writeFile': F4(function (merr, file, data, options) {
                    return Taskø1.asyncFunction(function (callback) {
                        return fsø1.writeFile(file, data, function (err) {
                            return callback(err ? Taskø1.error(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                })
            };
        })();
    }.call(this);
};
sanitize(Elm, 'Native', 'FS');
Elm.Native.FS.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbIm1ha2UiLCJsb2NhbFJ1bnRpbWUiLCJmc8O4MSIsInJlcXVpcmUiLCJUYXNrw7gxIiwiRWxtIiwiTmF0aXZlLlRhc2subWFrZSIsIlV0aWxzw7gxIiwiTmF0aXZlLlV0aWxzLm1ha2UiLCJUdXBsZTDDuDEiLCJUdXBsZTLDuDEiLCJzYW5pdGl6ZSIsIk5hdGl2ZS5GUy52YWx1ZXMiLCJfX2Rpcm5hbWUiLCJwYXRoIiwiYXN5bmNGdW5jdGlvbiIsImNhbGxiYWNrIiwiYWNjZXNzIiwiZXJyIiwic3VjY2VlZCIsIkYzIiwibWVyciIsImRhdGEiLCJ0YXNrQ0IiLCJjYiIsImFwcGVuZEZpbGUiLCJtb2RlIiwiY2htb2QiLCJGNCIsInVpZCIsImdpZCIsImNob3duIiwiZmQiLCJmY2hvd24iLCJGMiIsImNsb3NlIiwiZmNobW9kIiwiZnN0YXQiLCJzdGF0cyIsImZhaWwiLCJ0b1N0cmluZyIsImZzeW5jIiwibGVuIiwiZnRydW5jYXRlIiwic3JjcGF0aCIsImRzdHBhdGgiLCJsaW5rIiwibWtkaXIiLCJvcHRpb25zIiwicmVhZEZpbGUiLCJmbGFncyIsIm9wZW4iLCJGNiIsImJ1ZmZlciIsIm9mZnNldCIsImxlbmd0aCIsInBvc2l0aW9uIiwicmVhZCIsImJ5dGVzUmVhZCIsImJ1ZmZlcl8iLCJyZWFkZGlyIiwiZmlsZXMiLCJyZWFkbGluayIsImxpbmtTdHJpbmciLCJvbGRQYXRoIiwibmV3UGF0aCIsInJlbmFtZSIsInJtZGlyIiwic3RhdCIsImRlc3RpbmF0aW9uIiwidHlwZSIsInN5bWxpbmsiLCJ0cnVuY2F0ZSIsInVubGluayIsImhhbmRsZXIiLCJ3YXRjaCIsImV2ZW50IiwiZmlsZW5hbWUiLCJwZXJmb3JtIiwiaGFuZGxlcl/DuDEiLCJjdXJyIiwicHJldiIsIndhdGNoRmlsZSIsImNhbGxiYWNrXyIsInVud2F0Y2hGaWxlIiwiZmlsZSIsIndyaXRlRmlsZSIsImVycm9yIiwiTmF0aXZlLkZTLm1ha2Ui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TCxFQUFnQjtBQUFBLDJDLGFBQzVEO0FBQUEsd0NBQWNqRixJQUFiLENBQUNrRixXQUFGLENBQWlCdEUsSUFBakIsRUFBc0JpRSxVQUF0QjtBQUFBLHdDQUNBLE9BQUNJLFNBQUQsQ0FBcUIvRSxNQUFULENBQUNlLE9BQUYsQ0FBZVYsUUFBZixDQUFYLEVBREE7QUFBQSxxQyxDQUFBLEVBRDREO0FBQUEsaUNBQXJDLENBQWYsQ0FBVixFQURBO0FBQUEsNkIsQ0FBQSxFQURrQztBQUFBLHlCQUFwQyxFQUhDO0FBQUEscUIsS0FESCxDLElBQUE7QUFBQSxpQkFEUyxDQS9KK0I7QUFBQSxnQixhQThLOUJtQixFQUFELENBQUksVUFBS1AsSUFBTCxFQUFVZ0UsSUFBVixFQUFlL0QsSUFBZixFQUFvQjBCLE9BQXBCLEVBQ2I7QUFBQSwyQkFBZ0I1QyxNQUFmLENBQUNXLGFBQUYsQ0FBcUIsVUFBS0MsUUFBTCxFQUNuQjtBQUFBLCtCQUFZZCxJQUFYLENBQUNvRixTQUFGLENBQWVELElBQWYsRUFBb0IvRCxJQUFwQixFQUF5QixVQUFLSixHQUFMLEVBQ3ZCO0FBQUEsbUNBQUNGLFFBQUQsQ0FBY0UsR0FBSixHQUNBZCxNQUFQLENBQUNtRixLQUFGLENBQWNsRSxJQUFELENBQWlCSCxHQUFWLENBQUNzQixRQUFGLEVBQU4sQ0FBYixDQURRLEdBRUVwQyxNQUFULENBQUNlLE9BQUYsQ0FBZVYsUUFBZixDQUZGO0FBQUEseUJBREY7QUFBQSxxQkFERjtBQUFBLGlCQURTLENBOUsrQjtBQUFBLGFBRnhDLENBREE7QUFBQSxTLENBQUEsRUFERixDQUxDO0FBQUEsSyxLQURjLEMsSUFBQTtBQUFBLENBRGpCO0FBa01DRSxRQUFELENBQVVOLEdBQVYsRSxRQUFBLEUsSUFBQSxFQWxNQTtBQW1NTUEsR0FBQSxDQUFJbUYsY0FBVixHQUF5QnhGLElBQXpCIiwic291cmNlc0NvbnRlbnQiOlsiKGRlZm4tIG1ha2VcbiAgW2xvY2FsUnVudGltZV0gKGxldFxuICBbZnMgICAgIChyZXF1aXJlIFwiZnNcIilcbiAgIFRhc2sgICAoRWxtLk5hdGl2ZS5UYXNrLm1ha2UgICBsb2NhbFJ1bnRpbWUpXG4gICBVdGlscyAgKEVsbS5OYXRpdmUuVXRpbHMubWFrZSAgbG9jYWxSdW50aW1lKVxuICAgVHVwbGUwICg6VHVwbGUwIFV0aWxzKVxuICAgVHVwbGUyICg6VHVwbGUyIFV0aWxzKV1cbiAgKGRvXG4gICAgKHNhbml0aXplIGxvY2FsUnVudGltZSA6TmF0aXZlIDpGUylcbiAgICAoaWYgbG9jYWxSdW50aW1lLk5hdGl2ZS5GUy52YWx1ZXNcbiAgICAgICAgbG9jYWxSdW50aW1lLk5hdGl2ZS5GUy52YWx1ZXNcbiAgICAgICAgKHNldCEgbG9jYWxSdW50aW1lLk5hdGl2ZS5GUy52YWx1ZXMge1xuXG4gIDpkaXJuYW1lIF9fZGlybmFtZVxuXG4gIDpmX29rICg6Rl9PSyBmcylcbiAgOnJfb2sgKDpSX09LIGZzKVxuICA6d19vayAoOldfT0sgZnMpXG4gIDp4X29rICg6WF9PSyBmcylcblxuICA7IGZzLmFjY2VzcyhwYXRoWywgbW9kZV0sIGNhbGxiYWNrKVxuICA6YWNjZXNzIChmbiBbcGF0aF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKC5hY2Nlc3MgZnMgcGF0aCAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChpZiBlcnIgZmFsc2UgdHJ1ZSkpKSkpKSkpXG5cbiAgOyBmcy5hcHBlbmRGaWxlKGZpbGUsIGRhdGFbLCBvcHRpb25zXSwgY2FsbGJhY2spXG4gIDphcHBlbmRGaWxlIChGMyAoZm4gW21lcnIgcGF0aCBkYXRhXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC5hcHBlbmRGaWxlIGZzIHBhdGggZGF0YSBjYikpKSkpXG5cbiAgOyBmcy5jaG1vZChwYXRoLCBtb2RlLCBjYWxsYmFjaylcbiAgOmNobW9kIChGMyAoZm4gW21lcnIgcGF0aCBtb2RlXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC5jaG1vZCBmcyBwYXRoIG1vZGUgY2IpKSkpKVxuXG4gIDsgZnMuY2hvd24ocGF0aCwgdWlkLCBnaWQsIGNhbGxiYWNrKVxuICA6Y2hvd24gKEY0IChmbiBbbWVyciBwYXRoIHVpZCBnaWRdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLmNob3duIGZzIHBhdGggdWlkIGdpZCBjYikpKSkpXG5cbiAgOyBmcy5mY2hvd24oZmQsIHVpZCwgZ2lkLCBjYWxsYmFjaylcbiAgOmZjaG93biAoRjQgKGZuIFttZXJyIGZkIHVpZCBnaWRdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLmZjaG93biBmcyBmZCB1aWQgZ2lkIGNiKSkpKSlcblxuICA7IGZzLmNsb3NlKGZkLCBjYWxsYmFjaylcbiAgOmNsb3NlIChGMiAoZm4gW21lcnIgZmRdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLmNsb3NlIGZzIGZkIGNiKSkpKSlcblxuICA7IGZzLmZjaG1vZChmZCwgbW9kZSwgY2FsbGJhY2spXG4gIDpmY2htb2QgKEYzIChmbiBbbWVyciBmZCBtb2RlXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC5mY2htb2QgZnMgZmQgbW9kZSBjYikpKSkpXG5cbiAgOyBmcy5mc3RhdChmZCwgY2FsbGJhY2spXG4gIDpmc3RhdCAoRjIgKGZuIFttZXJyIGZkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoLmZzdGF0IGZzIGZkIChmbiBbZXJyIHN0YXRzXVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgIChUYXNrLmZhaWwgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoVGFzay5zdWNjZWVkIHN0YXRzKSkpKSkpKSkpXG5cbiAgOyBmcy5mc3luYyhmZCwgY2FsbGJhY2spXG4gIDpmc3luYyAoRjIgKGZuIFttZXJyIGZkXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC5mc3luYyBmcyBmZCBjYikpKSkpXG5cbiAgOyBmcy5mdHJ1bmNhdGUoZmQsIGxlbiwgY2FsbGJhY2spXG4gIDpmdHJ1bmNhdGUgKEYzIChmbiBbbWVyciBsZW4gZmRdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLmZ0cnVuY2F0ZSBmcyBmZCBsZW4gY2IpKSkpKVxuXG4gIDsgZnMubGluayhzcmNwYXRoLCBkc3RwYXRoLCBjYWxsYmFjaylcbiAgOmxpbmsgKEYzIChmbiBbbWVyciBzcmNwYXRoIGRzdHBhdGhdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLmxpbmsgZnMgc3JjcGF0aCBkc3RwYXRoIGNiKSkpKSlcblxuICA7IGZzLm1rZGlyKHBhdGhbLCBtb2RlXSwgY2FsbGJhY2spXG4gIDpta2RpciAoRjMgKGZuIFttZXJyIHBhdGggbW9kZV1cbiAgICAodGFza0NCIG1lcnIgVGFzayBUdXBsZTAgKGZuIFtjYl1cbiAgICAgICgubWtkaXIgZnMgcGF0aCBtb2RlIGNiKSkpKSlcblxuICA7IGZzLnJlYWRGaWxlKGZpbGVbLCBvcHRpb25zXSwgY2FsbGJhY2spXG4gIDpyZWFkRmlsZSAoRjMgKGZuIFttZXJyIG9wdGlvbnMgcGF0aF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKC5yZWFkRmlsZSBmcyBwYXRoIG9wdGlvbnMgKGZuIFtlcnIgZGF0YV1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoVGFzay5mYWlsIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKFRhc2suc3VjY2VlZCBkYXRhKSkpKSkpKSkpXG5cbiAgOyBmcy5vcGVuKHBhdGgsIGZsYWdzWywgbW9kZV0sIGNhbGxiYWNrKVxuICA6b3BlbiAoRjQgKGZuIFttZXJyIHBhdGggZmxhZ3MgbW9kZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKC5vcGVuIGZzIHBhdGggZmxhZ3MgbW9kZSAoZm4gW2VyciBmZF1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoVGFzay5mYWlsIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKFRhc2suc3VjY2VlZCBmZCkpKSkpKSkpKVxuXG4gIDsgZnMucmVhZChmZCwgYnVmZmVyLCBvZmZzZXQsIGxlbmd0aCwgcG9zaXRpb24sIGNhbGxiYWNrKVxuICA6cmVhZCAoRjYgKGZuIFttZXJyIGZkIGJ1ZmZlciBvZmZzZXQgbGVuZ3RoIHBvc2l0aW9uXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoLnJlYWQgZnMgZmQgYnVmZmVyIG9mZnNldCBsZW5ndGggcG9zaXRpb24gKGZuIFtlcnIgYnl0ZXNSZWFkIGJ1ZmZlcl9dXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKFRhc2suZmFpbCAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgIChUYXNrLnN1Y2NlZWQgKFR1cGxlMiBieXRlc1JlYWQgYnVmZmVyXykpKSkpKSkpKSlcblxuICA7IGZzLnJlYWRkaXIocGF0aCwgY2FsbGJhY2spXG4gIDpyZWFkZGlyIChGMiAoZm4gW21lcnIgcGF0aF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKC5yZWFkZGlyIGZzIHBhdGggKGZuIFtlcnIgZmlsZXNdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKFRhc2suZmFpbCAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgIChUYXNrLnN1Y2NlZWQgZmlsZXMpKSkpKSkpKSlcblxuICA7IGZzLnJlYWRsaW5rKHBhdGgsIGNhbGxiYWNrKVxuICA6cmVhZGxpbmsgKEYyIChmbiBbbWVyciBwYXRoXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoLnJlYWRsaW5rIGZzIHBhdGggKGZuIFtlcnIgbGlua1N0cmluZ11cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoVGFzay5mYWlsIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKFRhc2suc3VjY2VlZCBsaW5rU3RyaW5nKSkpKSkpKSkpXG5cbiAgOyBmcy5yZW5hbWUob2xkUGF0aCwgbmV3UGF0aCwgY2FsbGJhY2spXG4gIDpyZW5hbWUgKEYzIChmbiBbbWVyciBvbGRQYXRoIG5ld1BhdGhdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLnJlbmFtZSBmcyBvbGRQYXRoIG5ld1BhdGggY2IpKSkpKVxuXG4gIDsgZnMucm1kaXIocGF0aCwgY2FsbGJhY2spXG4gIDpybWRpciAoRjIgKGZuIFttZXJyIHBhdGhdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLnJtZGlyIGZzIHBhdGggY2IpKSkpKVxuXG4gIDsgZnMuc3RhdChwYXRoLCBjYWxsYmFjaylcbiAgOnN0YXQgKEYyIChmbiBbbWVyciBwYXRoXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoLnN0YXQgZnMgcGF0aCAoZm4gW2VyciBzdGF0c11cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoVGFzay5mYWlsIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKFRhc2suc3VjY2VlZCBzdGF0cykpKSkpKSkpKVxuXG4gIDsgZnMuc3ltbGluayhkZXN0aW5hdGlvbiwgcGF0aFssIHR5cGVdLCBjYWxsYmFjaylcbiAgOnN5bWxpbmsgKEY0IChmbiBbbWVyciBkZXN0aW5hdGlvbiBwYXRoIHR5cGVdXG4gICAgKHRhc2tDQiBtZXJyIFRhc2sgVHVwbGUwIChmbiBbY2JdXG4gICAgICAoLnN5bWxpbmsgZnMgZGVzdGluYXRpb24gcGF0aCB0eXBlIGNiKSkpKSlcblxuICA7IGZzLnRydW5jYXRlKHBhdGgsIGxlbiwgY2FsbGJhY2spXG4gIDp0cnVuY2F0ZSAoRjMgKGZuIFttZXJyIHBhdGggbGVuXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC50cnVuY2F0ZSBmcyBwYXRoIGxlbiBjYikpKSkpXG5cbiAgOyBmcy51bmxpbmsocGF0aCwgY2FsbGJhY2spXG4gIDp1bmxpbmsgKEYyIChmbiBbbWVyciBwYXRoXVxuICAgICh0YXNrQ0IgbWVyciBUYXNrIFR1cGxlMCAoZm4gW2NiXVxuICAgICAgKC51bmxpbmsgZnMgcGF0aCBjYikpKSkpXG5cbiAgOyBmcy51bndhdGNoRmlsZShmaWxlbmFtZVssIGxpc3RlbmVyXSlcbiAgOyBmcy51dGltZXMocGF0aCwgYXRpbWUsIG10aW1lLCBjYWxsYmFjaylcblxuICA7IGZzLndhdGNoKGZpbGVuYW1lWywgb3B0aW9uc11bLCBsaXN0ZW5lcl0pXG4gIDp3YXRjaCAoRjMgKGZuIFtwYXRoIG9wdGlvbnMgaGFuZGxlcl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGRvXG4gICAgICAgICgud2F0Y2ggZnMgcGF0aCBvcHRpb25zIChmbiBbZXZlbnQgZmlsZW5hbWVdXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2tcbiAgICAgICAgICAgIChoYW5kbGVyIChUdXBsZTIgZXZlbnQgZmlsZW5hbWUpKSkpKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDsgZnMud2F0Y2hGaWxlKGZpbGVuYW1lWywgb3B0aW9uc10sIGxpc3RlbmVyXG4gIDp3YXRjaEZpbGUgKEYzIChmbiBbb3B0aW9ucyBwYXRoIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfXG4gICAgICAgIChmbiBbY3VyciBwcmV2XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIChUdXBsZTIgY3VyciBwcmV2KSkpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdIChkb1xuICAgICAgICAoLndhdGNoRmlsZSBmcyBwYXRoIG9wdGlvbnMgaGFuZGxlcl8pXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX10gKGRvXG4gICAgICAgICAgKC51bndhdGNoRmlsZSBmcyBwYXRoIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDsgZnMud3JpdGUoZmQsIGJ1ZmZlciwgb2Zmc2V0LCBsZW5ndGhbLCBwb3NpdGlvbl0sIGNhbGxiYWNrKVxuICA7IGZzLndyaXRlKGZkLCBkYXRhWywgcG9zaXRpb25bLCBlbmNvZGluZ11dLCBjYWxsYmFjaylcblxuICA7IGZzLndyaXRlRmlsZShmaWxlLCBkYXRhWywgb3B0aW9uc10sIGNhbGxiYWNrKVxuICA6d3JpdGVGaWxlIChGNCAoZm4gW21lcnIgZmlsZSBkYXRhIG9wdGlvbnNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgud3JpdGVGaWxlIGZzIGZpbGUgZGF0YSAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmVycm9yIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICAgICAgICB9ICkpKSkpXG5cbihzYW5pdGl6ZSBFbG0gOk5hdGl2ZSA6RlMpXG4oc2V0ISBFbG0uTmF0aXZlLkZTLm1ha2UgbWFrZSlcbiJdfQ==
