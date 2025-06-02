"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BehaviorEventCallbacks = exports.CallbackType = exports.CustomFunctions = void 0;
class CustomFunctions {
}
exports.CustomFunctions = CustomFunctions;
var CallbackType;
(function (CallbackType) {
    CallbackType[CallbackType["None"] = 0] = "None";
    CallbackType[CallbackType["Behavior"] = 1] = "Behavior";
    CallbackType[CallbackType["BehaviorCustom"] = 2] = "BehaviorCustom";
    CallbackType[CallbackType["CustomFunction"] = 3] = "CustomFunction";
})(CallbackType = exports.CallbackType || (exports.CallbackType = {}));
class BehaviorEventCallbacks {
    static invokeCallbackFromInputs(script, eventName) {
        const callbackType = script["callbackType"];
        if (isNull(callbackType)) {
            print("Warning: Wrong Callback Type input.");
        }
        switch (callbackType) {
            case CallbackType.Behavior:
                return () => {
                    var _a, _b;
                    const behaviors = script[eventName + "Behaviors"];
                    if (!behaviors) {
                        print("Warning: No event with name: " + eventName);
                        return;
                    }
                    for (const behavior of behaviors) {
                        (_b = (_a = behavior === null || behavior === void 0 ? void 0 : behavior.api) === null || _a === void 0 ? void 0 : _a.trigger) === null || _b === void 0 ? void 0 : _b.call(_a);
                    }
                };
            case CallbackType.BehaviorCustom:
                return () => {
                    if (!global.behaviorSystem) {
                        print("The global behavior system has not been instantiated yet! Make sure a Behavior script is present somewhere!");
                        return;
                    }
                    const triggerNames = script[eventName + "CustomTriggers"];
                    for (const triggerName of triggerNames) {
                        if (triggerName.length == 0) {
                            print("You are trying to send an empty string custom trigger!");
                            continue;
                        }
                        global.behaviorSystem.sendCustomTrigger(triggerName);
                    }
                };
            case CallbackType.CustomFunction:
                return (eventData) => {
                    const listeners = script[eventName + "Functions"];
                    if (!listeners) {
                        print("Does not have a Script Components with custom functions assigned, but you are trying to invoke custom callbacks!");
                        return;
                    }
                    for (const listener of listeners) {
                        if (listener.function.length == 0) {
                            print("You are trying to invoke an empty string function!");
                            continue;
                        }
                        if (!listener.script.api[listener.function] && !listener.script[listener.function]) {
                            print("Cannot find the " + listener.function + " function in the assigned " + listener.script.name + " script.");
                            continue;
                        }
                        if (listener.script.api[listener.function]) {
                            listener.script.api[listener.function](eventData);
                        }
                        else {
                            listener.script[listener.function](eventData);
                        }
                    }
                };
        }
    }
}
exports.BehaviorEventCallbacks = BehaviorEventCallbacks;
