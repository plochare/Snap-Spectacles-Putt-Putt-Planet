"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PlayerPaceCalculator = void 0;
var __selfType = requireType("./PlayerPaceCalculator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let PlayerPaceCalculator = class PlayerPaceCalculator extends BaseScriptComponent {
    start(pos) {
        this.t = 0;
        this.cps = 0;
        this.testIncrement = .5;
        this.oPos = pos;
    }
    getPace(pos) {
        let dt = getDeltaTime();
        this.t += dt;
        let dist = 0;
        if (this.t > this.testIncrement) {
            // Cm moved since last sample
            dist = pos.distance(this.oPos);
            this.oPos = pos;
            // Pace in cm per sec (cps)
            this.cps = dist / this.t;
            this.t = 0;
        }
        return { nPos: pos, pace: this.cps, dist, dt };
    }
};
exports.PlayerPaceCalculator = PlayerPaceCalculator;
exports.PlayerPaceCalculator = PlayerPaceCalculator = __decorate([
    component
], PlayerPaceCalculator);
//# sourceMappingURL=PlayerPaceCalculator.js.map