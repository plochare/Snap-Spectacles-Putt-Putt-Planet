"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ArrowsSpawner = void 0;
var __selfType = requireType("./ArrowsSpawner");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const CatmullRomSpline_1 = require("./Helpers/CatmullRomSpline");
const GetVectorsFromQuaternion_1 = require("./Helpers/GetVectorsFromQuaternion");
const LensInitializer_1 = require("./LensInitializer");
let ArrowsSpawner = class ArrowsSpawner extends BaseScriptComponent {
    start(arrowsPositions, mySplinePoints, myPathLength) {
        this.clearState();
        this.nextId = 0;
        this.splinePoints = mySplinePoints;
        this.pathLength = myPathLength;
        // clear some points from beginning and end
        const offset = 7;
        if (arrowsPositions.length > offset + 1) {
            arrowsPositions = arrowsPositions.slice(offset - 1, arrowsPositions.length - 1);
        }
        if (arrowsPositions.length > offset + 1) {
            arrowsPositions = arrowsPositions.slice(0, -offset);
        }
        this.positions = arrowsPositions;
        this.updateEvent.enabled = true;
    }
    stop() {
        this.updateEvent.enabled = false;
        this.clearState();
    }
    clearState() {
        this.spawnedArrows.forEach((i) => {
            i.objects.forEach((o) => {
                o.destroy();
            });
        });
        this.spawnedArrows = [];
    }
    onAwake() {
        this.updateEvent = this.createEvent("UpdateEvent");
        this.updateEvent.enabled = false;
        this.updateEvent.bind(() => {
            this.onUpdate();
        });
        this.mainCameraT = this.mainCamera.getTransform();
    }
    onUpdate() {
        this.trySpawnNextArrows();
    }
    getSpawnedArrowsCount() {
        return this.spawnedArrows.length;
    }
    getArrowsLimit() {
        return this.maxArrows;
    }
    tryGetNextArrowPositionAndRotation() {
        const currentOldest = this.tryGetOldestArrowPositionAndRotation();
        const currentOldestId = currentOldest ? currentOldest.id : -1;
        if (this.nextId < this.positions.length && this.nextId != currentOldestId) {
            return this.positions[this.nextId];
        }
        return null;
    }
    tryGetOldestArrowPositionAndRotation() {
        if (this.spawnedArrows.length) {
            return this.spawnedArrows[0];
        }
        return null;
    }
    removeOldestArrow() {
        if (this.spawnedArrows.length == 0) {
            throw new Error("No arrows spawned");
        }
        this.spawnedArrows[0].objects.forEach((o) => o.destroy());
        this.spawnedArrows.shift();
    }
    getDistanceOnSpline(posA, posB) {
        let tA = CatmullRomSpline_1.CatmullRomSpline.worldToSplineSpace(posA, this.splinePoints).t;
        let tB = CatmullRomSpline_1.CatmullRomSpline.worldToSplineSpace(posB, this.splinePoints).t;
        let dist = Math.abs(tA - tB) * this.pathLength;
        return dist;
    }
    incrementNextId(currentPosition) {
        const currentOldest = this.tryGetOldestArrowPositionAndRotation();
        if (!currentOldest) {
            throw new Error("Cannot increment next id. Current oldest is null. This potentially means that we tried to increment id before spawning the arrow");
        }
        const currentOldestId = currentOldest.id;
        while (this.nextId < this.positions.length && this.getDistanceOnSpline(this.positions[this.nextId], currentPosition) < this.minimalDistanceBetweenArrows) {
            this.nextId++;
            if (this.nextId >= this.positions.length) {
                this.nextId = 0;
            }
            if (this.nextId == currentOldestId) {
                break;
            }
        }
    }
    spawnNextArrow() {
        if (this.nextId >= this.positions.length) {
            throw new Error("No position to spawn next arrow");
        }
        let currentId = this.nextId;
        const currentPosition = this.positions[currentId];
        let posA = null;
        let posB = null;
        if (this.positions.length > currentId + 1) {
            posA = this.positions[currentId];
            posB = this.positions[currentId + 1];
        }
        else {
            posA = this.positions[currentId - 1];
            posB = this.positions[currentId];
        }
        let fwd = posB.sub(posA);
        fwd = fwd.normalize();
        let up = this.vec3up.projectOnPlane(fwd);
        up = up.normalize();
        let rot = quat.lookAt(fwd, up);
        const { leftArrow, rightArrow } = this.instantiateSideArrowObj(currentPosition, rot); // pass pos and rot
        this.spawnedArrows.push({
            pointPosition: currentPosition,
            objects: [leftArrow, rightArrow],
            id: currentId
        });
        this.incrementNextId(currentPosition);
    }
    instantiateSideArrowObj(position, rotation) {
        let radius = 120;
        let height = 45;
        const { forward, right, up } = GetVectorsFromQuaternion_1.GetVectorsFromQuaternion.getInstance().getVectorsFromQuaternion(rotation);
        let rightPos = position.add(right.uniformScale(radius)).add(up.uniformScale(height));
        let leftPos = position.add(right.uniformScale(-radius)).add(up.uniformScale(height));
        let rightRot = quat.angleAxis(Math.PI / 3, forward).multiply(rotation);
        let leftRot = quat.angleAxis(-Math.PI / 3, forward).multiply(rotation);
        let leftArrow = this.pfbSideArrow.instantiate(null);
        leftArrow.getTransform().setWorldPosition(rightPos);
        leftArrow.getTransform().setWorldRotation(rightRot);
        // Hack to aid artist need to see realtime material changes to spawned arrow
        leftArrow.getChild(0).getChild(0).getComponent("RenderMeshVisual").mainMaterial = this.arrowMaterial;
        let rightArrow = this.pfbSideArrow.instantiate(null);
        rightArrow.getTransform().setWorldPosition(leftPos);
        rightArrow.getTransform().setWorldRotation(leftRot);
        // Hack to aid artist need to see realtime material changes to spawned arrow
        rightArrow.getChild(0).getChild(0).getComponent("RenderMeshVisual").mainMaterial = this.arrowMaterial;
        return { leftArrow, rightArrow };
    }
    trySpawnNextArrows() {
        const currentPosition = LensInitializer_1.LensInitializer.getInstance().getPlayerGroundPos();
        const spawnedArrowsCount = this.getSpawnedArrowsCount();
        const limit = this.getArrowsLimit();
        if (spawnedArrowsCount >= limit) {
            const nextArrow = this.tryGetNextArrowPositionAndRotation();
            if (isNull(nextArrow)) {
                return;
            }
            const oldestArrow = this.tryGetOldestArrowPositionAndRotation();
            const toNext = this.getDistanceOnSpline(nextArrow, currentPosition);
            const toOldest = oldestArrow ? this.getDistanceOnSpline(oldestArrow.pointPosition, currentPosition) : Infinity;
            if (toNext < toOldest && toNext < this.revealDistance) {
                this.removeOldestArrow();
                this.spawnNextArrow();
            }
        }
        else {
            const canSpawn = limit - spawnedArrowsCount;
            for (let i = 0; i < canSpawn; i++) {
                const nextArrow = this.tryGetNextArrowPositionAndRotation();
                if (isNull(nextArrow)) {
                    break;
                }
                this.spawnNextArrow();
            }
        }
    }
    __initialize() {
        super.__initialize();
        this.positions = [];
        this.spawnedArrows = [];
        this.vec3up = vec3.up();
        this.splinePoints = [];
    }
};
exports.ArrowsSpawner = ArrowsSpawner;
exports.ArrowsSpawner = ArrowsSpawner = __decorate([
    component
], ArrowsSpawner);
//# sourceMappingURL=ArrowsSpawner.js.map