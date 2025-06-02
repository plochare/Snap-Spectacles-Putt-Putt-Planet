export class Timeout {
    constructor(private readonly script: ScriptComponent) {}

    async waitFor(time: number): Promise<void> {
        return new Promise((resolve) => {
            const delayEv: DelayedCallbackEvent = this.script.createEvent("DelayedCallbackEvent");
            delayEv.bind(() => {
                resolve();
                this.script.removeEvent(delayEv);
            });
            delayEv.reset(time);
        });
    }
}
