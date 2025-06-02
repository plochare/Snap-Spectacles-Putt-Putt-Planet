//import { PlayerPaceCalculator } from "./PlayerPaceCalculator";
import { IPathMakerState } from "./PathMakerStates/IPathMakerState";
import { IdleState } from "./PathMakerStates/IdleState";
import { PlacingStartState } from "./PathMakerStates/PlacingStartState";
// import { BuildingPathState } from "./PathMakerStates/BuildingPathState";
import { PlacingFinishState } from "./PathMakerStates/PlacingFinishState";
import { UI } from "./UI";
import Event, { PublicApi } from "../SpectaclesInteractionKit/Utils/Event";
// import { PathData } from "./BuiltPathData";
import { SurfaceDetection } from "../Surface Detection/Scripts/SurfaceDetection";
// import { PathmakingPlayerFeedback } from "./PathmakingPlayerFeedback";
// import { LineController } from "./LineController";

@component
export class PathMaker extends BaseScriptComponent {
    @input
    pathRmv: RenderMeshVisual

    @input
    pfbSurfaceDetection: ObjectPrefab

    @input
    pfbLine: ObjectPrefab

    @input
    @allowUndefined
    camObj: SceneObject

    @input
    camObjOffset: SceneObject
    
    @input
    protected readonly ui: UI;

    @input
    protected readonly placingStartFinishLinesForwardDisplace: number = 200;

    private camTr: Transform = null;
    private camOffsetTr: Transform = null;
    private currentState: IPathMakerState = new IdleState();

    protected bigMoveDistanceThreshold = 40;
    protected hermiteResolution = 12;
    protected resampleResoluton = 4;

    private surfaceDetection:SurfaceDetection | undefined;
    /*
    get pathMade(): PublicApi<PathData> {
        return this.pathMadeEvent.publicApi();
    }
    
    protected pathMadeEvent: Event<PathData> = new Event<PathData>();
    */
    
    public init() {
        this.camTr = this.camObj.getTransform();
        this.camOffsetTr = this.camObjOffset.getTransform();
    }
    
    public start() {
        this.startStartPlacementState();

        this.ui.resetPathClicked.add(()=>{
            // reset path
            if(this.surfaceDetection){
                this.surfaceDetection.reset();      
            }       
            this.startStartPlacementState();
        })
    }

    private startStartPlacementState() {
        this.currentState.stop();
        if(!this.surfaceDetection){
            this.surfaceDetection = this.pfbSurfaceDetection.instantiate(null).getChild(0).getComponent("ScriptComponent") as SurfaceDetection;
        }
        
        this.currentState = new PlacingStartState(this,
            this.surfaceDetection,
            this.pfbLine,
            this.camTr,
            this.placingStartFinishLinesForwardDisplace,
            (startPosition, startRotation, startObject) => {
                this.startBuildingPathState(startPosition, startRotation, startObject);
            },

        );
        this.currentState.start();
    }
   
    private startBuildingPathState(startPosition: vec3, startRotation: quat, startObject: SceneObject) {
    }
   
    /*
    private startFinishPlacementState(startObject: SceneObject,
        startPosition: vec3,
        startRotation: quat,
        pathPoints: vec3[],
        lastVisualPoints: vec3[]) {
        
    }

    protected finishLoop(startObject: SceneObject,
        startPosition: vec3,
        startRotation: quat,
        splinePoints: { position: vec3, rotation }[]) {
        
    }

    private finishSprint(startObject: SceneObject,
        startPosition: vec3,
        startRotation: quat,
        finishObject: SceneObject,
        finishPosition: vec3,
        finishRotation: quat,
        splinePoints: { position: vec3, rotation }[]) {
        
    }
    */
}
