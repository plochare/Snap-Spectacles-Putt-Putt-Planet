"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CustomPinchButton = void 0;
var __selfType = requireType("./CustomPinchButton");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const mathUtils_1 = require("../SpectaclesInteractionKit/Utils/mathUtils");
let CustomPinchButton = class CustomPinchButton extends BaseScriptComponent {
    onAwake() {
        this.mat = this.rmv.mainMaterial;
        this.interactable.onHoverEnter.add(() => this.onHoverEnter());
        this.interactable.onHoverExit.add(() => this.onHoverExit());
        this.interactable.onTriggerStart.add(() => this.onTriggerEnter());
        this.interactable.onTriggerEnd.add(() => this.onTriggerExit());
        this.createEvent("UpdateEvent").bind(() => this.onUpdate());
    }
    onUpdate() {
        // Lerp to target
        let val = this.mat.mainPass.hover;
        val = (0, mathUtils_1.lerp)(val, this.targetVal, 3 * getDeltaTime());
        this.mat.mainPass.hover = val;
    }
    onHoverEnter() {
        this.targetVal = .7;
    }
    onHoverExit() {
        this.targetVal = 0;
    }
    onTriggerEnter() {
        this.targetVal = 1;
    }
    onTriggerExit() {
        this.targetVal = 0;
    }
    __initialize() {
        super.__initialize();
        this.targetVal = 0;
        this.mat = null;
    }
};
exports.CustomPinchButton = CustomPinchButton;
exports.CustomPinchButton = CustomPinchButton = __decorate([
    component
], CustomPinchButton);
//# sourceMappingURL=CustomPinchButton.js.map