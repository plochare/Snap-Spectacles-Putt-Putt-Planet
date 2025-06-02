"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Timer = void 0;
var __selfType = requireType("./Timer");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Conversions_1 = require("./Conversions");
let Timer = class Timer extends BaseScriptComponent {
    onAwake() {
        this.timerText.enabled = false;
        this.createEvent("UpdateEvent").bind(() => this.onUpdate());
    }
    onUpdate() {
        if (this.runTimer) {
            this.time += getDeltaTime();
            this.updateText(this.time, this.timerText);
        }
    }
    stop() {
        this.time = 0;
        this.updateText(this.time, this.timerText);
        this.updateText(this.time, this.lastLapTimeText);
        this.runTimer = false;
    }
    start() {
        this.time = 0;
        this.updateText(this.time, this.timerText);
        this.timerText.enabled = true;
        this.runTimer = true;
    }
    pause() {
        this.runTimer = false;
    }
    incrementLap() {
        this.lastLapHUD.enabled = true;
        this.updateText(this.time, this.lastLapTimeText);
    }
    updateText(seconds, text) {
        let minSec = Conversions_1.Conversions.secToMin(seconds);
        let secStr = minSec.sec < 10 ? "0" + minSec.sec.toFixed(0) : minSec.sec.toFixed(0);
        let str = minSec.min + ":" + secStr;
        text.text = str;
    }
    __initialize() {
        super.__initialize();
        this.time = 0;
        this.runTimer = false;
    }
};
exports.Timer = Timer;
exports.Timer = Timer = __decorate([
    component
], Timer);
//# sourceMappingURL=Timer.js.map