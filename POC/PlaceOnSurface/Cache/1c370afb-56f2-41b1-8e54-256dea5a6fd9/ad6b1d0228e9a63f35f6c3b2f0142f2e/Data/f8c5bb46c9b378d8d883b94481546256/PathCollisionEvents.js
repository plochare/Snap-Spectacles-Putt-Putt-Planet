"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PathCollisionEvents = void 0;
var __selfType = requireType("./PathCollisionEvents");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let PathCollisionEvents = class PathCollisionEvents extends BaseScriptComponent {
    init(myMsg, myCamTr, myCamCol, myPathWalker) {
        this.msg = myMsg;
        this.camTr = myCamTr;
        this.camCol = myCamCol;
        this.pathWalker = myPathWalker;
        this.tr = this.sceneObject.getTransform();
        this.col = this.sceneObject.getChild(0).getComponent("ColliderComponent");
        this.col.onCollisionEnter.add((e) => this.onCollisionEnter(e));
        this.col.onCollisionExit.add((e) => this.onCollisionExit(e));
    }
    onCollisionEnter(e) {
        if (e.collision.collider.isSame(this.camCol)) {
            this.enterPoint = this.camTr.getWorldPosition();
        }
    }
    onCollisionExit(e) {
        if (e.collision.collider.isSame(this.camCol)) {
            let exitPoint = this.camTr.getWorldPosition();
            let dir = null;
            if (!isNull(this.enterPoint)) {
                dir = exitPoint.sub(this.enterPoint);
                dir = dir.normalize();
                let dot = this.tr.forward.dot(dir);
                if (this.msg.includes("start")) {
                    this.pathWalker.onStartCollisionExit(dot);
                }
                else if (this.msg.includes("finish")) {
                    this.pathWalker.onFinishCollisionExit(dot);
                }
                // Reset
                this.enterPoint = null;
            }
            else {
                print("WARNING: cam fwd used for collision");
            }
        }
    }
    __initialize() {
        super.__initialize();
        this.enterPoint = null;
    }
};
exports.PathCollisionEvents = PathCollisionEvents;
exports.PathCollisionEvents = PathCollisionEvents = __decorate([
    component
], PathCollisionEvents);
//# sourceMappingURL=PathCollisionEvents.js.map