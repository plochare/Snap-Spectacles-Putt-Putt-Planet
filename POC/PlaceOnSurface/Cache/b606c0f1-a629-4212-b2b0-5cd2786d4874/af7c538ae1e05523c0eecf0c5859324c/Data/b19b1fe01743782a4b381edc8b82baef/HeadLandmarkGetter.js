"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromHeadLandmarkInput = void 0;
function invokeGetterFromHeadLandmarkInput(inputValues) {
    return () => {
        if (inputValues.head.getFacesCount() > inputValues.head.faceIndex) {
            return inputValues.head.getLandmark(inputValues.landmark)[inputValues.axis];
        }
    };
}
exports.invokeGetterFromHeadLandmarkInput = invokeGetterFromHeadLandmarkInput;
//# sourceMappingURL=HeadLandmarkGetter.js.map