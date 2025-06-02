"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromBlendshapeInput = void 0;
function invokeGetterFromBlendshapeInput(inputValues) {
    return () => inputValues.mesh.getBlendShapeWeight(inputValues.name);
}
exports.invokeGetterFromBlendshapeInput = invokeGetterFromBlendshapeInput;
//# sourceMappingURL=BlendshapeGetter.js.map