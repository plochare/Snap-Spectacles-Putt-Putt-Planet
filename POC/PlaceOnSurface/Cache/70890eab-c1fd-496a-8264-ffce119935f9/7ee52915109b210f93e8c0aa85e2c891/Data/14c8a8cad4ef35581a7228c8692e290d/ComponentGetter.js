"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.invokeGetterFromComponentInput = void 0;
const PropertyPathParser_1 = require("../Utils/PropertyPathParser");
function invokeGetterFromComponentInput(inputValue) {
    return () => PropertyPathParser_1.PropertyPathParser.get(inputValue.component, inputValue.propertyName);
}
exports.invokeGetterFromComponentInput = invokeGetterFromComponentInput;
//# sourceMappingURL=ComponentGetter.js.map