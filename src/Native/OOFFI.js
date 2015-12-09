global.ooffi = {
    'sanitize': function (record) {
        var spaces = Array.prototype.slice.call(arguments, 1);
        return spaces.reduce(function (r, space) {
            return (function () {
                r[space] ? void 0 : r[space] = {};
                return r[space];
            })();
        }, record);
    },
    'taskCB': function (merr, Task, Tuple0, f) {
        return Task.asyncFunction(function (callback) {
            return f(function (err) {
                return callback(err ? Task.error(merr(err.toString())) : Task.succeed(Tuple0));
            });
        });
    }
};
var make = function make(localRuntime) {
    return function () {
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        var Utilsø1 = Elm.Native.Utils.make(localRuntime);
        var Tuple0ø1 = (Utilsø1 || 0)['Tuple0'];
        var Tuple2ø1 = (Utilsø1 || 0)['Tuple2'];
        return (function () {
            ooffi.sanitize(localRuntime, 'Native', 'OOFFI');
            return localRuntime.Native.OOFFI.values ? localRuntime.Native.OOFFI.values : localRuntime.Native.OOFFI.values = {
                'method0': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name]();
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method1': F3(function (name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method2': F4(function (name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a, b);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method3': F5(function (name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a, b, c);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method4': F6(function (name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a, b, c, d);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method5': F7(function (name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a, b, c, d, e);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'method6': F8(function (name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name](a, b, c, d, e, f);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'methodAsync0': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync1': F3(function (name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync2': F4(function (name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync3': F5(function (name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync4': F6(function (name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync5': F7(function (name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync6': F8(function (name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function () {
                            return callback(Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync0E': F3(function (merr, name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync1E': F4(function (merr, name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync2E': F5(function (merr, name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync3E': F6(function (merr, name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync4E': F7(function (merr, name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync5E': F8(function (merr, name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'methodAsync6E': F9(function (merr, name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function (err) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple0ø1));
                        });
                    });
                }),
                'listen0': F4(function (onname, offname, object, handler) {
                    return function () {
                        var handler_ø1 = function () {
                            return Taskø1.perform(handler);
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen1': F5(function (onname, offname, object, a, handler) {
                    return function () {
                        var handler_ø1 = function () {
                            return Taskø1.perform(handler);
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen2': F6(function (onname, offname, object, a, b, handler) {
                    return function () {
                        var handler_ø1 = function () {
                            return Taskø1.perform(handler);
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen3': F7(function (onname, offname, object, a, b, c, handler) {
                    return function () {
                        var handler_ø1 = function () {
                            return Taskø1.perform(handler);
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen4': F8(function (onname, offname, object, a, b, c, d, handler) {
                    return function () {
                        var handler_ø1 = function () {
                            return Taskø1.perform(handler);
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, d, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen0_1': F4(function (onname, offname, object, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen1_1': F5(function (onname, offname, object, a, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen2_1': F6(function (onname, offname, object, a, b, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen3_1': F7(function (onname, offname, object, a, b, c, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen4_1': F8(function (onname, offname, object, a, b, c, d, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, d, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen5_1': F9(function (onname, offname, object, a, b, c, d, e, handler) {
                    return function () {
                        var handler_ø1 = function (x) {
                            return Taskø1.perform(handler(x));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, d, e, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen0_2': F4(function (onname, offname, object, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen1_2': F5(function (onname, offname, object, a, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen2_2': F6(function (onname, offname, object, a, b, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen3_2': F7(function (onname, offname, object, a, b, c, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen4_2': F8(function (onname, offname, object, a, b, c, d, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, d, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'listen5_2': F9(function (onname, offname, object, a, b, c, d, e, handler) {
                    return function () {
                        var handler_ø1 = function (x, y) {
                            return Taskø1.perform(handler(Tuple2ø1(x, y)));
                        };
                        return Taskø1.asyncFunction(function (callback) {
                            return (function () {
                                object[onname](a, b, c, d, e, handler_ø1);
                                return callback(Taskø1.succeed(Taskø1.asyncFunction(function (callback_) {
                                    return (function () {
                                        object[offname](a, handler_ø1);
                                        return callback_(Taskø1.succeed(Tuple0ø1));
                                    })();
                                })));
                            })();
                        });
                    }.call(this);
                }),
                'get0': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name]()));
                    });
                }),
                'get1': F3(function (name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a)));
                    });
                }),
                'get2': F4(function (name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a, b)));
                    });
                }),
                'get3': F5(function (name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a, b, c)));
                    });
                }),
                'get4': F6(function (name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a, b, c, d)));
                    });
                }),
                'get5': F7(function (name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a, b, c, d, e)));
                    });
                }),
                'get6': F8(function (name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(object[name](a, b, c, d, e, f)));
                    });
                }),
                'getAsync0': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync1': F3(function (name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync2': F4(function (name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync3': F5(function (name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync4': F6(function (name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync5': F7(function (name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync6': F2(function (name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function (x) {
                            return callback(Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync0E': F3(function (merr, name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync1E': F4(function (merr, name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync2E': F5(function (merr, name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync3E': F6(function (merr, name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync4E': F7(function (merr, name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync5E': F8(function (merr, name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync6E': F9(function (merr, name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function (err, x) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(x));
                        });
                    });
                }),
                'getAsync0_2': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync1_2': F3(function (name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync2_2': F4(function (name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync3_2': F5(function (name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync4_2': F6(function (name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync5_2': F7(function (name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync6_2': F8(function (name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function (x, y) {
                            return callback(Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync0_2E': F3(function (merr, name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync1_2E': F4(function (merr, name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync2_2E': F5(function (merr, name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync3_2E': F6(function (merr, name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync4_2E': F7(function (merr, name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync5_2E': F8(function (merr, name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'getAsync6_2E': F9(function (merr, name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return object[name](a, b, c, d, e, f, function (err, x, y) {
                            return callback(err ? Taskø1.fail(merr(err.toString())) : Taskø1.succeed(Tuple2ø1(x, y)));
                        });
                    });
                }),
                'unsafeGetGlobalConstant': function (name) {
                    return window[name];
                },
                'unsafeNull': null,
                'unsafeRequire': function (module) {
                    return require(module);
                },
                'unsafeGet0': F2(function (name, x) {
                    return x[name];
                }),
                'truthy': function (x) {
                    return x ? true : false;
                }
            };
        })();
    }.call(this);
};
typeof(window) == 'undefined' ? window = global : void 0;
ooffi.sanitize(Elm, 'Native', 'OOFFI');
Elm.Native.OOFFI.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbImdsb2JhbCIsIm9vZmZpIiwicmVjb3JkIiwic3BhY2VzIiwicmVkdWNlIiwiciIsInNwYWNlIiwibWVyciIsIlRhc2siLCJUdXBsZTAiLCJmIiwiYXN5bmNGdW5jdGlvbiIsImNhbGxiYWNrIiwiZXJyIiwiZXJyb3IiLCJ0b1N0cmluZyIsInN1Y2NlZWQiLCJtYWtlIiwibG9jYWxSdW50aW1lIiwiVGFza8O4MSIsIkVsbSIsIk5hdGl2ZS5UYXNrLm1ha2UiLCJVdGlsc8O4MSIsIk5hdGl2ZS5VdGlscy5tYWtlIiwiVHVwbGUww7gxIiwiVHVwbGUyw7gxIiwic2FuaXRpemUiLCJOYXRpdmUuT09GRkkudmFsdWVzIiwiRjIiLCJuYW1lIiwib2JqZWN0IiwiRjMiLCJhIiwiRjQiLCJiIiwiRjUiLCJjIiwiRjYiLCJkIiwiRjciLCJlIiwiRjgiLCJmYWlsIiwiRjkiLCJvbm5hbWUiLCJvZmZuYW1lIiwiaGFuZGxlciIsImhhbmRsZXJfw7gxIiwicGVyZm9ybSIsImNhbGxiYWNrXyIsIngiLCJ5Iiwid2luZG93IiwibnVsbCIsIm1vZHVsZSIsInJlcXVpcmUiLCJ0eXBlb2YiLCJOYXRpdmUuT09GRkkubWFrZSJdLCJtYXBwaW5ncyI6IkFBQU1BLE1BQUEsQ0FBT0MsS0FBYixHQUFtQjtBQUFBLEksWUFFUCxVQUNQQyxNQURPLEU7WUFDRUMsTUFBQSxHO1FBQ1IsT0FBQ0EsTUFBQSxDQUFPQyxNQUFSLENBQWUsVUFBS0MsQ0FBTCxFQUFPQyxLQUFQLEVBQWM7QUFBQSxtQixhQUMzQjtBQUFBLGdCQUFVRCxDQUFOLENBQVFDLEtBQVIsQ0FBSixHLE1BQUEsR0FBbUNELENBQU4sQ0FBUUMsS0FBUixDQUFOLEdBQXFCLEVBQTVDO0FBQUEsZ0JBQ0EsT0FBTUQsQ0FBTixDQUFRQyxLQUFSLEVBREE7QUFBQSxhLENBQUEsRUFEMkI7QUFBQSxTQUE3QixFQUdBSixNQUhBLEU7S0FKYTtBQUFBLEksVUFTVCxVQUFLSyxJQUFM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NWpCQTtBQTZqQk1BLEdBQUEsQ0FBSXFDLGlCQUFWLEdBQTRCeEMsSUFBNUIiLCJzb3VyY2VzQ29udGVudCI6WyIoc2V0ISBnbG9iYWwub29mZmkge1xuXG4gIDpzYW5pdGl6ZSAoZm5cbiAgICBbcmVjb3JkICYgc3BhY2VzXVxuICAgICAgKHNwYWNlcy5yZWR1Y2UgKGZuIFtyIHNwYWNlXSAoZG9cbiAgICAgICAgKGlmIChhZ2V0IHIgc3BhY2UpIG5pbCAoc2V0ISAoYWdldCByIHNwYWNlKSB7fSkpXG4gICAgICAgIChhZ2V0IHIgc3BhY2UpKSlcbiAgICAgIHJlY29yZCkpXG5cbiAgOnRhc2tDQiAoZm4gW21lcnIgVGFzayBUdXBsZTAgZl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGYgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKFRhc2suZXJyb3IgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoVGFzay5zdWNjZWVkIFR1cGxlMCkpKSkpKSkpXG5cbn0pXG5cbihkZWZuLSBtYWtlXG4gIFtsb2NhbFJ1bnRpbWVdIChsZXRcbiAgW1Rhc2sgICAoRWxtLk5hdGl2ZS5UYXNrLm1ha2UgICBsb2NhbFJ1bnRpbWUpXG4gICBVdGlscyAgKEVsbS5OYXRpdmUuVXRpbHMubWFrZSAgbG9jYWxSdW50aW1lKVxuICAgVHVwbGUwICg6VHVwbGUwIFV0aWxzKVxuICAgVHVwbGUyICg6VHVwbGUyIFV0aWxzKV1cbiAgIChkb1xuICAgICAob29mZmkuc2FuaXRpemUgbG9jYWxSdW50aW1lIDpOYXRpdmUgOk9PRkZJKVxuICAgICAoaWYgbG9jYWxSdW50aW1lLk5hdGl2ZS5PT0ZGSS52YWx1ZXNcbiAgICAgICAgIGxvY2FsUnVudGltZS5OYXRpdmUuT09GRkkudmFsdWVzXG4gICAgICAgICAoc2V0ISBsb2NhbFJ1bnRpbWUuTmF0aXZlLk9PRkZJLnZhbHVlcyB7XG5cbiAgOm1ldGhvZDAgKEYyIChmbiBbbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2QxIChGMyAoZm4gW25hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEpXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpXG5cbiAgOm1ldGhvZDIgKEY0IChmbiBbbmFtZSBvYmplY3QgYSBiXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIpXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpXG5cbiAgOm1ldGhvZDMgKEY1IChmbiBbbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2Q0IChGNiAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQpXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpXG5cbiAgOm1ldGhvZDUgKEY3IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUpXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpXG5cbiAgOm1ldGhvZDYgKEY4IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzAgKEYyIChmbiBbbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgKGZuIFtdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzEgKEYzIChmbiBbbmFtZSBvYmplY3QgYV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMyIChGNCAoZm4gW25hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFtdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzMgKEY1IChmbiBbbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgKGZuIFtdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzQgKEY2IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM1IChGNyAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFtdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzYgKEY4IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIGYgKGZuIFtdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzBFIChGMyAoZm4gW21lcnIgbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMxRSAoRjQgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrXG4gICAgICAgICAgKGlmIGVyclxuICAgICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAgICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzJFIChGNSAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrXG4gICAgICAgICAgKGlmIGVyclxuICAgICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAgICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzNFIChGNiAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM0RSAoRjcgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrXG4gICAgICAgICAgKGlmIGVyclxuICAgICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAgICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzVFIChGOCAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGMgZCBlXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSAoZm4gW2Vycl1cbiAgICAgICAgKGNhbGxiYWNrXG4gICAgICAgICAgKGlmIGVyclxuICAgICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAgICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKVxuXG4gIDptZXRob2RBc3luYzZFIChGOSAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIGYgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bGlzdGVuMCAoRjQgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFtdICgucGVyZm9ybSBUYXNrIGhhbmRsZXIpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjEgKEY1IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFtdICgucGVyZm9ybSBUYXNrIGhhbmRsZXIpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4yIChGNiAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFtdICgucGVyZm9ybSBUYXNrIGhhbmRsZXIpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGIgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjMgKEY3IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgYiBjIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbXSAoLnBlcmZvcm0gVGFzayBoYW5kbGVyKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjQgKEY4IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgYiBjIGQgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFtdICgucGVyZm9ybSBUYXNrIGhhbmRsZXIpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGIgYyBkIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG5cbiAgOmxpc3RlbjBfMSAoRjQgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIHgpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4xXzEgKEY1IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIHgpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuMl8xIChGNiAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIHgpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4zXzEgKEY3IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgYiBjIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW40XzEgKEY4IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgYiBjIGQgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIHgpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgZCBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuNV8xIChGOSAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBkIGUgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIHgpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgZCBlIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4wXzIgKEY0IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeCB5XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIChUdXBsZTIgeCB5KSkpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjFfMiAoRjUgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW3ggeV1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciAoVHVwbGUyIHggeSkpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuMl8yIChGNiAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4IHldXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgKFR1cGxlMiB4IHkpKSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuM18yIChGNyAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW3ggeV1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciAoVHVwbGUyIHggeSkpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjRfMiAoRjggKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGMgZCBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW3ggeV1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciAoVHVwbGUyIHggeSkpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgZCBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuNV8yIChGOSAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBkIGUgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4IHldXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgKFR1cGxlMiB4IHkpKSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGQgZSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6Z2V0MCAoRjIgKGZuIFtuYW1lIG9iamVjdF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICgoYWdldCBvYmplY3QgbmFtZSkpKSkpKSkpXG5cbiAgOmdldDEgKEYzIChmbiBbbmFtZSBvYmplY3QgYV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICgoYWdldCBvYmplY3QgbmFtZSkgYSkpKSkpKSlcblxuICA6Z2V0MiAoRjQgKGZuIFtuYW1lIG9iamVjdCBhIGJdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYikpKSkpKSlcblxuICA6Z2V0MyAoRjUgKGZuIFtuYW1lIG9iamVjdCBhIGIgY11cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMpKSkpKSkpXG5cbiAgOmdldDQgKEY2IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCkpKSkpKSlcblxuICA6Z2V0NSAoRjcgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGVdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSkpKSkpKSlcblxuICA6Z2V0NiAoRjggKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGUgZl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIGYpKSkpKSkpXG5cbiAgOmdldEFzeW5jMCAoRjIgKGZuIFtuYW1lIG9iamVjdF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSAoZm4gW3hdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSlcblxuICA6Z2V0QXN5bmMxIChGMyAoZm4gW25hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSAoZm4gW3hdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSlcblxuICA6Z2V0QXN5bmMyIChGNCAoZm4gW25hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMyAoRjUgKGZuIFtuYW1lIG9iamVjdCBhIGIgY11cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyAoZm4gW3hdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSlcblxuICA6Z2V0QXN5bmM0IChGNiAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCAoZm4gW3hdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSlcblxuICA6Z2V0QXN5bmM1IChGNyAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNiAoRjIgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGUgZl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgZiAoZm4gW3hdXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSlcblxuICA6Z2V0QXN5bmMwRSAoRjMgKGZuIFttZXJyIG5hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMUUgKEY0IChmbiBbbWVyciBuYW1lIG9iamVjdCBhXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgKGZuIFtlcnIgeF1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMyRSAoRjUgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFtlcnIgeF1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMzRSAoRjYgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNEUgKEY3IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgYyBkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgKGZuIFtlcnIgeF1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM1RSAoRjggKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFtlcnIgeF1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM2RSAoRjkgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMF8yIChGMiAoZm4gW25hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIChmbiBbeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMxXzIgKEYzIChmbiBbbmFtZSBvYmplY3QgYV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIChmbiBbeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMyXzIgKEY0IChmbiBbbmFtZSBvYmplY3QgYSBiXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jM18yIChGNSAoZm4gW25hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIChmbiBbeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM0XzIgKEY2IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIChmbiBbeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM1XzIgKEY3IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNl8yIChGOCAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmIChmbiBbeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMwXzJFIChGMyAoZm4gW21lcnIgbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMV8yRSAoRjQgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSAoZm4gW2VyciB4IHldXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMyXzJFIChGNSAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiAoZm4gW2VyciB4IHldXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmMzXzJFIChGNiAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNF8yRSAoRjcgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCAoZm4gW2VyciB4IHldXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM1XzJFIChGOCAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGMgZCBlXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSAoZm4gW2VyciB4IHldXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKSlcblxuICA6Z2V0QXN5bmM2XzJFIChGOSAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIGYgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOnVuc2FmZUdldEdsb2JhbENvbnN0YW50IChmbiBbbmFtZV0gKGFnZXQgd2luZG93IG5hbWUpKVxuXG4gIDp1bnNhZmVOdWxsIG51bGxcblxuICA6dW5zYWZlUmVxdWlyZSAoZm4gW21vZHVsZV0gKHJlcXVpcmUgbW9kdWxlKSlcblxuICA6dW5zYWZlR2V0MCAoRjIgKGZuIFtuYW1lIHhdIChhZ2V0IHggbmFtZSkpKVxuXG4gIDp0cnV0aHkgKGZuIFt4XSAoaWYgeCB0cnVlIGZhbHNlKSlcblxuICB9KSkpKSlcblxuKGlmICg9PSAodHlwZW9mIHdpbmRvdykgOnVuZGVmaW5lZCkgKHNldCEgd2luZG93IGdsb2JhbCkpXG4ob29mZmkuc2FuaXRpemUgRWxtIDpOYXRpdmUgOk9PRkZJKVxuKHNldCEgRWxtLk5hdGl2ZS5PT0ZGSS5tYWtlIG1ha2UpXG4iXX0=
