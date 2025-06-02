import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";
// import { Buffer } from "Scripts/Utils/Buffer";
import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";

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

    private bounceCounter = 0

    onAwake() {
        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent")
        this.physicsBody.mass = this.OBJECT_MASS
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this))

    }

    /**
     * Called when the ball collides with another object.
     * Plays a sound if it collides with a non-ball object with sufficient force.
     *
     * @param e Collision event containing collision details.
     */
    onCollisionEnter(e) {
        let collision = e.collision;

        // Used to determine the closest collision contact point to the world camera.
        let closestHit = null;
        let wCamera = WorldCameraFinderProvider.getInstance().getWorldPosition()
        let hitObject: SceneObject = null
        /*
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
            //if (collision.collider.getSceneObject().name.indexOf("Ball") < 0 && contact.impulse > 0.1) {
                //shouldPlayAudio = true
            //}
        })
        */
        
        this.bounceCounter++
        if (this.bounceCounter>3){
            bounceCounter = 0
            this.arcContainer.getComponent("BallArcBehavior").resetBall()
        }
        //if (shouldPlayAudio) {
            //this.audio.play(1)
        //}
    }
}
