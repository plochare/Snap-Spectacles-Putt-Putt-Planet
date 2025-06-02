"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromBodyLandmarkDistanceInput = void 0;
function invokeGetterFromBodyLandmarkDistanceInput(inputValues) {
    return () => inputValues.body.getPosition(inputValues.landmarkFrom)
        .distance(inputValues.body.getPosition(inputValues.landmarkTo));
}
exports.invokeGetterFromBodyLandmarkDistanceInput = invokeGetterFromBodyLandmarkDistanceInput;
//# sourceMappingURL=BodyLandmarkDistanceGetter.js.map