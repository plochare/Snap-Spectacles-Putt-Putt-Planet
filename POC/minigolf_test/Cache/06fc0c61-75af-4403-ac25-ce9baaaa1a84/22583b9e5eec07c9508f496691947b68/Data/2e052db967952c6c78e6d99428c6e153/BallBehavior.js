"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BallBehavior = void 0;
var __selfType = requireType("./BallBehavior");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider");
/**
 * @component
 * @class BallBehavior
 * Component keeps track of ball collisions
 *
 */
let BallBehavior = class BallBehavior extends BaseScriptComponent {
    onAwake() {
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent");
        this.physicsBody.mass = this.OBJECT_MASS;
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this));
    }
    /**
     * @param e Collision event containing collision details.
     */
    onCollisionEnter(e) {
        let collision = e.collision;
        // Used to determine the closest collision contact point to the world camera.
        let closestHit = null;
        let wCamera = WorldCameraFinderProvider_1.default.getInstance().getWorldPosition();
        let hitObject = null;
        e.collision.contacts.forEach(contact => {
            // Update closest collision point for reference if none is set,
            // or if this contact is closer to the camera.
            if (closestHit == null) {
                hitObject = collision.collider.getSceneObject();
                closestHit = contact.position;
            }
            else {
                if (contact.position.distance(wCamera) < closestHit.distance(wCamera)) {
                    closestHit = contact.position;
                    hitObject = collision.collider.getSceneObject();
                }
            }
            // If we hit something that isn't another ball and the collision impulse is big enough,
            // we play a sound.
            if (collision.collider.getSceneObject().name == "wall" && contact.impulse > 0.1) {
                this.ballSwingScript.collisionBall();
            }
        });
        //if (shouldPlayAudio) {
        //this.audio.play(1)
        //}
    }
    __initialize() {
        super.__initialize();
        this.OBJECT_MASS = 0.056;
        this.bounceCounter = 0;
    }
};
exports.BallBehavior = BallBehavior;
exports.BallBehavior = BallBehavior = __decorate([
    component
], BallBehavior);
//# sourceMappingURL=BallBehavior.js.map