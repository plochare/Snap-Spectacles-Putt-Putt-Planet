import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";

import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";
import {BallSwingBehavior} from "./BallSwingBehavior"

/**
 * @component
 * @class HoleBehavior
 * Component keeps track of hole collisions
 * 
 */

@component
export class HoleBehavior extends BaseScriptComponent {

    @input 
    ballSwingScript!: BallSwingBehavior

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
        this.ballSwingScript.appendScore()
        this.ballSwingScript.resetBall()
    }
    
}
