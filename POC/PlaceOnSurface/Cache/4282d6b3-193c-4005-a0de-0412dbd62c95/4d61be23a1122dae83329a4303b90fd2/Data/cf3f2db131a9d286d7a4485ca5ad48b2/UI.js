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
//import { LoopController } from "./LoopController";
let UI = class UI extends BaseScriptComponent {
    get createPathClicked() {
        return this.createPathClickedEvent.publicApi();
    }
    get resetPathClicked() {
        return this.resetPathClickedEvent.publicApi();
    }
    get tutorialComplete() {
        return this.tutorialCompleteEvent.publicApi();
    }
    onAwake() {
        this.warningTr = this.warningTutorialUI.getTransform();
    }
    showHomeUi() {
    }
    showTutorialUi() {
    }
    showDuringPathCreationUi() {
    }
    showEndSessionUi() {
    }
    showGoToStartUi(distance) {
    }
    initLoopUi(startTr) {
    }
    showLoopUi() {
    }
    hideLoopUi() {
    }
    hideUi() {
    }
    onProgressTutorial() {
    }
    onCreatePlaneDetectorButton() {
        this.hide(this.warningTr);
        this.tutorialCompleteEvent.invoke();
        this.createPathClickedEvent.invoke();
    }
    onFinishCreatePathButton() {
    }
    onResetCreatePathButton() {
    }
    onStopWalkingButton() {
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
    }
    __initialize() {
        super.__initialize();
        this.createPathClickedEvent = new Event_1.default();
        this.resetPathClickedEvent = new Event_1.default();
        this.tutorialCompleteEvent = new Event_1.default();
        this.warningTr = null;
    }
};
exports.UI = UI;
exports.UI = UI = __decorate([
    component
], UI);
//# sourceMappingURL=UI.js.map