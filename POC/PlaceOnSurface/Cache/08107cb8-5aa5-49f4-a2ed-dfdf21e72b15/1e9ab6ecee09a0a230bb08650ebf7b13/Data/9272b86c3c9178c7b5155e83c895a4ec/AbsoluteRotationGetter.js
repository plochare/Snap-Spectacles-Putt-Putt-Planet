"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromAbsoluteRotationInput = void 0;
function invokeGetterFromAbsoluteRotationInput(inputValues) {
    const t = inputValues.so.getTransform();
    return () => Math.abs(t.getWorldRotation().toEulerAngles()
        .dot(inputValues.coef));
}
exports.invokeGetterFromAbsoluteRotationInput = invokeGetterFromAbsoluteRotationInput;
//# sourceMappingURL=AbsoluteRotationGetter.js.map