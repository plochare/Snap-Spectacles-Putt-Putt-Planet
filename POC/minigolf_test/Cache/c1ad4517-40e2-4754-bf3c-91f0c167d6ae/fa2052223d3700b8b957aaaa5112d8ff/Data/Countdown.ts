/**
 * Countdown
 * Version 0.0.7
 *
 * The Custom Component creates a Countdown. The script allows you to customize the initial counter value, counter time,
 * min/max size, text color and font, and sound.
 *
 * API:
 *
 * start(): void - starts countdown.
 * (read-only) isStarted: boolean - whether the countdown has been started.
 * (read-only) isFinished: boolean - whether the countdown has been finished.
 * startValue: number - initial countdown value.
 * counterTime - duration of one countdown's counter.
 * startTextSize: number - text size at the beginning of the animation.
 * endTextSize: number - text size at the end of animation.
 * textColor: vec4 - text's color.
 * sound: AudioTrackAsset - text's sound that will be playing when counter changes.
 * font: Font - text's font
 */
import {Event} from "./Modules/Event/Event";
import {DestructionHelper} from "./Modules/Scene/DestructionHelper";
import {Timeout} from "./Modules/Promise/Timeout";
import {BehaviorEventCallbacks, CallbackType, CustomFunctions} from "./Modules/BehaviorSupport/BehaviorEventCallbacks";

@component
export class Countdown extends BaseScriptComponent {

    @input()
    @label("Auto Start")
    autostart: boolean;

    @ui.separator

    @input
    private eventCallbacks: boolean;

    @ui.group_start("Event Callbacks")
    @showIf("eventCallbacks")

    @input("int", "0")
    @widget(new ComboBoxWidget()
        .addItem("None", 0)
        .addItem("Behavior Script", 1)
        .addItem("Behavior Custom", 2)
        .addItem("Custom Function", 3))
    private callbackType: CallbackType;

    @input
    @showIf("callbackType", 1)
    private onCountdownStartBehaviors: ScriptComponent[];

    @input
    @showIf("callbackType", 1)
    private onCountdownFinishBehaviors: ScriptComponent[];

    @input
    @showIf("callbackType", 2)
    private onCountdownStartCustomTriggers: string[];

    @input
    @showIf("callbackType", 2)
    private onCountdownFinishCustomTriggers: string[];

    @input
    @showIf("callbackType", 3)
    @allowUndefined
    private onCountdownStartFunctions: CustomFunctions[];

    @input
    @showIf("callbackType", 3)
    @allowUndefined
    private onCountdownFinishFunctions: CustomFunctions[];

    @ui.group_end

    onCountdownStart: Event = new Event();
    onCountdownFinish: Event = new Event();

    startValue: number = 3;
    startTextSize: number = 250;
    endTextSize: number = 150;
    startOpacity: number = 0.65;
    endOpacity: number = 0.1;
    textColor: vec4 = new vec4(0.976, 0.972, 0.968, 0); /* #f9f8f7 */
    sound: AudioTrackAsset = null;
    font: Font = null;
    counterTime: number = 0.6;

    private _isStarted: boolean = false;
    private _isFinished: boolean = false;

    private helper: DestructionHelper = new DestructionHelper();
    private timeout: Timeout = new Timeout(this);

    private countdownTextC: Text;
    private countdownRegionC: ScreenRegionComponent;
    private countdownST: ScreenTransform;
    private countdownAudioC: AudioComponent;
    private counterPass: TextFill;
    private countdownUpdateEv: UpdateEvent = null;
    private counterIterator: number = this.startValue;
    private startTime: number;

    private counterUpdateListeners: Function[] = [];

    onAwake() {
        this.createComponents();
        this.initializeUpdateEv();
        this.initializeDestroyEv();
        this.initializeEventCallbacks();
        if (this.autostart) {
            this.callAutoStartWithDelay();
        }
    }

    get isStarted() {
        return this._isStarted;
    }

    get isFinished() {
        return this._isFinished;
    }

    /*
     * Starts the Countdown.
     */
    start(): void {
        if (this._isStarted && !this._isFinished) return;
        this._isStarted = true;
        this._isFinished = false;
        this.onCountdownStart.trigger();
        this.counterIterator = this.startValue;
        this.startTime = getTime();
        this.initializeTextC();
        this.countdownUpdateEv.enabled = true;
        if (this.sound) {
            this.initializeAudioC();
        }
    }

    /**
     * Creates components for Countdown: ScreenRegion, ScreenTransform and Text.
     * @private
     */
    private createComponents(): void {
        const so = this.getSceneObject();
        this.countdownRegionC = this.helper.getOrAddComponent(so, "ScreenRegionComponent");
        this.countdownRegionC.region = ScreenRegionType.FullFrame;
        this.countdownST = this.helper.getOrAddComponent(so, "ScreenTransform");
        this.countdownTextC = this.helper.getOrAddComponent(so, "Component.Text");
    }

    /**
     * Starts the Countdown with a slight delay (to avoid flickering on the lens start).
     * @private
     */
    private async callAutoStartWithDelay(): Promise<void> {
        await this.timeout.waitFor(0.05);
        if (this.autostart) {
            this.start();
        }
    }

    /**
     * Destroys Audio and Text Components on a destroying event.
     * @private
     */
    private initializeDestroyEv(): void {
        this.createEvent("OnDestroyEvent").bind(() => {
            for (const obj of this.helper.destroyObjects) {
                if (!isNull(obj)) {
                    obj.destroy();
                }
            }
        });
    }

    /**
     * Adds listeners to `onCountdownStart` and `onCountdownFinish` events.
     * @private
     */
    private initializeEventCallbacks(): void {
        if (this.eventCallbacks && this.callbackType !== CallbackType.None) {
            this.onCountdownStart.add(BehaviorEventCallbacks.invokeCallbackFromInputs(this, "onCountdownStart"));
            this.onCountdownFinish.add(BehaviorEventCallbacks.invokeCallbackFromInputs(this, "onCountdownFinish"));
        }
    }

    /**
     * Configures the Text Component.
     * @private
     */
    private initializeTextC(): void {
        this.countdownTextC.text = this.startValue.toString();
        this.countdownTextC.size = this.startTextSize;
        this.counterPass = this.countdownTextC.textFill;
        this.counterPass.color = this.textColor;
        if (this.font) {
            this.countdownTextC.font = this.font;
        }
    }

    /**
     * Creates an update event for the Countdown.
     * @private
     */
    private initializeUpdateEv(): void {
        this.countdownUpdateEv = this.createEvent("UpdateEvent");
        this.countdownUpdateEv.enabled = false;
        this.countdownUpdateEv.bind(() => this.countdownUpdate());
    }

    /**
     * Creates and configures an Audio Component.
     * @private
     */
    private initializeAudioC(): void {
        const countdownAudioSO: SceneObject = this.helper.createSceneObject(null, "CountdownAudio");
        this.countdownAudioC = this.helper.getOrAddComponent(countdownAudioSO, "AudioComponent");
        this.countdownAudioC.audioTrack = this.sound;
        this.countdownAudioC.play(1);
        this.counterUpdateListeners.push(() => this.countdownAudioC.play(1));
    }

    /**
     * Updates the Countdown's value.
     * @private
     */
    private countdownUpdate(): void {
        const animationTime = getTime() - this.startTime;
        if (animationTime < this.counterTime) {
            this.setCountdownAlpha(this.fitTo(0.0, this.counterTime, this.startOpacity, this.endOpacity, animationTime));
            this.setCountdownSize(animationTime / this.counterTime);
        } else {
            this.updateCounter();
        }
    }

    /**
     * Decrements the Countdown's counter.
     * @private
     */
    private updateCounter(): void {
        if (--this.counterIterator >= 1) {
            this.counterUpdateListeners.forEach((cb) => cb());
            this.countdownTextC.text = this.counterIterator.toString();
            this.startTime = getTime();
        } else {
            this.finishCountdown();
        }
    }

    /**
     * Sets the Countdown's alpha.
     * @param value - new alpha value.
     * @private
     */
    private setCountdownAlpha(value: number): void {
        this.textColor.w = value;
        this.counterPass.color = this.textColor;
    }

    /**
     * Sets the Countdown's size.
     * @param value - new size value.
     * @private
     */
    private setCountdownSize(value: number): void {
        this.countdownTextC.size = this.startTextSize + (this.endTextSize - this.startTextSize) * value;
    }

    /**
     * Handles Countdown's finish.
     * @private
     */
    private finishCountdown(): void {
        this.onCountdownFinish.trigger();
        this.setCountdownAlpha(0.0);
        this._isFinished = true;
        this.countdownUpdateEv.enabled = false;
    }

    private fitTo (valueMin: number, valueMax: number, effectMin: number, effectMax: number,
                   currentValue :number ): number {
        return (currentValue - valueMin) * (effectMax - effectMin) / (valueMax - valueMin) + effectMin;
    }
}
