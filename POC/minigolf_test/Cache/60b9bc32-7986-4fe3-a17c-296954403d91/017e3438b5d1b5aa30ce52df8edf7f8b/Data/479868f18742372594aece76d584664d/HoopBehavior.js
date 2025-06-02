"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.HoopBehavior = void 0;
var __selfType = requireType("./HoopBehavior");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * @component
 * @class HoopBehavior
 * Component keeps track of net score collisions
 *
 */
let HoopBehavior = class HoopBehavior extends BaseScriptComponent {
    onAwake() {
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent");
        this.physicsBody.mass = this.OBJECT_MASS;
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this));
    }
    onCollisionEnter(e) {
        let collision = e.collision;
        // Used to determine the closest collision contact point to the world camera.
        //let wCamera = WorldCameraFinderProvider.getInstance().getWorldPosition()
        this.ballArcScript.resetBall();
    }
    __initialize() {
        super.__initialize();
        this.OBJECT_MASS = 0.056;
    }
};
exports.HoopBehavior = HoopBehavior;
exports.HoopBehavior = HoopBehavior = __decorate([
    component
], HoopBehavior);
//# sourceMappingURL=HoopBehavior.js.map