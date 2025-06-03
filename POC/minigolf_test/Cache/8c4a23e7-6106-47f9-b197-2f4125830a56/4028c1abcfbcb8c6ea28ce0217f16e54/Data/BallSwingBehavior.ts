import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
// import { SIK } from "SpectaclesInteractionKit/SIK";

import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";
// import { ScreenLogger } from "./Utils/ScreenLogger";

/**
 * @component
 * @class BallSwingBehavior
 *
 * This component controls the behavior of a "golf swing" object in an interactive
 * AR scene. It uses physics and interaction handlers to simulate picking up the ball,
 * accumulating velocity/force and then launching the ball into the scene. 
 */
@component
export class BallSwingBehavior extends BaseScriptComponent {
    
    /**
     * @input
     * Text Display Fields
    */
    @input
    currentScoreText: Text

    @input
    highScoreText: Text

    @input
    timerText: Text

    /**
     * @input
     * Audio sound effects upon certain collisions.
     */
    @input
    bounce1audio: AudioComponent

    @input
    bounce2audio: AudioComponent

    @input
    bounce3audio: AudioComponent

    @input
    backboardaudio: AudioComponent

    @input
    @hint('This is the material that will provide the mesh outline')
    public targetOutlineMaterial: Material;

    @input
    @allowUndefined
    public meshVisual:RenderMeshVisual;

    @input
    gameContainer!: SceneObject

    @input
    puttContainer!: SceneObject

    @input
    dragObject!: SceneObject

    @input
    targetObject!: SceneObject

    @input
    ballObject!: SceneObject

    //@input
    //ballPhysicsBody!: BodyComponent

    @input
    t0Object!: SceneObject

    @input
    t1Object!: SceneObject

    @input
    t2Object!: SceneObject

    @input
    t3Object!: SceneObject

    @input
    t4Object!: SceneObject

    @input
    t5Object!: SceneObject

    @input
    t6Object!: SceneObject

    @input
    t7Object!: SceneObject

    @input
    t8Object!: SceneObject
    
    @input
    t9Object!: SceneObject
    
    @input
    clubObject!: SceneObject

    @input
    basketball_1!: SceneObject

    @input
    basketball_2!: SceneObject


    private calculateMidpoint(pos1: vec3, pos2: vec3): vec3 {
        return pos1.add(pos2).uniformScale(0.5)
    }
        
    private calculateDistance(pos1: vec3, pos2: vec3): number {
       return 0
    }
        
    private calculateAngle(pos1: vec3, pos2: vec3): number {
       const dx = pos2.x - pos1.x
       const dz = pos2.z - pos1.z
       const radians = Math.atan2(dz, dx)
       const degrees = (radians * 180) / Math.PI
       return degrees
    }
   
    /**
     * Reference to the physics body component of the tennis ball.
     * Used to apply mass, handle collisions, and manipulate velocity.
     */
    physicsBody: BodyComponent

    /**
     * Reference to the Interactable component, which allows this object
     * to be "grabbed" or interacted with by the user's hand or controller.
     */
    interactable: Interactable

    /**
     * Cached reference to the object's Transform component.
     * Used frequently for position and rotation updates.
     */
    protected t: Transform

    // Indicates if the ball is currently being held by the user.
    private isHolding = false
    
    /**
     * The physical mass of the tennis ball in scene units.
     */
    protected OBJECT_MASS = 0.056

    /**
     * If the ball falls below this Y position in the scene world,
     * it will be destroyed, simulating hitting "the ground."
     */
    private GROUND_Y_OFFSET = -350

    // private grabbable:Grabbable;

    private highlightMaterial: Material;
    
    initialTPos: vec3;

    private GRAVITY = -200
    private ballAngle = 0
    private ballPower = 0

    private launchAngleDeg = 0
    private launchAngleRad = 0
 
    private bounceCounter = 0

    private currentScoreVal = 0
    private highScoreVal = 0
    private timerVal = 90
    private internalStartTime = 0
    
    private lerptime = 0
    private startPosition = new vec3(0.0, 0.0, 0.0)
    private endPosition = new vec3(0.0, 0.0, 0.0)
    public gamestate = 'initGame'

    private intervalId = 0
    
    /**
     * Called once when the component is initialized.
     * Sets up physics, audio, and interaction events.
     */
    onAwake() {

        // Set audio playback mode for minimal latency on collision sound.
        //this.audio.playbackMode = Audio.PlaybackMode.LowLatency

        // Configure physics body parameters.
        this.physicsBody = this.sceneObject.getComponent("Physics.BodyComponent")
        this.physicsBody.mass = this.OBJECT_MASS
        this.physicsBody.onCollisionEnter.add(this.onCollisionEnter.bind(this))

        this.highlightMaterial = this.targetOutlineMaterial.clone();

        // Configure interactable event handlers for picking up and releasing the ball.
        this.interactable = this.sceneObject.getComponent(Interactable.getTypeName())
        this.interactable.onTriggerStart(this.onTriggerStart.bind(this))
        this.interactable.onTriggerEnd(this.onTriggerEnd.bind(this))
        
        // Register an update event callback to handle per-frame logic.
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this))

        // Cache a reference to the object's transform for efficient position/rotation updates.
        this.t = this.getTransform()
        
        // 
        this.setRandomBall()
        this.gamestate = "playerAim"
    }

    restartTimer(){
        this.internalStartTime = Math.floor(getTime())
    }

    /**
     * Called when the ball collides with another object.
     * Plays a sound if it collides with a non-ball object with sufficient force.
     *
     * @param e Collision event containing collision details.
     */
    onCollisionEnter(e) {
        let collision = e.collision;
        let shouldPlayAudio = false

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
            //if (collision.collider.getSceneObject().name.indexOf("Ball") < 0 && contact.impulse > 0.1) {
                //shouldPlayAudio = true
            //}
        })
        
        
        //if (shouldPlayAudio) {
            //this.audio.play(1)
        //}
    }

    /**
     * Called when the user starts interacting with (grabbing) the ball.
     *
     * @param e Interactor event containing info about which hand started the interaction.
     */
    onTriggerStart(interactor:Interactor) {

        this.initialTPos = this.t.getWorldPosition()
        
        this.meshVisual.enabled = false
        this.isHolding = true

    }

    /**
     * Called when the user releases the ball.
     * The ball becomes dynamic and is launched with the accumulated force and base velocity.
     */
    onTriggerEnd() {
   
        /* Ball Move
        
        */
        if (this.gamestate == "playerAim"){
            this.lerptime = 0
            this.startPosition = this.clubObject.getTransform().getLocalPosition()
            this.endPosition = this.t1Object.getTransform().getLocalPosition()
            //
            this.hideTrajectoryDots()
            this.gamestate = "playerSwing"
        }
        
        //this.ballObject.physicsBody.velocity = new vec3(0.0, 100.0, 0.0);

        this.isHolding = false

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

    /**
     * Called every frame. Updates the ball's physics state and checks if it should be destroyed.
     * When holding, accumulates force from hand acceleration. Also handles rotation buffering.
     */
    onUpdate() {
        
        if (this.gamestate == "ballMove"){
            if (Math.abs(this.ballObject.getComponent("Physics.BodyComponent").velocity.x)<0.01 && Math.abs(this.ballObject.getComponent("Physics.BodyComponent").velocity.z)<0.01){
                this.showTrajectoryDots()
                this.displayStroke()
                this.ballObject.getComponent("Physics.BodyComponent").dynamic = false
                this.dragObject.getComponent("Physics.BodyComponent").intangible = false
                this.dragObject.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
                this.meshVisual.enabled = true
                this.gamestate ="playerAim"
            } 
        }

        if (this.gamestate == "playerAim"){
            this.displayStroke()
        }
        
        
        if (this.gamestate == "playerSwing"){
            // golf club in motion  
            this.lerptime += 3 * getDeltaTime()
            if (this.lerptime>=1){
                this.clubObject.getTransform().setLocalPosition(this.endPosition)
                this.moveBall()
                this.gamestate = "ballMove"
            }else{
                // print('lerptime' + this.lerptime)
                const currentPosition = vec3.lerp(this.startPosition, this.endPosition, this.lerptime)
                this.clubObject.getTransform().setLocalPosition(currentPosition)
            }   
        }
        
        // If the ball falls below a certain height, reset ball (simulate hitting the ground).
        if (this.ballObject.getTransform().getWorldPosition().y < this.GROUND_Y_OFFSET) {
            this.resetBall()
        }
        
        
    }
    
    moveBall(){
        let velx = this.ballPower * Math.cos((this.ballAngle) * -0.0174533)
        let velz = -this.ballPower * Math.sin((this.ballAngle) * -0.0174533)
        
        this.dragObject.getComponent("Physics.BodyComponent").intangible = true
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = true
        this.ballObject.getComponent("Physics.BodyComponent").velocity = new vec3(velx,0,velz)
    }
    
    displayStroke(){
        const dragpoint = this.dragObject.getTransform().getLocalPosition()
        const startpoint = this.t1Object.getTransform().getLocalPosition()
        const startWorldPoint = this.t1Object.getTransform().getWorldPosition()
        this.dragObject.getTransform().setLocalPosition(new vec3(dragpoint.x, 0, dragpoint.z))
        //
        
        let dragDistz = dragpoint.z - startpoint.z
        let dragDistx = dragpoint.x - startpoint.x
        
        let sumOfSquares = Math.pow(dragDistz, 2) + Math.pow(dragDistx, 2) 

        let dragDistance = Math.sqrt(sumOfSquares)
        
        if (dragDistance>22){
            dragDistance = 22   
        }
        this.ballPower = dragDistance * 5.5
        
        this.ballAngle = this.calculateAngle(this.dragObject.getTransform().getWorldPosition(), this.t1Object.getTransform().getWorldPosition()) 
        
        this.clubObject.getTransform().setLocalRotation(quat.quatFromEuler(0,(this.ballAngle + 90) * -0.0174533,0))
        
        this.clubObject.getTransform().setLocalPosition(new vec3(startpoint.x + dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        
        this.t2Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.15*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.15*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t3Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.25*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.25*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t4Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.35*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.35*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t5Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.45*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.45*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t6Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.55*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.55*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t7Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.65*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.65*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t8Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.75*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.75*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))
        this.t9Object.getTransform().setLocalPosition(new vec3(startpoint.x + 0.85*dragDistance*Math.cos((this.ballAngle) * -0.0174533), this.ballObject.getTransform().getLocalPosition().y , startpoint.z + 0.85*dragDistance*Math.sin((this.ballAngle) * 0.0174533)))       
    }

    public collisionBall(){
        
    }
    
    /**
       Toggle trajectory dots
     **/
    hideTrajectoryDots(){
        this.t1Object.enabled = false
        this.t2Object.enabled = false
        this.t3Object.enabled = false
        this.t4Object.enabled = false
        this.t5Object.enabled = false
        this.t6Object.enabled = false
        this.t7Object.enabled = false
        this.t8Object.enabled = false
        this.t9Object.enabled = false
    }
    
    showTrajectoryDots(){
        this.t1Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t2Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t3Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t4Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t5Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t6Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t7Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t8Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        this.t9Object.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        //
        this.t1Object.enabled = true
        this.t2Object.enabled = true
        this.t3Object.enabled = true
        this.t4Object.enabled = true
        this.t5Object.enabled = true
        this.t6Object.enabled = true
        this.t7Object.enabled = true
        this.t8Object.enabled = true
        this.t9Object.enabled = true
    }
    
    /**
     * Resets the game paramters
     * */
    resetGame(){
        this.currentScoreVal = 0
        this.currentScoreText.text = this.currentScoreVal.toString()
    }
    
    /**
     * Resets the ball
     * */
    resetBall(){

        // Random Test
        this.setRandomBall()
        this.bounceCounter = 0

        // Reset Initial Ball Position
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = false
        this.ballObject.getTransform().setLocalPosition(vec3.zero())
        this.ballObject.getComponent("Physics.BodyComponent").velocity = vec3.zero()
        // Reset Positions
        this.dragObject.getComponent("Physics.BodyComponent").intangible = false
        this.dragObject.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        //this.dragObject.getTransform().setLocalPosition(new vec3(0,10,0))
        //
        this.showTrajectoryDots()
        this.displayStroke() 
        this.meshVisual.enabled = true
    }

    /**
     * AppendScore
     * */
    appendScore(){
        /*
        this.currentScoreVal++
        this.currentScoreText.text = this.currentScoreVal.toString()
        //
        if (this.currentScoreVal>this.highScoreVal){
            this.highScoreVal = this.currentScoreVal
            this.highScoreText.text = this.highScoreVal.toString()
        }
        */
    }
    /**
    * Creates the random and ball placement
    * */
    setRandomBall(){
        
        let randomDistance1 = Math.floor(Math.random() * 20) - Math.floor(Math.random() * 20) 
        let randomDistance2 = Math.floor(Math.random() * -5) - 65
        // 
        this.puttContainer.getTransform().setLocalPosition(new vec3(randomDistance1,0,randomDistance2))
        
    }
    
    /**
     * Destroys the scene object and removes it from the world.
     * Typically called when the ball is considered "lost" below ground level.
     */
    destroy() {
        this.sceneObject.destroy()
    }

}
