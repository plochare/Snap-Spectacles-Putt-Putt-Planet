import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";
// import { Buffer } from "Scripts/Utils/Buffer";
import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";
import {BallArcBehavior} from "./BallArcBehavior"

/**
 * @component
 * @class HoleBehavior
 * Component keeps track of net score collisions
 * 
 */

@component
export class HoleBehavior extends BaseScriptComponent {

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

        this.swishaudio.play(1)

        // Used to determine the closest collision contact point to the world camera.
        //let wCamera = WorldCameraFinderProvider.getInstance().getWorldPosition()
        this.ballArcScript.appendScore()
        this.ballArcScript.resetBall()
    }
    
}
