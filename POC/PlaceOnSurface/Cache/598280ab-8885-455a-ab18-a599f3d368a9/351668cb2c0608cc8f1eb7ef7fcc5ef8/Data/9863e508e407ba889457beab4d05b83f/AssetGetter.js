"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromAssetInput = void 0;
const PropertyPathParser_1 = require("../Utils/PropertyPathParser");
function invokeGetterFromAssetInput(inputValues) {
    let object;
    if (inputValues.asset.getTypeName() === 'Asset.Material') {
        object = inputValues.asset.mainPass;
    }
    return () => PropertyPathParser_1.PropertyPathParser.get(object, inputValues.propertyName);
}
exports.invokeGetterFromAssetInput = invokeGetterFromAssetInput;
//# sourceMappingURL=AssetGetter.js.map