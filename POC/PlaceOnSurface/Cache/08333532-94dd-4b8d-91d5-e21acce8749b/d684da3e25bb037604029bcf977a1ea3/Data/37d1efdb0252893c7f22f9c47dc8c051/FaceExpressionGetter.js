"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromFaceExpressionInput = void 0;
function invokeGetterFromFaceExpressionInput(inputValues) {
    return () => {
        if (inputValues.head.getFacesCount() > inputValues.head.faceIndex) {
            return inputValues.face.getExpressionWeightByName(inputValues.expression);
        }
    };
}
exports.invokeGetterFromFaceExpressionInput = invokeGetterFromFaceExpressionInput;
//# sourceMappingURL=FaceExpressionGetter.js.map