"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeSetterFromTransformAxisInput = exports.invokeSetterFromTransformVecInput = void 0;
const TransformManipulatorBuilder_1 = require("../TransformManipulator/TransformManipulatorBuilder");
function invokeSetterFromTransformVecInput(inputValues) {
    const t = inputValues.so.getTransform();
    const manipulator = TransformManipulatorBuilder_1.TransformManipulatorBuilder.get(t, inputValues.property);
    return (v, lerp = 1.0) => {
        const targetValue = vec3.lerp(inputValues.from, inputValues.to, v);
        const result = vec3.lerp(manipulator.get(), targetValue, lerp);
        manipulator.set(result);
        return result;
    };
}
exports.invokeSetterFromTransformVecInput = invokeSetterFromTransformVecInput;
function invokeSetterFromTransformAxisInput(inputValues) {
    const t = inputValues.so.getTransform();
    const manipulator = TransformManipulatorBuilder_1.TransformManipulatorBuilder.get(t, inputValues.property);
    return (v, lerp = 1.0) => {
        const targetValue = manipulator.get();
        targetValue[inputValues.axis] = MathUtils.lerp(inputValues.from, inputValues.to, v);
        const result = vec3.lerp(manipulator.get(), targetValue, lerp);
        manipulator.set(result);
        return result.x;
    };
}
exports.invokeSetterFromTransformAxisInput = invokeSetterFromTransformAxisInput;
//# sourceMappingURL=TransformSetter.js.map