import Event from "../SpectaclesInteractionKit/Utils/Event";
import {Conversions} from "./Conversions";
import { LoopController } from "./LoopController";

@component
export class UI extends BaseScriptComponent {
    @input
    camObj: SceneObject
    
    @input
    backplateSo:SceneObject

    @input
    warningTutorialUI:SceneObject
    
    get createPathClicked() {
        return this.createPathClickedEvent.publicApi();
    }

    get resetPathClicked() {
        return this.resetPathClickedEvent.publicApi();
    }

    get finishPathClicked(){
        return this.finishPathClickedEvent.publicApi();
    }

    get loopPathClicked(){
        return this.loopPathClickedEvent.publicApi();
    }

    get tutorialComplete(){
        return this.tutorialCompleteEvent.publicApi();
    }

    get endSessionClicked(){
        return this.endSessionClickedEvent.publicApi();
    }

    private createPathClickedEvent: Event = new Event();
    private resetPathClickedEvent: Event = new Event();
    private finishPathClickedEvent: Event = new Event();
    private loopPathClickedEvent: Event = new Event();
    private tutorialCompleteEvent: Event = new Event();
    private endSessionClickedEvent: Event = new Event();

    private warningTr = null;

    onAwake(){
        this.warningTr = this.warningTutorialUI.getTransform();
    }

    showHomeUi(){
    }

    showTutorialUi(){
    }

    showDuringPathCreationUi(){
    }

    showEndSessionUi(){
    }

    showGoToStartUi(distance: number){
    }

    initLoopUi(startTr:Transform){
    }

    showLoopUi(){
    }

    hideLoopUi(){
    }

    hideUi(){
    }

    onProgressTutorial(){
    }

    onCreatePlaneDetectorButton(){
        this.hide(this.warningTr);
        this.tutorialCompleteEvent.invoke();
        this.createPathClickedEvent.invoke();
    }

    onFinishCreatePathButton(){
    }

    onResetCreatePathButton(){
    }

    onStopWalkingButton(){
    }

    private hide(tr:Transform){
        let localPos = tr.getLocalPosition();
        localPos.y = 10000;
        tr.setLocalPosition(localPos);
        this.backplateSo.enabled = false;
    }

    private show(tr:Transform){
        let localPos = tr.getLocalPosition();
        localPos.y = -5;
        tr.setLocalPosition(localPos);
        this.backplateSo.enabled = true;
    }

    private tryHideCurrentActive(){
    }
}