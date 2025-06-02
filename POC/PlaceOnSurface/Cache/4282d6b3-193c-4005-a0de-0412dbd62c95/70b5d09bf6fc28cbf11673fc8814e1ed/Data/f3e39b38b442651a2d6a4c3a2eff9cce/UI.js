"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UI = void 0;
var __selfType = requireType("./UI");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Event_1 = require("../SpectaclesInteractionKit/Utils/Event");
let UI = class UI extends BaseScriptComponent {
    /*
    @input
    tutorialUI:SceneObject

    @input
    tutorialAnimationPlayer:AnimationPlayer

    @input
    tutorialText:Text
    */
    get createPathClicked() {
        return this.createPathClickedEvent.publicApi();
    }
    get resetPathClicked() {
        return this.resetPathClickedEvent.publicApi();
    }
    get finishPathClicked() {
        return this.finishPathClickedEvent.publicApi();
    }
    get loopPathClicked() {
        return this.loopPathClickedEvent.publicApi();
    }
    get tutorialComplete() {
        return this.tutorialCompleteEvent.publicApi();
    }
    get endSessionClicked() {
        return this.endSessionClickedEvent.publicApi();
    }
    onAwake() {
        this.warningTr = this.warningTutorialUI.getTransform();
        //this.tutorialTr = this.tutorialUI.getTransform();
        //this.homeTr = this.homeUI.getTransform();
        //his.duringPathCreationUiTr = this.duringPathCreationUI.getTransform();
        //this.goToStartUiTr = this.goToStartUI.getTransform();
        //this.endSessionUiTr = this.endSessionUI.getTransform();
        //his.hide(this.tutorialTr);
        //this.hide(this.homeTr);
        //this.hide(this.duringPathCreationUiTr);
        //this.hide(this.goToStartUiTr);
        //this.hide(this.endSessionUiTr);
    }
    showHomeUi() {
        //this.tryHideCurrentActive();
        //this.currentActiveTr = this.homeTr;
        //this.show(this.currentActiveTr);
    }
    showTutorialUi() {
        //this.tryHideCurrentActive();
        //this.tutorialStepCount = 0;
        //this.currentActiveTr = this.warningTr;
        //this.show(this.currentActiveTr);
    }
    showDuringPathCreationUi() {
        //this.tryHideCurrentActive();
        //this.currentActiveTr = this.duringPathCreationUiTr;
        //this.show(this.currentActiveTr);
    }
    showEndSessionUi() {
        //this.tryHideCurrentActive();
        //this.currentActiveTr = this.endSessionUiTr;
        //this.show(this.currentActiveTr);
    }
    showGoToStartUi(distance) {
        //this.tryHideCurrentActive();
        //const pathDistFt = Conversions.cmToFeet(distance);
        //this.goToStartUiDistance.text = pathDistFt.toFixed(1) + "'";
        //this.currentActiveTr = this.goToStartUiTr;
        //this.show(this.currentActiveTr);
    }
    initLoopUi(startTr) {
        //if(!this.loopUiController){
        //this.loopUiController = this.pfbLoopUi.instantiate(null).getComponent("ScriptComponent") as LoopController;
        //}
        //this.loopUiController.start(startTr);
    }
    showLoopUi() {
        //this.loopUiController.show();
    }
    hideLoopUi() {
        //this.loopUiController.hide();
    }
    hideUi() {
        this.tryHideCurrentActive();
        this.currentActiveTr = null;
    }
    onProgressTutorial() {
        /*
        if(this.tutorialStepCount === 0){
            this.tryHideCurrentActive();
            this.currentActiveTr = this.tutorialTr;
            this.show(this.currentActiveTr);
        } else if(this.tutorialStepCount === 1){
            this.tutorialAnimationPlayer.setClipEnabled("Sprint_Layer", false);
            this.tutorialAnimationPlayer.setClipEnabled("Loop_Layer", true);
            this.tutorialText.text = "MAKE A LOOP";
        } else if(this.tutorialStepCount === 2){
            this.hide(this.tutorialTr);
            this.tutorialCompleteEvent.invoke();
        }
        this.tutorialStepCount += 1;
        */
    }
    onCreatePlaneDetectorButton() {
        this.hide(this.warningTr);
        this.tutorialCompleteEvent.invoke();
        this.createPathClickedEvent.invoke();
    }
    onFinishCreatePathButton() {
        /*
        this.hide(this.duringPathCreationUiTr);

        if (this.loopUiController.getIsInLoopZone()) {
            this.loopUiController.onLock();
            this.loopPathClickedEvent.invoke();
        } else {
            this.finishPathClickedEvent.invoke();
        }
        */
    }
    onResetCreatePathButton() {
        //this.hide(this.duringPathCreationUiTr);
        //this.resetPathClickedEvent.invoke();
    }
    onStopWalkingButton() {
        //this.hide(this.endSessionUiTr);
        //this.endSessionClickedEvent.invoke();
    }
    hide(tr) {
        let localPos = tr.getLocalPosition();
        localPos.y = 10000;
        tr.setLocalPosition(localPos);
        this.backplateSo.enabled = false;
    }
    show(tr) {
        let localPos = tr.getLocalPosition();
        localPos.y = -5;
        tr.setLocalPosition(localPos);
        this.backplateSo.enabled = true;
    }
    tryHideCurrentActive() {
        if (this.currentActiveTr) {
            this.hide(this.currentActiveTr);
        }
    }
    __initialize() {
        super.__initialize();
        this.createPathClickedEvent = new Event_1.default();
        this.resetPathClickedEvent = new Event_1.default();
        this.finishPathClickedEvent = new Event_1.default();
        this.loopPathClickedEvent = new Event_1.default();
        this.tutorialCompleteEvent = new Event_1.default();
        this.endSessionClickedEvent = new Event_1.default();
        this.warningTr = null;
        this.tutorialTr = null;
        this.duringPathCreationUiTr = null;
        this.goToStartUiTr = null;
        this.endSessionUiTr = null;
        this.currentActiveTr = null;
        this.tutorialStepCount = 0;
    }
};
exports.UI = UI;
exports.UI = UI = __decorate([
    component
], UI);
//# sourceMappingURL=UI.js.map