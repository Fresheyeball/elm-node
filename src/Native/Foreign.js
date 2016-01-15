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
        var Listø1 = Elm.Native.List.make(localRuntime);
        var Dictø1 = Elm.Dict.make(localRuntime);
        var Tuple0ø1 = (Utilsø1 || 0)['Tuple0'];
        var Tuple2ø1 = (Utilsø1 || 0)['Tuple2'];
        var Tuple3ø1 = (Utilsø1 || 0)['Tuple3'];
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
                'method0E': F3(function (merr, name, object) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name]();
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method1E': F4(function (merr, name, object, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method2E': F5(function (merr, name, object, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a, b);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method3E': F6(function (merr, name, object, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a, b, c);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method4E': F7(function (merr, name, object, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a, b, c, d);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method5E': F8(function (merr, name, object, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a, b, c, d, e);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
                        })();
                    });
                }),
                'method6E': F9(function (merr, name, object, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            try {
                                return (function () {
                                    object[name](a, b, c, d, e, f);
                                    return callback(Taskø1.succeed(Tuple0ø1));
                                })();
                            } catch (error) {
                                return callback(Taskø1.fail(merr(error.toString())));
                            }
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
                'listen1_3': F5(function (onname, offname, object, a, handler) {
                    return function () {
                        var handler_ø1 = function (x, y, z) {
                            return Taskø1.perform(handler(Tuple3ø1(x, y, z)));
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
                'modify': F3(function (name, object, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return (function () {
                            object[name] = f(object[name]);
                            return callback(Taskø1.succeed(Tuple0ø1));
                        })();
                    });
                }),
                'read': F2(function (name, x) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(x[name]));
                    });
                }),
                'unsafeRead': F2(function (name, x) {
                    return x[name];
                }),
                'newOn0': F2(function (name, x) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name]()));
                    });
                }),
                'newOn1': F3(function (name, x, a) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a)));
                    });
                }),
                'newOn2': F4(function (name, x, a, b) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a, b)));
                    });
                }),
                'newOn3': F5(function (name, x, a, b, c) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a, b, c)));
                    });
                }),
                'newOn4': F6(function (name, x, a, b, c, d) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a, b, c, d)));
                    });
                }),
                'newOn5': F7(function (name, x, a, b, c, d, e) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a, b, c, d, e)));
                    });
                }),
                'newOn6': F8(function (name, x, a, b, c, d, e, f) {
                    return Taskø1.asyncFunction(function (callback) {
                        return callback(Taskø1.succeed(new x[name](a, b, c, d, e, f)));
                    });
                }),
                'unsafeGetGlobalConstant': function (name) {
                    return global[name];
                },
                'unsafeNull': null,
                'unsafeUndefined': undefined,
                'portPrimeToPort': function (x) {
                    return (function () {
                        return x.port$ = x.port();
                    })();
                },
                'unsafeToDict': function (obj) {
                    return function () {
                        var keysø1 = Object.keys(obj);
                        var keyPairø1 = keysø1.map(function (key) {
                            return Tuple2ø1(key, obj[key]);
                        });
                        return Dictø1.fromList(Listø1.fromArray(keyPairø1));
                    }.call(this);
                },
                'fromArray': Listø1.fromArray,
                'unsafeRequire': function (module) {
                    return require(module);
                },
                'truthy': function (x) {
                    return x ? true : false;
                },
                'toString': function (x) {
                    return x.toString();
                },
                'log': function (x) {
                    return (function () {
                        console.log(x);
                        return x;
                    })();
                },
                'rawInfinity': Infinity
            };
        })();
    }.call(this);
};
typeof(window) == 'undefined' ? window = global : void 0;
foreign.sanitize(Elm, 'Native', 'Foreign');
Elm.Native.Foreign.make = make;