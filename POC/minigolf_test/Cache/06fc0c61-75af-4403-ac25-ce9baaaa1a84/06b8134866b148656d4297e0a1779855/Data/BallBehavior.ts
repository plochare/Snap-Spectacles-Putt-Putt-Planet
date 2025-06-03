import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";
// import { Buffer } from "Scripts/Utils/Buffer";
import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";
import {BallSwingBehavior} from "./BallSwingBehavior"
/**
 * @component
 * @class BallBehavior
 * Component keeps track of ball collisions
 * 
 */

@component
export class BallBehavior extends BaseScriptComponent {
    
    @input
    arcContainer!: SceneObject

    @input 
    ballSwingScript!: BallSwingBehavior

    physicsBody: BodyComponent
    protected OBJECT_MASS = 0.056

    private bounceCounter = 0

    onAwake() {
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent")
        this.physicsBody.mass = this.OBJECT_MASS
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this))
    }

    /**
     * @param e Collision event containing collision details.
     */
    onCollisionEnter(e) {
        let collision = e.collision;

        // Used to determine the closest collision contact point to the world camera.
        let closestHit = null;
        let wCamera = WorldCameraFinderProvider.getInstance().getWorldPosition()
        let hitObject: SceneObject = null
        
        e.collision.contacts.forEach(contact => {
            // Update closest collision point for reference if none is set,
            // or if this contact is closer to the camera.
            if (closestHit == null) { 
                hitObject = collision.collider.getSceneObject()
                closestHit = contact.position 
            } else {
                if (contact.position.distance(wCamera) < closestHit.distance(wCamera)) {
                    closestHit = contact.position
                    hitObject = collision.collider.getSceneObject()
                }
            }

            // If we hit something that isn't another ball and the collision impulse is big enough,
            // we play a sound.
            if (collision.collider.getSceneObject().name == "wall"" 0 && contact.impulse > 0.1) {
                this.ballSwingScript.collisionBall()
            }
            
        })
       
        
        
        
        

        //if (shouldPlayAudio) {
            //this.audio.play(1)
        //}
    }
}
