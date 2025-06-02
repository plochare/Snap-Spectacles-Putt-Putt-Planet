"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProgressBarController = void 0;
var __selfType = requireType("./ProgressBarController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let ProgressBarController = class ProgressBarController extends BaseScriptComponent {
    onAwake() {
        this.pointerScreenTransform = this.pointer.getComponent("Component.ScreenTransform");
        if (!this.pointerScreenTransform) {
            throw new Error("Pointer is required to have screen transform");
        }
        this.startPos = this.startPosScreenTransform.anchors.getCenter();
        this.endPos = this.endPosScreenTransform.anchors.getCenter();
        this.setProgress(this.initialProgress);
    }
    setProgress(newProgress) {
        let newPointerPosition = MathUtils.remap(newProgress, 0, 1, this.startPos.x, this.endPos.x);
        this.pointerScreenTransform.anchors.setCenter(new vec2(newPointerPosition, this.startPos.y));
        this.BarMat.mainPass.currentPosition = newProgress;
        let item = this.textComponent;
        item.text = Math.floor(newProgress * 100) + '%';
    }
};
exports.ProgressBarController = ProgressBarController;
exports.ProgressBarController = ProgressBarController = __decorate([
    component
], ProgressBarController);
//# sourceMappingURL=ProgressBarController.js.map