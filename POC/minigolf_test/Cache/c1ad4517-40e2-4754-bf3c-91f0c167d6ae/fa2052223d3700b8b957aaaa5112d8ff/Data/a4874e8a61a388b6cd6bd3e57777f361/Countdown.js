"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Countdown = void 0;
var __selfType = requireType("./Countdown");
function component(target) { target.getTypeName = function () { return __selfType; }; }
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
const Event_1 = require("./Modules/Event/Event");
const DestructionHelper_1 = require("./Modules/Scene/DestructionHelper");
const Timeout_1 = require("./Modules/Promise/Timeout");
const BehaviorEventCallbacks_1 = require("./Modules/BehaviorSupport/BehaviorEventCallbacks");
let Countdown = class Countdown extends BaseScriptComponent {
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
    start() {
        if (this._isStarted && !this._isFinished)
            return;
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
    createComponents() {
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
    async callAutoStartWithDelay() {
        await this.timeout.waitFor(0.05);
        if (this.autostart) {
            this.start();
        }
    }
    /**
     * Destroys Audio and Text Components on a destroying event.
     * @private
     */
    initializeDestroyEv() {
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
    initializeEventCallbacks() {
        if (this.eventCallbacks && this.callbackType !== BehaviorEventCallbacks_1.CallbackType.None) {
            this.onCountdownStart.add(BehaviorEventCallbacks_1.BehaviorEventCallbacks.invokeCallbackFromInputs(this, "onCountdownStart"));
            this.onCountdownFinish.add(BehaviorEventCallbacks_1.BehaviorEventCallbacks.invokeCallbackFromInputs(this, "onCountdownFinish"));
        }
    }
    /**
     * Configures the Text Component.
     * @private
     */
    initializeTextC() {
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
    initializeUpdateEv() {
        this.countdownUpdateEv = this.createEvent("UpdateEvent");
        this.countdownUpdateEv.enabled = false;
        this.countdownUpdateEv.bind(() => this.countdownUpdate());
    }
    /**
     * Creates and configures an Audio Component.
     * @private
     */
    initializeAudioC() {
        const countdownAudioSO = this.helper.createSceneObject(null, "CountdownAudio");
        this.countdownAudioC = this.helper.getOrAddComponent(countdownAudioSO, "AudioComponent");
        this.countdownAudioC.audioTrack = this.sound;
        this.countdownAudioC.play(1);
        this.counterUpdateListeners.push(() => this.countdownAudioC.play(1));
    }
    /**
     * Updates the Countdown's value.
     * @private
     */
    countdownUpdate() {
        const animationTime = getTime() - this.startTime;
        if (animationTime < this.counterTime) {
            this.setCountdownAlpha(this.fitTo(0.0, this.counterTime, this.startOpacity, this.endOpacity, animationTime));
            this.setCountdownSize(animationTime / this.counterTime);
        }
        else {
            this.updateCounter();
        }
    }
    /**
     * Decrements the Countdown's counter.
     * @private
     */
    updateCounter() {
        if (--this.counterIterator >= 1) {
            this.counterUpdateListeners.forEach((cb) => cb());
            this.countdownTextC.text = this.counterIterator.toString();
            this.startTime = getTime();
        }
        else {
            this.finishCountdown();
        }
    }
    /**
     * Sets the Countdown's alpha.
     * @param value - new alpha value.
     * @private
     */
    setCountdownAlpha(value) {
        this.textColor.w = value;
        this.counterPass.color = this.textColor;
    }
    /**
     * Sets the Countdown's size.
     * @param value - new size value.
     * @private
     */
    setCountdownSize(value) {
        this.countdownTextC.size = this.startTextSize + (this.endTextSize - this.startTextSize) * value;
    }
    /**
     * Handles Countdown's finish.
     * @private
     */
    finishCountdown() {
        this.onCountdownFinish.trigger();
        this.setCountdownAlpha(0.0);
        this._isFinished = true;
        this.countdownUpdateEv.enabled = false;
    }
    fitTo(valueMin, valueMax, effectMin, effectMax, currentValue) {
        return (currentValue - valueMin) * (effectMax - effectMin) / (valueMax - valueMin) + effectMin;
    }
    __initialize() {
        super.__initialize();
        this.onCountdownStart = new Event_1.Event();
        this.onCountdownFinish = new Event_1.Event();
        this.startValue = 3;
        this.startTextSize = 250;
        this.endTextSize = 150;
        this.startOpacity = 0.65;
        this.endOpacity = 0.1;
        this.textColor = new vec4(0.976, 0.972, 0.968, 0);
        this.sound = null;
        this.font = null;
        this.counterTime = 0.6;
        this._isStarted = false;
        this._isFinished = false;
        this.helper = new DestructionHelper_1.DestructionHelper();
        this.timeout = new Timeout_1.Timeout(this);
        this.countdownUpdateEv = null;
        this.counterIterator = this.startValue;
        this.counterUpdateListeners = [];
    }
};
Countdown = __decorate([
    component
], Countdown);
exports.Countdown = Countdown;
