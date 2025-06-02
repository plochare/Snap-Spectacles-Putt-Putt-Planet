"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.WiredParametersInput = exports.TransformType = exports.OutputType = exports.OutputPropertyType = exports.TransformAxis2D = exports.TransformAxis = exports.BodyLandmarks = exports.InputPropertyType = void 0;
const ComponentWithPrintOptions_1 = require("./Debug/ComponentWithPrintOptions");
var InputPropertyType;
(function (InputPropertyType) {
    InputPropertyType[InputPropertyType["Transform"] = 0] = "Transform";
    InputPropertyType[InputPropertyType["Asset"] = 1] = "Asset";
    InputPropertyType[InputPropertyType["Component"] = 2] = "Component";
    InputPropertyType[InputPropertyType["BodyLandmark"] = 3] = "BodyLandmark";
    InputPropertyType[InputPropertyType["HeadLandmark"] = 4] = "HeadLandmark";
    InputPropertyType[InputPropertyType["DistanceBetweenPoints"] = 5] = "DistanceBetweenPoints";
    InputPropertyType[InputPropertyType["AbsoluteRotation"] = 6] = "AbsoluteRotation";
    InputPropertyType[InputPropertyType["Blendshape"] = 7] = "Blendshape";
    InputPropertyType[InputPropertyType["FaceExpression"] = 8] = "FaceExpression";
    InputPropertyType[InputPropertyType["DistanceBodyMesh"] = 9] = "DistanceBodyMesh";
})(InputPropertyType || (exports.InputPropertyType = InputPropertyType = {}));
var BodyLandmarks;
(function (BodyLandmarks) {
    BodyLandmarks[BodyLandmarks["Hips"] = 0] = "Hips";
    BodyLandmarks[BodyLandmarks["Spine"] = 1] = "Spine";
    BodyLandmarks[BodyLandmarks["Spine1"] = 2] = "Spine1";
    BodyLandmarks[BodyLandmarks["Spine2"] = 3] = "Spine2";
    BodyLandmarks[BodyLandmarks["Neck"] = 4] = "Neck";
    BodyLandmarks[BodyLandmarks["Head"] = 5] = "Head";
    BodyLandmarks[BodyLandmarks["LeftShoulder"] = 6] = "LeftShoulder";
    BodyLandmarks[BodyLandmarks["LeftArm"] = 7] = "LeftArm";
    BodyLandmarks[BodyLandmarks["LeftForeArm"] = 8] = "LeftForeArm";
    BodyLandmarks[BodyLandmarks["LeftHand"] = 9] = "LeftHand";
    BodyLandmarks[BodyLandmarks["RightShoulder"] = 10] = "RightShoulder";
    BodyLandmarks[BodyLandmarks["RightArm"] = 11] = "RightArm";
    BodyLandmarks[BodyLandmarks["RightForeArm"] = 12] = "RightForeArm";
    BodyLandmarks[BodyLandmarks["RightHand"] = 13] = "RightHand";
    BodyLandmarks[BodyLandmarks["LeftUpLeg"] = 14] = "LeftUpLeg";
    BodyLandmarks[BodyLandmarks["LeftLeg"] = 15] = "LeftLeg";
    BodyLandmarks[BodyLandmarks["LeftFoot"] = 16] = "LeftFoot";
    BodyLandmarks[BodyLandmarks["LeftToeBase"] = 17] = "LeftToeBase";
    BodyLandmarks[BodyLandmarks["RightUpLeg"] = 18] = "RightUpLeg";
    BodyLandmarks[BodyLandmarks["RightLeg"] = 19] = "RightLeg";
    BodyLandmarks[BodyLandmarks["RightFoot"] = 20] = "RightFoot";
    BodyLandmarks[BodyLandmarks["RightToeBase"] = 21] = "RightToeBase";
})(BodyLandmarks || (exports.BodyLandmarks = BodyLandmarks = {}));
var TransformAxis;
(function (TransformAxis) {
    TransformAxis[TransformAxis["x"] = 0] = "x";
    TransformAxis[TransformAxis["y"] = 1] = "y";
    TransformAxis[TransformAxis["z"] = 2] = "z";
})(TransformAxis || (exports.TransformAxis = TransformAxis = {}));
var TransformAxis2D;
(function (TransformAxis2D) {
    TransformAxis2D[TransformAxis2D["x"] = 0] = "x";
    TransformAxis2D[TransformAxis2D["y"] = 1] = "y";
})(TransformAxis2D || (exports.TransformAxis2D = TransformAxis2D = {}));
var OutputPropertyType;
(function (OutputPropertyType) {
    OutputPropertyType[OutputPropertyType["Transform"] = 0] = "Transform";
    OutputPropertyType[OutputPropertyType["Asset"] = 1] = "Asset";
    OutputPropertyType[OutputPropertyType["Component"] = 2] = "Component";
    OutputPropertyType[OutputPropertyType["Blendshape"] = 3] = "Blendshape";
    OutputPropertyType[OutputPropertyType["Atlas"] = 4] = "Atlas";
    OutputPropertyType[OutputPropertyType["AnimationWeight"] = 5] = "AnimationWeight";
})(OutputPropertyType || (exports.OutputPropertyType = OutputPropertyType = {}));
var OutputType;
(function (OutputType) {
    OutputType[OutputType["Float"] = 0] = "Float";
    OutputType[OutputType["Vec2"] = 1] = "Vec2";
    OutputType[OutputType["Vec3"] = 2] = "Vec3";
    OutputType[OutputType["RGBA"] = 3] = "RGBA";
    OutputType[OutputType["RGB"] = 4] = "RGB";
})(OutputType || (exports.OutputType = OutputType = {}));
var TransformType;
(function (TransformType) {
    TransformType[TransformType["Vec3"] = 0] = "Vec3";
    TransformType[TransformType["Axis"] = 1] = "Axis";
})(TransformType || (exports.TransformType = TransformType = {}));
class WiredParametersInput extends ComponentWithPrintOptions_1.ComponentWithPrintOptions {
}
exports.WiredParametersInput = WiredParametersInput;
//# sourceMappingURL=WiredParametersInput.js.map