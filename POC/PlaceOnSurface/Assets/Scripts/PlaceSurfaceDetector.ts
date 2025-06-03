import { IPlacingState } from "./PlacingStates/IPlacingState";
import { IdleState } from "./PlacingStates/IdleState";
import { PlacingStartState } from "./PlacingStates/PlacingStartState";

import { UI } from "./UI";
import Event, { PublicApi } from "../SpectaclesInteractionKit/Utils/Event";
import { SurfaceDetection } from "../Surface Detection/Scripts/SurfaceDetection";


@component
export class PlaceSurfaceDetector extends BaseScriptComponent {
    @input
    pathRmv: RenderMeshVisual

    @input
    pfbSurfaceDetection: ObjectPrefab

    @input
    pfbPlaceObject: ObjectPrefab

    @input
    @allowUndefined
    camObj: SceneObject

    @input
    camObjOffset: SceneObject
    
    @input
    protected readonly ui: UI;

    @input
    protected readonly placingStartForwardDisplace: number = 200;

    private camTr: Transform = null;
    private camOffsetTr: Transform = null;
    private currentState: IPlacingState = new IdleState();

    protected bigMoveDistanceThreshold = 40;
    protected hermiteResolution = 12;
    protected resampleResoluton = 4;

    private surfaceDetection:SurfaceDetection | undefined;

    
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
            this.pfbPlaceObject,
            this.camTr,
            this.placingStartForwardDisplace,
            (startPosition, startRotation, startObject) => {
                this.startBuildingPathState(startPosition, startRotation, startObject);
            },

        );
        this.currentState.start();
    }
   
    private startBuildingPathState(startPosition: vec3, startRotation: quat, startObject: SceneObject) {
    
    }
   
   
}
