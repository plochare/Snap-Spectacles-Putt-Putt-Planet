"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var LensInitializer_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.LensInitializer = void 0;
var __selfType = requireType("./LensInitializer");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let LensInitializer = LensInitializer_1 = class LensInitializer extends BaseScriptComponent {
    static getInstance() {
        if (!LensInitializer_1.instance) {
            throw new Error("Trying to get LensInitializer instance, but it hasn't been set.  You need to call it later.");
        }
        return LensInitializer_1.instance;
    }
    onAwake() {
        if (!LensInitializer_1.instance) {
            LensInitializer_1.instance = this;
        }
        else {
            throw new Error("LensInitializer already has an instance but another one is initializing. Aborting.");
        }
        this.camTr = this.camSo.getTransform();
        this.pathMaker.init();
        //this.pathWalker.init();
        // this.ui.getSceneObject().enabled = true;
        this.tutorialController.startTutorial(() => {
            this.pathMaker.start();
        });
    }
    setFloorOffsetFromCamera(floorPos) {
        // Get the difference between current cam height and this Y value 
        // Meaning, we take the camera's height at floor set to be the player's "height" for this path 
        let camPos = this.camTr.getWorldPosition();
        let offset = floorPos.sub(camPos);
        // Because player is looking down when height is taken, 
        // offset is closer than it will be (when player is looking out)
        this.floorOffsetFromCamera = offset.y - 10;
        this.floorIsSet = true;
    }
    getPlayerGroundPos() {
        if (!this.floorIsSet) {
            throw Error("Floor not set. You need to call it later.");
        }
        return this.camTr.getWorldPosition().add(this.vec3up.uniformScale(this.floorOffsetFromCamera));
    }
    __initialize() {
        super.__initialize();
        this.floorOffsetFromCamera = -100;
        this.floorIsSet = false;
        this.vec3up = vec3.up();
    }
};
exports.LensInitializer = LensInitializer;
exports.LensInitializer = LensInitializer = LensInitializer_1 = __decorate([
    component
], LensInitializer);
//# sourceMappingURL=LensInitializer.js.map