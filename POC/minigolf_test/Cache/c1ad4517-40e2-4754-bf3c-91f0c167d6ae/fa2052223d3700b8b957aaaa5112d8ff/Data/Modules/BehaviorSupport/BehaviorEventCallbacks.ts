@typedef
export class CustomFunctions {
    @input
    script: ScriptComponent;

    @input
    function: string;
}

export enum CallbackType {
    None,
    Behavior,
    BehaviorCustom,
    CustomFunction
}

declare namespace global {
    let behaviorSystem: BehaviorSystem
}

export class BehaviorEventCallbacks {

    static invokeCallbackFromInputs(script: BaseScriptComponent, eventName: string): (data: any) => void {
        const callbackType: CallbackType = script["callbackType"];
        if (isNull(callbackType)) {
            print("Warning: Wrong Callback Type input.");
        }
        switch (callbackType) {
            case CallbackType.Behavior:
                return () => {
                    const behaviors: ScriptComponent[] = script[eventName + "Behaviors"];
                    if (!behaviors) {
                        print("Warning: No event with name: " + eventName);
                        return;
                    }
                    for (const behavior of behaviors) {
                        behavior?.api?.trigger?.();
                    }
                }
            case CallbackType.BehaviorCustom:
                return () => {
                    if (!global.behaviorSystem) {
                        print("The global behavior system has not been instantiated yet! Make sure a Behavior script is present somewhere!");
                        return;
                    }
                    const triggerNames: string[] = script[eventName + "CustomTriggers"];
                    for (const triggerName of triggerNames) {
                        if (triggerName.length == 0) {
                            print("You are trying to send an empty string custom trigger!");
                            continue;
                        }
                        global.behaviorSystem.sendCustomTrigger(triggerName);
                    }
                }
            case CallbackType.CustomFunction:
                return (eventData: any) => {
                    const listeners: CustomFunctions[] = script[eventName + "Functions"];
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
                        } else {
                            listener.script[listener.function](eventData);
                        }
                    }
                }
        }
    }
}
