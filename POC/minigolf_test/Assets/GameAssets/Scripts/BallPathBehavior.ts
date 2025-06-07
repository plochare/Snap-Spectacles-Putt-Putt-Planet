import { Interactable } from "SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit/Providers/CameraProvider/WorldCameraFinderProvider";
import { SIK } from "SpectaclesInteractionKit/SIK";
import { InteractorEvent } from "SpectaclesInteractionKit/Core/Interactor/InteractorEvent";
import { Interactor, InteractorInputType } from "SpectaclesInteractionKit/Core/Interactor/Interactor";

// import { ScreenLogger } from "./Utils/ScreenLogger";

/**
 * @component
 * @class BallPathBehavior
 *
 * This component controls the behavior of a "ball path" object in an interactive
 * AR scene. It uses physics and interaction handlers to simulate picking up the ball,
 * accumulating velocity/force based on hand gestures, and then launching the ball
 * into the scene. It also plays a sound effect upon collisions and removes the
 * object if it falls below a certain Y-threshold (representing "ground").
 */
@component
export class BallPathBehavior extends BaseScriptComponent {
   
    /**
     * @input
     * Course Hole Numbers
    */
    @input
    hole0!: SceneObject

    @input
    hole1!: SceneObject

    @input
    hole2!: SceneObject
    
    @input
    hole3!: SceneObject
    
    /**
     * @input
     * UI Prompts
    */
    @input
    UIprompt!: SceneObject
    
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
    wallaudio: AudioComponent

    @input
    bumpaudio: AudioComponent

    @input
    erroraudio: AudioComponent

    @input
    puttaudio: AudioComponent
    
    @input
    clap0audio: AudioComponent
    
    @input
    clap1audio: AudioComponent
    
    @input
    clap2audio: AudioComponent

    @input
    @hint('This is the material that will provide the mesh outline')
    public targetOutlineMaterial: Material;

    @input
    @allowUndefined
    public meshVisual:RenderMeshVisual;

    @input
    gameContainer!: SceneObject

    @input
    putterContainer!: SceneObject

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
    /*
    @input
    basketball_1!: SceneObject

    @input
    basketball_2!: SceneObject
    */

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
    
    private isGrabbed: boolean = false;
    private isHandOverlapping: boolean = false;

    private highlightMaterial: Material;
    

    initialTPos: vec3;

    initialTRot: quat;

    private GRAVITY = -200

    private ballAngle = 0
    private ballPower = 0

    private launchAngleDeg = 0
    private launchAngleRad = 0

    public arcControllerAngle = 0    
    private bounceCounter = 0

    private currentScoreVal = 0
    private highScoreVal = 0
    private timerVal = 90
    private internalStartTime = 0
    
    private lerptime = 0
    private startPosition = new vec3(0.0, 0.0, 0.0)
    private endPosition = new vec3(0.0, 0.0, 0.0)
    public gamestate = 'initGame'
    public currentCourseNumber = -1

    private intervalId = 0
    
    private holePar = [4, 4, 5]
    private playerStrokes = [0, 0, 0]
    private playerScore = 0
    
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
        
        /*
        this.currentScoreText.text = this.currentScoreVal.toString()
        this.highScoreText.text = this.highScoreVal.toString()
        this.timerText.text = this.timerVal.toString()
        */
        // 
        this.showCourse0()
        this.hideUIprompt()
        //this.setRandomBallPlacement()
        this.gamestate = "playerAim"
    }

    restartTimer(){
        this.internalStartTime = Math.floor(getTime())
    }

    showCourse0(){
        this.hole0.enabled = true
        this.hole1.enabled = false
        this.hole2.enabled = false
        this.hole3.enabled = false
        // set initial ball + club position
        let startX = 0
        let startZ = -65
        this.putterContainer.getTransform().setLocalPosition(new vec3(startX,0,startZ))
    }
    showCourse1(){
        this.hole0.enabled = false
        this.hole1.enabled = true
        this.hole2.enabled = false
        this.hole3.enabled = false
        // set initial ball + club position
        let startX = 12
        let startZ = -74
        this.putterContainer.getTransform().setLocalPosition(new vec3(startX,0,startZ))
    }
    showCourse2(){
        this.hole0.enabled = false
        this.hole1.enabled = false
        this.hole2.enabled = true
        this.hole3.enabled = false
        // set initial ball + club position
        let startX = 58
        let startZ = -74
        this.putterContainer.getTransform().setLocalPosition(new vec3(startX,0,startZ))
    }
    showCourse3(){
        this.hole0.enabled = false
        this.hole1.enabled = false
        this.hole2.enabled = false
        this.hole3.enabled = true
        // set initial ball + club position
        let startX = -17
        let startZ = -72
        this.putterContainer.getTransform().setLocalPosition(new vec3(startX,0,startZ))
    }
    
    showUIprompt(){
        this.UIprompt.enabled = true
    }
    
    hideUIprompt(){
        this.UIprompt.enabled = false
    }
    
    onPlayHole(){
        //
        
        if (this.currentCourseNumber == -1){
            this.showCourse0()
            this.hideUIprompt()  
        }
        if (this.currentCourseNumber == 0){
            this.showCourse1()
            this.hideUIprompt()
        }
        if (this.currentCourseNumber == 1){
            this.showCourse2()
            this.hideUIprompt()
        }
        if (this.currentCourseNumber == 2){
            this.showCourse3()
            this.hideUIprompt()
        }
        // Reset Path Positions
        this.dragObject.getComponent("Physics.BodyComponent").intangible = false
        this.dragObject.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        //
        this.showTrajectoryDots()
        this.displayStroke() 
        this.meshVisual.enabled = true
        //
        this.ballObject.enabled = true
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
        this.clubObject.enabled = true
        //
        this.gamestate = "playerAim"
    }
    
    onNextHole(){
        this.currentCourseNumber++
        if (this.currentCourseNumber<3){
            this.onPlayHole()
        }else{
            this.currentCourseNumber = 0
            this.onPlayHole()
            // OnRestartGame
            this.playerStrokes = [0, 0, 0]
            this.playerScore = 0
        }
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
        /*
        */
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
        // Once released, the ball should be affected by physics again.
        // this.physicsBody.intangible = false
        // this.physicsBody.dynamic = false
        
        /* Ball Move 
        */
        if (this.gamestate == "playerAim"){
            this.lerptime = 0
            this.startPosition = this.clubObject.getTransform().getLocalPosition()
            this.endPosition = this.t1Object.getTransform().getLocalPosition()
            //
            this.hideTrajectoryDots()
            this.playerStrokes[this.currentCourseNumber] = this.playerStrokes[this.currentCourseNumber] + 1
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
            if (Math.abs(this.ballObject.getComponent("Physics.BodyComponent").velocity.x)<0.1 && Math.abs(this.ballObject.getComponent("Physics.BodyComponent").velocity.z)<0.1){
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
        this.dragObject.getTransform().setLocalPosition(new vec3(dragpoint.x, this.ballObject.getTransform().getLocalPosition().y, dragpoint.z))
        //
        
        let dragDistz = dragpoint.z - startpoint.z
        let dragDistx = dragpoint.x - startpoint.x
        
        let sumOfSquares = Math.pow(dragDistz, 2) + Math.pow(dragDistx, 2) 

        let dragDistance = Math.sqrt(sumOfSquares)
        
        if (dragDistance>22){
            dragDistance = 22   
        }
        this.ballPower = dragDistance * 6
        
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
        print("audio collision")
        this.wallaudio.play(1)
        
        /*
        if (this.ballObject.getTransform().getLocalPosition().y < 2){
            this.bounceCounter++
            if (this.bounceCounter == 1){
                this.wallaudio.play(1)
            }
            if (this.bounceCounter == 2){
                this.bumpaudio.play(1)
            }
            if (this.bounceCounter == 3){
                this.erroraudio.play(1)
            }
            if (this.bounceCounter>3){
                this.resetBall()
            }
        }else{
            
        }
        */
    }
    
    public getBallVelocity() : number {
        let currentVelocity = Math.sqrt((this.ballObject.getComponent("Physics.BodyComponent").velocity.x*this.ballObject.getComponent("Physics.BodyComponent").velocity.x) + (this.ballObject.getComponent("Physics.BodyComponent").velocity.z * this.ballObject.getComponent("Physics.BodyComponent").velocity.z))
        return currentVelocity
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
    
    hideBall(){
        // Reset Initial Ball Position
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = false
        this.ballObject.getTransform().setLocalPosition(vec3.zero())
        this.ballObject.getComponent("Physics.BodyComponent").velocity = vec3.zero()
        //
        this.dragObject.getComponent("Physics.BodyComponent").intangible = true
        this.ballObject.enabled = false
        //
        this.t1Object.enabled = false
        this.t2Object.enabled = false
        this.t3Object.enabled = false
        this.t4Object.enabled = false
        this.t5Object.enabled = false
        this.t6Object.enabled = false
        this.t7Object.enabled = false
        this.t8Object.enabled = false
        this.t9Object.enabled = false
        this.clubObject.enabled = false
    }
    
    /**
     * Resets the ball and ball path
     * */
    resetBall(){

        // Random Test
        this.setRandomBallPlacement()
        this.bounceCounter = 0

        // Reset Initial Ball Position
        this.ballObject.getComponent("Physics.BodyComponent").dynamic = false
        this.ballObject.getTransform().setLocalPosition(vec3.zero())
        this.ballObject.getComponent("Physics.BodyComponent").velocity = vec3.zero()
        // Reset Path Positions
        this.dragObject.getComponent("Physics.BodyComponent").intangible = false
        this.dragObject.getTransform().setLocalPosition(this.ballObject.getTransform().getLocalPosition())
        //this.dragObject.getTransform().setLocalPosition(new vec3(0,10,0))
        //
        this.showTrajectoryDots()
        this.displayStroke() 
        this.meshVisual.enabled = true
    }

    /**
     * UpdateScoreboard 
     * */
    updateScoreboard(){
        if (this.playerStrokes[this.currentCourseNumber] == this.holePar[this.currentCourseNumber]){
           this.clap0audio.play(1)
        }
        if (this.playerStrokes[this.currentCourseNumber] < this.holePar[this.currentCourseNumber]){
           this.clap1audio.play(1)
        }
        if (this.playerStrokes[this.currentCourseNumber] > this.holePar[this.currentCourseNumber]){
            this.clap2audio.play(1)    
        }
        //
        this.playerScore = this.playerStrokes[0] + this.playerStrokes[1] + this.playerStrokes[2]
        // this.currentScoreVal++
        // this.currentScoreText.text = this.currentScoreVal.toString()
        //
        /*
        
        if (this.currentScoreVal>this.highScoreVal){
            this.highScoreVal = this.currentScoreVal
            this.highScoreText.text = this.highScoreVal.toString()
        }*/
    }
    /**
    * Creates the random ball position
    * */
    setRandomBallPlacement(){
        
        let randomDistance1 = Math.floor(Math.random() * 5) - Math.floor(Math.random() * 5) 
        let randomDistance2 = Math.floor(Math.random() * -5) - 65
        // 
        this.putterContainer.getTransform().setLocalPosition(new vec3(randomDistance1,0,randomDistance2))
        
    }

    /**
     * Destroys the scene object and removes it from the world.
     * Typically called when the ball is considered "lost" below ground level.
     */
    destroy() {
        this.sceneObject.destroy()
    }

}
