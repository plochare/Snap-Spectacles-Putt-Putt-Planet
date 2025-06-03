"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WarningController = void 0;
var __selfType = requireType("./WarningController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let WarningController = class WarningController extends BaseScriptComponent {
    onAwake() {
        this.mainCameraLayers = this.mainCamera.renderLayer;
        this.mainCameraCaptureLayers = this.mainCameraCapture.renderLayer;
        this.warningLayer = this.warningVisual.layer;
        // test
        // this.toggleWaring(true);
        // this.createEvent("TouchStartEvent").bind(()=>{
        //     this.toggleWaring(false);
        // })
    }
    toggleWaring(on) {
        this.mainCamera.renderLayer = on ? this.warningLayer : this.mainCameraLayers;
        this.mainCameraCapture.renderLayer = on ? this.warningLayer : this.mainCameraCaptureLayers;
        this.toggleOrtho(!on);
    }
    toggleOrtho(on) {
        this.orthoCamera.enabled = on;
        this.orthoCameraCapture.enabled = on;
    }
};
exports.WarningController = WarningController;
exports.WarningController = WarningController = __decorate([
    component
], WarningController);
//# sourceMappingURL=WarningController.js.map