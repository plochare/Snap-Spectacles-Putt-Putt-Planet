"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PlaceSurfaceDetector = void 0;
var __selfType = requireType("./PlaceSurfaceDetector");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const IdleState_1 = require("./PlacingStates/IdleState");
const PlacingStartState_1 = require("./PlacingStates/PlacingStartState");
let PlaceSurfaceDetector = class PlaceSurfaceDetector extends BaseScriptComponent {
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
        this.currentState = new PlacingStartState_1.PlacingStartState(this, this.surfaceDetection, this.pfbPlaceObject, this.camTr, this.placingStartFinishLinesForwardDisplace, (startPosition, startRotation, startObject) => {
            this.startBuildingPathState(startPosition, startRotation, startObject);
        });
        this.currentState.start();
    }
    startBuildingPathState(startPosition, startRotation, startObject) {
    }
    __initialize() {
        super.__initialize();
        this.camTr = null;
        this.camOffsetTr = null;
        this.currentState = new IdleState_1.IdleState();
        this.bigMoveDistanceThreshold = 40;
        this.hermiteResolution = 12;
        this.resampleResoluton = 4;
    }
};
exports.PlaceSurfaceDetector = PlaceSurfaceDetector;
exports.PlaceSurfaceDetector = PlaceSurfaceDetector = __decorate([
    component
], PlaceSurfaceDetector);
//# sourceMappingURL=PlaceSurfaceDetector.js.map