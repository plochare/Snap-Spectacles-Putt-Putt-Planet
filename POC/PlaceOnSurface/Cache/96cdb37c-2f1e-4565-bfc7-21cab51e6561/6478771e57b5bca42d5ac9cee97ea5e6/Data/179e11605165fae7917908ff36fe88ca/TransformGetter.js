"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromTransformInput = void 0;
const TransformManipulatorBuilder_1 = require("../TransformManipulator/TransformManipulatorBuilder");
function invokeGetterFromTransformInput(inputValues) {
    const t = inputValues.so.getTransform();
    const manipulator = TransformManipulatorBuilder_1.TransformManipulatorBuilder.get(t, inputValues.property);
    return () => manipulator.get()[inputValues.axis];
}
exports.invokeGetterFromTransformInput = invokeGetterFromTransformInput;
//# sourceMappingURL=TransformGetter.js.map