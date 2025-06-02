"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var SoundController_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.SoundController = exports.SoundEvent = void 0;
var __selfType = requireType("./SoundController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
class SoundEvent {
}
exports.SoundEvent = SoundEvent;
let SoundController = SoundController_1 = class SoundController extends BaseScriptComponent {
    static getInstance() {
        if (!SoundController_1.instance) {
            throw new Error("Trying to get SoundController instance, but it hasn't been set. You need to call it later.");
        }
        return SoundController_1.instance;
    }
    onAwake() {
        if (!SoundController_1.instance) {
            SoundController_1.instance = this;
        }
        else {
            throw new Error("SoundController already has an instance but another one is initializing. Aborting.");
        }
    }
    stopAllSounds() {
        this.auds.forEach(a => {
            if (a.audioTrack && !isNull(a.audioTrack) && a.isPlaying()) {
                a.stop(false);
            }
        });
    }
    playSound(myKey) {
        for (let i = 0; i < this.soundEvents.length; i++) {
            if (this.soundEvents[i].key === myKey) {
                let myAud = this.getAud();
                if (myAud) {
                    let evt = this.soundEvents[i];
                    myAud.volume = evt.vol;
                    myAud.audioTrack = evt.clip;
                    myAud.position = 0;
                    let loopNum = evt.loop ? -1 : 1;
                    myAud.play(loopNum);
                }
            }
        }
    }
    getAud() {
        // todo: pool prefabs in available and not avaliable arrays, spawn new if none available 
        for (let i = 0; i < this.auds.length; i++) {
            if (!this.auds[i].isPlaying()) {
                return this.auds[i];
            }
        }
        return undefined;
    }
    __initialize() {
        super.__initialize();
    }
};
exports.SoundController = SoundController;
exports.SoundController = SoundController = SoundController_1 = __decorate([
    component
], SoundController);
//# sourceMappingURL=SoundController.js.map