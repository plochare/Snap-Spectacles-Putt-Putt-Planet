"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ComponentWithPrintOptions = void 0;
class ComponentWithPrintOptions extends BaseScriptComponent {
    printDebug(message) {
        if (this.printDebugStatements) {
            print(this.getSceneObject().name + ' - ' + message);
        }
    }
    printWarning(message) {
        if (this.printWarningStatements) {
            print(this.getSceneObject().name + ' - WARNING, ' + message);
        }
    }
}
exports.ComponentWithPrintOptions = ComponentWithPrintOptions;
//# sourceMappingURL=ComponentWithPrintOptions.js.map