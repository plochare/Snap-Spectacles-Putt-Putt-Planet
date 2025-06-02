import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";
// import { Buffer } from "Scripts/Utils/Buffer";
import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";
import {BallArcBehavior} from "./BallArcBehavior"

/**
 * @component
 * @class HoopBehavior
 * Component keeps track of net score collisions
 * 
 */

@component
export class HoopBehavior extends BaseScriptComponent {

    @input 
    ballArcScript!: BallArcBehavior

    @input
    swishaudio: AudioComponent

    physicsBody: BodyComponent
    protected OBJECT_MASS = 0.056

    onAwake() {
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent")
        this.physicsBody.mass = this.OBJECT_MASS
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this))
    }

    onCollisionEnter(e) {
        let collision = e.collision;

        swishaudio.play(1)

        // Used to determine the closest collision contact point to the world camera.
        //let wCamera = WorldCameraFinderProvider.getInstance().getWorldPosition()

        this.ballArcScript.resetBall()
    }
    /*
    // Create a scene object with a collider component.
    var obj = scene.createSceneObject('MyCollider');
    var collider = obj.createComponent('Physics.ColliderComponent');

    // Set it to intangible so nothing collides with it.
    collider.intangible = true;

    // Adjust the overlap filter. For this example, we want to detect all non-intangible colliders and bodies.
    // Note, these match the defaults, but are included for demonstration.
    collider.overlapFilter.includeIntangible = false;
    collider.overlapFilter.includeDynamic = true;
    collider.overlapFilter.includeStatic = true;

    // Print overlap events.
    collider.onOverlapEnter.add(function (e) {
      print('OverlapEnter(' + e.overlap.id + '): ' + e.overlap.collider);
    });
    */
}
