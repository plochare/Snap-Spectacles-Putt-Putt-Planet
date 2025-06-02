"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromSODistanceInput = void 0;
function invokeGetterFromSODistanceInput(inputValues) {
    const fromT = inputValues.from.getTransform(), toT = inputValues.to.getTransform();
    return () => fromT.getWorldPosition().distance(toT.getWorldPosition());
}
exports.invokeGetterFromSODistanceInput = invokeGetterFromSODistanceInput;
//# sourceMappingURL=SODistanceGetter.js.map