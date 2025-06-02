"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PathmakingPlayerFeedback = void 0;
var __selfType = requireType("./PathmakingPlayerFeedback");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LinearAlgebra_1 = require("./Helpers/LinearAlgebra");
const LensInitializer_1 = require("./LensInitializer");
let PathmakingPlayerFeedback = class PathmakingPlayerFeedback extends BaseScriptComponent {
    onAwake() {
        this.tr = this.getSceneObject().getTransform();
        this.jointsSo.forEach(so => {
            let joint = so.getTransform();
            this.joints.push(joint);
            so.enabled = false;
        });
    }
    start(positions) {
        this.update(positions);
        this.visualSo.enabled = true;
    }
    stop() {
        this.visualSo.enabled = false;
    }
    update(positions) {
        let pos = LensInitializer_1.LensInitializer.getInstance().getPlayerGroundPos();
        this.tr.setWorldPosition(pos);
        // update arrow positions
        let rotations = LinearAlgebra_1.LinearAlgebra.computeCurveRotations(positions);
        let lastRot = quat.quatIdentity();
        // Set poses
        for (let i = 0; i < this.joints.length; i++) {
            if (i < positions.length) {
                this.jointsSo[i].enabled = true;
                let targetPos = positions[i];
                this.joints[i].setWorldPosition(targetPos);
                // We need to flip this rotation for the way the art was made 
                lastRot = LinearAlgebra_1.LinearAlgebra.flippedRot(rotations[i], this.vec3up);
                this.joints[i].setWorldRotation(lastRot);
            }
            else {
                this.joints[i].setWorldPosition(pos);
                this.joints[i].setWorldRotation(lastRot);
                // this.jointsSo[i].enabled = false;
            }
        }
    }
    __initialize() {
        super.__initialize();
        this.joints = [];
        this.vec3up = vec3.up();
    }
};
exports.PathmakingPlayerFeedback = PathmakingPlayerFeedback;
exports.PathmakingPlayerFeedback = PathmakingPlayerFeedback = __decorate([
    component
], PathmakingPlayerFeedback);
//# sourceMappingURL=PathmakingPlayerFeedback.js.map