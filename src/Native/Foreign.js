global.foreign = {
    'sanitize': function (record) {
        var spaces = Array.prototype.slice.call(arguments, 1);
        return spaces.reduce(function (r, space) {
            return (function () {
                r[space] ? void 0 : r[space] = {};
                return r[space];
            })();
        }, record);
    }
};
var make = function make(localRuntime) {
    return function () {
        var Taskø1 = Elm.Native.Task.make(localRuntime);
        var Utilsø1 = Elm.Native.Utils.make(localRuntime);
        var Tuple0ø1 = (Utilsø1 || 0)['Tuple0'];
        var Tuple2ø1 = (Utilsø1 || 0)['Tuple2'];
        return (function () {
            foreign.sanitize(localRuntime, 'Native', 'Foreign');
            return localRuntime.Native.Foreign.values ? localRuntime.Native.Foreign.values : localRuntime.Native.Foreign.values = {
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
                'get': F2(function (name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.success(object[name]));
                    });
                }),
                'modify': F3(function (name, object, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name] = f(object[name]);
                            return callback(Taskø1.success(Tuple0ø1));
                        })();
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
                'getTime': function (date) {
                    return date.getTime();
                },
                'fromTime': function (time) {
                    return new Date(time);
                },
                'truthy': function (x) {
                    return x ? true : false;
                },
                'toString': function (x) {
                    return x.toString();
                }
            };
        })();
    }.call(this);
};
typeof(window) == 'undefined' ? window = global : void 0;
foreign.sanitize(Elm, 'Native', 'Foreign');
Elm.Native.Foreign.make = make;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFub255bW91cy53aXNwIl0sIm5hbWVzIjpbImdsb2JhbCIsImZvcmVpZ24iLCJyZWNvcmQiLCJzcGFjZXMiLCJyZWR1Y2UiLCJyIiwic3BhY2UiLCJtYWtlIiwibG9jYWxSdW50aW1lIiwiVGFza8O4MSIsIkVsbSIsIk5hdGl2ZS5UYXNrLm1ha2UiLCJVdGlsc8O4MSIsIk5hdGl2ZS5VdGlscy5tYWtlIiwiVHVwbGUww7gxIiwiVHVwbGUyw7gxIiwic2FuaXRpemUiLCJOYXRpdmUuRm9yZWlnbi52YWx1ZXMiLCJGMiIsIm5hbWUiLCJvYmplY3QiLCJhc3luY0Z1bmN0aW9uIiwiY2FsbGJhY2siLCJzdWNjZWVkIiwiRjMiLCJhIiwiRjQiLCJiIiwiRjUiLCJjIiwiRjYiLCJkIiwiRjciLCJlIiwiRjgiLCJmIiwibWVyciIsImVyciIsImZhaWwiLCJ0b1N0cmluZyIsIkY5Iiwib25uYW1lIiwib2ZmbmFtZSIsImhhbmRsZXIiLCJoYW5kbGVyX8O4MSIsInBlcmZvcm0iLCJjYWxsYmFja18iLCJ4IiwieSIsInN1Y2Nlc3MiLCJ3aW5kb3ciLCJudWxsIiwibW9kdWxlIiwicmVxdWlyZSIsImRhdGUiLCJnZXRUaW1lIiwidGltZSIsInR5cGVvZiIsIk5hdGl2ZS5Gb3JlaWduLm1ha2UiXSwibWFwcGluZ3MiOiJBQUFNQSxNQUFBLENBQU9DLE9BQWIsR0FBcUI7QUFBQSxJLFlBRVQsVUFDUEMsTUFETyxFO1lBQ0VDLE1BQUEsRztRQUNSLE9BQUNBLE1BQUEsQ0FBT0MsTUFBUixDQUFlLFVBQUtDLENBQUwsRUFBT0MsS0FBUCxFQUFjO0FBQUEsbUIsYUFDM0I7QUFBQSxnQkFBVUQsQ0FBTixDQUFRQyxLQUFSLENBQUosRyxNQUFBLEdBQW1DRCxDQUFOLENBQVFDLEtBQVIsQ0FBTixHQUFxQixFQUE1QztBQUFBLGdCQUNBLE9BQU1ELENBQU4sQ0FBUUMsS0FBUixFQURBO0FBQUEsYSxDQUFBLEVBRDJCO0FBQUEsU0FBN0IsRUFHQUosTUFIQSxFO0tBSmU7QUFBQSxD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bUMsSUFBTCxFQUFXO0FBQUEsMkJBQVVBLElBQVQsQ0FBQ0MsT0FBRjtBQUFBLGlCQXJpQjRCO0FBQUEsZ0IsWUF1aUJ0QyxVQUFLQyxJQUFMLEVBQVc7QUFBQSwrQixJQUFBLENBQU9BLElBQVA7QUFBQSxpQkF2aUIyQjtBQUFBLGdCLFVBeWlCeEMsVUFBS1QsQ0FBTCxFQUFRO0FBQUEsMkJBQUlBLENBQUosRyxJQUFBLEcsS0FBQTtBQUFBLGlCQXppQmdDO0FBQUEsZ0IsWUEyaUJ0QyxVQUFLQSxDQUFMLEVBQVE7QUFBQSwyQkFBV0EsQ0FBVixDQUFDUixRQUFGO0FBQUEsaUJBM2lCOEI7QUFBQSxhQUY3QyxDQURBO0FBQUEsUyxDQUFBLEVBREYsQ0FKQTtBQUFBLEssS0FEYyxDLElBQUE7QUFBQSxDQURqQixDQVhBO0FBb2tCU2tCLE1BQUQsQ0FBUVAsTUFBUixDQUFKLEksV0FBSixHQUEwQ0EsTUFBTixHQUFhbEQsTUFBakQsRyxNQUFBLENBcGtCQTtBQXFrQkNDLE9BQUEsQ0FBUWUsUUFBVCxDQUFrQk4sR0FBbEIsRSxRQUFBLEUsU0FBQSxFQXJrQkE7QUFza0JNQSxHQUFBLENBQUlnRCxtQkFBVixHQUE4Qm5ELElBQTlCIiwic291cmNlc0NvbnRlbnQiOlsiKHNldCEgZ2xvYmFsLmZvcmVpZ24ge1xuXG4gIDpzYW5pdGl6ZSAoZm5cbiAgICBbcmVjb3JkICYgc3BhY2VzXVxuICAgICAgKHNwYWNlcy5yZWR1Y2UgKGZuIFtyIHNwYWNlXSAoZG9cbiAgICAgICAgKGlmIChhZ2V0IHIgc3BhY2UpIG5pbCAoc2V0ISAoYWdldCByIHNwYWNlKSB7fSkpXG4gICAgICAgIChhZ2V0IHIgc3BhY2UpKSlcbiAgICAgIHJlY29yZCkpXG5cbn0pXG5cbihkZWZuLSBtYWtlXG4gIFtsb2NhbFJ1bnRpbWVdIChsZXRcbiAgW1Rhc2sgICAoRWxtLk5hdGl2ZS5UYXNrLm1ha2UgICBsb2NhbFJ1bnRpbWUpXG4gICBVdGlscyAgKEVsbS5OYXRpdmUuVXRpbHMubWFrZSAgbG9jYWxSdW50aW1lKVxuICAgVHVwbGUwICg6VHVwbGUwIFV0aWxzKVxuICAgVHVwbGUyICg6VHVwbGUyIFV0aWxzKV1cbiAgIChkb1xuICAgICAoZm9yZWlnbi5zYW5pdGl6ZSBsb2NhbFJ1bnRpbWUgOk5hdGl2ZSA6Rm9yZWlnbilcbiAgICAgKGlmIGxvY2FsUnVudGltZS5OYXRpdmUuRm9yZWlnbi52YWx1ZXNcbiAgICAgICAgIGxvY2FsUnVudGltZS5OYXRpdmUuRm9yZWlnbi52YWx1ZXNcbiAgICAgICAgIChzZXQhIGxvY2FsUnVudGltZS5OYXRpdmUuRm9yZWlnbi52YWx1ZXMge1xuXG4gIDptZXRob2QwIChGMiAoZm4gW25hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSlcbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSlcblxuICA6bWV0aG9kMSAoRjMgKGZuIFtuYW1lIG9iamVjdCBhXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2QyIChGNCAoZm4gW25hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGRvXG4gICAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2QzIChGNSAoZm4gW25hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYylcbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSlcblxuICA6bWV0aG9kNCAoRjYgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2Q1IChGNyAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKGRvXG4gICAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlKVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKVxuXG4gIDptZXRob2Q2IChGOCAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoZG9cbiAgICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgZilcbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMwIChGMiAoZm4gW25hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMxIChGMyAoZm4gW25hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSAoZm4gW11cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpXG5cbiAgOm1ldGhvZEFzeW5jMiAoRjQgKGZuIFtuYW1lIG9iamVjdCBhIGJdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMzIChGNSAoZm4gW25hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM0IChGNiAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCAoZm4gW11cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpXG5cbiAgOm1ldGhvZEFzeW5jNSAoRjcgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGVdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM2IChGOCAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmIChmbiBbXVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMwRSAoRjMgKGZuIFttZXJyIG5hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIChmbiBbZXJyXVxuICAgICAgICAoY2FsbGJhY2tcbiAgICAgICAgICAoaWYgZXJyXG4gICAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICAgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpXG5cbiAgOm1ldGhvZEFzeW5jMUUgKEY0IChmbiBbbWVyciBuYW1lIG9iamVjdCBhXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMyRSAoRjUgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmMzRSAoRjYgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIChmbiBbZXJyXVxuICAgICAgICAoY2FsbGJhY2tcbiAgICAgICAgICAoaWYgZXJyXG4gICAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICAgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpXG5cbiAgOm1ldGhvZEFzeW5jNEUgKEY3IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgYyBkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM1RSAoRjggKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFtlcnJdXG4gICAgICAgIChjYWxsYmFja1xuICAgICAgICAgIChpZiBlcnJcbiAgICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgICAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSlcblxuICA6bWV0aG9kQXN5bmM2RSAoRjkgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmIChmbiBbZXJyXVxuICAgICAgICAoY2FsbGJhY2tcbiAgICAgICAgICAoaWYgZXJyXG4gICAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICAgKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjAgKEY0IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbXSAoLnBlcmZvcm0gVGFzayBoYW5kbGVyKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4xIChGNSAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbXSAoLnBlcmZvcm0gVGFzayBoYW5kbGVyKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuMiAoRjYgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbXSAoLnBlcmZvcm0gVGFzayBoYW5kbGVyKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4zIChGNyAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW10gKC5wZXJmb3JtIFRhc2sgaGFuZGxlcikpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW40IChGOCAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBkIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbXSAoLnBlcmZvcm0gVGFzayBoYW5kbGVyKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgYSBiIGMgZCBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuXG4gIDpsaXN0ZW4wXzEgKEY0IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuMV8xIChGNSAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjJfMSAoRjYgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuM18xIChGNyAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW3hdXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgeCkpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGIgYyBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuNF8xIChGOCAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBhIGIgYyBkIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGQgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjVfMSAoRjkgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGMgZCBlIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeF1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciB4KSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGQgZSBoYW5kbGVyXylcbiAgICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja19dXG4gICAgICAgICAgICAoZG9cbiAgICAgICAgICAgICAgKChhZ2V0IG9iamVjdCBvZmZuYW1lKSBhIGhhbmRsZXJfKVxuICAgICAgICAgICAgICAoY2FsbGJhY2tfICguc3VjY2VlZCBUYXNrIFR1cGxlMCkpKSkpKSkpKSkpKSlcblxuICA6bGlzdGVuMF8yIChGNCAoZm4gW29ubmFtZSBvZmZuYW1lIG9iamVjdCBoYW5kbGVyXVxuICAgIChsZXRcbiAgICAgIFtoYW5kbGVyXyAoZm4gW3ggeV1cbiAgICAgICAgICAoLnBlcmZvcm0gVGFzayAoaGFuZGxlciAoVHVwbGUyIHggeSkpKSldXG4gICAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgICAoZG9cbiAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9ubmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW4xXzIgKEY1IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4IHldXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgKFR1cGxlMiB4IHkpKSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjJfMiAoRjYgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeCB5XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIChUdXBsZTIgeCB5KSkpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGIgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjNfMiAoRjcgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGMgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4IHldXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgKFR1cGxlMiB4IHkpKSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGhhbmRsZXJfKVxuICAgICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrX11cbiAgICAgICAgICAgIChkb1xuICAgICAgICAgICAgICAoKGFnZXQgb2JqZWN0IG9mZm5hbWUpIGEgaGFuZGxlcl8pXG4gICAgICAgICAgICAgIChjYWxsYmFja18gKC5zdWNjZWVkIFRhc2sgVHVwbGUwKSkpKSkpKSkpKSkpKVxuXG4gIDpsaXN0ZW40XzIgKEY4IChmbiBbb25uYW1lIG9mZm5hbWUgb2JqZWN0IGEgYiBjIGQgaGFuZGxlcl1cbiAgICAobGV0XG4gICAgICBbaGFuZGxlcl8gKGZuIFt4IHldXG4gICAgICAgICAgKC5wZXJmb3JtIFRhc2sgKGhhbmRsZXIgKFR1cGxlMiB4IHkpKSkpXVxuICAgICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICAgKGRvXG4gICAgICAgICAgKChhZ2V0IG9iamVjdCBvbm5hbWUpIGEgYiBjIGQgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmxpc3RlbjVfMiAoRjkgKGZuIFtvbm5hbWUgb2ZmbmFtZSBvYmplY3QgYSBiIGMgZCBlIGhhbmRsZXJdXG4gICAgKGxldFxuICAgICAgW2hhbmRsZXJfIChmbiBbeCB5XVxuICAgICAgICAgICgucGVyZm9ybSBUYXNrIChoYW5kbGVyIChUdXBsZTIgeCB5KSkpKV1cbiAgICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAgIChkb1xuICAgICAgICAgICgoYWdldCBvYmplY3Qgb25uYW1lKSBhIGIgYyBkIGUgaGFuZGxlcl8pXG4gICAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tfXVxuICAgICAgICAgICAgKGRvXG4gICAgICAgICAgICAgICgoYWdldCBvYmplY3Qgb2ZmbmFtZSkgYSBoYW5kbGVyXylcbiAgICAgICAgICAgICAgKGNhbGxiYWNrXyAoLnN1Y2NlZWQgVGFzayBUdXBsZTApKSkpKSkpKSkpKSkpXG5cbiAgOmdldDAgKEYyIChmbiBbbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpKSkpKSkpKVxuXG4gIDpnZXQxIChGMyAoZm4gW25hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEpKSkpKSkpXG5cbiAgOmdldDIgKEY0IChmbiBbbmFtZSBvYmplY3QgYSBiXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIpKSkpKSkpXG5cbiAgOmdldDMgKEY1IChmbiBbbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjKSkpKSkpKVxuXG4gIDpnZXQ0IChGNiAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQpKSkpKSkpXG5cbiAgOmdldDUgKEY3IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUpKSkpKSkpXG5cbiAgOmdldDYgKEY4IChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmKSkpKSkpKVxuXG4gIDpnZXRBc3luYzAgKEYyIChmbiBbbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMSAoRjMgKGZuIFtuYW1lIG9iamVjdCBhXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMiAoRjQgKGZuIFtuYW1lIG9iamVjdCBhIGJdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIChmbiBbeF1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzMgKEY1IChmbiBbbmFtZSBvYmplY3QgYSBiIGNdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNCAoRjYgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNSAoRjcgKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGVdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIChmbiBbeF1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIHgpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzYgKEYyIChmbiBbbmFtZSBvYmplY3QgYSBiIGMgZCBlIGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIGYgKGZuIFt4XVxuICAgICAgICAoY2FsbGJhY2sgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMEUgKEYzIChmbiBbbWVyciBuYW1lIG9iamVjdF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSAoZm4gW2VyciB4XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzFFIChGNCAoZm4gW21lcnIgbmFtZSBvYmplY3QgYV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMkUgKEY1IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGJdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jM0UgKEY2IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgY11cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyAoZm4gW2VyciB4XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzRFIChGNyAoZm4gW21lcnIgbmFtZSBvYmplY3QgYSBiIGMgZF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNUUgKEY4IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgYyBkIGVdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCBlIChmbiBbZXJyIHhdXG4gICAgICAgIChjYWxsYmFjayAoaWYgZXJyXG4gICAgICAgICAgKC5mYWlsIFRhc2sgKG1lcnIgKC50b1N0cmluZyBlcnIpKSlcbiAgICAgICAgICAoLnN1Y2NlZWQgVGFzayB4KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNkUgKEY5IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgYyBkIGUgZl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgZiAoZm4gW2VyciB4XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgeCkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzBfMiAoRjIgKGZuIFtuYW1lIG9iamVjdF1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMV8yIChGMyAoZm4gW25hbWUgb2JqZWN0IGFdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMl8yIChGNCAoZm4gW25hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFt4IHldXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzNfMiAoRjUgKGZuIFtuYW1lIG9iamVjdCBhIGIgY11cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNF8yIChGNiAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGRdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgICgoYWdldCBvYmplY3QgbmFtZSkgYSBiIGMgZCAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNV8yIChGNyAoZm4gW25hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFt4IHldXG4gICAgICAgIChjYWxsYmFjayAoLnN1Y2NlZWQgVGFzayAoVHVwbGUyIHggeSkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzZfMiAoRjggKGZuIFtuYW1lIG9iamVjdCBhIGIgYyBkIGUgZl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgZiAoZm4gW3ggeV1cbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMF8yRSAoRjMgKGZuIFttZXJyIG5hbWUgb2JqZWN0XVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIChmbiBbZXJyIHggeV1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzFfMkUgKEY0IChmbiBbbWVyciBuYW1lIG9iamVjdCBhXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jMl8yRSAoRjUgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYl1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jM18yRSAoRjYgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIChmbiBbZXJyIHggeV1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpKVxuXG4gIDpnZXRBc3luYzRfMkUgKEY3IChmbiBbbWVyciBuYW1lIG9iamVjdCBhIGIgYyBkXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNV8yRSAoRjggKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZV1cbiAgICAoLmFzeW5jRnVuY3Rpb24gVGFzayAoZm4gW2NhbGxiYWNrXVxuICAgICAgKChhZ2V0IG9iamVjdCBuYW1lKSBhIGIgYyBkIGUgKGZuIFtlcnIgeCB5XVxuICAgICAgICAoY2FsbGJhY2sgKGlmIGVyclxuICAgICAgICAgICguZmFpbCBUYXNrIChtZXJyICgudG9TdHJpbmcgZXJyKSkpXG4gICAgICAgICAgKC5zdWNjZWVkIFRhc2sgKFR1cGxlMiB4IHkpKSkpKSkpKSkpXG5cbiAgOmdldEFzeW5jNl8yRSAoRjkgKGZuIFttZXJyIG5hbWUgb2JqZWN0IGEgYiBjIGQgZSBmXVxuICAgICguYXN5bmNGdW5jdGlvbiBUYXNrIChmbiBbY2FsbGJhY2tdXG4gICAgICAoKGFnZXQgb2JqZWN0IG5hbWUpIGEgYiBjIGQgZSBmIChmbiBbZXJyIHggeV1cbiAgICAgICAgKGNhbGxiYWNrIChpZiBlcnJcbiAgICAgICAgICAoLmZhaWwgVGFzayAobWVyciAoLnRvU3RyaW5nIGVycikpKVxuICAgICAgICAgICguc3VjY2VlZCBUYXNrIChUdXBsZTIgeCB5KSkpKSkpKSkpKVxuXG4gIDpnZXQgKEYyIChmbiBbbmFtZSBvYmplY3RdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChjYWxsYmFjayAoLnN1Y2Nlc3MgVGFzayAoYWdldCBvYmplY3QgbmFtZSkpKSkpKSlcblxuICA6bW9kaWZ5IChGMyAoZm4gW25hbWUgb2JqZWN0IGZdXG4gICAgKC5hc3luY0Z1bmN0aW9uIFRhc2sgKGZuIFtjYWxsYmFja11cbiAgICAgIChkb1xuICAgICAgICAoc2V0ISAoYWdldCBvYmplY3QgbmFtZSkgKGYgKGFnZXQgb2JqZWN0IG5hbWUpKSlcbiAgICAgICAgKGNhbGxiYWNrICguc3VjY2VzcyBUYXNrIFR1cGxlMCkpKSkpKSlcblxuICA6dW5zYWZlR2V0R2xvYmFsQ29uc3RhbnQgKGZuIFtuYW1lXSAoYWdldCB3aW5kb3cgbmFtZSkpXG5cbiAgOnVuc2FmZU51bGwgbnVsbFxuXG4gIDp1bnNhZmVSZXF1aXJlIChmbiBbbW9kdWxlXSAocmVxdWlyZSBtb2R1bGUpKVxuXG4gIDp1bnNhZmVHZXQwIChGMiAoZm4gW25hbWUgeF0gKGFnZXQgeCBuYW1lKSkpXG5cbiAgOmdldFRpbWUgKGZuIFtkYXRlXSAoLmdldFRpbWUgZGF0ZSkpXG5cbiAgOmZyb21UaW1lIChmbiBbdGltZV0gKERhdGUuIHRpbWUpKVxuXG4gIDp0cnV0aHkgKGZuIFt4XSAoaWYgeCB0cnVlIGZhbHNlKSlcblxuICA6dG9TdHJpbmcgKGZuIFt4XSAoLnRvU3RyaW5nIHgpKVxuXG4gIH0pKSkpKVxuXG4oaWYgKD09ICh0eXBlb2Ygd2luZG93KSA6dW5kZWZpbmVkKSAoc2V0ISB3aW5kb3cgZ2xvYmFsKSlcbihmb3JlaWduLnNhbml0aXplIEVsbSA6TmF0aXZlIDpGb3JlaWduKVxuKHNldCEgRWxtLk5hdGl2ZS5Gb3JlaWduLm1ha2UgbWFrZSlcbiJdfQ==
