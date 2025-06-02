"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.LineController = void 0;
var __selfType = requireType("./LineController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LinearAlgebra_1 = require("./Helpers/LinearAlgebra");
const SoundController_1 = require("./SoundController");
let LineController = class LineController extends BaseScriptComponent {
    init(beginsAsStartLine) {
        this.countdownSo.enabled = false;
        this.collisionStayRemover = this.countdownCollider.onCollisionStay.add((e) => this.onCollisionStay(e));
        this.lapCounterSo = this.lapCounter3Dtext.getSceneObject();
        this.lapCounterSo.enabled = false;
        this.isStart = beginsAsStartLine;
        if (!beginsAsStartLine) {
            let pos = this.countdownCollider.getTransform().getLocalPosition();
            pos.z = -pos.z;
            this.countdownCollider.getTransform().setLocalPosition(pos);
        }
        this.setVisual();
        this.visualTr = this.visualSo.getTransform();
        this.setHintVisual();
        this.pathCollisionEvents.init(this.isStart ? "start" : "finish", this.camCol.getSceneObject().getParent().getTransform(), this.camCol, this.pathWalker);
    }
    setHintVisual() {
        this.hintStartVisual.enabled = this.isStart;
        this.hintFinishVisual.enabled = !this.isStart;
        this.realVisualsParent.enabled = false;
        this.hintVisualsParent.enabled = true;
    }
    setRealVisual() {
        this.realVisualsParent.enabled = true;
        this.hintVisualsParent.enabled = false;
    }
    setEnableWalkCountdown() {
        this.enableWalkCountdown = true;
    }
    startCountDown() {
        let delay = 1;
        for (let i = 0; i < this.countdownSoArray.length + 1; i++) {
            let evt = this.createEvent("DelayedCallbackEvent");
            evt.bind(() => {
                this.countdownSoArray.forEach(so => {
                    so.enabled = false;
                });
                if (i == 0) {
                    SoundController_1.SoundController.getInstance().playSound("onCountdown");
                }
                if (i < this.countdownSoArray.length) {
                    this.countdownSo.enabled = true;
                    this.countdownSoArray[i].enabled = true;
                }
                if (i == this.countdownSoArray.length) {
                    this.countdownSo.enabled = false;
                }
            });
            evt.reset(delay * i);
        }
        // return delay
        return delay * (this.countdownSoArray.length + 1);
    }
    onStartSprint() {
        this.startLineTurnArrow.enabled = true;
        this.finishLineTurnArrow.enabled = true;
    }
    setVisual() {
        this.startVisual.enabled = this.isStart;
        this.finishVisual.enabled = !this.isStart;
    }
    onSprintStartAreaCollision() {
        this.enableWalkCountdown = false;
        if (this.collisionStayRemover) {
            this.countdownCollider.onCollisionStay.remove(this.collisionStayRemover);
        }
        this.countdownCollider.enabled = false;
        if (this.isStart) {
            this.startCountDown();
        }
    }
    onReverseSprintTrackVisuals() {
        this.isStart = !this.isStart;
        this.setVisual();
        let rot = LinearAlgebra_1.LinearAlgebra.flippedRot(this.visualTr.getWorldRotation(), this.visualTr.up);
        this.visualTr.setWorldRotation(rot);
    }
    // This is only called on the start visual
    onIncrementLoop(nextLapCount) {
        this.startVisual.enabled = false;
        this.lapCounterSo.enabled = true;
        this.lapCounter3Dtext.text = "LAP " + nextLapCount;
    }
    onCollisionStay(e) {
        if (this.enableWalkCountdown) {
            if (e.collision.collider.isSame(this.camCol)) {
                this.pathWalker.onSprintStartAreaCollision(!this.isStart);
                this.enableWalkCountdown = false;
            }
        }
    }
    __initialize() {
        super.__initialize();
        this.enableWalkCountdown = false;
        this.lapCounterSo = null;
        this.visualTr = null;
    }
};
exports.LineController = LineController;
exports.LineController = LineController = __decorate([
    component
], LineController);
//# sourceMappingURL=LineController.js.map