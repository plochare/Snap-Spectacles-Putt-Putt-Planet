"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeSetterFromBlendshapeInput = void 0;
function invokeSetterFromBlendshapeInput(inputValues) {
    return (v, lerp = 1.0) => {
        const targetWeight = MathUtils.lerp(inputValues.from, inputValues.to, v);
        const currentWeight = inputValues.mesh.getBlendShapeWeight(inputValues.blendshape);
        const result = MathUtils.lerp(currentWeight, targetWeight, lerp);
        inputValues.mesh.setBlendShapeWeight(inputValues.blendshape, result);
        return result;
    };
}
exports.invokeSetterFromBlendshapeInput = invokeSetterFromBlendshapeInput;
//# sourceMappingURL=BlendshapeSetter.js.map