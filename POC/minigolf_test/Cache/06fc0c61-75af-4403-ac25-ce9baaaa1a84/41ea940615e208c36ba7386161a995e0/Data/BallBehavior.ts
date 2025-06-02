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


    onAwake() {

    }
}
