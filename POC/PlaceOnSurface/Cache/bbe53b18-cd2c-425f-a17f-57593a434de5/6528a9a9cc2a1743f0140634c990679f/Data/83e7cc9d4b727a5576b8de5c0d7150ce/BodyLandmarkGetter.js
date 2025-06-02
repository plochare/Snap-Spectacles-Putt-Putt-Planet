"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromBodyLandmarkInput = void 0;
const TransformManipulatorBuilder_1 = require("../TransformManipulator/TransformManipulatorBuilder");
function invokeGetterFromBodyLandmarkInput(inputValues) {
    const manipulator = TransformManipulatorBuilder_1.TransformManipulatorBuilder.get(inputValues.body.getTransform(inputValues.landmark), inputValues.property);
    return () => manipulator.get()[inputValues.axis];
}
exports.invokeGetterFromBodyLandmarkInput = invokeGetterFromBodyLandmarkInput;
//# sourceMappingURL=BodyLandmarkGetter.js.map