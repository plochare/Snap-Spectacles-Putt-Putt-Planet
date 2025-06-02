"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var GetVectorsFromQuaternion_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.GetVectorsFromQuaternion = void 0;
var __selfType = requireType("./GetVectorsFromQuaternion");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let GetVectorsFromQuaternion = GetVectorsFromQuaternion_1 = class GetVectorsFromQuaternion extends BaseScriptComponent {
    static getInstance() {
        if (!GetVectorsFromQuaternion_1.instance) {
            // Note: this does not start in scene
            GetVectorsFromQuaternion_1.instance = new GetVectorsFromQuaternion_1();
        }
        return GetVectorsFromQuaternion_1.instance;
    }
    onAwake() {
        GetVectorsFromQuaternion_1.instance = this;
    }
    /**
     * Computes the forward, right, and up vectors from a quaternion.
     * @param q - The quaternion representing the rotation.
     * @returns An object containing forward, right, and up vectors.
     */
    getVectorsFromQuaternion(q) {
        // Convert quaternion to rotation matrix elements
        const xx = q.x * q.x;
        const yy = q.y * q.y;
        const zz = q.z * q.z;
        const xy = q.x * q.y;
        const xz = q.x * q.z;
        const yz = q.y * q.z;
        const wx = q.w * q.x;
        const wy = q.w * q.y;
        const wz = q.w * q.z;
        // Forward vector (Z-axis)
        const forwardVec = {
            x: 2 * (xz + wy),
            y: 2 * (yz - wx),
            z: 1 - 2 * (xx + yy),
        };
        // Right vector (X-axis)
        const rightVec = {
            x: 1 - 2 * (yy + zz),
            y: 2 * (xy + wz),
            z: 2 * (xz - wy),
        };
        // Up vector (Y-axis)
        const upVec = {
            x: 2 * (xy - wz),
            y: 1 - 2 * (xx + zz),
            z: 2 * (yz + wx),
        };
        const forward = new vec3(forwardVec.x, forwardVec.y, forwardVec.z);
        const right = new vec3(rightVec.x, rightVec.y, rightVec.z);
        const up = new vec3(upVec.x, upVec.y, upVec.z);
        return { forward: forward, right: right, up: up };
    }
    test() {
        // Example usage
        const quaternion = { x: 0, y: 0, z: 0, w: 1 };
        const { forward, right, up } = this.getVectorsFromQuaternion(quaternion);
    }
    __initialize() {
        super.__initialize();
    }
};
exports.GetVectorsFromQuaternion = GetVectorsFromQuaternion;
exports.GetVectorsFromQuaternion = GetVectorsFromQuaternion = GetVectorsFromQuaternion_1 = __decorate([
    component
], GetVectorsFromQuaternion);
//# sourceMappingURL=GetVectorsFromQuaternion.js.map