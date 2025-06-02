"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BallArcBehavior = void 0;
var __selfType = requireType("./BallArcBehavior");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider");
const SIK_1 = require("SpectaclesInteractionKit/SIK");
// import { Grabbable } from "./Grabbable";
// import { ScreenLogger } from "./Utils/ScreenLogger";
/**
 * @component
 * @class BallArcBehavior
 *
 * This component controls the behavior of a "ball arc" object in an interactive
 * AR scene. It uses physics and interaction handlers to simulate picking up the ball,
 * accumulating velocity/force based on hand gestures, and then launching the ball
 * into the scene. It also plays a sound effect upon collisions and removes the
 * object if it falls below a certain Y-threshold (representing "ground").
 */
let BallArcBehavior = class BallArcBehavior extends BaseScriptComponent {
    calculateMidpoint(pos1, pos2) {
        return pos1.add(pos2).uniformScale(0.5);
    }
    /**
     * Called once when the component is initialized.
     * Sets up physics, audio, and interaction events.
     */
    onAwake() {
        /*
        if (!this.grabbable) {
            this.grabbable = this.sceneObject.getComponent(Grabbable.getTypeName());
        }

        if (!this.grabbable) {
            print("This module requires the Grabbable component.");
            return;
        }
        */
        // Set audio playback mode for minimal latency on collision sound.
        //this.audio.playbackMode = Audio.PlaybackMode.LowLatency
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent");
        this.physicsBody.mass = this.OBJECT_MASS;
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this));
        this.highlightMaterial = this.targetOutlineMaterial.clone();
        // Configure interactable event handlers for picking up and releasing the ball.
        this.interactable = this.sceneObject.getComponent(Interactable_1.Interactable.getTypeName());
        this.interactable.onTriggerStart(this.onTriggerStart.bind(this));
        this.interactable.onTriggerEnd(this.onTriggerEnd.bind(this));
        /*
        this.grabbable.onHoverStartEvent.add(() => {
            this.addMaterialToRenderMeshArray();
        });
        this.grabbable.onHoverEndEvent.add(() => {
            this.removeMaterialFromRenderMeshArray();
        });

        this.grabbable.onGrabStartEvent.add(this.onTriggerStart.bind(this));
        this.grabbable.onGrabEndEvent.add(this.onTriggerEnd.bind(this));
        */
        // Register an update event callback to handle per-frame logic.
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
        // Cache a reference to the object's transform for efficient position/rotation updates.
        this.t = this.getTransform();
        /*
        this.currentScoreText.text = this.currentScoreVal.toString()
        this.highScoreText.text = this.highScoreVal.toString()
        this.timerText.text = this.timerVal.toString()
        */
        //
        //this.intervalId = setInterval(this.updateTimer, 1000);
        // 
        this.setRandomBallArc();
    }
    /**
     * Called when the ball collides with another object.
     * Plays a sound if it collides with a non-ball object with sufficient force.
     *
     * @param e Collision event containing collision details.
     */
    onCollisionEnter(e) {
        let collision = e.collision;
        let shouldPlayAudio = false;
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
            //if (collision.collider.getSceneObject().name.indexOf("Ball") < 0 && contact.impulse > 0.1) {
            //shouldPlayAudio = true
            //}
        });
        this.bounceCounter++;
        if (this.bounceCounter > 3) {
            this.resetBall();
        }
        //if (shouldPlayAudio) {
        //this.audio.play(1)
        //}
    }
    /**
     * Called when the user starts interacting with (grabbing) the ball.
     *
     * @param e Interactor event containing info about which hand started the interaction.
     */
    onTriggerStart(interactor) {
        this.initialTPos = this.t.getWorldPosition();
        /*
        // Determine which hand we are using based on the input type.
        this.hand = this.handInputData.getHand(interactor.inputType == InteractorInputType.LeftHand ? 'left' : 'right');

        this.initialHandPos = this.hand.indexKnuckle.position;
        this.initialTPos = this.t.getWorldPosition();
        this.initialHandRot = this.hand.indexKnuckle.rotation;
        this.initialTRot = this.t.getWorldRotation();

        // Calculate a "start point" in front of the hand where the ball should appear when grabbed.
        let startPoint = this.hand.indexKnuckle.position.add(this.hand.thumbKnuckle.position).uniformScale(0.5)
        let nudgeLeftDir = this.hand.middleKnuckle.position.sub(this.hand.pinkyKnuckle.position)
        startPoint = startPoint.add(nudgeLeftDir.normalize().uniformScale(5))
        let nudgeUpDir = this.hand.indexKnuckle.position.sub(this.hand.wrist.position)
        startPoint = startPoint.add(nudgeUpDir.normalize().uniformScale(3))

        // Calculate the "end point" and direction for orienting the ball in the hand.
        let endPoint = this.hand.indexTip.position.add(this.hand.thumbTip.position).uniformScale(0.5)
        let direction = endPoint.sub(startPoint)

        // Move the ball to the end point and orient it.
        this.t.setWorldPosition(endPoint)
        this.t.setWorldRotation(quat.lookAt(direction, vec3.up()))

        // Reset velocities and force accumulation since we just picked up the ball.
        this.prevHandVelocity = vec3.zero()
        this.accumulatedForce = vec3.zero()
        */
        this.meshVisual.enabled = false;
        this.isHolding = true;
    }
    /**
     * Called when the user releases the ball.
     * The ball becomes dynamic and is launched with the accumulated force and base velocity.
     */
    onTriggerEnd() {
        // Once released, the ball should be affected by physics again.
        // this.physicsBody.intangible = false
        // this.physicsBody.dynamic = false
        // Calculate the velocity to apply to the ball from the hand movement.
        // let baseVelocity = this.getHandVelocity()
        // baseVelocity = baseVelocity.uniformScale(this.HAND_BASE_VELOCITY_MULTIPLIER)
        // Final velocity = base velocity + any accumulated force from acceleration.
        // this.physicsBody.velocity = baseVelocity.add(this.accumulatedForce)
        let vertVelocity = Math.sqrt(Math.abs(2.0 * this.GRAVITY * this.arcHeight));
        let horizVelocity = vertVelocity / Math.tan(this.launchAngleRad);
        let arcAngleRad = (this.arcControllerAngle - 90) * (Math.PI / 180);
        print("vertVelocity : " + vertVelocity);
        this.dragObject.getComponent("Physics.BodyComponent").intangible = true;
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = true;
        this.ballObject.getComponent("Physics.BodyComponent").velocity = new vec3(-1 * horizVelocity * Math.sin(arcAngleRad), vertVelocity, -1 * horizVelocity * Math.cos(arcAngleRad));
        //this.ballObject.physicsBody.velocity = new vec3(0.0, 100.0, 0.0);
        this.isHolding = false;
        // Reset force and velocity trackers.
        //this.prevHandVelocity = vec3.zero()
        //this.accumulatedForce = vec3.zero()
    }
    addMaterialToRenderMeshArray() {
        const matCount = this.meshVisual.getMaterialsCount();
        let addMaterial = true;
        for (let k = 0; k < matCount; k++) {
            const material = this.meshVisual.getMaterial(k);
            if (material.isSame(this.highlightMaterial)) {
                addMaterial = false;
                break;
            }
        }
        if (addMaterial) {
            const materials = this.meshVisual.materials;
            materials.unshift(this.highlightMaterial);
            this.meshVisual.materials = materials;
        }
    }
    removeMaterialFromRenderMeshArray() {
        const materials = [];
        const matCount = this.meshVisual.getMaterialsCount();
        for (let k = 0; k < matCount; k++) {
            const material = this.meshVisual.getMaterial(k);
            if (material.isSame(this.highlightMaterial)) {
                continue;
            }
            materials.push(material);
        }
        this.meshVisual.clearMaterials();
        for (let k = 0; k < materials.length; k++) {
            this.meshVisual.addMaterial(materials[k]);
        }
    }
    getDeltaHandPos() {
        return this.hand.indexKnuckle.position.sub(this.initialHandPos);
    }
    getDeltaHandRot() {
        return this.hand.indexKnuckle.rotation.multiply(this.initialHandRot.invert());
    }
    /**
     * Called every frame. Updates the ball's physics state and checks if it should be destroyed.
     * When holding, accumulates force from hand acceleration. Also handles rotation buffering.
     */
    onUpdate() {
        // If the ball is being held, update its position and rotation based on hand movement
        if (this.isHolding) {
            // let nPos = this.initialTPos.add(this.getDeltaHandPos())
            // this.t.setWorldPosition(nPos);
            // let nRot = this.getDeltaHandRot().multiply(this.initialTRot)
            // this.t.setWorldRotation(nRot);
        }
        //this.timerVal = Math.floor(getTime())
        //this.timerText.text = this.timerVal.toString()
        /*
        let handVelocity = this.getHandVelocity()

        // If the ball is currently held, accumulate force based on changes in hand velocity (acceleration).
        if (this.isHolding && getDeltaTime() > 0) {
            let handAcceleration = (handVelocity.sub(this.prevHandVelocity)).uniformScale(1/(Math.max(0.016666, getDeltaTime())));
            this.accumulatedForce = this.accumulatedForce.add(handAcceleration.uniformScale(this.HAND_ACCELERATION_MULTIPLIER));
            this.prevHandVelocity = handVelocity;
        }
        */
        this.displayArc();
        // If the ball falls below a certain height, reset ball (simulate hitting the ground).
        if (this.ballObject.getTransform().getWorldPosition().y < this.GROUND_Y_OFFSET) {
            this.resetBall();
        }
    }
    displayArc() {
        const dragpoint = this.dragObject.getTransform().getLocalPosition();
        const startpoint = this.targetObject.getTransform().getLocalPosition();
        this.dragObject.getTransform().setLocalPosition(new vec3(dragpoint.x, dragpoint.y, 0));
        //
        const dragHeight = dragpoint.y - startpoint.y;
        const dragDistance = dragpoint.x - startpoint.x;
        // const midpoint = this.calculateMidpoint(this.dragObject.getTransform().getWorldPosition(), this.targetObject.getTransform().getWorldPosition())
        this.t0Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.1 * dragDistance, startpoint.y + 0.19 * dragHeight, 0));
        this.t1Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.2 * dragDistance, startpoint.y + 0.36 * dragHeight, 0));
        this.t2Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.3 * dragDistance, startpoint.y + 0.51 * dragHeight, 0));
        this.t3Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.4 * dragDistance, startpoint.y + 0.64 * dragHeight, 0));
        this.t4Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.5 * dragDistance, startpoint.y + 0.75 * dragHeight, 0));
        this.t5Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.6 * dragDistance, startpoint.y + 0.84 * dragHeight, 0));
        this.t6Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.7 * dragDistance, startpoint.y + 0.91 * dragHeight, 0));
        this.t7Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.8 * dragDistance, startpoint.y + 0.96 * dragHeight, 0));
        this.t8Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.9 * dragDistance, startpoint.y + 0.99 * dragHeight, 0));
        //
        const apexPoint = this.t8Object.getTransform().getLocalPosition();
        this.arcHeight = apexPoint.y - startpoint.y + 1.25;
        const arcLength = (apexPoint.x - startpoint.x) / 2;
        this.launchAngleRad = Math.atan2(this.arcHeight, arcLength);
    }
    collisionBall() {
        if (this.ballObject.getTransform().getLocalPosition().y < 2) {
            this.bounceCounter++;
            if (this.bounceCounter == 1) {
                this.bounce1audio.play(1);
            }
            if (this.bounceCounter == 2) {
                this.bounce2audio.play(1);
            }
            if (this.bounceCounter == 3) {
                this.bounce3audio.play(1);
            }
            if (this.bounceCounter > 3) {
                this.resetBall();
            }
        }
        else {
            this.backboardaudio.play(1);
        }
    }
    /**
     * Resets the ball and ball arc
     * */
    resetBall() {
        // Random Test
        this.setRandomBallArc();
        this.bounceCounter = 0;
        // Reset Initial Ball Position
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = false;
        this.ballObject.getTransform().setLocalPosition(vec3.zero());
        this.ballObject.getComponent("Physics.BodyComponent").velocity = vec3.zero();
        // Reset Arc Positions
        this.dragObject.getComponent("Physics.BodyComponent").intangible = false;
        this.dragObject.getTransform().setLocalPosition(new vec3(0, 10, 0));
        //
        this.displayArc();
        this.meshVisual.enabled = true;
    }
    /**
    * Creates the random and ball arc distance and angle
    * */
    setRandomBallArc() {
        // Random Angle 0 -> -180
        let randomAngle = Math.floor(Math.random() * 180) - 180;
        // Define the angles in degrees
        this.arcControllerAngle = randomAngle;
        let yRotation = randomAngle;
        // Convert to radians
        let yRadians = yRotation * 0.0174533;
        // Create a quaternion
        let rotationQuaternion = quat.quatFromEuler(0, yRadians, 0);
        // Set the local rotation
        this.gameContainer.getTransform().setLocalRotation(rotationQuaternion);
        // Random Distance 12 -> 60
        let randomDistance = Math.floor(Math.random() * (60 - 12 + 1)) + 12;
        // 
        this.arcContainer.getTransform().setLocalPosition(new vec3(randomDistance, 0, 0));
    }
    DisableArcSelection() {
        // this.meshVisual.enabled = false
        // this.physicsBody.enabled = false
    }
    EnableArcSelection() {
        // this.meshVisual.enabled = true
        // this.physicsBody.enabled = true
    }
    EnableBasketball1() {
        this.basketball_1.enabled = true;
        this.basketball_2.enabled = false;
    }
    EnableBasketball2() {
        this.basketball_1.enabled = false;
        this.basketball_2.enabled = true;
    }
    /**
     * Destroys the scene object and removes it from the world.
     * Typically called when the ball is considered "lost" below ground level.
     */
    destroy() {
        this.sceneObject.destroy();
    }
    /**
     * Retrieves the current hand velocity vector used for computing ball's launch velocity and acceleration.
     *
     * @returns Current velocity of the user's hand as a vec3.
     */
    getHandVelocity() {
        // If in the Lens Studio Editor, return a fixed simulated velocity
        if (global.deviceInfoSystem.isEditor()) {
            return WorldCameraFinderProvider_1.default.getInstance().forward().uniformScale(-1050);
        }
        // Retrieve the hand's object-specific velocity data if available
        const objectSpecificData = this.hand.objectTracking3D.objectSpecificData;
        if (objectSpecificData) {
            const handVelocity = objectSpecificData['global'];
            // If the magnitude of the velocity is too low,
            // it is likely just jitter so we ignore by returning 0
            if (handVelocity.length < 2) {
                return vec3.zero();
            }
            return handVelocity;
        }
        // If no tracking data is available, return zero
        return vec3.zero();
    }
    __initialize() {
        super.__initialize();
        this.handInputData = SIK_1.SIK.HandInputData;
        this.hand = this.handInputData.getHand('right');
        this.isHolding = false;
        this.accumulatedForce = vec3.zero();
        this.prevHandVelocity = vec3.zero();
        this.OBJECT_MASS = 0.056;
        this.HAND_ACCELERATION_MULTIPLIER = 0.08;
        this.HAND_BASE_VELOCITY_MULTIPLIER = 0.6;
        this.GROUND_Y_OFFSET = -350;
        this.isGrabbed = false;
        this.isHandOverlapping = false;
        this.GRAVITY = -200;
        this.arcHeight = 0;
        this.launchAngleDeg = 0;
        this.launchAngleRad = 0;
        this.arcControllerAngle = -120;
        this.bounceCounter = 0;
        this.currentScoreVal = 0;
        this.highScoreVal = 7;
        this.timerVal = 90;
        this.intervalId = 0;
    }
};
exports.BallArcBehavior = BallArcBehavior;
exports.BallArcBehavior = BallArcBehavior = __decorate([
    component
], BallArcBehavior);
//# sourceMappingURL=BallArcBehavior.js.map