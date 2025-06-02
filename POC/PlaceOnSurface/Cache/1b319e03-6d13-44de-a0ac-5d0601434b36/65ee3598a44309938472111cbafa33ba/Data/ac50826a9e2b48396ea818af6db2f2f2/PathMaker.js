"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PathMaker = void 0;
var __selfType = requireType("./PathMaker");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const IdleState_1 = require("./PathMakerStates/IdleState");
const BuildingPathState_1 = require("./PathMakerStates/BuildingPathState");
const Event_1 = require("../SpectaclesInteractionKit/Utils/Event");
// import { LineController } from "./LineController";
let PathMaker = class PathMaker extends BaseScriptComponent {
    get pathMade() {
        return this.pathMadeEvent.publicApi();
    }
    init() {
        this.camTr = this.camObj.getTransform();
        this.camOffsetTr = this.camObjOffset.getTransform();
    }
    start() {
        this.startStartPlacementState();
        this.ui.resetPathClicked.add(() => {
            // reset path
            if (this.surfaceDetection) {
                this.surfaceDetection.reset();
            }
            this.startStartPlacementState();
        });
    }
    startStartPlacementState() {
        this.currentState.stop();
        if (!this.surfaceDetection) {
            this.surfaceDetection = this.pfbSurfaceDetection.instantiate(null).getChild(0).getComponent("ScriptComponent");
        }
        /*
        this.currentState = new PlacingStartState(this,
            this.surfaceDetection,
            this.pfbLine,
            this.camTr,
            this.placingStartFinishLinesForwardDisplace,
            (startPosition, startRotation, startObject) => {
                this.startBuildingPathState(startPosition, startRotation, startObject);
            },

        );
        */
        this.currentState.start();
    }
    startBuildingPathState(startPosition, startRotation, startObject) {
        this.currentState.stop();
        this.currentState = new BuildingPathState_1.BuildingPathState(this, this.camTr, this.camOffsetTr, this.pathRmv, this.pathDistText, startPosition, startRotation, startObject, this.ui, this.playerPaceCalculator, this.pathmakingPlayerFeedback, this.bigMoveDistanceThreshold, this.hermiteResolution, this.resampleResoluton, (startPosition, startRotation, startObject, pathPoints, lastVisualPoints) => {
            this.startFinishPlacementState(startObject, startPosition, startRotation, pathPoints, lastVisualPoints);
        }, (startPosition, startRotation, startObject, splinePoints) => {
            // NOTE: Use this line anywhere you want a stack trace
            // print(`${new Error().stack}`);
            this.finishLoop(startObject, startPosition, startRotation, splinePoints);
        });
        this.currentState.start();
    }
    startFinishPlacementState(startObject, startPosition, startRotation, pathPoints, lastVisualPoints) {
        /*
        this.currentState.stop();
        this.currentState = new PlacingFinishState(
            startObject,
            this,
            this.surfaceDetection,
            this.pfbLine,
            this.camTr,
            this.placingStartFinishLinesForwardDisplace,
            pathPoints,
            lastVisualPoints,
            this.pathRmv,
            this.bigMoveDistanceThreshold,
            this.hermiteResolution,
            this.resampleResoluton,

            (finishPosition, finishRotation, finishObject, splinePoints: { position: vec3, rotation: quat }[]) => {
                const finishCtrl = finishObject.getComponent(LineController.getTypeName());
                finishCtrl.setRealVisual();
                this.finishSprint(
                    startObject,
                    startPosition,
                    startRotation,
                    finishObject,
                    finishPosition,
                    finishRotation,
                    splinePoints);
            }
        );
        this.currentState.start();
        */
    }
    finishLoop(startObject, startPosition, startRotation, splinePoints) {
        this.currentState.stop();
        this.currentState = new IdleState_1.IdleState();
        this.currentState.start();
        this.pathMadeEvent.invoke({
            isLoop: true,
            startObject,
            startPosition,
            startRotation,
            splinePoints
        });
    }
    finishSprint(startObject, startPosition, startRotation, finishObject, finishPosition, finishRotation, splinePoints) {
        this.currentState.stop();
        this.currentState = new IdleState_1.IdleState();
        this.currentState.start();
        this.pathMadeEvent.invoke({
            isLoop: false,
            startObject,
            finishObject,
            startPosition,
            startRotation,
            finishPosition,
            finishRotation,
            splinePoints
        });
    }
    __initialize() {
        super.__initialize();
        this.camTr = null;
        this.camOffsetTr = null;
        this.currentState = new IdleState_1.IdleState();
        this.bigMoveDistanceThreshold = 40;
        this.hermiteResolution = 12;
        this.resampleResoluton = 4;
        this.pathMadeEvent = new Event_1.default();
    }
};
exports.PathMaker = PathMaker;
exports.PathMaker = PathMaker = __decorate([
    component
], PathMaker);
//# sourceMappingURL=PathMaker.js.map