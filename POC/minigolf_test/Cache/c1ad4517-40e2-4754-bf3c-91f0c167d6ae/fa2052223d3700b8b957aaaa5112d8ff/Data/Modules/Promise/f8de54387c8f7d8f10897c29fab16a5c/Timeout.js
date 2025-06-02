"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Timeout = void 0;
class Timeout {
    constructor(script) {
        this.script = script;
    }
    async waitFor(time) {
        return new Promise((resolve) => {
            const delayEv = this.script.createEvent("DelayedCallbackEvent");
            delayEv.bind(() => {
                resolve();
                this.script.removeEvent(delayEv);
            });
            delayEv.reset(time);
        });
    }
}
exports.Timeout = Timeout;
