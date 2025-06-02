"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WiredParameters = void 0;
var __selfType = requireType("./Wired Parameters");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const WiredParametersInput_1 = require("./Modules/WiredParametersInput");
const TransformGetter_1 = require("./Modules/InputGetter/TransformGetter");
const AssetGetter_1 = require("./Modules/InputGetter/AssetGetter");
const ComponentGetter_1 = require("./Modules/InputGetter/ComponentGetter");
const SODistanceGetter_1 = require("./Modules/InputGetter/SODistanceGetter");
const Body_1 = require("./Modules/Body");
const BodyLandmarkDistanceGetter_1 = require("./Modules/InputGetter/BodyLandmarkDistanceGetter");
const AbsoluteRotationGetter_1 = require("./Modules/InputGetter/AbsoluteRotationGetter");
const BlendshapeGetter_1 = require("./Modules/InputGetter/BlendshapeGetter");
const FaceExpressionGetter_1 = require("./Modules/InputGetter/FaceExpressionGetter");
const DestructionHelper_1 = require("./Modules/Scene/DestructionHelper");
const HeadLandmarkGetter_1 = require("./Modules/InputGetter/HeadLandmarkGetter");
const BodyLandmarkGetter_1 = require("./Modules/InputGetter/BodyLandmarkGetter");
const TransformSetter_1 = require("./Modules/OutputSetter/TransformSetter");
const ComponentSetter_1 = require("./Modules/OutputSetter/ComponentSetter");
const AssetSetter_1 = require("./Modules/OutputSetter/AssetSetter");
const BlendshapeSetter_1 = require("./Modules/OutputSetter/BlendshapeSetter");
const AnimationWeightSetter_1 = require("./Modules/OutputSetter/AnimationWeightSetter");
const AtlasSetter_1 = require("./Modules/OutputSetter/AtlasSetter");
const Easing_1 = require("./Modules/Animation/Easing");
let WiredParameters = class WiredParameters extends WiredParametersInput_1.WiredParametersInput {
    onAwake() {
        if (!this.validInputs()) {
            return;
        }
        this.invokeInputGetter();
        this.invokeOutputSetter();
        this.initializeEasingFunction();
        this.initializeUpdateEvent();
    }
    validInputs() {
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.Transform && isNull(this.inputSO)) {
            print("Warning! Transform input is missing.");
            return false;
        }
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.Asset && isNull(this.inputAsset)) {
            print("Warning! Asset input is missing.");
            return false;
        }
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.DistanceBetweenPoints && (isNull(this.inputDistanceSOFrom) || isNull(this.inputDistanceSOTo))) {
            print("Warning! Object input is missing.");
            return false;
        }
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.AbsoluteRotation && isNull(this.inputAbsoluteRotationSO)) {
            print("Warning! Object input is missing.");
            return false;
        }
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.Blendshape && isNull(this.inputBlendshapeMesh)) {
            print("Warning! Mesh input is missing.");
            return false;
        }
        if (this.inputMode === WiredParametersInput_1.InputPropertyType.FaceExpression && isNull(this.inputFaceMesh)) {
            print("Warning! Face Mesh input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.Transform && isNull(this.outputSO)) {
            print("Warning! Transform input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.Asset && isNull(this.outputAsset)) {
            print("Warning! Asset input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.Component && isNull(this.outputComponent)) {
            print("Warning! Component input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.Blendshape && isNull(this.outputBlendshapeMesh)) {
            print("Warning! Mesh input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.Atlas && isNull(this.outputAtlasTexture)) {
            print("Warning! Texture input is missing.");
            return false;
        }
        if (this.outputMode === WiredParametersInput_1.OutputPropertyType.AnimationWeight && isNull(this.outputAnimationMixer)) {
            print("Warning! Animation Mixer input is missing.");
            return false;
        }
        return true;
    }
    /**
     * Invokes getter function depending on selected input options.
     * @private
     */
    invokeInputGetter() {
        switch (this.inputMode) {
            case WiredParametersInput_1.InputPropertyType.Transform:
                this.getter = (0, TransformGetter_1.invokeGetterFromTransformInput)({
                    so: this.inputSO,
                    property: this.inputTransformProperty,
                    axis: WiredParametersInput_1.TransformAxis[this.inputTransformAxis]
                });
                break;
            case WiredParametersInput_1.InputPropertyType.Asset:
                this.getter = (0, AssetGetter_1.invokeGetterFromAssetInput)({
                    asset: this.inputAsset,
                    propertyName: this.inputAssetProperty
                });
                break;
            case WiredParametersInput_1.InputPropertyType.Component:
                this.getter = (0, ComponentGetter_1.invokeGetterFromComponentInput)({
                    component: this.inputComponent,
                    propertyName: this.inputComponentProperty
                });
                break;
            case WiredParametersInput_1.InputPropertyType.DistanceBetweenPoints:
                this.getter = (0, SODistanceGetter_1.invokeGetterFromSODistanceInput)({
                    from: this.inputDistanceSOFrom,
                    to: this.inputDistanceSOTo
                });
                break;
            case WiredParametersInput_1.InputPropertyType.DistanceBodyMesh:
                this.getter = (0, BodyLandmarkDistanceGetter_1.invokeGetterFromBodyLandmarkDistanceInput)({
                    landmarkFrom: WiredParametersInput_1.BodyLandmarks[this.inputBodyLandmarkFrom],
                    landmarkTo: WiredParametersInput_1.BodyLandmarks[this.inputBodyLandmarkTo],
                    body: this.getBody()
                });
                break;
            case WiredParametersInput_1.InputPropertyType.AbsoluteRotation:
                this.getter = (0, AbsoluteRotationGetter_1.invokeGetterFromAbsoluteRotationInput)({
                    so: this.inputAbsoluteRotationSO,
                    coef: this.inputAbsoluteRotationCoef
                });
                break;
            case WiredParametersInput_1.InputPropertyType.Blendshape:
                this.getter = (0, BlendshapeGetter_1.invokeGetterFromBlendshapeInput)({
                    mesh: this.inputBlendshapeMesh,
                    name: this.inputBlendshapeName
                });
                break;
            case WiredParametersInput_1.InputPropertyType.FaceExpression:
                this.getter = (0, FaceExpressionGetter_1.invokeGetterFromFaceExpressionInput)({
                    head: this.getHead(this.inputFaceMesh.mesh.control.faceIndex),
                    face: this.inputFaceMesh.mesh.control,
                    expression: this.inputFaceExpressionName
                });
                break;
            case WiredParametersInput_1.InputPropertyType.HeadLandmark:
                this.getter = (0, HeadLandmarkGetter_1.invokeGetterFromHeadLandmarkInput)({
                    head: this.getHead(this.inputHeadIndex),
                    landmark: this.inputHeadLandmark,
                    axis: WiredParametersInput_1.TransformAxis2D[this.inputHeadTransformAxis]
                });
                break;
            case WiredParametersInput_1.InputPropertyType.BodyLandmark:
                this.getter = (0, BodyLandmarkGetter_1.invokeGetterFromBodyLandmarkInput)({
                    body: this.getBody(),
                    landmark: WiredParametersInput_1.BodyLandmarks[this.inputBodyLandmark],
                    property: this.inputBodyTransformProperty,
                    axis: WiredParametersInput_1.TransformAxis[this.inputBodyTransformAxis]
                });
                break;
            default:
                this.printWarning('Invalid Input Mode: ' + this.inputMode);
                break;
        }
    }
    /**
     * Invokes setter function depending on selected input options.
     * @private
     */
    invokeOutputSetter() {
        switch (this.outputMode) {
            case WiredParametersInput_1.OutputPropertyType.Transform: {
                switch (this.outputTransformValue) {
                    case WiredParametersInput_1.TransformType.Axis:
                        this.setter = (0, TransformSetter_1.invokeSetterFromTransformVecInput)({
                            so: this.outputSO,
                            property: this.outputTransformProperty,
                            from: this.outputTransformVecFrom,
                            to: this.outputTransformVecTo,
                        });
                        break;
                    case WiredParametersInput_1.TransformType.Vec3:
                        this.setter = (0, TransformSetter_1.invokeSetterFromTransformAxisInput)({
                            so: this.outputSO,
                            property: this.outputTransformProperty,
                            axis: WiredParametersInput_1.TransformAxis[this.outputTransformAxis],
                            from: this.outputTransformAxisFrom,
                            to: this.outputTransformAxisTo
                        });
                        break;
                    default:
                        this.printWarning('Invalid Transform Output Type: ' + this.outputTransformValue);
                        break;
                }
                break;
            }
            case WiredParametersInput_1.OutputPropertyType.Component: {
                let from, to, lerpF;
                switch (this.outputComponentValue) {
                    case WiredParametersInput_1.OutputType.Float:
                        from = this.outputComponentFloatFrom;
                        to = this.outputComponentFloatTo;
                        lerpF = MathUtils.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.Vec2:
                        from = this.outputComponentVec2From;
                        to = this.outputComponentVec2To;
                        lerpF = vec2.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.Vec3:
                        from = this.outputComponentVec3From;
                        to = this.outputComponentVec3To;
                        lerpF = vec3.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.RGB:
                        from = this.outputComponentRGBFrom;
                        to = this.outputComponentRGBTo;
                        lerpF = vec3.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.RGBA:
                        from = this.outputComponentRGBAFrom;
                        to = this.outputComponentRGBATo;
                        lerpF = vec4.lerp;
                        break;
                    default:
                        this.printWarning('Invalid Component Output Type: ' + this.outputComponentValue);
                        break;
                }
                this.setter = (0, ComponentSetter_1.invokeSetterFromComponentInput)({
                    component: this.outputComponent,
                    property: this.outputComponentProperty,
                    from: from,
                    to: to,
                    lerp: lerpF
                });
                break;
            }
            case WiredParametersInput_1.OutputPropertyType.Asset: {
                let from, to, lerpF;
                switch (this.outputAssetValue) {
                    case WiredParametersInput_1.OutputType.Float:
                        from = this.outputAssetFloatFrom;
                        to = this.outputAssetFloatTo;
                        lerpF = MathUtils.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.Vec2:
                        from = this.outputAssetVec2From;
                        to = this.outputAssetVec2To;
                        lerpF = vec2.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.Vec3:
                        from = this.outputAssetVec3From;
                        to = this.outputAssetVec3To;
                        lerpF = vec3.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.RGB:
                        from = this.outputAssetRGBFrom;
                        to = this.outputAssetRGBTo;
                        lerpF = vec3.lerp;
                        break;
                    case WiredParametersInput_1.OutputType.RGBA:
                        from = this.outputAssetRGBAFrom;
                        to = this.outputAssetRGBATo;
                        lerpF = vec4.lerp;
                        break;
                    default:
                        this.printWarning('Invalid Asset Output Type: ' + this.outputAssetValue);
                        break;
                }
                this.setter = (0, AssetSetter_1.invokeSetterFromAssetInput)({
                    asset: this.outputAsset,
                    property: this.outputAssetProperty,
                    from: from,
                    to: to,
                    lerp: lerpF
                });
                break;
            }
            case WiredParametersInput_1.OutputPropertyType.Blendshape:
                this.setter = (0, BlendshapeSetter_1.invokeSetterFromBlendshapeInput)({
                    mesh: this.outputBlendshapeMesh,
                    blendshape: this.outputBlendshapeName,
                    from: this.outputBlendshapeFrom,
                    to: this.outputBlendshapeTo
                });
                break;
            case WiredParametersInput_1.OutputPropertyType.AnimationWeight:
                this.setter = (0, AnimationWeightSetter_1.invokeSetterFromAnimationWeightInput)({
                    mixer: this.outputAnimationMixer,
                    layer: this.outputAnimationMixerLayer,
                    from: this.outputAnimationMixerFrom,
                    to: this.outputAnimationMixerTo
                });
                break;
            case WiredParametersInput_1.OutputPropertyType.Atlas:
                this.setter = (0, AtlasSetter_1.invokeSetterFromAtlasInput)({
                    texture: this.outputAtlasTexture,
                    yoyo: this.outputAtlasYoyo,
                    from: this.outputAtlasFrom,
                    to: this.outputAtlasTo
                });
                break;
            default:
                this.printWarning('Invalid Output Mode: ' + this.outputMode);
                break;
        }
    }
    initializeEasingFunction() {
        this.easing = Easing_1.easings[this.interpolation];
    }
    initializeUpdateEvent() {
        this.createEvent('UpdateEvent').bind(() => {
            let value = this.getter();
            if (value !== undefined) {
                this.printDebug('Input Value: ' + value.toFixed(2));
                value = MathUtils.clamp(value, this.fromValue, this.toValue);
                value = MathUtils.remap(value, this.fromValue, this.toValue, 0.0, 1.0);
                const result = this.setter(this.easing(value), this.lerp ? this.lerpCoef : 1.0);
                if (typeof result === 'number') {
                    this.printDebug('Result Value: ' + result.toFixed(2));
                }
                else {
                    this.printDebug('Result Value: ' + result);
                }
            }
        });
    }
    getHead(faceIndex) {
        const headSO = this.destructionHelper.createSceneObject();
        const headC = this.destructionHelper.getOrAddComponent(headSO, 'Head');
        headC.faceIndex = faceIndex;
        return headC;
    }
    getBody() {
        return new Body_1.Body(this.bodyPrefab);
    }
    __initialize() {
        super.__initialize();
        this.destructionHelper = new DestructionHelper_1.DestructionHelper();
    }
};
exports.WiredParameters = WiredParameters;
exports.WiredParameters = WiredParameters = __decorate([
    component
], WiredParameters);
//# sourceMappingURL=Wired%20Parameters.js.map