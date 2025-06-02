#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_FLAG_IS_NORMAL_MAP detailNormalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 0:34
//sampler sampler detailNormalTexSmpSC 0:35
//sampler sampler emissiveTexSmpSC 0:36
//sampler sampler intensityTextureSmpSC 0:37
//sampler sampler materialParamsTexSmpSC 0:38
//sampler sampler normalTexSmpSC 0:39
//sampler sampler opacityTexSmpSC 0:40
//sampler sampler reflectionModulationTexSmpSC 0:41
//sampler sampler reflectionTexSmpSC 0:42
//sampler sampler rimColorTexSmpSC 0:43
//sampler sampler sc_EnvmapDiffuseSmpSC 0:44
//sampler sampler sc_EnvmapSpecularSmpSC 0:45
//sampler sampler sc_RayTracedAoTextureSmpSC 0:47
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:48
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:49
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:50
//sampler sampler sc_SSAOTextureSmpSC 0:51
//sampler sampler sc_ScreenTextureSmpSC 0:52
//sampler sampler sc_ShadowTextureSmpSC 0:53
//sampler sampler z_hitIdAndBarycentricSmp 0:55
//sampler sampler z_rayDirectionsSmpSC 0:56
//texture texture2D baseTex 0:4:0:34
//texture texture2D detailNormalTex 0:5:0:35
//texture texture2D emissiveTex 0:6:0:36
//texture texture2D intensityTexture 0:7:0:37
//texture texture2D materialParamsTex 0:8:0:38
//texture texture2D normalTex 0:9:0:39
//texture texture2D opacityTex 0:10:0:40
//texture texture2D reflectionModulationTex 0:11:0:41
//texture texture2D reflectionTex 0:12:0:42
//texture texture2D rimColorTex 0:13:0:43
//texture texture2D sc_EnvmapDiffuse 0:14:0:44
//texture texture2D sc_EnvmapSpecular 0:15:0:45
//texture texture2D sc_RayTracedAoTexture 0:24:0:47
//texture texture2D sc_RayTracedDiffIndTexture 0:25:0:48
//texture texture2D sc_RayTracedReflectionTexture 0:26:0:49
//texture texture2D sc_RayTracedShadowTexture 0:27:0:50
//texture texture2D sc_SSAOTexture 0:28:0:51
//texture texture2D sc_ScreenTexture 0:29:0:52
//texture texture2D sc_ShadowTexture 0:30:0:53
//texture utexture2D z_hitIdAndBarycentric 0:32:0:55
//texture texture2D z_rayDirections 0:33:0:56
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:57:6816 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapDiffuseDims 1104
//float4 sc_EnvmapDiffuseView 1120
//float4 sc_EnvmapSpecularSize 1136
//float4 sc_EnvmapSpecularDims 1152
//float4 sc_EnvmapSpecularView 1168
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_GeometryInfo 1408
//float4x4 sc_ModelViewProjectionMatrixArray 1424:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1552:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1808:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2064:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2192:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2288:[2]:48
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float3x3 sc_NormalMatrixInverse 3200
//float4x4 sc_PrevFrameModelMatrix 3248
//float4x4 sc_PrevFrameModelMatrixInverse 3312
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float3 sc_WorldAabbMin 3408
//float3 sc_WorldAabbMax 3424
//float4 sc_WindowToViewportTransform 3440
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
//float shaderComplexityValue 3604
//float sc_DisableFrustumCullingMarker 3608
//float4 weights0 3616
//float4 weights1 3632
//float4 weights2 3648
//float4 sc_StereoClipPlanes 3664:[2]:16
//int sc_FallbackInstanceID 3696
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//float strandWidth 3712
//float strandTaper 3716
//float4 sc_StrandDataMapTextureSize 3728
//float clumpInstanceCount 3744
//float clumpRadius 3748
//float clumpTipScale 3752
//float hairstyleInstanceCount 3756
//float hairstyleNoise 3760
//float4 sc_ScreenTextureSize 3776
//float4 sc_ScreenTextureDims 3792
//float4 sc_ScreenTextureView 3808
//bool receivesRayTracedReflections 3824
//bool isProxyMode 3828
//bool receivesRayTracedShadows 3832
//bool receivesRayTracedDiffuseIndirect 3836
//bool receivesRayTracedAo 3840
//float4 sc_RayTracedReflectionTextureSize 3856
//float4 sc_RayTracedReflectionTextureDims 3872
//float4 sc_RayTracedReflectionTextureView 3888
//float4 sc_RayTracedShadowTextureSize 3904
//float4 sc_RayTracedShadowTextureDims 3920
//float4 sc_RayTracedShadowTextureView 3936
//float4 sc_RayTracedDiffIndTextureSize 3952
//float4 sc_RayTracedDiffIndTextureDims 3968
//float4 sc_RayTracedDiffIndTextureView 3984
//float4 sc_RayTracedAoTextureSize 4000
//float4 sc_RayTracedAoTextureDims 4016
//float4 sc_RayTracedAoTextureView 4032
//float receiver_mask 4048
//float3 OriginNormalizationScale 4064
//float3 OriginNormalizationScaleInv 4080
//float3 OriginNormalizationOffset 4096
//int receiverId 4112
//int instance_id 4116
//int lray_triangles_last 4120
//bool noEarlyZ 4124
//bool has_animated_pn 4128
//int emitter_stride 4132
//int proxy_offset_position 4136
//int proxy_offset_normal 4140
//int proxy_offset_tangent 4144
//int proxy_offset_color 4148
//int proxy_offset_texture0 4152
//int proxy_offset_texture1 4156
//int proxy_offset_texture2 4160
//int proxy_offset_texture3 4164
//int proxy_format_position 4168
//int proxy_format_normal 4172
//int proxy_format_tangent 4176
//int proxy_format_color 4180
//int proxy_format_texture0 4184
//int proxy_format_texture1 4188
//int proxy_format_texture2 4192
//int proxy_format_texture3 4196
//float4 z_rayDirectionsSize 4208
//float4 z_rayDirectionsDims 4224
//float4 z_rayDirectionsView 4240
//float correctedIntensity 4256
//float4 intensityTextureSize 4272
//float4 intensityTextureDims 4288
//float4 intensityTextureView 4304
//float3x3 intensityTextureTransform 4320
//float4 intensityTextureUvMinMax 4368
//float4 intensityTextureBorderColor 4384
//float reflBlurWidth 4400
//float reflBlurMinRough 4404
//float reflBlurMaxRough 4408
//int overrideTimeEnabled 4412
//float overrideTimeElapsed 4416
//float overrideTimeDelta 4420
//int PreviewEnabled 4424
//int PreviewNodeID 4428
//float alphaTestThreshold 4432
//float3 recolorRed 4448
//float4 baseColor 4464
//float4 baseTexSize 4480
//float4 baseTexDims 4496
//float4 baseTexView 4512
//float3x3 baseTexTransform 4528
//float4 baseTexUvMinMax 4576
//float4 baseTexBorderColor 4592
//float2 uv2Scale 4608
//float2 uv2Offset 4616
//float2 uv3Scale 4624
//float2 uv3Offset 4632
//float3 recolorGreen 4640
//float3 recolorBlue 4656
//float4 opacityTexSize 4672
//float4 opacityTexDims 4688
//float4 opacityTexView 4704
//float3x3 opacityTexTransform 4720
//float4 opacityTexUvMinMax 4768
//float4 opacityTexBorderColor 4784
//float4 normalTexSize 4800
//float4 normalTexDims 4816
//float4 normalTexView 4832
//float3x3 normalTexTransform 4848
//float4 normalTexUvMinMax 4896
//float4 normalTexBorderColor 4912
//float4 detailNormalTexSize 4928
//float4 detailNormalTexDims 4944
//float4 detailNormalTexView 4960
//float3x3 detailNormalTexTransform 4976
//float4 detailNormalTexUvMinMax 5024
//float4 detailNormalTexBorderColor 5040
//float4 emissiveTexSize 5056
//float4 emissiveTexDims 5072
//float4 emissiveTexView 5088
//float3x3 emissiveTexTransform 5104
//float4 emissiveTexUvMinMax 5152
//float4 emissiveTexBorderColor 5168
//float3 emissiveColor 5184
//float emissiveIntensity 5200
//float reflectionIntensity 5204
//float4 reflectionTexSize 5216
//float4 reflectionTexDims 5232
//float4 reflectionTexView 5248
//float3x3 reflectionTexTransform 5264
//float4 reflectionTexUvMinMax 5312
//float4 reflectionTexBorderColor 5328
//float4 reflectionModulationTexSize 5344
//float4 reflectionModulationTexDims 5360
//float4 reflectionModulationTexView 5376
//float3x3 reflectionModulationTexTransform 5392
//float4 reflectionModulationTexUvMinMax 5440
//float4 reflectionModulationTexBorderColor 5456
//float3 rimColor 5472
//float rimIntensity 5488
//float4 rimColorTexSize 5504
//float4 rimColorTexDims 5520
//float4 rimColorTexView 5536
//float3x3 rimColorTexTransform 5552
//float4 rimColorTexUvMinMax 5600
//float4 rimColorTexBorderColor 5616
//float rimExponent 5632
//float metallic 5636
//float4 materialParamsTexSize 5648
//float4 materialParamsTexDims 5664
//float4 materialParamsTexView 5680
//float3x3 materialParamsTexTransform 5696
//float4 materialParamsTexUvMinMax 5744
//float4 materialParamsTexBorderColor 5760
//float roughness 5776
//float specularAoDarkening 5780
//float specularAoIntensity 5784
//float4 Port_Import_N042 5792
//float Port_Input1_N044 5808
//float Port_Import_N088 5812
//float3 Port_Import_N089 5824
//float4 Port_Import_N384 5840
//float Port_Import_N307 5856
//float Port_Import_N201 5860
//float Port_Import_N012 5864
//float Port_Import_N010 5868
//float Port_Import_N007 5872
//float2 Port_Import_N008 5880
//float2 Port_Import_N009 5888
//float Port_Speed_N022 5896
//float2 Port_Import_N254 5904
//float Port_Import_N065 5912
//float Port_Import_N055 5916
//float Port_Import_N056 5920
//float2 Port_Import_N000 5928
//float2 Port_Import_N060 5936
//float2 Port_Import_N061 5944
//float Port_Speed_N063 5952
//float2 Port_Import_N255 5960
//float4 Port_Default_N369 5968
//float4 Port_Import_N092 5984
//float3 Port_Import_N090 6000
//float3 Port_Import_N091 6016
//float3 Port_Import_N144 6032
//float Port_Value2_N073 6048
//float4 Port_Import_N166 6064
//float Port_Import_N206 6080
//float Port_Import_N043 6084
//float2 Port_Import_N151 6088
//float2 Port_Import_N155 6096
//float Port_Default_N204 6104
//float Port_Import_N047 6108
//float Port_Input1_N002 6112
//float Port_Input2_N072 6116
//float Port_Import_N336 6120
//float Port_Import_N160 6124
//float2 Port_Import_N167 6128
//float2 Port_Import_N207 6136
//float Port_Strength1_N200 6144
//float Port_Import_N095 6148
//float Port_Import_N108 6152
//float3 Port_Default_N113 6160
//float Port_Strength2_N200 6176
//float Port_Import_N273 6180
//float Port_Input1_N274 6184
//float Port_Import_N131 6188
//float Port_Import_N116 6192
//float2 Port_Import_N120 6200
//float2 Port_Import_N127 6208
//float3 Port_Default_N132 6224
//float3 Port_Import_N295 6240
//float Port_Import_N296 6256
//float3 Port_Default_N103 6272
//float Port_Import_N133 6288
//float Port_Import_N231 6292
//float3 Port_Import_N327 6304
//float3 Port_Input1_N257 6320
//float3 Port_Import_N259 6336
//float Port_Input1_N264 6352
//float Port_Input1_N268 6356
//float Port_Input1_N270 6360
//float Port_Import_N123 6364
//float Port_Import_N025 6368
//float2 Port_Import_N030 6376
//float2 Port_Import_N031 6384
//float3 Port_Default_N041 6400
//float3 Port_Default_N134 6416
//float3 Port_Import_N298 6432
//float Port_Import_N172 6448
//float3 Port_Import_N318 6464
//float Port_Import_N319 6480
//float Port_Import_N171 6484
//float Port_Import_N135 6488
//float2 Port_Import_N150 6496
//float2 Port_Import_N152 6504
//float3 Port_Default_N170 6512
//float Port_Import_N339 6528
//float3 Port_Import_N328 6544
//float Port_Import_N340 6560
//float3 Port_Default_N173 6576
//float3 Port_Import_N306 6592
//float Port_Import_N277 6608
//float Port_Import_N280 6612
//float2 Port_Import_N241 6616
//float2 Port_Import_N246 6624
//float Port_Import_N278 6632
//float Port_Import_N186 6636
//float Port_Input1_N187 6640
//float Port_Import_N078 6644
//float3 Port_Value1_N079 6656
//float Port_Import_N281 6672
//float3 Port_Input0_N325 6688
//float Port_Import_N283 6704
//float3 Port_Input0_N239 6720
//float3 Port_Import_N235 6736
//float3 Port_Input1_N322 6752
//float Port_Import_N282 6768
//float3 Port_Default_N326 6784
//float depthRef 6800
//}
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0
//spec_const bool BLEND_MODE_BRIGHT 1
//spec_const bool BLEND_MODE_COLOR_BURN 2
//spec_const bool BLEND_MODE_COLOR_DODGE 3
//spec_const bool BLEND_MODE_COLOR 4
//spec_const bool BLEND_MODE_DARKEN 5
//spec_const bool BLEND_MODE_DIFFERENCE 6
//spec_const bool BLEND_MODE_DIVIDE 7
//spec_const bool BLEND_MODE_DIVISION 8
//spec_const bool BLEND_MODE_EXCLUSION 9
//spec_const bool BLEND_MODE_FORGRAY 10
//spec_const bool BLEND_MODE_HARD_GLOW 11
//spec_const bool BLEND_MODE_HARD_LIGHT 12
//spec_const bool BLEND_MODE_HARD_MIX 13
//spec_const bool BLEND_MODE_HARD_PHOENIX 14
//spec_const bool BLEND_MODE_HARD_REFLECT 15
//spec_const bool BLEND_MODE_HUE 16
//spec_const bool BLEND_MODE_INTENSE 17
//spec_const bool BLEND_MODE_LIGHTEN 18
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19
//spec_const bool BLEND_MODE_LUMINOSITY 20
//spec_const bool BLEND_MODE_NEGATION 21
//spec_const bool BLEND_MODE_NOTBRIGHT 22
//spec_const bool BLEND_MODE_OVERLAY 23
//spec_const bool BLEND_MODE_PIN_LIGHT 24
//spec_const bool BLEND_MODE_REALISTIC 25
//spec_const bool BLEND_MODE_SATURATION 26
//spec_const bool BLEND_MODE_SOFT_LIGHT 27
//spec_const bool BLEND_MODE_SUBTRACT 28
//spec_const bool BLEND_MODE_VIVID_LIGHT 29
//spec_const bool ENABLE_BASE_TEX 30
//spec_const bool ENABLE_DETAIL_NORMAL 31
//spec_const bool ENABLE_EMISSIVE 32
//spec_const bool ENABLE_NORMALMAP 33
//spec_const bool ENABLE_OPACITY_TEX 34
//spec_const bool ENABLE_RECOLOR 35
//spec_const bool ENABLE_REFLECTION_MODULATION_TEX 36
//spec_const bool ENABLE_RIM_COLOR_TEX 37
//spec_const bool ENABLE_RIM_HIGHLIGHT 38
//spec_const bool ENABLE_RIM_INVERT 39
//spec_const bool ENABLE_SPECULAR_AO 40
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 41
//spec_const bool ENABLE_UV2_ANIMATION 42
//spec_const bool ENABLE_UV2 43
//spec_const bool ENABLE_UV3_ANIMATION 44
//spec_const bool ENABLE_UV3 45
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 46
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 47
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 48
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 49
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 50
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 51
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 52
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 53
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 54
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 55
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 56
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 57
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 58
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 59
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 60
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 61
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 62
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 63
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 64
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 65
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 66
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 67
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 68
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 69
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 70
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 71
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 72
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 73
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 74
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 75
//spec_const bool Tweak_N179 76
//spec_const bool UseViewSpaceDepthVariant 77
//spec_const bool baseTexHasSwappedViews 78
//spec_const bool detailNormalTexHasSwappedViews 79
//spec_const bool emissiveTexHasSwappedViews 80
//spec_const bool intensityTextureHasSwappedViews 81
//spec_const bool materialParamsTexHasSwappedViews 82
//spec_const bool normalTexHasSwappedViews 83
//spec_const bool opacityTexHasSwappedViews 84
//spec_const bool reflectionModulationTexHasSwappedViews 85
//spec_const bool reflectionTexHasSwappedViews 86
//spec_const bool rimColorTexHasSwappedViews 87
//spec_const bool sc_BlendMode_AddWithAlphaFactor 88
//spec_const bool sc_BlendMode_Add 89
//spec_const bool sc_BlendMode_AlphaTest 90
//spec_const bool sc_BlendMode_AlphaToCoverage 91
//spec_const bool sc_BlendMode_ColoredGlass 92
//spec_const bool sc_BlendMode_Custom 93
//spec_const bool sc_BlendMode_Max 94
//spec_const bool sc_BlendMode_Min 95
//spec_const bool sc_BlendMode_MultiplyOriginal 96
//spec_const bool sc_BlendMode_Multiply 97
//spec_const bool sc_BlendMode_Normal 98
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 99
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 100
//spec_const bool sc_BlendMode_PremultipliedAlpha 101
//spec_const bool sc_BlendMode_Screen 102
//spec_const bool sc_DepthOnly 103
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 104
//spec_const bool sc_EnvmapSpecularHasSwappedViews 105
//spec_const bool sc_FramebufferFetch 106
//spec_const bool sc_HasDiffuseEnvmap 107
//spec_const bool sc_LightEstimation 108
//spec_const bool sc_MotionVectorsPass 109
//spec_const bool sc_OITCompositingPass 110
//spec_const bool sc_OITDepthBoundsPass 111
//spec_const bool sc_OITDepthGatherPass 112
//spec_const bool sc_ProjectiveShadowsCaster 113
//spec_const bool sc_ProjectiveShadowsReceiver 114
//spec_const bool sc_ProxyAlphaOne 115
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 116
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 117
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 118
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 119
//spec_const bool sc_RenderAlphaToColor 120
//spec_const bool sc_SSAOEnabled 121
//spec_const bool sc_ScreenTextureHasSwappedViews 122
//spec_const bool sc_ShaderComplexityAnalyzer 123
//spec_const bool sc_UseFramebufferFetchMarker 124
//spec_const bool sc_VertexBlendingUseNormals 125
//spec_const bool sc_VertexBlending 126
//spec_const int NODE_13_DROPLIST_ITEM 127
//spec_const int NODE_181_DROPLIST_ITEM 128
//spec_const int NODE_184_DROPLIST_ITEM 129
//spec_const int NODE_221_DROPLIST_ITEM 130
//spec_const int NODE_228_DROPLIST_ITEM 131
//spec_const int NODE_27_DROPLIST_ITEM 132
//spec_const int NODE_315_DROPLIST_ITEM 133
//spec_const int NODE_38_DROPLIST_ITEM 134
//spec_const int NODE_49_DROPLIST_ITEM 135
//spec_const int NODE_69_DROPLIST_ITEM 136
//spec_const int NODE_76_DROPLIST_ITEM 137
//spec_const int SC_DEVICE_CLASS 138
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 139
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 140
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 141
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 142
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 143
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 144
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 145
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 146
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 147
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 148
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 149
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 150
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 151
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 152
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 153
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 154
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 155
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 156
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 157
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 158
//spec_const int baseTexLayout 159
//spec_const int detailNormalTexLayout 160
//spec_const int emissiveTexLayout 161
//spec_const int intensityTextureLayout 162
//spec_const int materialParamsTexLayout 163
//spec_const int normalTexLayout 164
//spec_const int opacityTexLayout 165
//spec_const int reflectionModulationTexLayout 166
//spec_const int reflectionTexLayout 167
//spec_const int rimColorTexLayout 168
//spec_const int sc_AmbientLightMode0 169
//spec_const int sc_AmbientLightMode1 170
//spec_const int sc_AmbientLightMode2 171
//spec_const int sc_AmbientLightMode_Constant 172
//spec_const int sc_AmbientLightMode_EnvironmentMap 173
//spec_const int sc_AmbientLightMode_FromCamera 174
//spec_const int sc_AmbientLightMode_SphericalHarmonics 175
//spec_const int sc_AmbientLightsCount 176
//spec_const int sc_DepthBufferMode 177
//spec_const int sc_DirectionalLightsCount 178
//spec_const int sc_EnvLightMode 179
//spec_const int sc_EnvmapDiffuseLayout 180
//spec_const int sc_EnvmapSpecularLayout 181
//spec_const int sc_LightEstimationSGCount 182
//spec_const int sc_MaxTextureImageUnits 183
//spec_const int sc_PointLightsCount 184
//spec_const int sc_RayTracedAoTextureLayout 185
//spec_const int sc_RayTracedDiffIndTextureLayout 186
//spec_const int sc_RayTracedReflectionTextureLayout 187
//spec_const int sc_RayTracedShadowTextureLayout 188
//spec_const int sc_RenderingSpace 189
//spec_const int sc_ScreenTextureLayout 190
//spec_const int sc_ShaderCacheConstant 191
//spec_const int sc_SkinBonesCount 192
//spec_const int sc_StereoRenderingMode 193
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 194
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_BASE_TEX [[function_constant(30)]];
constant bool ENABLE_BASE_TEX_tmp = is_function_constant_defined(ENABLE_BASE_TEX) ? ENABLE_BASE_TEX : false;
constant bool ENABLE_DETAIL_NORMAL [[function_constant(31)]];
constant bool ENABLE_DETAIL_NORMAL_tmp = is_function_constant_defined(ENABLE_DETAIL_NORMAL) ? ENABLE_DETAIL_NORMAL : false;
constant bool ENABLE_EMISSIVE [[function_constant(32)]];
constant bool ENABLE_EMISSIVE_tmp = is_function_constant_defined(ENABLE_EMISSIVE) ? ENABLE_EMISSIVE : false;
constant bool ENABLE_NORMALMAP [[function_constant(33)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_OPACITY_TEX [[function_constant(34)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_RECOLOR [[function_constant(35)]];
constant bool ENABLE_RECOLOR_tmp = is_function_constant_defined(ENABLE_RECOLOR) ? ENABLE_RECOLOR : false;
constant bool ENABLE_REFLECTION_MODULATION_TEX [[function_constant(36)]];
constant bool ENABLE_REFLECTION_MODULATION_TEX_tmp = is_function_constant_defined(ENABLE_REFLECTION_MODULATION_TEX) ? ENABLE_REFLECTION_MODULATION_TEX : false;
constant bool ENABLE_RIM_COLOR_TEX [[function_constant(37)]];
constant bool ENABLE_RIM_COLOR_TEX_tmp = is_function_constant_defined(ENABLE_RIM_COLOR_TEX) ? ENABLE_RIM_COLOR_TEX : false;
constant bool ENABLE_RIM_HIGHLIGHT [[function_constant(38)]];
constant bool ENABLE_RIM_HIGHLIGHT_tmp = is_function_constant_defined(ENABLE_RIM_HIGHLIGHT) ? ENABLE_RIM_HIGHLIGHT : false;
constant bool ENABLE_RIM_INVERT [[function_constant(39)]];
constant bool ENABLE_RIM_INVERT_tmp = is_function_constant_defined(ENABLE_RIM_INVERT) ? ENABLE_RIM_INVERT : false;
constant bool ENABLE_SPECULAR_AO [[function_constant(40)]];
constant bool ENABLE_SPECULAR_AO_tmp = is_function_constant_defined(ENABLE_SPECULAR_AO) ? ENABLE_SPECULAR_AO : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(41)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_UV2_ANIMATION [[function_constant(42)]];
constant bool ENABLE_UV2_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV2_ANIMATION) ? ENABLE_UV2_ANIMATION : false;
constant bool ENABLE_UV2 [[function_constant(43)]];
constant bool ENABLE_UV2_tmp = is_function_constant_defined(ENABLE_UV2) ? ENABLE_UV2 : false;
constant bool ENABLE_UV3_ANIMATION [[function_constant(44)]];
constant bool ENABLE_UV3_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV3_ANIMATION) ? ENABLE_UV3_ANIMATION : false;
constant bool ENABLE_UV3 [[function_constant(45)]];
constant bool ENABLE_UV3_tmp = is_function_constant_defined(ENABLE_UV3) ? ENABLE_UV3 : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(46)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(47)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex [[function_constant(48)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTex) ? SC_USE_CLAMP_TO_BORDER_emissiveTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(49)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(50)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(51)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(52)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex [[function_constant(53)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex) ? SC_USE_CLAMP_TO_BORDER_reflectionModulationTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex [[function_constant(54)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionTex) ? SC_USE_CLAMP_TO_BORDER_reflectionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex [[function_constant(55)]];
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_rimColorTex) ? SC_USE_CLAMP_TO_BORDER_rimColorTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(56)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(57)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTex [[function_constant(58)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTex) ? SC_USE_UV_MIN_MAX_emissiveTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(59)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(60)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(61)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(62)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex [[function_constant(63)]];
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionModulationTex) ? SC_USE_UV_MIN_MAX_reflectionModulationTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionTex [[function_constant(64)]];
constant bool SC_USE_UV_MIN_MAX_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionTex) ? SC_USE_UV_MIN_MAX_reflectionTex : false;
constant bool SC_USE_UV_MIN_MAX_rimColorTex [[function_constant(65)]];
constant bool SC_USE_UV_MIN_MAX_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_rimColorTex) ? SC_USE_UV_MIN_MAX_rimColorTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(66)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(67)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTex [[function_constant(68)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTex) ? SC_USE_UV_TRANSFORM_emissiveTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(69)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(70)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(71)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(72)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex [[function_constant(73)]];
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionModulationTex) ? SC_USE_UV_TRANSFORM_reflectionModulationTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionTex [[function_constant(74)]];
constant bool SC_USE_UV_TRANSFORM_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionTex) ? SC_USE_UV_TRANSFORM_reflectionTex : false;
constant bool SC_USE_UV_TRANSFORM_rimColorTex [[function_constant(75)]];
constant bool SC_USE_UV_TRANSFORM_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_rimColorTex) ? SC_USE_UV_TRANSFORM_rimColorTex : false;
constant bool Tweak_N179 [[function_constant(76)]];
constant bool Tweak_N179_tmp = is_function_constant_defined(Tweak_N179) ? Tweak_N179 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(77)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(78)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(79)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool emissiveTexHasSwappedViews [[function_constant(80)]];
constant bool emissiveTexHasSwappedViews_tmp = is_function_constant_defined(emissiveTexHasSwappedViews) ? emissiveTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(81)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(82)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(83)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(84)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool reflectionModulationTexHasSwappedViews [[function_constant(85)]];
constant bool reflectionModulationTexHasSwappedViews_tmp = is_function_constant_defined(reflectionModulationTexHasSwappedViews) ? reflectionModulationTexHasSwappedViews : false;
constant bool reflectionTexHasSwappedViews [[function_constant(86)]];
constant bool reflectionTexHasSwappedViews_tmp = is_function_constant_defined(reflectionTexHasSwappedViews) ? reflectionTexHasSwappedViews : false;
constant bool rimColorTexHasSwappedViews [[function_constant(87)]];
constant bool rimColorTexHasSwappedViews_tmp = is_function_constant_defined(rimColorTexHasSwappedViews) ? rimColorTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(88)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(89)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(90)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(91)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(92)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(93)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(94)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(95)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(96)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(97)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(98)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(99)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(100)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(101)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(102)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(103)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(104)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(105)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(106)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(107)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(108)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(109)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(110)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(111)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(112)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(113)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(114)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(115)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(116)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(117)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(118)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(119)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(120)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(121)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(122)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(123)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(124)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(125)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(126)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(127)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(128)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(129)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_221_DROPLIST_ITEM [[function_constant(130)]];
constant int NODE_221_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_221_DROPLIST_ITEM) ? NODE_221_DROPLIST_ITEM : 0;
constant int NODE_228_DROPLIST_ITEM [[function_constant(131)]];
constant int NODE_228_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_228_DROPLIST_ITEM) ? NODE_228_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(132)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_315_DROPLIST_ITEM [[function_constant(133)]];
constant int NODE_315_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_315_DROPLIST_ITEM) ? NODE_315_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(134)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(135)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(136)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int NODE_76_DROPLIST_ITEM [[function_constant(137)]];
constant int NODE_76_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_76_DROPLIST_ITEM) ? NODE_76_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(138)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(139)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(140)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex [[function_constant(141)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(142)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(143)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(144)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(145)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex [[function_constant(146)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex [[function_constant(147)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex [[function_constant(148)]];
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_U_rimColorTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(149)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(150)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex [[function_constant(151)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(152)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(153)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(154)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(155)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex [[function_constant(156)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex [[function_constant(157)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex [[function_constant(158)]];
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_V_rimColorTex : -1;
constant int baseTexLayout [[function_constant(159)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(160)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int emissiveTexLayout [[function_constant(161)]];
constant int emissiveTexLayout_tmp = is_function_constant_defined(emissiveTexLayout) ? emissiveTexLayout : 0;
constant int intensityTextureLayout [[function_constant(162)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(163)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(164)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(165)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int reflectionModulationTexLayout [[function_constant(166)]];
constant int reflectionModulationTexLayout_tmp = is_function_constant_defined(reflectionModulationTexLayout) ? reflectionModulationTexLayout : 0;
constant int reflectionTexLayout [[function_constant(167)]];
constant int reflectionTexLayout_tmp = is_function_constant_defined(reflectionTexLayout) ? reflectionTexLayout : 0;
constant int rimColorTexLayout [[function_constant(168)]];
constant int rimColorTexLayout_tmp = is_function_constant_defined(rimColorTexLayout) ? rimColorTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(169)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(170)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(171)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(172)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(173)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(174)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(175)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(176)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(177)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(178)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(179)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(180)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(181)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(182)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(183)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(184)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(185)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(186)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(187)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(188)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(189)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(190)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(191)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(192)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(193)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(194)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_124=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_125=normalize(param_5);
out.varTangent=float4(l9_125.x,l9_125.y,l9_125.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_126=param_2.position;
float4 l9_127=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_127=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_129]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_127=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_131]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=gl_InstanceIndex%2;
}
int l9_133=l9_132;
l9_127=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_133]*l9_126;
}
else
{
l9_127=l9_126;
}
}
}
float4 l9_134=l9_127;
out.varViewSpaceDepth=-l9_134.z;
}
float4 l9_135=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_135=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_137]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_141]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_142=param_2.position;
float4 l9_143=l9_142;
if (sc_RenderingSpace_tmp==1)
{
l9_143=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_142;
}
float4 l9_144=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_143;
float2 l9_145=((l9_144.xy/float2(l9_144.w))*0.5)+float2(0.5);
out.varShadowTex=l9_145;
}
float4 l9_146=l9_135;
if (sc_DepthBufferMode_tmp==1)
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148][2].w!=0.0)
{
float l9_149=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_146.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_146.w))*l9_149)-1.0)*l9_146.w;
}
}
float4 l9_150=l9_146;
l9_135=l9_150;
float4 l9_151=l9_135;
float4 l9_152=l9_151;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_152.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_153=l9_152;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_154=dot(l9_153,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_155=l9_154;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_155;
}
}
float4 l9_156=float4(l9_152.x,-l9_152.y,(l9_152.z*0.5)+(l9_152.w*0.5),l9_152.w);
out.gl_Position=l9_156;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
bool l9_10=UserUniforms.isProxyMode!=0;
if (l9_10)
{
l9_9=1e-07;
}
float l9_11=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_12=param_6;
float l9_13=param_8;
float l9_14=l9_13+1.0;
l9_14=(l9_14*l9_14)*0.125;
float l9_15=(l9_12*(1.0-l9_14))+l9_14;
float l9_16=param_7;
float l9_17=param_8;
float l9_18=l9_17+1.0;
l9_18=(l9_18*l9_18)*0.125;
float l9_19=(l9_16*(1.0-l9_18))+l9_18;
float l9_20=1.0/(l9_15*l9_19);
float param_9=VdotH;
float3 param_10=F0;
float l9_21=param_9;
float3 l9_22=param_10;
float3 l9_23=float3(1.0);
float l9_24=1.0-l9_21;
float l9_25=l9_24*l9_24;
float l9_26=(l9_25*l9_25)*l9_24;
float3 l9_27=l9_22+((l9_23-l9_22)*l9_26);
float3 l9_28=l9_27;
return l9_28*(((l9_11*l9_20)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_29=param_11;
float3 l9_30=param_12;
float3 l9_31=float3(1.0);
float l9_32=1.0-l9_29;
float l9_33=l9_32*l9_32;
float l9_34=(l9_33*l9_33)*l9_32;
float3 l9_35=l9_30+((l9_31-l9_30)*l9_34);
float3 l9_36=l9_35;
return ((l9_36*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedReflectionTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread texture2d<float> sc_RayTracedShadowTexture,thread sampler sc_RayTracedShadowTextureSmpSC,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
bool l9_67=UserUniforms.receivesRayTracedShadows!=0;
if (l9_67)
{
float4 l9_68=gl_FragCoord;
float2 l9_69=l9_68.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
int l9_72=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_71;
int l9_79=l9_77;
float2 l9_80=l9_78;
int l9_81=l9_79;
float l9_82=0.0;
float4 l9_83=float4(0.0);
float2 l9_84=l9_80;
int l9_85=sc_RayTracedShadowTextureLayout_tmp;
int l9_86=l9_81;
float l9_87=l9_82;
float2 l9_88=l9_84;
int l9_89=l9_85;
int l9_90=l9_86;
float3 l9_91=float3(0.0);
if (l9_89==0)
{
l9_91=float3(l9_88,0.0);
}
else
{
if (l9_89==1)
{
l9_91=float3(l9_88.x,(l9_88.y*0.5)+(0.5-(float(l9_90)*0.5)),0.0);
}
else
{
l9_91=float3(l9_88,float(l9_90));
}
}
float3 l9_92=l9_91;
float3 l9_93=l9_92;
float2 l9_94=l9_93.xy;
float l9_95=l9_87;
float4 l9_96=sc_RayTracedShadowTexture.sample(sc_RayTracedShadowTextureSmpSC,l9_94,bias(l9_95));
float4 l9_97=l9_96;
l9_83=l9_97;
float4 l9_98=l9_83;
float4 l9_99=l9_98;
float4 l9_100=l9_99;
float l9_101=l9_100.x;
float3 l9_102=float3(l9_101);
float3 l9_103=l9_102;
l9_12.directDiffuse*=(float3(1.0)-l9_103);
l9_12.directSpecular*=(float3(1.0)-l9_103);
}
SurfaceProperties l9_104=param_4;
float3 l9_105=l9_104.normal;
float3 l9_106=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_107=l9_105;
float3 l9_108=l9_107;
float l9_109=UserUniforms.sc_EnvmapRotation.y;
float2 l9_110=float2(0.0);
float l9_111=l9_108.x;
float l9_112=-l9_108.z;
float l9_113=(l9_111<0.0) ? (-1.0) : 1.0;
float l9_114=l9_113*acos(fast::clamp(l9_112/length(float2(l9_111,l9_112)),-1.0,1.0));
l9_110.x=l9_114-1.5707964;
l9_110.y=acos(l9_108.y);
l9_110/=float2(6.2831855,3.1415927);
l9_110.y=1.0-l9_110.y;
l9_110.x+=(l9_109/360.0);
l9_110.x=fract((l9_110.x+floor(l9_110.x))+1.0);
float2 l9_115=l9_110;
float2 l9_116=l9_115;
float4 l9_117=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_118=l9_116;
float2 l9_119=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_120=5.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_118,l9_119,l9_120);
}
float2 l9_121=l9_116;
float l9_122=13.0;
int l9_123=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
float2 l9_129=l9_121;
int l9_130=l9_128;
float l9_131=l9_122;
float4 l9_132=float4(0.0);
float2 l9_133=l9_129;
int l9_134=sc_EnvmapSpecularLayout_tmp;
int l9_135=l9_130;
float l9_136=l9_131;
float2 l9_137=l9_133;
int l9_138=l9_134;
int l9_139=l9_135;
float3 l9_140=float3(0.0);
if (l9_138==0)
{
l9_140=float3(l9_137,0.0);
}
else
{
if (l9_138==1)
{
l9_140=float3(l9_137.x,(l9_137.y*0.5)+(0.5-(float(l9_139)*0.5)),0.0);
}
else
{
l9_140=float3(l9_137,float(l9_139));
}
}
float3 l9_141=l9_140;
float3 l9_142=l9_141;
float2 l9_143=l9_142.xy;
float l9_144=l9_136;
float4 l9_145=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_143,bias(l9_144));
float4 l9_146=l9_145;
l9_132=l9_146;
float4 l9_147=l9_132;
float4 l9_148=l9_147;
l9_117=l9_148;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_149=l9_116;
float2 l9_150=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_151=0.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_149,l9_150,l9_151);
bool l9_152=UserUniforms.isProxyMode!=0;
if (l9_152)
{
float2 l9_153=l9_116;
float l9_154=0.0;
int l9_155=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=l9_160;
float l9_163=l9_154;
float4 l9_164=float4(0.0);
float2 l9_165=l9_161;
int l9_166=sc_EnvmapDiffuseLayout_tmp;
int l9_167=l9_162;
float l9_168=l9_163;
float2 l9_169=l9_165;
int l9_170=l9_166;
int l9_171=l9_167;
float3 l9_172=float3(0.0);
if (l9_170==0)
{
l9_172=float3(l9_169,0.0);
}
else
{
if (l9_170==1)
{
l9_172=float3(l9_169.x,(l9_169.y*0.5)+(0.5-(float(l9_171)*0.5)),0.0);
}
else
{
l9_172=float3(l9_169,float(l9_171));
}
}
float3 l9_173=l9_172;
float3 l9_174=l9_173;
float2 l9_175=l9_174.xy;
float l9_176=l9_168;
float4 l9_177=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_175,level(l9_176));
float4 l9_178=l9_177;
l9_164=l9_178;
float4 l9_179=l9_164;
float4 l9_180=l9_179;
l9_117=l9_180;
}
else
{
float2 l9_181=l9_116;
float l9_182=-13.0;
int l9_183=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=varStereoViewID;
}
int l9_185=l9_184;
l9_183=1-l9_185;
}
else
{
int l9_186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_186=0;
}
else
{
l9_186=varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
float2 l9_189=l9_181;
int l9_190=l9_188;
float l9_191=l9_182;
float4 l9_192=float4(0.0);
float2 l9_193=l9_189;
int l9_194=sc_EnvmapDiffuseLayout_tmp;
int l9_195=l9_190;
float l9_196=l9_191;
float2 l9_197=l9_193;
int l9_198=l9_194;
int l9_199=l9_195;
float3 l9_200=float3(0.0);
if (l9_198==0)
{
l9_200=float3(l9_197,0.0);
}
else
{
if (l9_198==1)
{
l9_200=float3(l9_197.x,(l9_197.y*0.5)+(0.5-(float(l9_199)*0.5)),0.0);
}
else
{
l9_200=float3(l9_197,float(l9_199));
}
}
float3 l9_201=l9_200;
float3 l9_202=l9_201;
float2 l9_203=l9_202.xy;
float l9_204=l9_196;
float4 l9_205=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_203,bias(l9_204));
float4 l9_206=l9_205;
l9_192=l9_206;
float4 l9_207=l9_192;
float4 l9_208=l9_207;
l9_117=l9_208;
}
}
else
{
float2 l9_209=l9_116;
float l9_210=13.0;
int l9_211=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=varStereoViewID;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=varStereoViewID;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
float2 l9_217=l9_209;
int l9_218=l9_216;
float l9_219=l9_210;
float4 l9_220=float4(0.0);
float2 l9_221=l9_217;
int l9_222=sc_EnvmapSpecularLayout_tmp;
int l9_223=l9_218;
float l9_224=l9_219;
float2 l9_225=l9_221;
int l9_226=l9_222;
int l9_227=l9_223;
float3 l9_228=float3(0.0);
if (l9_226==0)
{
l9_228=float3(l9_225,0.0);
}
else
{
if (l9_226==1)
{
l9_228=float3(l9_225.x,(l9_225.y*0.5)+(0.5-(float(l9_227)*0.5)),0.0);
}
else
{
l9_228=float3(l9_225,float(l9_227));
}
}
float3 l9_229=l9_228;
float3 l9_230=l9_229;
float2 l9_231=l9_230.xy;
float l9_232=l9_224;
float4 l9_233=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
l9_220=l9_234;
float4 l9_235=l9_220;
float4 l9_236=l9_235;
l9_117=l9_236;
}
}
float4 l9_237=l9_117;
float3 l9_238=l9_237.xyz*(1.0/l9_237.w);
float3 l9_239=l9_238*UserUniforms.sc_EnvmapExposure;
l9_106=l9_239;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_240=UserUniforms.sc_Sh[0];
float3 l9_241=UserUniforms.sc_Sh[1];
float3 l9_242=UserUniforms.sc_Sh[2];
float3 l9_243=UserUniforms.sc_Sh[3];
float3 l9_244=UserUniforms.sc_Sh[4];
float3 l9_245=UserUniforms.sc_Sh[5];
float3 l9_246=UserUniforms.sc_Sh[6];
float3 l9_247=UserUniforms.sc_Sh[7];
float3 l9_248=UserUniforms.sc_Sh[8];
float3 l9_249=-l9_105;
float l9_250=0.0;
l9_250=l9_249.x;
float l9_251=l9_249.y;
float l9_252=l9_249.z;
float l9_253=l9_250*l9_250;
float l9_254=l9_251*l9_251;
float l9_255=l9_252*l9_252;
float l9_256=l9_250*l9_251;
float l9_257=l9_251*l9_252;
float l9_258=l9_250*l9_252;
float3 l9_259=((((((l9_248*0.42904299)*(l9_253-l9_254))+((l9_246*0.74312502)*l9_255))+(l9_240*0.88622701))-(l9_246*0.24770799))+((((l9_244*l9_256)+(l9_247*l9_258))+(l9_245*l9_257))*0.85808599))+((((l9_243*l9_250)+(l9_241*l9_251))+(l9_242*l9_252))*1.0233279);
l9_106=l9_259*UserUniforms.sc_ShIntensity;
}
}
bool l9_260=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_260)
{
float4 l9_261=sampleRayTracedIndirectDiffuse(varStereoViewID,UserUniforms,sc_RayTracedDiffIndTexture,sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_106=mix(l9_106,l9_261.xyz,float3(l9_261.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_262=l9_105;
float3 l9_263=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_264;
float l9_265;
int l9_266=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_266<sc_LightEstimationSGCount_tmp)
{
l9_264.color=UserUniforms.sc_LightEstimationData.sg[l9_266].color;
l9_264.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_266].sharpness;
l9_264.axis=UserUniforms.sc_LightEstimationData.sg[l9_266].axis;
float3 l9_267=l9_262;
float l9_268=dot(l9_264.axis,l9_267);
float l9_269=l9_264.sharpness;
float l9_270=0.36000001;
float l9_271=1.0/(4.0*l9_270);
float l9_272=exp(-l9_269);
float l9_273=l9_272*l9_272;
float l9_274=1.0/l9_269;
float l9_275=(1.0+(2.0*l9_273))-l9_274;
float l9_276=((l9_272-l9_273)*l9_274)-l9_273;
float l9_277=sqrt(1.0-l9_275);
float l9_278=l9_270*l9_268;
float l9_279=l9_271*l9_277;
float l9_280=l9_278+l9_279;
float l9_281=l9_268;
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282;
if (step(abs(l9_278),l9_279)>0.5)
{
l9_265=(l9_280*l9_280)/l9_277;
}
else
{
l9_265=l9_283;
}
l9_283=l9_265;
float l9_284=(l9_275*l9_283)+l9_276;
sc_SphericalGaussianLight_t l9_285=l9_264;
float3 l9_286=(l9_285.color/float3(l9_285.sharpness))*6.2831855;
float3 l9_287=(l9_286*l9_284)/float3(3.1415927);
l9_263+=l9_287;
l9_266++;
continue;
}
else
{
break;
}
}
float3 l9_288=l9_263;
l9_106+=l9_288;
}
float3 l9_289=l9_106;
float3 l9_290=l9_289;
l9_12.indirectDiffuse=l9_290;
SurfaceProperties l9_291=param_4;
float3 l9_292=l9_13;
float3 l9_293=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_294=l9_291;
float3 l9_295=l9_292;
float3 l9_296=l9_294.normal;
float3 l9_297=reflect(-l9_295,l9_296);
float3 l9_298=l9_296;
float3 l9_299=l9_297;
float l9_300=l9_294.roughness;
l9_297=getSpecularDominantDir(l9_298,l9_299,l9_300);
float l9_301=l9_294.roughness;
float l9_302=pow(l9_301,0.66666669);
float l9_303=fast::clamp(l9_302,0.0,1.0);
float l9_304=l9_303*5.0;
float l9_305=l9_304;
float l9_306=l9_305;
float3 l9_307=l9_297;
float l9_308=l9_306;
float3 l9_309=l9_307;
float l9_310=l9_308;
float4 l9_311=float4(0.0);
float3 l9_312=l9_309;
float l9_313=UserUniforms.sc_EnvmapRotation.y;
float2 l9_314=float2(0.0);
float l9_315=l9_312.x;
float l9_316=-l9_312.z;
float l9_317=(l9_315<0.0) ? (-1.0) : 1.0;
float l9_318=l9_317*acos(fast::clamp(l9_316/length(float2(l9_315,l9_316)),-1.0,1.0));
l9_314.x=l9_318-1.5707964;
l9_314.y=acos(l9_312.y);
l9_314/=float2(6.2831855,3.1415927);
l9_314.y=1.0-l9_314.y;
l9_314.x+=(l9_313/360.0);
l9_314.x=fract((l9_314.x+floor(l9_314.x))+1.0);
float2 l9_319=l9_314;
float2 l9_320=l9_319;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_321=floor(l9_310);
float l9_322=ceil(l9_310);
float l9_323=l9_310-l9_321;
float2 l9_324=l9_320;
float2 l9_325=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_326=l9_321;
float2 l9_327=calcSeamlessPanoramicUvsForSampling(l9_324,l9_325,l9_326);
float2 l9_328=l9_327;
float l9_329=l9_321;
float2 l9_330=l9_328;
float l9_331=l9_329;
int l9_332=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_333=0;
}
else
{
l9_333=varStereoViewID;
}
int l9_334=l9_333;
l9_332=1-l9_334;
}
else
{
int l9_335=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_335=0;
}
else
{
l9_335=varStereoViewID;
}
int l9_336=l9_335;
l9_332=l9_336;
}
int l9_337=l9_332;
float2 l9_338=l9_330;
int l9_339=l9_337;
float l9_340=l9_331;
float4 l9_341=float4(0.0);
float2 l9_342=l9_338;
int l9_343=sc_EnvmapSpecularLayout_tmp;
int l9_344=l9_339;
float l9_345=l9_340;
float2 l9_346=l9_342;
int l9_347=l9_343;
int l9_348=l9_344;
float3 l9_349=float3(0.0);
if (l9_347==0)
{
l9_349=float3(l9_346,0.0);
}
else
{
if (l9_347==1)
{
l9_349=float3(l9_346.x,(l9_346.y*0.5)+(0.5-(float(l9_348)*0.5)),0.0);
}
else
{
l9_349=float3(l9_346,float(l9_348));
}
}
float3 l9_350=l9_349;
float3 l9_351=l9_350;
float2 l9_352=l9_351.xy;
float l9_353=l9_345;
float4 l9_354=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_352,level(l9_353));
float4 l9_355=l9_354;
l9_341=l9_355;
float4 l9_356=l9_341;
float4 l9_357=l9_356;
float4 l9_358=l9_357;
float4 l9_359=l9_358;
float2 l9_360=l9_320;
float2 l9_361=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_362=l9_322;
float2 l9_363=calcSeamlessPanoramicUvsForSampling(l9_360,l9_361,l9_362);
float2 l9_364=l9_363;
float l9_365=l9_322;
float2 l9_366=l9_364;
float l9_367=l9_365;
int l9_368=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_369=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_369=0;
}
else
{
l9_369=varStereoViewID;
}
int l9_370=l9_369;
l9_368=1-l9_370;
}
else
{
int l9_371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_371=0;
}
else
{
l9_371=varStereoViewID;
}
int l9_372=l9_371;
l9_368=l9_372;
}
int l9_373=l9_368;
float2 l9_374=l9_366;
int l9_375=l9_373;
float l9_376=l9_367;
float4 l9_377=float4(0.0);
float2 l9_378=l9_374;
int l9_379=sc_EnvmapSpecularLayout_tmp;
int l9_380=l9_375;
float l9_381=l9_376;
float2 l9_382=l9_378;
int l9_383=l9_379;
int l9_384=l9_380;
float3 l9_385=float3(0.0);
if (l9_383==0)
{
l9_385=float3(l9_382,0.0);
}
else
{
if (l9_383==1)
{
l9_385=float3(l9_382.x,(l9_382.y*0.5)+(0.5-(float(l9_384)*0.5)),0.0);
}
else
{
l9_385=float3(l9_382,float(l9_384));
}
}
float3 l9_386=l9_385;
float3 l9_387=l9_386;
float2 l9_388=l9_387.xy;
float l9_389=l9_381;
float4 l9_390=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_388,level(l9_389));
float4 l9_391=l9_390;
l9_377=l9_391;
float4 l9_392=l9_377;
float4 l9_393=l9_392;
float4 l9_394=l9_393;
float4 l9_395=l9_394;
l9_311=mix(l9_359,l9_395,float4(l9_323));
}
else
{
float2 l9_396=l9_320;
float l9_397=l9_310;
float2 l9_398=l9_396;
float l9_399=l9_397;
int l9_400=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_401=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_401=0;
}
else
{
l9_401=varStereoViewID;
}
int l9_402=l9_401;
l9_400=1-l9_402;
}
else
{
int l9_403=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_403=0;
}
else
{
l9_403=varStereoViewID;
}
int l9_404=l9_403;
l9_400=l9_404;
}
int l9_405=l9_400;
float2 l9_406=l9_398;
int l9_407=l9_405;
float l9_408=l9_399;
float4 l9_409=float4(0.0);
float2 l9_410=l9_406;
int l9_411=sc_EnvmapSpecularLayout_tmp;
int l9_412=l9_407;
float l9_413=l9_408;
float2 l9_414=l9_410;
int l9_415=l9_411;
int l9_416=l9_412;
float3 l9_417=float3(0.0);
if (l9_415==0)
{
l9_417=float3(l9_414,0.0);
}
else
{
if (l9_415==1)
{
l9_417=float3(l9_414.x,(l9_414.y*0.5)+(0.5-(float(l9_416)*0.5)),0.0);
}
else
{
l9_417=float3(l9_414,float(l9_416));
}
}
float3 l9_418=l9_417;
float3 l9_419=l9_418;
float2 l9_420=l9_419.xy;
float l9_421=l9_413;
float4 l9_422=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_420,level(l9_421));
float4 l9_423=l9_422;
l9_409=l9_423;
float4 l9_424=l9_409;
float4 l9_425=l9_424;
float4 l9_426=l9_425;
l9_311=l9_426;
}
float4 l9_427=l9_311;
float3 l9_428=l9_427.xyz*(1.0/l9_427.w);
float3 l9_429=l9_428;
float3 l9_430=l9_429*UserUniforms.sc_EnvmapExposure;
l9_430+=float3(1e-06);
float3 l9_431=l9_430;
float3 l9_432=l9_431;
bool l9_433=UserUniforms.receivesRayTracedReflections!=0;
if (l9_433)
{
float4 l9_434=sampleRayTracedReflections(varStereoViewID,UserUniforms,sc_RayTracedReflectionTexture,sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_432=mix(l9_432,l9_434.xyz,float3(l9_434.w));
}
SurfaceProperties l9_435=l9_294;
float l9_436=abs(dot(l9_296,l9_295));
float3 l9_437=l9_432*envBRDFApprox(l9_435,l9_436);
l9_293+=l9_437;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_438=l9_291;
float3 l9_439=l9_292;
float l9_440=fast::clamp(l9_438.roughness*l9_438.roughness,0.0099999998,1.0);
float3 l9_441=UserUniforms.sc_LightEstimationData.ambientLight*l9_438.specColor;
sc_SphericalGaussianLight_t l9_442;
sc_SphericalGaussianLight_t l9_443;
sc_SphericalGaussianLight_t l9_444;
int l9_445=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_445<sc_LightEstimationSGCount_tmp)
{
l9_442.color=UserUniforms.sc_LightEstimationData.sg[l9_445].color;
l9_442.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_445].sharpness;
l9_442.axis=UserUniforms.sc_LightEstimationData.sg[l9_445].axis;
float3 l9_446=l9_438.normal;
float l9_447=l9_440;
float3 l9_448=l9_439;
float3 l9_449=l9_438.specColor;
float3 l9_450=l9_446;
float l9_451=l9_447;
l9_443.axis=l9_450;
float l9_452=l9_451*l9_451;
l9_443.sharpness=2.0/l9_452;
l9_443.color=float3(1.0/(3.1415927*l9_452));
sc_SphericalGaussianLight_t l9_453=l9_443;
sc_SphericalGaussianLight_t l9_454=l9_453;
sc_SphericalGaussianLight_t l9_455=l9_454;
float3 l9_456=l9_448;
l9_444.axis=reflect(-l9_456,l9_455.axis);
l9_444.color=l9_455.color;
l9_444.sharpness=l9_455.sharpness;
l9_444.sharpness/=(4.0*fast::max(dot(l9_455.axis,l9_456),9.9999997e-05));
sc_SphericalGaussianLight_t l9_457=l9_444;
sc_SphericalGaussianLight_t l9_458=l9_457;
sc_SphericalGaussianLight_t l9_459=l9_458;
sc_SphericalGaussianLight_t l9_460=l9_442;
float l9_461=length((l9_459.axis*l9_459.sharpness)+(l9_460.axis*l9_460.sharpness));
float3 l9_462=(l9_459.color*exp((l9_461-l9_459.sharpness)-l9_460.sharpness))*l9_460.color;
float l9_463=1.0-exp((-2.0)*l9_461);
float3 l9_464=((l9_462*6.2831855)*l9_463)/float3(l9_461);
float3 l9_465=l9_464;
float3 l9_466=l9_458.axis;
float l9_467=l9_447*l9_447;
float l9_468=dot(l9_446,l9_466);
float l9_469=fast::clamp(l9_468,0.0,1.0);
float l9_470=l9_469;
float l9_471=dot(l9_446,l9_448);
float l9_472=fast::clamp(l9_471,0.0,1.0);
float l9_473=l9_472;
float3 l9_474=normalize(l9_458.axis+l9_448);
float l9_475=l9_467;
float l9_476=l9_470;
float l9_477=1.0/(l9_476+sqrt(l9_475+(((1.0-l9_475)*l9_476)*l9_476)));
float l9_478=l9_467;
float l9_479=l9_473;
float l9_480=1.0/(l9_479+sqrt(l9_478+(((1.0-l9_478)*l9_479)*l9_479)));
l9_465*=(l9_477*l9_480);
float l9_481=dot(l9_466,l9_474);
float l9_482=fast::clamp(l9_481,0.0,1.0);
float l9_483=pow(1.0-l9_482,5.0);
l9_465*=(l9_449+((float3(1.0)-l9_449)*l9_483));
l9_465*=l9_470;
float3 l9_484=l9_465;
l9_441+=l9_484;
l9_445++;
continue;
}
else
{
break;
}
}
float3 l9_485=l9_441;
l9_293+=l9_485;
}
float3 l9_486=l9_293;
l9_12.indirectSpecular=l9_486;
LightingComponents l9_487=l9_12;
LightingComponents lighting=l9_487;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_488=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_489=FragColor0;
float4 l9_490=l9_489;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_490.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_491=l9_490;
l9_488=l9_491;
}
else
{
float4 l9_492=gl_FragCoord;
float2 l9_493=l9_492.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_494=l9_493;
float2 l9_495=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_496=1;
int l9_497=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_497=0;
}
else
{
l9_497=varStereoViewID;
}
int l9_498=l9_497;
int l9_499=l9_498;
float3 l9_500=float3(l9_494,0.0);
int l9_501=l9_496;
int l9_502=l9_499;
if (l9_501==1)
{
l9_500.y=((2.0*l9_500.y)+float(l9_502))-1.0;
}
float2 l9_503=l9_500.xy;
l9_495=l9_503;
}
else
{
l9_495=l9_494;
}
float2 l9_504=l9_495;
float2 l9_505=l9_504;
float2 l9_506=l9_505;
int l9_507=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_508=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_508=0;
}
else
{
l9_508=varStereoViewID;
}
int l9_509=l9_508;
l9_507=1-l9_509;
}
else
{
int l9_510=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_510=0;
}
else
{
l9_510=varStereoViewID;
}
int l9_511=l9_510;
l9_507=l9_511;
}
int l9_512=l9_507;
float2 l9_513=l9_506;
int l9_514=l9_512;
float2 l9_515=l9_513;
int l9_516=l9_514;
float l9_517=0.0;
float4 l9_518=float4(0.0);
float2 l9_519=l9_515;
int l9_520=sc_ScreenTextureLayout_tmp;
int l9_521=l9_516;
float l9_522=l9_517;
float2 l9_523=l9_519;
int l9_524=l9_520;
int l9_525=l9_521;
float3 l9_526=float3(0.0);
if (l9_524==0)
{
l9_526=float3(l9_523,0.0);
}
else
{
if (l9_524==1)
{
l9_526=float3(l9_523.x,(l9_523.y*0.5)+(0.5-(float(l9_525)*0.5)),0.0);
}
else
{
l9_526=float3(l9_523,float(l9_525));
}
}
float3 l9_527=l9_526;
float3 l9_528=l9_527;
float2 l9_529=l9_528.xy;
float l9_530=l9_522;
float4 l9_531=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_529,bias(l9_530));
float4 l9_532=l9_531;
l9_518=l9_532;
float4 l9_533=l9_518;
float4 l9_534=l9_533;
float4 l9_535=l9_534;
l9_488=l9_535;
}
float4 l9_536=l9_488;
float4 l9_537=l9_536;
float3 param_5=l9_537.xyz;
float3 l9_538;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_538=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_538=param_5*param_5;
}
float3 l9_539=l9_538;
float3 framebuffer=l9_539;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_540=float3(0.0);
bool l9_541=UserUniforms.receivesRayTracedAo!=0;
if (l9_541)
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*float3(1.0-sampleRayTracedAo(varStereoViewID,UserUniforms,sc_RayTracedAoTexture,sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
}
float3 l9_542=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_543=param_6.emissive;
float3 l9_544=param_7.transmitted;
if (param_8)
{
float l9_545=param_6.opacity;
l9_540*=srgbToLinear(l9_545);
}
float3 l9_546=((l9_540+l9_542)+l9_543)+l9_544;
float3 l9_547=l9_546;
float4 Output=float4(l9_547,surfaceProperties.opacity);
bool l9_548=UserUniforms.isProxyMode!=0;
if (l9_548)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_549=1.8;
float l9_550=1.4;
float l9_551=0.5;
float l9_552=1.5;
float3 l9_553=(param_9*((param_9*l9_549)+float3(l9_550)))/((param_9*((param_9*l9_549)+float3(l9_551)))+float3(l9_552));
Output=float4(l9_553.x,l9_553.y,l9_553.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_554=param_10.x;
float l9_555=param_10.y;
float l9_556=param_10.z;
float3 l9_557=float3(linearToSrgb(l9_554),linearToSrgb(l9_555),linearToSrgb(l9_556));
Output=float4(l9_557.x,l9_557.y,l9_557.z,Output.w);
return Output;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
bool l9_2=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set0.UserUniforms),sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,sc_set0.z_hitIdAndBarycentric,sc_set0.z_hitIdAndBarycentricSmp,(*sc_set0.layoutVertices),(*sc_set0.layoutVerticesPN),(*sc_set0.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set0.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set0.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexColor=rhp.color;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.Surface_UVCoord1=rhp.uv1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
float4 emitterPositionCS=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_8]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.SurfacePosition_WorldSpace=rhp.positionWS;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_9=gl_FragCoord;
float2 l9_10=l9_9.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_11=l9_10;
float2 l9_12=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_13=1;
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=in.varStereoViewID;
}
int l9_15=l9_14;
int l9_16=l9_15;
float3 l9_17=float3(l9_11,0.0);
int l9_18=l9_13;
int l9_19=l9_16;
if (l9_18==1)
{
l9_17.y=((2.0*l9_17.y)+float(l9_19))-1.0;
}
float2 l9_20=l9_17.xy;
l9_12=l9_20;
}
else
{
l9_12=l9_11;
}
float2 l9_21=l9_12;
float2 l9_22=l9_21;
Globals.gScreenCoord=l9_22;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
}
float4 Result_N363=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_23=float4(0.0);
l9_23=param_3.VertexColor;
float3 l9_24=float3(0.0);
float3 l9_25=float3(0.0);
float3 l9_26=float3(0.0);
ssGlobals l9_27=param_3;
float3 l9_28;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_29=float3(0.0);
float3 l9_30=(*sc_set0.UserUniforms).recolorRed;
l9_29=l9_30;
float3 l9_31=float3(0.0);
l9_31=l9_29;
float4 l9_32=float4(0.0);
float4 l9_33=(*sc_set0.UserUniforms).baseColor;
l9_32=l9_33;
float4 l9_34=float4(0.0);
l9_34=l9_32;
float4 l9_35=float4(0.0);
float4 l9_36=float4(0.0);
float4 l9_37=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_38=l9_27;
float4 l9_39;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_40=float2(0.0);
float2 l9_41=float2(0.0);
float2 l9_42=float2(0.0);
float2 l9_43=float2(0.0);
float2 l9_44=float2(0.0);
float2 l9_45=float2(0.0);
ssGlobals l9_46=l9_38;
float2 l9_47;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_48=float2(0.0);
l9_48=l9_46.Surface_UVCoord0;
l9_41=l9_48;
l9_47=l9_41;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_49=float2(0.0);
l9_49=l9_46.Surface_UVCoord1;
l9_42=l9_49;
l9_47=l9_42;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_50=float2(0.0);
float2 l9_51=float2(0.0);
float2 l9_52=float2(0.0);
ssGlobals l9_53=l9_46;
float2 l9_54;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
ssGlobals l9_58=l9_53;
float2 l9_59;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_60=float2(0.0);
float2 l9_61=float2(0.0);
float2 l9_62=float2(0.0);
float2 l9_63=float2(0.0);
float2 l9_64=float2(0.0);
ssGlobals l9_65=l9_58;
float2 l9_66;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_67=float2(0.0);
l9_67=l9_65.Surface_UVCoord0;
l9_61=l9_67;
l9_66=l9_61;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_68=float2(0.0);
l9_68=l9_65.Surface_UVCoord1;
l9_62=l9_68;
l9_66=l9_62;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_69=float2(0.0);
l9_69=l9_65.gScreenCoord;
l9_63=l9_69;
l9_66=l9_63;
}
else
{
float2 l9_70=float2(0.0);
l9_70=l9_65.Surface_UVCoord0;
l9_64=l9_70;
l9_66=l9_64;
}
}
}
l9_60=l9_66;
float2 l9_71=float2(0.0);
float2 l9_72=(*sc_set0.UserUniforms).uv2Scale;
l9_71=l9_72;
float2 l9_73=float2(0.0);
l9_73=l9_71;
float2 l9_74=float2(0.0);
float2 l9_75=(*sc_set0.UserUniforms).uv2Offset;
l9_74=l9_75;
float2 l9_76=float2(0.0);
l9_76=l9_74;
float2 l9_77=float2(0.0);
l9_77=(l9_60*l9_73)+l9_76;
float2 l9_78=float2(0.0);
l9_78=l9_77+(l9_76*(l9_58.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_56=l9_78;
l9_59=l9_56;
}
else
{
float2 l9_79=float2(0.0);
float2 l9_80=float2(0.0);
float2 l9_81=float2(0.0);
float2 l9_82=float2(0.0);
float2 l9_83=float2(0.0);
ssGlobals l9_84=l9_58;
float2 l9_85;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_86=float2(0.0);
l9_86=l9_84.Surface_UVCoord0;
l9_80=l9_86;
l9_85=l9_80;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_87=float2(0.0);
l9_87=l9_84.Surface_UVCoord1;
l9_81=l9_87;
l9_85=l9_81;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_88=float2(0.0);
l9_88=l9_84.gScreenCoord;
l9_82=l9_88;
l9_85=l9_82;
}
else
{
float2 l9_89=float2(0.0);
l9_89=l9_84.Surface_UVCoord0;
l9_83=l9_89;
l9_85=l9_83;
}
}
}
l9_79=l9_85;
float2 l9_90=float2(0.0);
float2 l9_91=(*sc_set0.UserUniforms).uv2Scale;
l9_90=l9_91;
float2 l9_92=float2(0.0);
l9_92=l9_90;
float2 l9_93=float2(0.0);
float2 l9_94=(*sc_set0.UserUniforms).uv2Offset;
l9_93=l9_94;
float2 l9_95=float2(0.0);
l9_95=l9_93;
float2 l9_96=float2(0.0);
l9_96=(l9_79*l9_92)+l9_95;
l9_57=l9_96;
l9_59=l9_57;
}
l9_55=l9_59;
l9_51=l9_55;
l9_54=l9_51;
}
else
{
float2 l9_97=float2(0.0);
l9_97=l9_53.Surface_UVCoord0;
l9_52=l9_97;
l9_54=l9_52;
}
l9_50=l9_54;
float2 l9_98=float2(0.0);
l9_98=l9_50;
float2 l9_99=float2(0.0);
l9_99=l9_98;
l9_43=l9_99;
l9_47=l9_43;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_100=float2(0.0);
float2 l9_101=float2(0.0);
float2 l9_102=float2(0.0);
ssGlobals l9_103=l9_46;
float2 l9_104;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_105=float2(0.0);
float2 l9_106=float2(0.0);
float2 l9_107=float2(0.0);
ssGlobals l9_108=l9_103;
float2 l9_109;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
float2 l9_112=float2(0.0);
float2 l9_113=float2(0.0);
float2 l9_114=float2(0.0);
float2 l9_115=float2(0.0);
ssGlobals l9_116=l9_108;
float2 l9_117;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_118=float2(0.0);
l9_118=l9_116.Surface_UVCoord0;
l9_111=l9_118;
l9_117=l9_111;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_119=float2(0.0);
l9_119=l9_116.Surface_UVCoord1;
l9_112=l9_119;
l9_117=l9_112;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_120=float2(0.0);
l9_120=l9_116.gScreenCoord;
l9_113=l9_120;
l9_117=l9_113;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_121=float2(0.0);
float2 l9_122=float2(0.0);
float2 l9_123=float2(0.0);
ssGlobals l9_124=l9_116;
float2 l9_125;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_126=float2(0.0);
float2 l9_127=float2(0.0);
float2 l9_128=float2(0.0);
ssGlobals l9_129=l9_124;
float2 l9_130;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_131=float2(0.0);
float2 l9_132=float2(0.0);
float2 l9_133=float2(0.0);
float2 l9_134=float2(0.0);
float2 l9_135=float2(0.0);
ssGlobals l9_136=l9_129;
float2 l9_137;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_138=float2(0.0);
l9_138=l9_136.Surface_UVCoord0;
l9_132=l9_138;
l9_137=l9_132;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_139=float2(0.0);
l9_139=l9_136.Surface_UVCoord1;
l9_133=l9_139;
l9_137=l9_133;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_140=float2(0.0);
l9_140=l9_136.gScreenCoord;
l9_134=l9_140;
l9_137=l9_134;
}
else
{
float2 l9_141=float2(0.0);
l9_141=l9_136.Surface_UVCoord0;
l9_135=l9_141;
l9_137=l9_135;
}
}
}
l9_131=l9_137;
float2 l9_142=float2(0.0);
float2 l9_143=(*sc_set0.UserUniforms).uv2Scale;
l9_142=l9_143;
float2 l9_144=float2(0.0);
l9_144=l9_142;
float2 l9_145=float2(0.0);
float2 l9_146=(*sc_set0.UserUniforms).uv2Offset;
l9_145=l9_146;
float2 l9_147=float2(0.0);
l9_147=l9_145;
float2 l9_148=float2(0.0);
l9_148=(l9_131*l9_144)+l9_147;
float2 l9_149=float2(0.0);
l9_149=l9_148+(l9_147*(l9_129.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_127=l9_149;
l9_130=l9_127;
}
else
{
float2 l9_150=float2(0.0);
float2 l9_151=float2(0.0);
float2 l9_152=float2(0.0);
float2 l9_153=float2(0.0);
float2 l9_154=float2(0.0);
ssGlobals l9_155=l9_129;
float2 l9_156;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_157=float2(0.0);
l9_157=l9_155.Surface_UVCoord0;
l9_151=l9_157;
l9_156=l9_151;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_158=float2(0.0);
l9_158=l9_155.Surface_UVCoord1;
l9_152=l9_158;
l9_156=l9_152;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_159=float2(0.0);
l9_159=l9_155.gScreenCoord;
l9_153=l9_159;
l9_156=l9_153;
}
else
{
float2 l9_160=float2(0.0);
l9_160=l9_155.Surface_UVCoord0;
l9_154=l9_160;
l9_156=l9_154;
}
}
}
l9_150=l9_156;
float2 l9_161=float2(0.0);
float2 l9_162=(*sc_set0.UserUniforms).uv2Scale;
l9_161=l9_162;
float2 l9_163=float2(0.0);
l9_163=l9_161;
float2 l9_164=float2(0.0);
float2 l9_165=(*sc_set0.UserUniforms).uv2Offset;
l9_164=l9_165;
float2 l9_166=float2(0.0);
l9_166=l9_164;
float2 l9_167=float2(0.0);
l9_167=(l9_150*l9_163)+l9_166;
l9_128=l9_167;
l9_130=l9_128;
}
l9_126=l9_130;
l9_122=l9_126;
l9_125=l9_122;
}
else
{
float2 l9_168=float2(0.0);
l9_168=l9_124.Surface_UVCoord0;
l9_123=l9_168;
l9_125=l9_123;
}
l9_121=l9_125;
float2 l9_169=float2(0.0);
l9_169=l9_121;
float2 l9_170=float2(0.0);
l9_170=l9_169;
l9_114=l9_170;
l9_117=l9_114;
}
else
{
float2 l9_171=float2(0.0);
l9_171=l9_116.Surface_UVCoord0;
l9_115=l9_171;
l9_117=l9_115;
}
}
}
}
l9_110=l9_117;
float2 l9_172=float2(0.0);
float2 l9_173=(*sc_set0.UserUniforms).uv3Scale;
l9_172=l9_173;
float2 l9_174=float2(0.0);
l9_174=l9_172;
float2 l9_175=float2(0.0);
float2 l9_176=(*sc_set0.UserUniforms).uv3Offset;
l9_175=l9_176;
float2 l9_177=float2(0.0);
l9_177=l9_175;
float2 l9_178=float2(0.0);
l9_178=(l9_110*l9_174)+l9_177;
float2 l9_179=float2(0.0);
l9_179=l9_178+(l9_177*(l9_108.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_106=l9_179;
l9_109=l9_106;
}
else
{
float2 l9_180=float2(0.0);
float2 l9_181=float2(0.0);
float2 l9_182=float2(0.0);
float2 l9_183=float2(0.0);
float2 l9_184=float2(0.0);
float2 l9_185=float2(0.0);
ssGlobals l9_186=l9_108;
float2 l9_187;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_188=float2(0.0);
l9_188=l9_186.Surface_UVCoord0;
l9_181=l9_188;
l9_187=l9_181;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_189=float2(0.0);
l9_189=l9_186.Surface_UVCoord1;
l9_182=l9_189;
l9_187=l9_182;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_190=float2(0.0);
l9_190=l9_186.gScreenCoord;
l9_183=l9_190;
l9_187=l9_183;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_191=float2(0.0);
float2 l9_192=float2(0.0);
float2 l9_193=float2(0.0);
ssGlobals l9_194=l9_186;
float2 l9_195;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
float2 l9_198=float2(0.0);
ssGlobals l9_199=l9_194;
float2 l9_200;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_201=float2(0.0);
float2 l9_202=float2(0.0);
float2 l9_203=float2(0.0);
float2 l9_204=float2(0.0);
float2 l9_205=float2(0.0);
ssGlobals l9_206=l9_199;
float2 l9_207;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_208=float2(0.0);
l9_208=l9_206.Surface_UVCoord0;
l9_202=l9_208;
l9_207=l9_202;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_209=float2(0.0);
l9_209=l9_206.Surface_UVCoord1;
l9_203=l9_209;
l9_207=l9_203;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_210=float2(0.0);
l9_210=l9_206.gScreenCoord;
l9_204=l9_210;
l9_207=l9_204;
}
else
{
float2 l9_211=float2(0.0);
l9_211=l9_206.Surface_UVCoord0;
l9_205=l9_211;
l9_207=l9_205;
}
}
}
l9_201=l9_207;
float2 l9_212=float2(0.0);
float2 l9_213=(*sc_set0.UserUniforms).uv2Scale;
l9_212=l9_213;
float2 l9_214=float2(0.0);
l9_214=l9_212;
float2 l9_215=float2(0.0);
float2 l9_216=(*sc_set0.UserUniforms).uv2Offset;
l9_215=l9_216;
float2 l9_217=float2(0.0);
l9_217=l9_215;
float2 l9_218=float2(0.0);
l9_218=(l9_201*l9_214)+l9_217;
float2 l9_219=float2(0.0);
l9_219=l9_218+(l9_217*(l9_199.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_197=l9_219;
l9_200=l9_197;
}
else
{
float2 l9_220=float2(0.0);
float2 l9_221=float2(0.0);
float2 l9_222=float2(0.0);
float2 l9_223=float2(0.0);
float2 l9_224=float2(0.0);
ssGlobals l9_225=l9_199;
float2 l9_226;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_227=float2(0.0);
l9_227=l9_225.Surface_UVCoord0;
l9_221=l9_227;
l9_226=l9_221;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_228=float2(0.0);
l9_228=l9_225.Surface_UVCoord1;
l9_222=l9_228;
l9_226=l9_222;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_229=float2(0.0);
l9_229=l9_225.gScreenCoord;
l9_223=l9_229;
l9_226=l9_223;
}
else
{
float2 l9_230=float2(0.0);
l9_230=l9_225.Surface_UVCoord0;
l9_224=l9_230;
l9_226=l9_224;
}
}
}
l9_220=l9_226;
float2 l9_231=float2(0.0);
float2 l9_232=(*sc_set0.UserUniforms).uv2Scale;
l9_231=l9_232;
float2 l9_233=float2(0.0);
l9_233=l9_231;
float2 l9_234=float2(0.0);
float2 l9_235=(*sc_set0.UserUniforms).uv2Offset;
l9_234=l9_235;
float2 l9_236=float2(0.0);
l9_236=l9_234;
float2 l9_237=float2(0.0);
l9_237=(l9_220*l9_233)+l9_236;
l9_198=l9_237;
l9_200=l9_198;
}
l9_196=l9_200;
l9_192=l9_196;
l9_195=l9_192;
}
else
{
float2 l9_238=float2(0.0);
l9_238=l9_194.Surface_UVCoord0;
l9_193=l9_238;
l9_195=l9_193;
}
l9_191=l9_195;
float2 l9_239=float2(0.0);
l9_239=l9_191;
float2 l9_240=float2(0.0);
l9_240=l9_239;
l9_184=l9_240;
l9_187=l9_184;
}
else
{
float2 l9_241=float2(0.0);
l9_241=l9_186.Surface_UVCoord0;
l9_185=l9_241;
l9_187=l9_185;
}
}
}
}
l9_180=l9_187;
float2 l9_242=float2(0.0);
float2 l9_243=(*sc_set0.UserUniforms).uv3Scale;
l9_242=l9_243;
float2 l9_244=float2(0.0);
l9_244=l9_242;
float2 l9_245=float2(0.0);
float2 l9_246=(*sc_set0.UserUniforms).uv3Offset;
l9_245=l9_246;
float2 l9_247=float2(0.0);
l9_247=l9_245;
float2 l9_248=float2(0.0);
l9_248=(l9_180*l9_244)+l9_247;
l9_107=l9_248;
l9_109=l9_107;
}
l9_105=l9_109;
l9_101=l9_105;
l9_104=l9_101;
}
else
{
float2 l9_249=float2(0.0);
l9_249=l9_103.Surface_UVCoord0;
l9_102=l9_249;
l9_104=l9_102;
}
l9_100=l9_104;
float2 l9_250=float2(0.0);
l9_250=l9_100;
float2 l9_251=float2(0.0);
l9_251=l9_250;
l9_44=l9_251;
l9_47=l9_44;
}
else
{
float2 l9_252=float2(0.0);
l9_252=l9_46.Surface_UVCoord0;
l9_45=l9_252;
l9_47=l9_45;
}
}
}
}
l9_40=l9_47;
float4 l9_253=float4(0.0);
int l9_254=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_255=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_255=0;
}
else
{
l9_255=in.varStereoViewID;
}
int l9_256=l9_255;
l9_254=1-l9_256;
}
else
{
int l9_257=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_257=0;
}
else
{
l9_257=in.varStereoViewID;
}
int l9_258=l9_257;
l9_254=l9_258;
}
int l9_259=l9_254;
int l9_260=baseTexLayout_tmp;
int l9_261=l9_259;
float2 l9_262=l9_40;
bool l9_263=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_264=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_265=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_266=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_267=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_268=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_269=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_270=0.0;
bool l9_271=l9_268&&(!l9_266);
float l9_272=1.0;
float l9_273=l9_262.x;
int l9_274=l9_265.x;
if (l9_274==1)
{
l9_273=fract(l9_273);
}
else
{
if (l9_274==2)
{
float l9_275=fract(l9_273);
float l9_276=l9_273-l9_275;
float l9_277=step(0.25,fract(l9_276*0.5));
l9_273=mix(l9_275,1.0-l9_275,fast::clamp(l9_277,0.0,1.0));
}
}
l9_262.x=l9_273;
float l9_278=l9_262.y;
int l9_279=l9_265.y;
if (l9_279==1)
{
l9_278=fract(l9_278);
}
else
{
if (l9_279==2)
{
float l9_280=fract(l9_278);
float l9_281=l9_278-l9_280;
float l9_282=step(0.25,fract(l9_281*0.5));
l9_278=mix(l9_280,1.0-l9_280,fast::clamp(l9_282,0.0,1.0));
}
}
l9_262.y=l9_278;
if (l9_266)
{
bool l9_283=l9_268;
bool l9_284;
if (l9_283)
{
l9_284=l9_265.x==3;
}
else
{
l9_284=l9_283;
}
float l9_285=l9_262.x;
float l9_286=l9_267.x;
float l9_287=l9_267.z;
bool l9_288=l9_284;
float l9_289=l9_272;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_262.x=l9_285;
l9_272=l9_289;
bool l9_292=l9_268;
bool l9_293;
if (l9_292)
{
l9_293=l9_265.y==3;
}
else
{
l9_293=l9_292;
}
float l9_294=l9_262.y;
float l9_295=l9_267.y;
float l9_296=l9_267.w;
bool l9_297=l9_293;
float l9_298=l9_272;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_262.y=l9_294;
l9_272=l9_298;
}
float2 l9_301=l9_262;
bool l9_302=l9_263;
float3x3 l9_303=l9_264;
if (l9_302)
{
l9_301=float2((l9_303*float3(l9_301,1.0)).xy);
}
float2 l9_304=l9_301;
float2 l9_305=l9_304;
float2 l9_306=l9_305;
l9_262=l9_306;
float l9_307=l9_262.x;
int l9_308=l9_265.x;
bool l9_309=l9_271;
float l9_310=l9_272;
if ((l9_308==0)||(l9_308==3))
{
float l9_311=l9_307;
float l9_312=0.0;
float l9_313=1.0;
bool l9_314=l9_309;
float l9_315=l9_310;
float l9_316=fast::clamp(l9_311,l9_312,l9_313);
float l9_317=step(abs(l9_311-l9_316),9.9999997e-06);
l9_315*=(l9_317+((1.0-float(l9_314))*(1.0-l9_317)));
l9_311=l9_316;
l9_307=l9_311;
l9_310=l9_315;
}
l9_262.x=l9_307;
l9_272=l9_310;
float l9_318=l9_262.y;
int l9_319=l9_265.y;
bool l9_320=l9_271;
float l9_321=l9_272;
if ((l9_319==0)||(l9_319==3))
{
float l9_322=l9_318;
float l9_323=0.0;
float l9_324=1.0;
bool l9_325=l9_320;
float l9_326=l9_321;
float l9_327=fast::clamp(l9_322,l9_323,l9_324);
float l9_328=step(abs(l9_322-l9_327),9.9999997e-06);
l9_326*=(l9_328+((1.0-float(l9_325))*(1.0-l9_328)));
l9_322=l9_327;
l9_318=l9_322;
l9_321=l9_326;
}
l9_262.y=l9_318;
l9_272=l9_321;
float2 l9_329=l9_262;
int l9_330=l9_260;
int l9_331=l9_261;
float l9_332=l9_270;
float2 l9_333=l9_329;
int l9_334=l9_330;
int l9_335=l9_331;
float3 l9_336=float3(0.0);
if (l9_334==0)
{
l9_336=float3(l9_333,0.0);
}
else
{
if (l9_334==1)
{
l9_336=float3(l9_333.x,(l9_333.y*0.5)+(0.5-(float(l9_335)*0.5)),0.0);
}
else
{
l9_336=float3(l9_333,float(l9_335));
}
}
float3 l9_337=l9_336;
float3 l9_338=l9_337;
float2 l9_339=l9_338.xy;
float l9_340=l9_332;
float4 l9_341=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_339,bias(l9_340));
float4 l9_342=l9_341;
float4 l9_343=l9_342;
if (l9_268)
{
l9_343=mix(l9_269,l9_343,float4(l9_272));
}
float4 l9_344=l9_343;
l9_253=l9_344;
l9_36=l9_253;
l9_39=l9_36;
}
else
{
l9_39=l9_37;
}
l9_35=l9_39;
float4 l9_345=float4(0.0);
l9_345=l9_34*l9_35;
float4 l9_346=float4(0.0);
l9_346=l9_345;
float4 l9_347=float4(0.0);
l9_347=l9_346;
float l9_348=0.0;
float l9_349=0.0;
float l9_350=0.0;
float3 l9_351=l9_347.xyz;
float l9_352=l9_351.x;
float l9_353=l9_351.y;
float l9_354=l9_351.z;
l9_348=l9_352;
l9_349=l9_353;
l9_350=l9_354;
float3 l9_355=float3(0.0);
l9_355=l9_31*float3(l9_348);
float3 l9_356=float3(0.0);
float3 l9_357=(*sc_set0.UserUniforms).recolorGreen;
l9_356=l9_357;
float3 l9_358=float3(0.0);
l9_358=l9_356;
float3 l9_359=float3(0.0);
l9_359=l9_358*float3(l9_349);
float3 l9_360=float3(0.0);
float3 l9_361=(*sc_set0.UserUniforms).recolorBlue;
l9_360=l9_361;
float3 l9_362=float3(0.0);
l9_362=l9_360;
float3 l9_363=float3(0.0);
l9_363=l9_362*float3(l9_350);
float3 l9_364=float3(0.0);
l9_364=(l9_355+l9_359)+l9_363;
l9_25=l9_364;
l9_28=l9_25;
}
else
{
float4 l9_365=float4(0.0);
float4 l9_366=(*sc_set0.UserUniforms).baseColor;
l9_365=l9_366;
float4 l9_367=float4(0.0);
l9_367=l9_365;
float4 l9_368=float4(0.0);
float4 l9_369=float4(0.0);
float4 l9_370=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_371=l9_27;
float4 l9_372;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_373=float2(0.0);
float2 l9_374=float2(0.0);
float2 l9_375=float2(0.0);
float2 l9_376=float2(0.0);
float2 l9_377=float2(0.0);
float2 l9_378=float2(0.0);
ssGlobals l9_379=l9_371;
float2 l9_380;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_381=float2(0.0);
l9_381=l9_379.Surface_UVCoord0;
l9_374=l9_381;
l9_380=l9_374;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_382=float2(0.0);
l9_382=l9_379.Surface_UVCoord1;
l9_375=l9_382;
l9_380=l9_375;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_383=float2(0.0);
float2 l9_384=float2(0.0);
float2 l9_385=float2(0.0);
ssGlobals l9_386=l9_379;
float2 l9_387;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_388=float2(0.0);
float2 l9_389=float2(0.0);
float2 l9_390=float2(0.0);
ssGlobals l9_391=l9_386;
float2 l9_392;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_393=float2(0.0);
float2 l9_394=float2(0.0);
float2 l9_395=float2(0.0);
float2 l9_396=float2(0.0);
float2 l9_397=float2(0.0);
ssGlobals l9_398=l9_391;
float2 l9_399;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_400=float2(0.0);
l9_400=l9_398.Surface_UVCoord0;
l9_394=l9_400;
l9_399=l9_394;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_401=float2(0.0);
l9_401=l9_398.Surface_UVCoord1;
l9_395=l9_401;
l9_399=l9_395;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_402=float2(0.0);
l9_402=l9_398.gScreenCoord;
l9_396=l9_402;
l9_399=l9_396;
}
else
{
float2 l9_403=float2(0.0);
l9_403=l9_398.Surface_UVCoord0;
l9_397=l9_403;
l9_399=l9_397;
}
}
}
l9_393=l9_399;
float2 l9_404=float2(0.0);
float2 l9_405=(*sc_set0.UserUniforms).uv2Scale;
l9_404=l9_405;
float2 l9_406=float2(0.0);
l9_406=l9_404;
float2 l9_407=float2(0.0);
float2 l9_408=(*sc_set0.UserUniforms).uv2Offset;
l9_407=l9_408;
float2 l9_409=float2(0.0);
l9_409=l9_407;
float2 l9_410=float2(0.0);
l9_410=(l9_393*l9_406)+l9_409;
float2 l9_411=float2(0.0);
l9_411=l9_410+(l9_409*(l9_391.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_389=l9_411;
l9_392=l9_389;
}
else
{
float2 l9_412=float2(0.0);
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
float2 l9_415=float2(0.0);
float2 l9_416=float2(0.0);
ssGlobals l9_417=l9_391;
float2 l9_418;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_419=float2(0.0);
l9_419=l9_417.Surface_UVCoord0;
l9_413=l9_419;
l9_418=l9_413;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_420=float2(0.0);
l9_420=l9_417.Surface_UVCoord1;
l9_414=l9_420;
l9_418=l9_414;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_421=float2(0.0);
l9_421=l9_417.gScreenCoord;
l9_415=l9_421;
l9_418=l9_415;
}
else
{
float2 l9_422=float2(0.0);
l9_422=l9_417.Surface_UVCoord0;
l9_416=l9_422;
l9_418=l9_416;
}
}
}
l9_412=l9_418;
float2 l9_423=float2(0.0);
float2 l9_424=(*sc_set0.UserUniforms).uv2Scale;
l9_423=l9_424;
float2 l9_425=float2(0.0);
l9_425=l9_423;
float2 l9_426=float2(0.0);
float2 l9_427=(*sc_set0.UserUniforms).uv2Offset;
l9_426=l9_427;
float2 l9_428=float2(0.0);
l9_428=l9_426;
float2 l9_429=float2(0.0);
l9_429=(l9_412*l9_425)+l9_428;
l9_390=l9_429;
l9_392=l9_390;
}
l9_388=l9_392;
l9_384=l9_388;
l9_387=l9_384;
}
else
{
float2 l9_430=float2(0.0);
l9_430=l9_386.Surface_UVCoord0;
l9_385=l9_430;
l9_387=l9_385;
}
l9_383=l9_387;
float2 l9_431=float2(0.0);
l9_431=l9_383;
float2 l9_432=float2(0.0);
l9_432=l9_431;
l9_376=l9_432;
l9_380=l9_376;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_433=float2(0.0);
float2 l9_434=float2(0.0);
float2 l9_435=float2(0.0);
ssGlobals l9_436=l9_379;
float2 l9_437;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_438=float2(0.0);
float2 l9_439=float2(0.0);
float2 l9_440=float2(0.0);
ssGlobals l9_441=l9_436;
float2 l9_442;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_443=float2(0.0);
float2 l9_444=float2(0.0);
float2 l9_445=float2(0.0);
float2 l9_446=float2(0.0);
float2 l9_447=float2(0.0);
float2 l9_448=float2(0.0);
ssGlobals l9_449=l9_441;
float2 l9_450;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_451=float2(0.0);
l9_451=l9_449.Surface_UVCoord0;
l9_444=l9_451;
l9_450=l9_444;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_452=float2(0.0);
l9_452=l9_449.Surface_UVCoord1;
l9_445=l9_452;
l9_450=l9_445;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_453=float2(0.0);
l9_453=l9_449.gScreenCoord;
l9_446=l9_453;
l9_450=l9_446;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_454=float2(0.0);
float2 l9_455=float2(0.0);
float2 l9_456=float2(0.0);
ssGlobals l9_457=l9_449;
float2 l9_458;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_459=float2(0.0);
float2 l9_460=float2(0.0);
float2 l9_461=float2(0.0);
ssGlobals l9_462=l9_457;
float2 l9_463;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
float2 l9_467=float2(0.0);
float2 l9_468=float2(0.0);
ssGlobals l9_469=l9_462;
float2 l9_470;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_471=float2(0.0);
l9_471=l9_469.Surface_UVCoord0;
l9_465=l9_471;
l9_470=l9_465;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_472=float2(0.0);
l9_472=l9_469.Surface_UVCoord1;
l9_466=l9_472;
l9_470=l9_466;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_473=float2(0.0);
l9_473=l9_469.gScreenCoord;
l9_467=l9_473;
l9_470=l9_467;
}
else
{
float2 l9_474=float2(0.0);
l9_474=l9_469.Surface_UVCoord0;
l9_468=l9_474;
l9_470=l9_468;
}
}
}
l9_464=l9_470;
float2 l9_475=float2(0.0);
float2 l9_476=(*sc_set0.UserUniforms).uv2Scale;
l9_475=l9_476;
float2 l9_477=float2(0.0);
l9_477=l9_475;
float2 l9_478=float2(0.0);
float2 l9_479=(*sc_set0.UserUniforms).uv2Offset;
l9_478=l9_479;
float2 l9_480=float2(0.0);
l9_480=l9_478;
float2 l9_481=float2(0.0);
l9_481=(l9_464*l9_477)+l9_480;
float2 l9_482=float2(0.0);
l9_482=l9_481+(l9_480*(l9_462.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_460=l9_482;
l9_463=l9_460;
}
else
{
float2 l9_483=float2(0.0);
float2 l9_484=float2(0.0);
float2 l9_485=float2(0.0);
float2 l9_486=float2(0.0);
float2 l9_487=float2(0.0);
ssGlobals l9_488=l9_462;
float2 l9_489;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_490=float2(0.0);
l9_490=l9_488.Surface_UVCoord0;
l9_484=l9_490;
l9_489=l9_484;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_491=float2(0.0);
l9_491=l9_488.Surface_UVCoord1;
l9_485=l9_491;
l9_489=l9_485;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_492=float2(0.0);
l9_492=l9_488.gScreenCoord;
l9_486=l9_492;
l9_489=l9_486;
}
else
{
float2 l9_493=float2(0.0);
l9_493=l9_488.Surface_UVCoord0;
l9_487=l9_493;
l9_489=l9_487;
}
}
}
l9_483=l9_489;
float2 l9_494=float2(0.0);
float2 l9_495=(*sc_set0.UserUniforms).uv2Scale;
l9_494=l9_495;
float2 l9_496=float2(0.0);
l9_496=l9_494;
float2 l9_497=float2(0.0);
float2 l9_498=(*sc_set0.UserUniforms).uv2Offset;
l9_497=l9_498;
float2 l9_499=float2(0.0);
l9_499=l9_497;
float2 l9_500=float2(0.0);
l9_500=(l9_483*l9_496)+l9_499;
l9_461=l9_500;
l9_463=l9_461;
}
l9_459=l9_463;
l9_455=l9_459;
l9_458=l9_455;
}
else
{
float2 l9_501=float2(0.0);
l9_501=l9_457.Surface_UVCoord0;
l9_456=l9_501;
l9_458=l9_456;
}
l9_454=l9_458;
float2 l9_502=float2(0.0);
l9_502=l9_454;
float2 l9_503=float2(0.0);
l9_503=l9_502;
l9_447=l9_503;
l9_450=l9_447;
}
else
{
float2 l9_504=float2(0.0);
l9_504=l9_449.Surface_UVCoord0;
l9_448=l9_504;
l9_450=l9_448;
}
}
}
}
l9_443=l9_450;
float2 l9_505=float2(0.0);
float2 l9_506=(*sc_set0.UserUniforms).uv3Scale;
l9_505=l9_506;
float2 l9_507=float2(0.0);
l9_507=l9_505;
float2 l9_508=float2(0.0);
float2 l9_509=(*sc_set0.UserUniforms).uv3Offset;
l9_508=l9_509;
float2 l9_510=float2(0.0);
l9_510=l9_508;
float2 l9_511=float2(0.0);
l9_511=(l9_443*l9_507)+l9_510;
float2 l9_512=float2(0.0);
l9_512=l9_511+(l9_510*(l9_441.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_439=l9_512;
l9_442=l9_439;
}
else
{
float2 l9_513=float2(0.0);
float2 l9_514=float2(0.0);
float2 l9_515=float2(0.0);
float2 l9_516=float2(0.0);
float2 l9_517=float2(0.0);
float2 l9_518=float2(0.0);
ssGlobals l9_519=l9_441;
float2 l9_520;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_521=float2(0.0);
l9_521=l9_519.Surface_UVCoord0;
l9_514=l9_521;
l9_520=l9_514;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_522=float2(0.0);
l9_522=l9_519.Surface_UVCoord1;
l9_515=l9_522;
l9_520=l9_515;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_523=float2(0.0);
l9_523=l9_519.gScreenCoord;
l9_516=l9_523;
l9_520=l9_516;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_524=float2(0.0);
float2 l9_525=float2(0.0);
float2 l9_526=float2(0.0);
ssGlobals l9_527=l9_519;
float2 l9_528;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_529=float2(0.0);
float2 l9_530=float2(0.0);
float2 l9_531=float2(0.0);
ssGlobals l9_532=l9_527;
float2 l9_533;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_534=float2(0.0);
float2 l9_535=float2(0.0);
float2 l9_536=float2(0.0);
float2 l9_537=float2(0.0);
float2 l9_538=float2(0.0);
ssGlobals l9_539=l9_532;
float2 l9_540;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_541=float2(0.0);
l9_541=l9_539.Surface_UVCoord0;
l9_535=l9_541;
l9_540=l9_535;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_542=float2(0.0);
l9_542=l9_539.Surface_UVCoord1;
l9_536=l9_542;
l9_540=l9_536;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_543=float2(0.0);
l9_543=l9_539.gScreenCoord;
l9_537=l9_543;
l9_540=l9_537;
}
else
{
float2 l9_544=float2(0.0);
l9_544=l9_539.Surface_UVCoord0;
l9_538=l9_544;
l9_540=l9_538;
}
}
}
l9_534=l9_540;
float2 l9_545=float2(0.0);
float2 l9_546=(*sc_set0.UserUniforms).uv2Scale;
l9_545=l9_546;
float2 l9_547=float2(0.0);
l9_547=l9_545;
float2 l9_548=float2(0.0);
float2 l9_549=(*sc_set0.UserUniforms).uv2Offset;
l9_548=l9_549;
float2 l9_550=float2(0.0);
l9_550=l9_548;
float2 l9_551=float2(0.0);
l9_551=(l9_534*l9_547)+l9_550;
float2 l9_552=float2(0.0);
l9_552=l9_551+(l9_550*(l9_532.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_530=l9_552;
l9_533=l9_530;
}
else
{
float2 l9_553=float2(0.0);
float2 l9_554=float2(0.0);
float2 l9_555=float2(0.0);
float2 l9_556=float2(0.0);
float2 l9_557=float2(0.0);
ssGlobals l9_558=l9_532;
float2 l9_559;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_560=float2(0.0);
l9_560=l9_558.Surface_UVCoord0;
l9_554=l9_560;
l9_559=l9_554;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_561=float2(0.0);
l9_561=l9_558.Surface_UVCoord1;
l9_555=l9_561;
l9_559=l9_555;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_562=float2(0.0);
l9_562=l9_558.gScreenCoord;
l9_556=l9_562;
l9_559=l9_556;
}
else
{
float2 l9_563=float2(0.0);
l9_563=l9_558.Surface_UVCoord0;
l9_557=l9_563;
l9_559=l9_557;
}
}
}
l9_553=l9_559;
float2 l9_564=float2(0.0);
float2 l9_565=(*sc_set0.UserUniforms).uv2Scale;
l9_564=l9_565;
float2 l9_566=float2(0.0);
l9_566=l9_564;
float2 l9_567=float2(0.0);
float2 l9_568=(*sc_set0.UserUniforms).uv2Offset;
l9_567=l9_568;
float2 l9_569=float2(0.0);
l9_569=l9_567;
float2 l9_570=float2(0.0);
l9_570=(l9_553*l9_566)+l9_569;
l9_531=l9_570;
l9_533=l9_531;
}
l9_529=l9_533;
l9_525=l9_529;
l9_528=l9_525;
}
else
{
float2 l9_571=float2(0.0);
l9_571=l9_527.Surface_UVCoord0;
l9_526=l9_571;
l9_528=l9_526;
}
l9_524=l9_528;
float2 l9_572=float2(0.0);
l9_572=l9_524;
float2 l9_573=float2(0.0);
l9_573=l9_572;
l9_517=l9_573;
l9_520=l9_517;
}
else
{
float2 l9_574=float2(0.0);
l9_574=l9_519.Surface_UVCoord0;
l9_518=l9_574;
l9_520=l9_518;
}
}
}
}
l9_513=l9_520;
float2 l9_575=float2(0.0);
float2 l9_576=(*sc_set0.UserUniforms).uv3Scale;
l9_575=l9_576;
float2 l9_577=float2(0.0);
l9_577=l9_575;
float2 l9_578=float2(0.0);
float2 l9_579=(*sc_set0.UserUniforms).uv3Offset;
l9_578=l9_579;
float2 l9_580=float2(0.0);
l9_580=l9_578;
float2 l9_581=float2(0.0);
l9_581=(l9_513*l9_577)+l9_580;
l9_440=l9_581;
l9_442=l9_440;
}
l9_438=l9_442;
l9_434=l9_438;
l9_437=l9_434;
}
else
{
float2 l9_582=float2(0.0);
l9_582=l9_436.Surface_UVCoord0;
l9_435=l9_582;
l9_437=l9_435;
}
l9_433=l9_437;
float2 l9_583=float2(0.0);
l9_583=l9_433;
float2 l9_584=float2(0.0);
l9_584=l9_583;
l9_377=l9_584;
l9_380=l9_377;
}
else
{
float2 l9_585=float2(0.0);
l9_585=l9_379.Surface_UVCoord0;
l9_378=l9_585;
l9_380=l9_378;
}
}
}
}
l9_373=l9_380;
float4 l9_586=float4(0.0);
int l9_587=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_588=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_588=0;
}
else
{
l9_588=in.varStereoViewID;
}
int l9_589=l9_588;
l9_587=1-l9_589;
}
else
{
int l9_590=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_590=0;
}
else
{
l9_590=in.varStereoViewID;
}
int l9_591=l9_590;
l9_587=l9_591;
}
int l9_592=l9_587;
int l9_593=baseTexLayout_tmp;
int l9_594=l9_592;
float2 l9_595=l9_373;
bool l9_596=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_597=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_598=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_599=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_600=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_601=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_602=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_603=0.0;
bool l9_604=l9_601&&(!l9_599);
float l9_605=1.0;
float l9_606=l9_595.x;
int l9_607=l9_598.x;
if (l9_607==1)
{
l9_606=fract(l9_606);
}
else
{
if (l9_607==2)
{
float l9_608=fract(l9_606);
float l9_609=l9_606-l9_608;
float l9_610=step(0.25,fract(l9_609*0.5));
l9_606=mix(l9_608,1.0-l9_608,fast::clamp(l9_610,0.0,1.0));
}
}
l9_595.x=l9_606;
float l9_611=l9_595.y;
int l9_612=l9_598.y;
if (l9_612==1)
{
l9_611=fract(l9_611);
}
else
{
if (l9_612==2)
{
float l9_613=fract(l9_611);
float l9_614=l9_611-l9_613;
float l9_615=step(0.25,fract(l9_614*0.5));
l9_611=mix(l9_613,1.0-l9_613,fast::clamp(l9_615,0.0,1.0));
}
}
l9_595.y=l9_611;
if (l9_599)
{
bool l9_616=l9_601;
bool l9_617;
if (l9_616)
{
l9_617=l9_598.x==3;
}
else
{
l9_617=l9_616;
}
float l9_618=l9_595.x;
float l9_619=l9_600.x;
float l9_620=l9_600.z;
bool l9_621=l9_617;
float l9_622=l9_605;
float l9_623=fast::clamp(l9_618,l9_619,l9_620);
float l9_624=step(abs(l9_618-l9_623),9.9999997e-06);
l9_622*=(l9_624+((1.0-float(l9_621))*(1.0-l9_624)));
l9_618=l9_623;
l9_595.x=l9_618;
l9_605=l9_622;
bool l9_625=l9_601;
bool l9_626;
if (l9_625)
{
l9_626=l9_598.y==3;
}
else
{
l9_626=l9_625;
}
float l9_627=l9_595.y;
float l9_628=l9_600.y;
float l9_629=l9_600.w;
bool l9_630=l9_626;
float l9_631=l9_605;
float l9_632=fast::clamp(l9_627,l9_628,l9_629);
float l9_633=step(abs(l9_627-l9_632),9.9999997e-06);
l9_631*=(l9_633+((1.0-float(l9_630))*(1.0-l9_633)));
l9_627=l9_632;
l9_595.y=l9_627;
l9_605=l9_631;
}
float2 l9_634=l9_595;
bool l9_635=l9_596;
float3x3 l9_636=l9_597;
if (l9_635)
{
l9_634=float2((l9_636*float3(l9_634,1.0)).xy);
}
float2 l9_637=l9_634;
float2 l9_638=l9_637;
float2 l9_639=l9_638;
l9_595=l9_639;
float l9_640=l9_595.x;
int l9_641=l9_598.x;
bool l9_642=l9_604;
float l9_643=l9_605;
if ((l9_641==0)||(l9_641==3))
{
float l9_644=l9_640;
float l9_645=0.0;
float l9_646=1.0;
bool l9_647=l9_642;
float l9_648=l9_643;
float l9_649=fast::clamp(l9_644,l9_645,l9_646);
float l9_650=step(abs(l9_644-l9_649),9.9999997e-06);
l9_648*=(l9_650+((1.0-float(l9_647))*(1.0-l9_650)));
l9_644=l9_649;
l9_640=l9_644;
l9_643=l9_648;
}
l9_595.x=l9_640;
l9_605=l9_643;
float l9_651=l9_595.y;
int l9_652=l9_598.y;
bool l9_653=l9_604;
float l9_654=l9_605;
if ((l9_652==0)||(l9_652==3))
{
float l9_655=l9_651;
float l9_656=0.0;
float l9_657=1.0;
bool l9_658=l9_653;
float l9_659=l9_654;
float l9_660=fast::clamp(l9_655,l9_656,l9_657);
float l9_661=step(abs(l9_655-l9_660),9.9999997e-06);
l9_659*=(l9_661+((1.0-float(l9_658))*(1.0-l9_661)));
l9_655=l9_660;
l9_651=l9_655;
l9_654=l9_659;
}
l9_595.y=l9_651;
l9_605=l9_654;
float2 l9_662=l9_595;
int l9_663=l9_593;
int l9_664=l9_594;
float l9_665=l9_603;
float2 l9_666=l9_662;
int l9_667=l9_663;
int l9_668=l9_664;
float3 l9_669=float3(0.0);
if (l9_667==0)
{
l9_669=float3(l9_666,0.0);
}
else
{
if (l9_667==1)
{
l9_669=float3(l9_666.x,(l9_666.y*0.5)+(0.5-(float(l9_668)*0.5)),0.0);
}
else
{
l9_669=float3(l9_666,float(l9_668));
}
}
float3 l9_670=l9_669;
float3 l9_671=l9_670;
float2 l9_672=l9_671.xy;
float l9_673=l9_665;
float4 l9_674=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_672,bias(l9_673));
float4 l9_675=l9_674;
float4 l9_676=l9_675;
if (l9_601)
{
l9_676=mix(l9_602,l9_676,float4(l9_605));
}
float4 l9_677=l9_676;
l9_586=l9_677;
l9_369=l9_586;
l9_372=l9_369;
}
else
{
l9_372=l9_370;
}
l9_368=l9_372;
float4 l9_678=float4(0.0);
l9_678=l9_367*l9_368;
float4 l9_679=float4(0.0);
l9_679=l9_678;
float4 l9_680=float4(0.0);
l9_680=l9_679;
l9_26=l9_680.xyz;
l9_28=l9_26;
}
l9_24=l9_28;
float3 l9_681=float3(0.0);
l9_681=l9_24;
float3 l9_682=float3(0.0);
l9_682=l9_681;
float4 l9_683=float4(0.0);
l9_683=float4(l9_682.x,l9_682.y,l9_682.z,l9_683.w);
l9_683.w=(*sc_set0.UserUniforms).Port_Value2_N073;
float4 l9_684=float4(0.0);
l9_684=l9_23*l9_683;
param=l9_684;
param_2=param;
}
else
{
float3 l9_685=float3(0.0);
float3 l9_686=float3(0.0);
float3 l9_687=float3(0.0);
ssGlobals l9_688=param_3;
float3 l9_689;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_690=float3(0.0);
float3 l9_691=(*sc_set0.UserUniforms).recolorRed;
l9_690=l9_691;
float3 l9_692=float3(0.0);
l9_692=l9_690;
float4 l9_693=float4(0.0);
float4 l9_694=(*sc_set0.UserUniforms).baseColor;
l9_693=l9_694;
float4 l9_695=float4(0.0);
l9_695=l9_693;
float4 l9_696=float4(0.0);
float4 l9_697=float4(0.0);
float4 l9_698=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_699=l9_688;
float4 l9_700;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_701=float2(0.0);
float2 l9_702=float2(0.0);
float2 l9_703=float2(0.0);
float2 l9_704=float2(0.0);
float2 l9_705=float2(0.0);
float2 l9_706=float2(0.0);
ssGlobals l9_707=l9_699;
float2 l9_708;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_709=float2(0.0);
l9_709=l9_707.Surface_UVCoord0;
l9_702=l9_709;
l9_708=l9_702;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_710=float2(0.0);
l9_710=l9_707.Surface_UVCoord1;
l9_703=l9_710;
l9_708=l9_703;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_711=float2(0.0);
float2 l9_712=float2(0.0);
float2 l9_713=float2(0.0);
ssGlobals l9_714=l9_707;
float2 l9_715;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_716=float2(0.0);
float2 l9_717=float2(0.0);
float2 l9_718=float2(0.0);
ssGlobals l9_719=l9_714;
float2 l9_720;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_721=float2(0.0);
float2 l9_722=float2(0.0);
float2 l9_723=float2(0.0);
float2 l9_724=float2(0.0);
float2 l9_725=float2(0.0);
ssGlobals l9_726=l9_719;
float2 l9_727;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_728=float2(0.0);
l9_728=l9_726.Surface_UVCoord0;
l9_722=l9_728;
l9_727=l9_722;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_729=float2(0.0);
l9_729=l9_726.Surface_UVCoord1;
l9_723=l9_729;
l9_727=l9_723;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_730=float2(0.0);
l9_730=l9_726.gScreenCoord;
l9_724=l9_730;
l9_727=l9_724;
}
else
{
float2 l9_731=float2(0.0);
l9_731=l9_726.Surface_UVCoord0;
l9_725=l9_731;
l9_727=l9_725;
}
}
}
l9_721=l9_727;
float2 l9_732=float2(0.0);
float2 l9_733=(*sc_set0.UserUniforms).uv2Scale;
l9_732=l9_733;
float2 l9_734=float2(0.0);
l9_734=l9_732;
float2 l9_735=float2(0.0);
float2 l9_736=(*sc_set0.UserUniforms).uv2Offset;
l9_735=l9_736;
float2 l9_737=float2(0.0);
l9_737=l9_735;
float2 l9_738=float2(0.0);
l9_738=(l9_721*l9_734)+l9_737;
float2 l9_739=float2(0.0);
l9_739=l9_738+(l9_737*(l9_719.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_717=l9_739;
l9_720=l9_717;
}
else
{
float2 l9_740=float2(0.0);
float2 l9_741=float2(0.0);
float2 l9_742=float2(0.0);
float2 l9_743=float2(0.0);
float2 l9_744=float2(0.0);
ssGlobals l9_745=l9_719;
float2 l9_746;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_747=float2(0.0);
l9_747=l9_745.Surface_UVCoord0;
l9_741=l9_747;
l9_746=l9_741;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_748=float2(0.0);
l9_748=l9_745.Surface_UVCoord1;
l9_742=l9_748;
l9_746=l9_742;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_749=float2(0.0);
l9_749=l9_745.gScreenCoord;
l9_743=l9_749;
l9_746=l9_743;
}
else
{
float2 l9_750=float2(0.0);
l9_750=l9_745.Surface_UVCoord0;
l9_744=l9_750;
l9_746=l9_744;
}
}
}
l9_740=l9_746;
float2 l9_751=float2(0.0);
float2 l9_752=(*sc_set0.UserUniforms).uv2Scale;
l9_751=l9_752;
float2 l9_753=float2(0.0);
l9_753=l9_751;
float2 l9_754=float2(0.0);
float2 l9_755=(*sc_set0.UserUniforms).uv2Offset;
l9_754=l9_755;
float2 l9_756=float2(0.0);
l9_756=l9_754;
float2 l9_757=float2(0.0);
l9_757=(l9_740*l9_753)+l9_756;
l9_718=l9_757;
l9_720=l9_718;
}
l9_716=l9_720;
l9_712=l9_716;
l9_715=l9_712;
}
else
{
float2 l9_758=float2(0.0);
l9_758=l9_714.Surface_UVCoord0;
l9_713=l9_758;
l9_715=l9_713;
}
l9_711=l9_715;
float2 l9_759=float2(0.0);
l9_759=l9_711;
float2 l9_760=float2(0.0);
l9_760=l9_759;
l9_704=l9_760;
l9_708=l9_704;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_761=float2(0.0);
float2 l9_762=float2(0.0);
float2 l9_763=float2(0.0);
ssGlobals l9_764=l9_707;
float2 l9_765;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_766=float2(0.0);
float2 l9_767=float2(0.0);
float2 l9_768=float2(0.0);
ssGlobals l9_769=l9_764;
float2 l9_770;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
float2 l9_773=float2(0.0);
float2 l9_774=float2(0.0);
float2 l9_775=float2(0.0);
float2 l9_776=float2(0.0);
ssGlobals l9_777=l9_769;
float2 l9_778;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_779=float2(0.0);
l9_779=l9_777.Surface_UVCoord0;
l9_772=l9_779;
l9_778=l9_772;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_780=float2(0.0);
l9_780=l9_777.Surface_UVCoord1;
l9_773=l9_780;
l9_778=l9_773;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_781=float2(0.0);
l9_781=l9_777.gScreenCoord;
l9_774=l9_781;
l9_778=l9_774;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_782=float2(0.0);
float2 l9_783=float2(0.0);
float2 l9_784=float2(0.0);
ssGlobals l9_785=l9_777;
float2 l9_786;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_787=float2(0.0);
float2 l9_788=float2(0.0);
float2 l9_789=float2(0.0);
ssGlobals l9_790=l9_785;
float2 l9_791;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_792=float2(0.0);
float2 l9_793=float2(0.0);
float2 l9_794=float2(0.0);
float2 l9_795=float2(0.0);
float2 l9_796=float2(0.0);
ssGlobals l9_797=l9_790;
float2 l9_798;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_799=float2(0.0);
l9_799=l9_797.Surface_UVCoord0;
l9_793=l9_799;
l9_798=l9_793;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_800=float2(0.0);
l9_800=l9_797.Surface_UVCoord1;
l9_794=l9_800;
l9_798=l9_794;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_801=float2(0.0);
l9_801=l9_797.gScreenCoord;
l9_795=l9_801;
l9_798=l9_795;
}
else
{
float2 l9_802=float2(0.0);
l9_802=l9_797.Surface_UVCoord0;
l9_796=l9_802;
l9_798=l9_796;
}
}
}
l9_792=l9_798;
float2 l9_803=float2(0.0);
float2 l9_804=(*sc_set0.UserUniforms).uv2Scale;
l9_803=l9_804;
float2 l9_805=float2(0.0);
l9_805=l9_803;
float2 l9_806=float2(0.0);
float2 l9_807=(*sc_set0.UserUniforms).uv2Offset;
l9_806=l9_807;
float2 l9_808=float2(0.0);
l9_808=l9_806;
float2 l9_809=float2(0.0);
l9_809=(l9_792*l9_805)+l9_808;
float2 l9_810=float2(0.0);
l9_810=l9_809+(l9_808*(l9_790.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_788=l9_810;
l9_791=l9_788;
}
else
{
float2 l9_811=float2(0.0);
float2 l9_812=float2(0.0);
float2 l9_813=float2(0.0);
float2 l9_814=float2(0.0);
float2 l9_815=float2(0.0);
ssGlobals l9_816=l9_790;
float2 l9_817;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_818=float2(0.0);
l9_818=l9_816.Surface_UVCoord0;
l9_812=l9_818;
l9_817=l9_812;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_819=float2(0.0);
l9_819=l9_816.Surface_UVCoord1;
l9_813=l9_819;
l9_817=l9_813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_820=float2(0.0);
l9_820=l9_816.gScreenCoord;
l9_814=l9_820;
l9_817=l9_814;
}
else
{
float2 l9_821=float2(0.0);
l9_821=l9_816.Surface_UVCoord0;
l9_815=l9_821;
l9_817=l9_815;
}
}
}
l9_811=l9_817;
float2 l9_822=float2(0.0);
float2 l9_823=(*sc_set0.UserUniforms).uv2Scale;
l9_822=l9_823;
float2 l9_824=float2(0.0);
l9_824=l9_822;
float2 l9_825=float2(0.0);
float2 l9_826=(*sc_set0.UserUniforms).uv2Offset;
l9_825=l9_826;
float2 l9_827=float2(0.0);
l9_827=l9_825;
float2 l9_828=float2(0.0);
l9_828=(l9_811*l9_824)+l9_827;
l9_789=l9_828;
l9_791=l9_789;
}
l9_787=l9_791;
l9_783=l9_787;
l9_786=l9_783;
}
else
{
float2 l9_829=float2(0.0);
l9_829=l9_785.Surface_UVCoord0;
l9_784=l9_829;
l9_786=l9_784;
}
l9_782=l9_786;
float2 l9_830=float2(0.0);
l9_830=l9_782;
float2 l9_831=float2(0.0);
l9_831=l9_830;
l9_775=l9_831;
l9_778=l9_775;
}
else
{
float2 l9_832=float2(0.0);
l9_832=l9_777.Surface_UVCoord0;
l9_776=l9_832;
l9_778=l9_776;
}
}
}
}
l9_771=l9_778;
float2 l9_833=float2(0.0);
float2 l9_834=(*sc_set0.UserUniforms).uv3Scale;
l9_833=l9_834;
float2 l9_835=float2(0.0);
l9_835=l9_833;
float2 l9_836=float2(0.0);
float2 l9_837=(*sc_set0.UserUniforms).uv3Offset;
l9_836=l9_837;
float2 l9_838=float2(0.0);
l9_838=l9_836;
float2 l9_839=float2(0.0);
l9_839=(l9_771*l9_835)+l9_838;
float2 l9_840=float2(0.0);
l9_840=l9_839+(l9_838*(l9_769.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_767=l9_840;
l9_770=l9_767;
}
else
{
float2 l9_841=float2(0.0);
float2 l9_842=float2(0.0);
float2 l9_843=float2(0.0);
float2 l9_844=float2(0.0);
float2 l9_845=float2(0.0);
float2 l9_846=float2(0.0);
ssGlobals l9_847=l9_769;
float2 l9_848;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_849=float2(0.0);
l9_849=l9_847.Surface_UVCoord0;
l9_842=l9_849;
l9_848=l9_842;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_850=float2(0.0);
l9_850=l9_847.Surface_UVCoord1;
l9_843=l9_850;
l9_848=l9_843;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_851=float2(0.0);
l9_851=l9_847.gScreenCoord;
l9_844=l9_851;
l9_848=l9_844;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_852=float2(0.0);
float2 l9_853=float2(0.0);
float2 l9_854=float2(0.0);
ssGlobals l9_855=l9_847;
float2 l9_856;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_857=float2(0.0);
float2 l9_858=float2(0.0);
float2 l9_859=float2(0.0);
ssGlobals l9_860=l9_855;
float2 l9_861;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_862=float2(0.0);
float2 l9_863=float2(0.0);
float2 l9_864=float2(0.0);
float2 l9_865=float2(0.0);
float2 l9_866=float2(0.0);
ssGlobals l9_867=l9_860;
float2 l9_868;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_869=float2(0.0);
l9_869=l9_867.Surface_UVCoord0;
l9_863=l9_869;
l9_868=l9_863;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_870=float2(0.0);
l9_870=l9_867.Surface_UVCoord1;
l9_864=l9_870;
l9_868=l9_864;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_871=float2(0.0);
l9_871=l9_867.gScreenCoord;
l9_865=l9_871;
l9_868=l9_865;
}
else
{
float2 l9_872=float2(0.0);
l9_872=l9_867.Surface_UVCoord0;
l9_866=l9_872;
l9_868=l9_866;
}
}
}
l9_862=l9_868;
float2 l9_873=float2(0.0);
float2 l9_874=(*sc_set0.UserUniforms).uv2Scale;
l9_873=l9_874;
float2 l9_875=float2(0.0);
l9_875=l9_873;
float2 l9_876=float2(0.0);
float2 l9_877=(*sc_set0.UserUniforms).uv2Offset;
l9_876=l9_877;
float2 l9_878=float2(0.0);
l9_878=l9_876;
float2 l9_879=float2(0.0);
l9_879=(l9_862*l9_875)+l9_878;
float2 l9_880=float2(0.0);
l9_880=l9_879+(l9_878*(l9_860.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_858=l9_880;
l9_861=l9_858;
}
else
{
float2 l9_881=float2(0.0);
float2 l9_882=float2(0.0);
float2 l9_883=float2(0.0);
float2 l9_884=float2(0.0);
float2 l9_885=float2(0.0);
ssGlobals l9_886=l9_860;
float2 l9_887;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_888=float2(0.0);
l9_888=l9_886.Surface_UVCoord0;
l9_882=l9_888;
l9_887=l9_882;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_889=float2(0.0);
l9_889=l9_886.Surface_UVCoord1;
l9_883=l9_889;
l9_887=l9_883;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_890=float2(0.0);
l9_890=l9_886.gScreenCoord;
l9_884=l9_890;
l9_887=l9_884;
}
else
{
float2 l9_891=float2(0.0);
l9_891=l9_886.Surface_UVCoord0;
l9_885=l9_891;
l9_887=l9_885;
}
}
}
l9_881=l9_887;
float2 l9_892=float2(0.0);
float2 l9_893=(*sc_set0.UserUniforms).uv2Scale;
l9_892=l9_893;
float2 l9_894=float2(0.0);
l9_894=l9_892;
float2 l9_895=float2(0.0);
float2 l9_896=(*sc_set0.UserUniforms).uv2Offset;
l9_895=l9_896;
float2 l9_897=float2(0.0);
l9_897=l9_895;
float2 l9_898=float2(0.0);
l9_898=(l9_881*l9_894)+l9_897;
l9_859=l9_898;
l9_861=l9_859;
}
l9_857=l9_861;
l9_853=l9_857;
l9_856=l9_853;
}
else
{
float2 l9_899=float2(0.0);
l9_899=l9_855.Surface_UVCoord0;
l9_854=l9_899;
l9_856=l9_854;
}
l9_852=l9_856;
float2 l9_900=float2(0.0);
l9_900=l9_852;
float2 l9_901=float2(0.0);
l9_901=l9_900;
l9_845=l9_901;
l9_848=l9_845;
}
else
{
float2 l9_902=float2(0.0);
l9_902=l9_847.Surface_UVCoord0;
l9_846=l9_902;
l9_848=l9_846;
}
}
}
}
l9_841=l9_848;
float2 l9_903=float2(0.0);
float2 l9_904=(*sc_set0.UserUniforms).uv3Scale;
l9_903=l9_904;
float2 l9_905=float2(0.0);
l9_905=l9_903;
float2 l9_906=float2(0.0);
float2 l9_907=(*sc_set0.UserUniforms).uv3Offset;
l9_906=l9_907;
float2 l9_908=float2(0.0);
l9_908=l9_906;
float2 l9_909=float2(0.0);
l9_909=(l9_841*l9_905)+l9_908;
l9_768=l9_909;
l9_770=l9_768;
}
l9_766=l9_770;
l9_762=l9_766;
l9_765=l9_762;
}
else
{
float2 l9_910=float2(0.0);
l9_910=l9_764.Surface_UVCoord0;
l9_763=l9_910;
l9_765=l9_763;
}
l9_761=l9_765;
float2 l9_911=float2(0.0);
l9_911=l9_761;
float2 l9_912=float2(0.0);
l9_912=l9_911;
l9_705=l9_912;
l9_708=l9_705;
}
else
{
float2 l9_913=float2(0.0);
l9_913=l9_707.Surface_UVCoord0;
l9_706=l9_913;
l9_708=l9_706;
}
}
}
}
l9_701=l9_708;
float4 l9_914=float4(0.0);
int l9_915=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_916=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_916=0;
}
else
{
l9_916=in.varStereoViewID;
}
int l9_917=l9_916;
l9_915=1-l9_917;
}
else
{
int l9_918=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_918=0;
}
else
{
l9_918=in.varStereoViewID;
}
int l9_919=l9_918;
l9_915=l9_919;
}
int l9_920=l9_915;
int l9_921=baseTexLayout_tmp;
int l9_922=l9_920;
float2 l9_923=l9_701;
bool l9_924=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_925=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_926=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_927=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_928=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_929=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_930=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_931=0.0;
bool l9_932=l9_929&&(!l9_927);
float l9_933=1.0;
float l9_934=l9_923.x;
int l9_935=l9_926.x;
if (l9_935==1)
{
l9_934=fract(l9_934);
}
else
{
if (l9_935==2)
{
float l9_936=fract(l9_934);
float l9_937=l9_934-l9_936;
float l9_938=step(0.25,fract(l9_937*0.5));
l9_934=mix(l9_936,1.0-l9_936,fast::clamp(l9_938,0.0,1.0));
}
}
l9_923.x=l9_934;
float l9_939=l9_923.y;
int l9_940=l9_926.y;
if (l9_940==1)
{
l9_939=fract(l9_939);
}
else
{
if (l9_940==2)
{
float l9_941=fract(l9_939);
float l9_942=l9_939-l9_941;
float l9_943=step(0.25,fract(l9_942*0.5));
l9_939=mix(l9_941,1.0-l9_941,fast::clamp(l9_943,0.0,1.0));
}
}
l9_923.y=l9_939;
if (l9_927)
{
bool l9_944=l9_929;
bool l9_945;
if (l9_944)
{
l9_945=l9_926.x==3;
}
else
{
l9_945=l9_944;
}
float l9_946=l9_923.x;
float l9_947=l9_928.x;
float l9_948=l9_928.z;
bool l9_949=l9_945;
float l9_950=l9_933;
float l9_951=fast::clamp(l9_946,l9_947,l9_948);
float l9_952=step(abs(l9_946-l9_951),9.9999997e-06);
l9_950*=(l9_952+((1.0-float(l9_949))*(1.0-l9_952)));
l9_946=l9_951;
l9_923.x=l9_946;
l9_933=l9_950;
bool l9_953=l9_929;
bool l9_954;
if (l9_953)
{
l9_954=l9_926.y==3;
}
else
{
l9_954=l9_953;
}
float l9_955=l9_923.y;
float l9_956=l9_928.y;
float l9_957=l9_928.w;
bool l9_958=l9_954;
float l9_959=l9_933;
float l9_960=fast::clamp(l9_955,l9_956,l9_957);
float l9_961=step(abs(l9_955-l9_960),9.9999997e-06);
l9_959*=(l9_961+((1.0-float(l9_958))*(1.0-l9_961)));
l9_955=l9_960;
l9_923.y=l9_955;
l9_933=l9_959;
}
float2 l9_962=l9_923;
bool l9_963=l9_924;
float3x3 l9_964=l9_925;
if (l9_963)
{
l9_962=float2((l9_964*float3(l9_962,1.0)).xy);
}
float2 l9_965=l9_962;
float2 l9_966=l9_965;
float2 l9_967=l9_966;
l9_923=l9_967;
float l9_968=l9_923.x;
int l9_969=l9_926.x;
bool l9_970=l9_932;
float l9_971=l9_933;
if ((l9_969==0)||(l9_969==3))
{
float l9_972=l9_968;
float l9_973=0.0;
float l9_974=1.0;
bool l9_975=l9_970;
float l9_976=l9_971;
float l9_977=fast::clamp(l9_972,l9_973,l9_974);
float l9_978=step(abs(l9_972-l9_977),9.9999997e-06);
l9_976*=(l9_978+((1.0-float(l9_975))*(1.0-l9_978)));
l9_972=l9_977;
l9_968=l9_972;
l9_971=l9_976;
}
l9_923.x=l9_968;
l9_933=l9_971;
float l9_979=l9_923.y;
int l9_980=l9_926.y;
bool l9_981=l9_932;
float l9_982=l9_933;
if ((l9_980==0)||(l9_980==3))
{
float l9_983=l9_979;
float l9_984=0.0;
float l9_985=1.0;
bool l9_986=l9_981;
float l9_987=l9_982;
float l9_988=fast::clamp(l9_983,l9_984,l9_985);
float l9_989=step(abs(l9_983-l9_988),9.9999997e-06);
l9_987*=(l9_989+((1.0-float(l9_986))*(1.0-l9_989)));
l9_983=l9_988;
l9_979=l9_983;
l9_982=l9_987;
}
l9_923.y=l9_979;
l9_933=l9_982;
float2 l9_990=l9_923;
int l9_991=l9_921;
int l9_992=l9_922;
float l9_993=l9_931;
float2 l9_994=l9_990;
int l9_995=l9_991;
int l9_996=l9_992;
float3 l9_997=float3(0.0);
if (l9_995==0)
{
l9_997=float3(l9_994,0.0);
}
else
{
if (l9_995==1)
{
l9_997=float3(l9_994.x,(l9_994.y*0.5)+(0.5-(float(l9_996)*0.5)),0.0);
}
else
{
l9_997=float3(l9_994,float(l9_996));
}
}
float3 l9_998=l9_997;
float3 l9_999=l9_998;
float2 l9_1000=l9_999.xy;
float l9_1001=l9_993;
float4 l9_1002=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1000,bias(l9_1001));
float4 l9_1003=l9_1002;
float4 l9_1004=l9_1003;
if (l9_929)
{
l9_1004=mix(l9_930,l9_1004,float4(l9_933));
}
float4 l9_1005=l9_1004;
l9_914=l9_1005;
l9_697=l9_914;
l9_700=l9_697;
}
else
{
l9_700=l9_698;
}
l9_696=l9_700;
float4 l9_1006=float4(0.0);
l9_1006=l9_695*l9_696;
float4 l9_1007=float4(0.0);
l9_1007=l9_1006;
float4 l9_1008=float4(0.0);
l9_1008=l9_1007;
float l9_1009=0.0;
float l9_1010=0.0;
float l9_1011=0.0;
float3 l9_1012=l9_1008.xyz;
float l9_1013=l9_1012.x;
float l9_1014=l9_1012.y;
float l9_1015=l9_1012.z;
l9_1009=l9_1013;
l9_1010=l9_1014;
l9_1011=l9_1015;
float3 l9_1016=float3(0.0);
l9_1016=l9_692*float3(l9_1009);
float3 l9_1017=float3(0.0);
float3 l9_1018=(*sc_set0.UserUniforms).recolorGreen;
l9_1017=l9_1018;
float3 l9_1019=float3(0.0);
l9_1019=l9_1017;
float3 l9_1020=float3(0.0);
l9_1020=l9_1019*float3(l9_1010);
float3 l9_1021=float3(0.0);
float3 l9_1022=(*sc_set0.UserUniforms).recolorBlue;
l9_1021=l9_1022;
float3 l9_1023=float3(0.0);
l9_1023=l9_1021;
float3 l9_1024=float3(0.0);
l9_1024=l9_1023*float3(l9_1011);
float3 l9_1025=float3(0.0);
l9_1025=(l9_1016+l9_1020)+l9_1024;
l9_686=l9_1025;
l9_689=l9_686;
}
else
{
float4 l9_1026=float4(0.0);
float4 l9_1027=(*sc_set0.UserUniforms).baseColor;
l9_1026=l9_1027;
float4 l9_1028=float4(0.0);
l9_1028=l9_1026;
float4 l9_1029=float4(0.0);
float4 l9_1030=float4(0.0);
float4 l9_1031=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_1032=l9_688;
float4 l9_1033;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1034=float2(0.0);
float2 l9_1035=float2(0.0);
float2 l9_1036=float2(0.0);
float2 l9_1037=float2(0.0);
float2 l9_1038=float2(0.0);
float2 l9_1039=float2(0.0);
ssGlobals l9_1040=l9_1032;
float2 l9_1041;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1042=float2(0.0);
l9_1042=l9_1040.Surface_UVCoord0;
l9_1035=l9_1042;
l9_1041=l9_1035;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1043=float2(0.0);
l9_1043=l9_1040.Surface_UVCoord1;
l9_1036=l9_1043;
l9_1041=l9_1036;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1044=float2(0.0);
float2 l9_1045=float2(0.0);
float2 l9_1046=float2(0.0);
ssGlobals l9_1047=l9_1040;
float2 l9_1048;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1049=float2(0.0);
float2 l9_1050=float2(0.0);
float2 l9_1051=float2(0.0);
ssGlobals l9_1052=l9_1047;
float2 l9_1053;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1054=float2(0.0);
float2 l9_1055=float2(0.0);
float2 l9_1056=float2(0.0);
float2 l9_1057=float2(0.0);
float2 l9_1058=float2(0.0);
ssGlobals l9_1059=l9_1052;
float2 l9_1060;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1061=float2(0.0);
l9_1061=l9_1059.Surface_UVCoord0;
l9_1055=l9_1061;
l9_1060=l9_1055;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1062=float2(0.0);
l9_1062=l9_1059.Surface_UVCoord1;
l9_1056=l9_1062;
l9_1060=l9_1056;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1063=float2(0.0);
l9_1063=l9_1059.gScreenCoord;
l9_1057=l9_1063;
l9_1060=l9_1057;
}
else
{
float2 l9_1064=float2(0.0);
l9_1064=l9_1059.Surface_UVCoord0;
l9_1058=l9_1064;
l9_1060=l9_1058;
}
}
}
l9_1054=l9_1060;
float2 l9_1065=float2(0.0);
float2 l9_1066=(*sc_set0.UserUniforms).uv2Scale;
l9_1065=l9_1066;
float2 l9_1067=float2(0.0);
l9_1067=l9_1065;
float2 l9_1068=float2(0.0);
float2 l9_1069=(*sc_set0.UserUniforms).uv2Offset;
l9_1068=l9_1069;
float2 l9_1070=float2(0.0);
l9_1070=l9_1068;
float2 l9_1071=float2(0.0);
l9_1071=(l9_1054*l9_1067)+l9_1070;
float2 l9_1072=float2(0.0);
l9_1072=l9_1071+(l9_1070*(l9_1052.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1050=l9_1072;
l9_1053=l9_1050;
}
else
{
float2 l9_1073=float2(0.0);
float2 l9_1074=float2(0.0);
float2 l9_1075=float2(0.0);
float2 l9_1076=float2(0.0);
float2 l9_1077=float2(0.0);
ssGlobals l9_1078=l9_1052;
float2 l9_1079;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1080=float2(0.0);
l9_1080=l9_1078.Surface_UVCoord0;
l9_1074=l9_1080;
l9_1079=l9_1074;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1081=float2(0.0);
l9_1081=l9_1078.Surface_UVCoord1;
l9_1075=l9_1081;
l9_1079=l9_1075;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1082=float2(0.0);
l9_1082=l9_1078.gScreenCoord;
l9_1076=l9_1082;
l9_1079=l9_1076;
}
else
{
float2 l9_1083=float2(0.0);
l9_1083=l9_1078.Surface_UVCoord0;
l9_1077=l9_1083;
l9_1079=l9_1077;
}
}
}
l9_1073=l9_1079;
float2 l9_1084=float2(0.0);
float2 l9_1085=(*sc_set0.UserUniforms).uv2Scale;
l9_1084=l9_1085;
float2 l9_1086=float2(0.0);
l9_1086=l9_1084;
float2 l9_1087=float2(0.0);
float2 l9_1088=(*sc_set0.UserUniforms).uv2Offset;
l9_1087=l9_1088;
float2 l9_1089=float2(0.0);
l9_1089=l9_1087;
float2 l9_1090=float2(0.0);
l9_1090=(l9_1073*l9_1086)+l9_1089;
l9_1051=l9_1090;
l9_1053=l9_1051;
}
l9_1049=l9_1053;
l9_1045=l9_1049;
l9_1048=l9_1045;
}
else
{
float2 l9_1091=float2(0.0);
l9_1091=l9_1047.Surface_UVCoord0;
l9_1046=l9_1091;
l9_1048=l9_1046;
}
l9_1044=l9_1048;
float2 l9_1092=float2(0.0);
l9_1092=l9_1044;
float2 l9_1093=float2(0.0);
l9_1093=l9_1092;
l9_1037=l9_1093;
l9_1041=l9_1037;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1094=float2(0.0);
float2 l9_1095=float2(0.0);
float2 l9_1096=float2(0.0);
ssGlobals l9_1097=l9_1040;
float2 l9_1098;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1099=float2(0.0);
float2 l9_1100=float2(0.0);
float2 l9_1101=float2(0.0);
ssGlobals l9_1102=l9_1097;
float2 l9_1103;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1104=float2(0.0);
float2 l9_1105=float2(0.0);
float2 l9_1106=float2(0.0);
float2 l9_1107=float2(0.0);
float2 l9_1108=float2(0.0);
float2 l9_1109=float2(0.0);
ssGlobals l9_1110=l9_1102;
float2 l9_1111;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1112=float2(0.0);
l9_1112=l9_1110.Surface_UVCoord0;
l9_1105=l9_1112;
l9_1111=l9_1105;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1113=float2(0.0);
l9_1113=l9_1110.Surface_UVCoord1;
l9_1106=l9_1113;
l9_1111=l9_1106;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1114=float2(0.0);
l9_1114=l9_1110.gScreenCoord;
l9_1107=l9_1114;
l9_1111=l9_1107;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1115=float2(0.0);
float2 l9_1116=float2(0.0);
float2 l9_1117=float2(0.0);
ssGlobals l9_1118=l9_1110;
float2 l9_1119;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1120=float2(0.0);
float2 l9_1121=float2(0.0);
float2 l9_1122=float2(0.0);
ssGlobals l9_1123=l9_1118;
float2 l9_1124;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1125=float2(0.0);
float2 l9_1126=float2(0.0);
float2 l9_1127=float2(0.0);
float2 l9_1128=float2(0.0);
float2 l9_1129=float2(0.0);
ssGlobals l9_1130=l9_1123;
float2 l9_1131;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1132=float2(0.0);
l9_1132=l9_1130.Surface_UVCoord0;
l9_1126=l9_1132;
l9_1131=l9_1126;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1133=float2(0.0);
l9_1133=l9_1130.Surface_UVCoord1;
l9_1127=l9_1133;
l9_1131=l9_1127;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1134=float2(0.0);
l9_1134=l9_1130.gScreenCoord;
l9_1128=l9_1134;
l9_1131=l9_1128;
}
else
{
float2 l9_1135=float2(0.0);
l9_1135=l9_1130.Surface_UVCoord0;
l9_1129=l9_1135;
l9_1131=l9_1129;
}
}
}
l9_1125=l9_1131;
float2 l9_1136=float2(0.0);
float2 l9_1137=(*sc_set0.UserUniforms).uv2Scale;
l9_1136=l9_1137;
float2 l9_1138=float2(0.0);
l9_1138=l9_1136;
float2 l9_1139=float2(0.0);
float2 l9_1140=(*sc_set0.UserUniforms).uv2Offset;
l9_1139=l9_1140;
float2 l9_1141=float2(0.0);
l9_1141=l9_1139;
float2 l9_1142=float2(0.0);
l9_1142=(l9_1125*l9_1138)+l9_1141;
float2 l9_1143=float2(0.0);
l9_1143=l9_1142+(l9_1141*(l9_1123.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1121=l9_1143;
l9_1124=l9_1121;
}
else
{
float2 l9_1144=float2(0.0);
float2 l9_1145=float2(0.0);
float2 l9_1146=float2(0.0);
float2 l9_1147=float2(0.0);
float2 l9_1148=float2(0.0);
ssGlobals l9_1149=l9_1123;
float2 l9_1150;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1151=float2(0.0);
l9_1151=l9_1149.Surface_UVCoord0;
l9_1145=l9_1151;
l9_1150=l9_1145;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1152=float2(0.0);
l9_1152=l9_1149.Surface_UVCoord1;
l9_1146=l9_1152;
l9_1150=l9_1146;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1153=float2(0.0);
l9_1153=l9_1149.gScreenCoord;
l9_1147=l9_1153;
l9_1150=l9_1147;
}
else
{
float2 l9_1154=float2(0.0);
l9_1154=l9_1149.Surface_UVCoord0;
l9_1148=l9_1154;
l9_1150=l9_1148;
}
}
}
l9_1144=l9_1150;
float2 l9_1155=float2(0.0);
float2 l9_1156=(*sc_set0.UserUniforms).uv2Scale;
l9_1155=l9_1156;
float2 l9_1157=float2(0.0);
l9_1157=l9_1155;
float2 l9_1158=float2(0.0);
float2 l9_1159=(*sc_set0.UserUniforms).uv2Offset;
l9_1158=l9_1159;
float2 l9_1160=float2(0.0);
l9_1160=l9_1158;
float2 l9_1161=float2(0.0);
l9_1161=(l9_1144*l9_1157)+l9_1160;
l9_1122=l9_1161;
l9_1124=l9_1122;
}
l9_1120=l9_1124;
l9_1116=l9_1120;
l9_1119=l9_1116;
}
else
{
float2 l9_1162=float2(0.0);
l9_1162=l9_1118.Surface_UVCoord0;
l9_1117=l9_1162;
l9_1119=l9_1117;
}
l9_1115=l9_1119;
float2 l9_1163=float2(0.0);
l9_1163=l9_1115;
float2 l9_1164=float2(0.0);
l9_1164=l9_1163;
l9_1108=l9_1164;
l9_1111=l9_1108;
}
else
{
float2 l9_1165=float2(0.0);
l9_1165=l9_1110.Surface_UVCoord0;
l9_1109=l9_1165;
l9_1111=l9_1109;
}
}
}
}
l9_1104=l9_1111;
float2 l9_1166=float2(0.0);
float2 l9_1167=(*sc_set0.UserUniforms).uv3Scale;
l9_1166=l9_1167;
float2 l9_1168=float2(0.0);
l9_1168=l9_1166;
float2 l9_1169=float2(0.0);
float2 l9_1170=(*sc_set0.UserUniforms).uv3Offset;
l9_1169=l9_1170;
float2 l9_1171=float2(0.0);
l9_1171=l9_1169;
float2 l9_1172=float2(0.0);
l9_1172=(l9_1104*l9_1168)+l9_1171;
float2 l9_1173=float2(0.0);
l9_1173=l9_1172+(l9_1171*(l9_1102.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1100=l9_1173;
l9_1103=l9_1100;
}
else
{
float2 l9_1174=float2(0.0);
float2 l9_1175=float2(0.0);
float2 l9_1176=float2(0.0);
float2 l9_1177=float2(0.0);
float2 l9_1178=float2(0.0);
float2 l9_1179=float2(0.0);
ssGlobals l9_1180=l9_1102;
float2 l9_1181;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1182=float2(0.0);
l9_1182=l9_1180.Surface_UVCoord0;
l9_1175=l9_1182;
l9_1181=l9_1175;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1183=float2(0.0);
l9_1183=l9_1180.Surface_UVCoord1;
l9_1176=l9_1183;
l9_1181=l9_1176;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1184=float2(0.0);
l9_1184=l9_1180.gScreenCoord;
l9_1177=l9_1184;
l9_1181=l9_1177;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1185=float2(0.0);
float2 l9_1186=float2(0.0);
float2 l9_1187=float2(0.0);
ssGlobals l9_1188=l9_1180;
float2 l9_1189;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1190=float2(0.0);
float2 l9_1191=float2(0.0);
float2 l9_1192=float2(0.0);
ssGlobals l9_1193=l9_1188;
float2 l9_1194;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1195=float2(0.0);
float2 l9_1196=float2(0.0);
float2 l9_1197=float2(0.0);
float2 l9_1198=float2(0.0);
float2 l9_1199=float2(0.0);
ssGlobals l9_1200=l9_1193;
float2 l9_1201;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1202=float2(0.0);
l9_1202=l9_1200.Surface_UVCoord0;
l9_1196=l9_1202;
l9_1201=l9_1196;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1203=float2(0.0);
l9_1203=l9_1200.Surface_UVCoord1;
l9_1197=l9_1203;
l9_1201=l9_1197;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1204=float2(0.0);
l9_1204=l9_1200.gScreenCoord;
l9_1198=l9_1204;
l9_1201=l9_1198;
}
else
{
float2 l9_1205=float2(0.0);
l9_1205=l9_1200.Surface_UVCoord0;
l9_1199=l9_1205;
l9_1201=l9_1199;
}
}
}
l9_1195=l9_1201;
float2 l9_1206=float2(0.0);
float2 l9_1207=(*sc_set0.UserUniforms).uv2Scale;
l9_1206=l9_1207;
float2 l9_1208=float2(0.0);
l9_1208=l9_1206;
float2 l9_1209=float2(0.0);
float2 l9_1210=(*sc_set0.UserUniforms).uv2Offset;
l9_1209=l9_1210;
float2 l9_1211=float2(0.0);
l9_1211=l9_1209;
float2 l9_1212=float2(0.0);
l9_1212=(l9_1195*l9_1208)+l9_1211;
float2 l9_1213=float2(0.0);
l9_1213=l9_1212+(l9_1211*(l9_1193.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1191=l9_1213;
l9_1194=l9_1191;
}
else
{
float2 l9_1214=float2(0.0);
float2 l9_1215=float2(0.0);
float2 l9_1216=float2(0.0);
float2 l9_1217=float2(0.0);
float2 l9_1218=float2(0.0);
ssGlobals l9_1219=l9_1193;
float2 l9_1220;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1221=float2(0.0);
l9_1221=l9_1219.Surface_UVCoord0;
l9_1215=l9_1221;
l9_1220=l9_1215;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1222=float2(0.0);
l9_1222=l9_1219.Surface_UVCoord1;
l9_1216=l9_1222;
l9_1220=l9_1216;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1223=float2(0.0);
l9_1223=l9_1219.gScreenCoord;
l9_1217=l9_1223;
l9_1220=l9_1217;
}
else
{
float2 l9_1224=float2(0.0);
l9_1224=l9_1219.Surface_UVCoord0;
l9_1218=l9_1224;
l9_1220=l9_1218;
}
}
}
l9_1214=l9_1220;
float2 l9_1225=float2(0.0);
float2 l9_1226=(*sc_set0.UserUniforms).uv2Scale;
l9_1225=l9_1226;
float2 l9_1227=float2(0.0);
l9_1227=l9_1225;
float2 l9_1228=float2(0.0);
float2 l9_1229=(*sc_set0.UserUniforms).uv2Offset;
l9_1228=l9_1229;
float2 l9_1230=float2(0.0);
l9_1230=l9_1228;
float2 l9_1231=float2(0.0);
l9_1231=(l9_1214*l9_1227)+l9_1230;
l9_1192=l9_1231;
l9_1194=l9_1192;
}
l9_1190=l9_1194;
l9_1186=l9_1190;
l9_1189=l9_1186;
}
else
{
float2 l9_1232=float2(0.0);
l9_1232=l9_1188.Surface_UVCoord0;
l9_1187=l9_1232;
l9_1189=l9_1187;
}
l9_1185=l9_1189;
float2 l9_1233=float2(0.0);
l9_1233=l9_1185;
float2 l9_1234=float2(0.0);
l9_1234=l9_1233;
l9_1178=l9_1234;
l9_1181=l9_1178;
}
else
{
float2 l9_1235=float2(0.0);
l9_1235=l9_1180.Surface_UVCoord0;
l9_1179=l9_1235;
l9_1181=l9_1179;
}
}
}
}
l9_1174=l9_1181;
float2 l9_1236=float2(0.0);
float2 l9_1237=(*sc_set0.UserUniforms).uv3Scale;
l9_1236=l9_1237;
float2 l9_1238=float2(0.0);
l9_1238=l9_1236;
float2 l9_1239=float2(0.0);
float2 l9_1240=(*sc_set0.UserUniforms).uv3Offset;
l9_1239=l9_1240;
float2 l9_1241=float2(0.0);
l9_1241=l9_1239;
float2 l9_1242=float2(0.0);
l9_1242=(l9_1174*l9_1238)+l9_1241;
l9_1101=l9_1242;
l9_1103=l9_1101;
}
l9_1099=l9_1103;
l9_1095=l9_1099;
l9_1098=l9_1095;
}
else
{
float2 l9_1243=float2(0.0);
l9_1243=l9_1097.Surface_UVCoord0;
l9_1096=l9_1243;
l9_1098=l9_1096;
}
l9_1094=l9_1098;
float2 l9_1244=float2(0.0);
l9_1244=l9_1094;
float2 l9_1245=float2(0.0);
l9_1245=l9_1244;
l9_1038=l9_1245;
l9_1041=l9_1038;
}
else
{
float2 l9_1246=float2(0.0);
l9_1246=l9_1040.Surface_UVCoord0;
l9_1039=l9_1246;
l9_1041=l9_1039;
}
}
}
}
l9_1034=l9_1041;
float4 l9_1247=float4(0.0);
int l9_1248=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1249=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1249=0;
}
else
{
l9_1249=in.varStereoViewID;
}
int l9_1250=l9_1249;
l9_1248=1-l9_1250;
}
else
{
int l9_1251=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1251=0;
}
else
{
l9_1251=in.varStereoViewID;
}
int l9_1252=l9_1251;
l9_1248=l9_1252;
}
int l9_1253=l9_1248;
int l9_1254=baseTexLayout_tmp;
int l9_1255=l9_1253;
float2 l9_1256=l9_1034;
bool l9_1257=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1258=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1259=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1260=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1261=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1262=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1263=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1264=0.0;
bool l9_1265=l9_1262&&(!l9_1260);
float l9_1266=1.0;
float l9_1267=l9_1256.x;
int l9_1268=l9_1259.x;
if (l9_1268==1)
{
l9_1267=fract(l9_1267);
}
else
{
if (l9_1268==2)
{
float l9_1269=fract(l9_1267);
float l9_1270=l9_1267-l9_1269;
float l9_1271=step(0.25,fract(l9_1270*0.5));
l9_1267=mix(l9_1269,1.0-l9_1269,fast::clamp(l9_1271,0.0,1.0));
}
}
l9_1256.x=l9_1267;
float l9_1272=l9_1256.y;
int l9_1273=l9_1259.y;
if (l9_1273==1)
{
l9_1272=fract(l9_1272);
}
else
{
if (l9_1273==2)
{
float l9_1274=fract(l9_1272);
float l9_1275=l9_1272-l9_1274;
float l9_1276=step(0.25,fract(l9_1275*0.5));
l9_1272=mix(l9_1274,1.0-l9_1274,fast::clamp(l9_1276,0.0,1.0));
}
}
l9_1256.y=l9_1272;
if (l9_1260)
{
bool l9_1277=l9_1262;
bool l9_1278;
if (l9_1277)
{
l9_1278=l9_1259.x==3;
}
else
{
l9_1278=l9_1277;
}
float l9_1279=l9_1256.x;
float l9_1280=l9_1261.x;
float l9_1281=l9_1261.z;
bool l9_1282=l9_1278;
float l9_1283=l9_1266;
float l9_1284=fast::clamp(l9_1279,l9_1280,l9_1281);
float l9_1285=step(abs(l9_1279-l9_1284),9.9999997e-06);
l9_1283*=(l9_1285+((1.0-float(l9_1282))*(1.0-l9_1285)));
l9_1279=l9_1284;
l9_1256.x=l9_1279;
l9_1266=l9_1283;
bool l9_1286=l9_1262;
bool l9_1287;
if (l9_1286)
{
l9_1287=l9_1259.y==3;
}
else
{
l9_1287=l9_1286;
}
float l9_1288=l9_1256.y;
float l9_1289=l9_1261.y;
float l9_1290=l9_1261.w;
bool l9_1291=l9_1287;
float l9_1292=l9_1266;
float l9_1293=fast::clamp(l9_1288,l9_1289,l9_1290);
float l9_1294=step(abs(l9_1288-l9_1293),9.9999997e-06);
l9_1292*=(l9_1294+((1.0-float(l9_1291))*(1.0-l9_1294)));
l9_1288=l9_1293;
l9_1256.y=l9_1288;
l9_1266=l9_1292;
}
float2 l9_1295=l9_1256;
bool l9_1296=l9_1257;
float3x3 l9_1297=l9_1258;
if (l9_1296)
{
l9_1295=float2((l9_1297*float3(l9_1295,1.0)).xy);
}
float2 l9_1298=l9_1295;
float2 l9_1299=l9_1298;
float2 l9_1300=l9_1299;
l9_1256=l9_1300;
float l9_1301=l9_1256.x;
int l9_1302=l9_1259.x;
bool l9_1303=l9_1265;
float l9_1304=l9_1266;
if ((l9_1302==0)||(l9_1302==3))
{
float l9_1305=l9_1301;
float l9_1306=0.0;
float l9_1307=1.0;
bool l9_1308=l9_1303;
float l9_1309=l9_1304;
float l9_1310=fast::clamp(l9_1305,l9_1306,l9_1307);
float l9_1311=step(abs(l9_1305-l9_1310),9.9999997e-06);
l9_1309*=(l9_1311+((1.0-float(l9_1308))*(1.0-l9_1311)));
l9_1305=l9_1310;
l9_1301=l9_1305;
l9_1304=l9_1309;
}
l9_1256.x=l9_1301;
l9_1266=l9_1304;
float l9_1312=l9_1256.y;
int l9_1313=l9_1259.y;
bool l9_1314=l9_1265;
float l9_1315=l9_1266;
if ((l9_1313==0)||(l9_1313==3))
{
float l9_1316=l9_1312;
float l9_1317=0.0;
float l9_1318=1.0;
bool l9_1319=l9_1314;
float l9_1320=l9_1315;
float l9_1321=fast::clamp(l9_1316,l9_1317,l9_1318);
float l9_1322=step(abs(l9_1316-l9_1321),9.9999997e-06);
l9_1320*=(l9_1322+((1.0-float(l9_1319))*(1.0-l9_1322)));
l9_1316=l9_1321;
l9_1312=l9_1316;
l9_1315=l9_1320;
}
l9_1256.y=l9_1312;
l9_1266=l9_1315;
float2 l9_1323=l9_1256;
int l9_1324=l9_1254;
int l9_1325=l9_1255;
float l9_1326=l9_1264;
float2 l9_1327=l9_1323;
int l9_1328=l9_1324;
int l9_1329=l9_1325;
float3 l9_1330=float3(0.0);
if (l9_1328==0)
{
l9_1330=float3(l9_1327,0.0);
}
else
{
if (l9_1328==1)
{
l9_1330=float3(l9_1327.x,(l9_1327.y*0.5)+(0.5-(float(l9_1329)*0.5)),0.0);
}
else
{
l9_1330=float3(l9_1327,float(l9_1329));
}
}
float3 l9_1331=l9_1330;
float3 l9_1332=l9_1331;
float2 l9_1333=l9_1332.xy;
float l9_1334=l9_1326;
float4 l9_1335=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1333,bias(l9_1334));
float4 l9_1336=l9_1335;
float4 l9_1337=l9_1336;
if (l9_1262)
{
l9_1337=mix(l9_1263,l9_1337,float4(l9_1266));
}
float4 l9_1338=l9_1337;
l9_1247=l9_1338;
l9_1030=l9_1247;
l9_1033=l9_1030;
}
else
{
l9_1033=l9_1031;
}
l9_1029=l9_1033;
float4 l9_1339=float4(0.0);
l9_1339=l9_1028*l9_1029;
float4 l9_1340=float4(0.0);
l9_1340=l9_1339;
float4 l9_1341=float4(0.0);
l9_1341=l9_1340;
l9_687=l9_1341.xyz;
l9_689=l9_687;
}
l9_685=l9_689;
float3 l9_1342=float3(0.0);
l9_1342=l9_685;
float3 l9_1343=float3(0.0);
l9_1343=l9_1342;
float4 l9_1344=float4(0.0);
l9_1344=float4(l9_1343.x,l9_1343.y,l9_1343.z,l9_1344.w);
l9_1344.w=(*sc_set0.UserUniforms).Port_Value2_N073;
param_1=l9_1344;
param_2=param_1;
}
Result_N363=param_2;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float4 Output_N5=float4(0.0);
float4 param_4=(*sc_set0.UserUniforms).baseColor;
Output_N5=param_4;
float4 Value_N384=float4(0.0);
Value_N384=Output_N5;
float4 Result_N369=float4(0.0);
float4 param_5=float4(0.0);
float4 param_6=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals param_8=Globals;
float4 param_7;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1345=float2(0.0);
float2 l9_1346=float2(0.0);
float2 l9_1347=float2(0.0);
float2 l9_1348=float2(0.0);
float2 l9_1349=float2(0.0);
float2 l9_1350=float2(0.0);
ssGlobals l9_1351=param_8;
float2 l9_1352;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1353=float2(0.0);
l9_1353=l9_1351.Surface_UVCoord0;
l9_1346=l9_1353;
l9_1352=l9_1346;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1354=float2(0.0);
l9_1354=l9_1351.Surface_UVCoord1;
l9_1347=l9_1354;
l9_1352=l9_1347;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1355=float2(0.0);
float2 l9_1356=float2(0.0);
float2 l9_1357=float2(0.0);
ssGlobals l9_1358=l9_1351;
float2 l9_1359;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1360=float2(0.0);
float2 l9_1361=float2(0.0);
float2 l9_1362=float2(0.0);
ssGlobals l9_1363=l9_1358;
float2 l9_1364;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1365=float2(0.0);
float2 l9_1366=float2(0.0);
float2 l9_1367=float2(0.0);
float2 l9_1368=float2(0.0);
float2 l9_1369=float2(0.0);
ssGlobals l9_1370=l9_1363;
float2 l9_1371;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1372=float2(0.0);
l9_1372=l9_1370.Surface_UVCoord0;
l9_1366=l9_1372;
l9_1371=l9_1366;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1373=float2(0.0);
l9_1373=l9_1370.Surface_UVCoord1;
l9_1367=l9_1373;
l9_1371=l9_1367;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1374=float2(0.0);
l9_1374=l9_1370.gScreenCoord;
l9_1368=l9_1374;
l9_1371=l9_1368;
}
else
{
float2 l9_1375=float2(0.0);
l9_1375=l9_1370.Surface_UVCoord0;
l9_1369=l9_1375;
l9_1371=l9_1369;
}
}
}
l9_1365=l9_1371;
float2 l9_1376=float2(0.0);
float2 l9_1377=(*sc_set0.UserUniforms).uv2Scale;
l9_1376=l9_1377;
float2 l9_1378=float2(0.0);
l9_1378=l9_1376;
float2 l9_1379=float2(0.0);
float2 l9_1380=(*sc_set0.UserUniforms).uv2Offset;
l9_1379=l9_1380;
float2 l9_1381=float2(0.0);
l9_1381=l9_1379;
float2 l9_1382=float2(0.0);
l9_1382=(l9_1365*l9_1378)+l9_1381;
float2 l9_1383=float2(0.0);
l9_1383=l9_1382+(l9_1381*(l9_1363.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1361=l9_1383;
l9_1364=l9_1361;
}
else
{
float2 l9_1384=float2(0.0);
float2 l9_1385=float2(0.0);
float2 l9_1386=float2(0.0);
float2 l9_1387=float2(0.0);
float2 l9_1388=float2(0.0);
ssGlobals l9_1389=l9_1363;
float2 l9_1390;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1391=float2(0.0);
l9_1391=l9_1389.Surface_UVCoord0;
l9_1385=l9_1391;
l9_1390=l9_1385;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1392=float2(0.0);
l9_1392=l9_1389.Surface_UVCoord1;
l9_1386=l9_1392;
l9_1390=l9_1386;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1393=float2(0.0);
l9_1393=l9_1389.gScreenCoord;
l9_1387=l9_1393;
l9_1390=l9_1387;
}
else
{
float2 l9_1394=float2(0.0);
l9_1394=l9_1389.Surface_UVCoord0;
l9_1388=l9_1394;
l9_1390=l9_1388;
}
}
}
l9_1384=l9_1390;
float2 l9_1395=float2(0.0);
float2 l9_1396=(*sc_set0.UserUniforms).uv2Scale;
l9_1395=l9_1396;
float2 l9_1397=float2(0.0);
l9_1397=l9_1395;
float2 l9_1398=float2(0.0);
float2 l9_1399=(*sc_set0.UserUniforms).uv2Offset;
l9_1398=l9_1399;
float2 l9_1400=float2(0.0);
l9_1400=l9_1398;
float2 l9_1401=float2(0.0);
l9_1401=(l9_1384*l9_1397)+l9_1400;
l9_1362=l9_1401;
l9_1364=l9_1362;
}
l9_1360=l9_1364;
l9_1356=l9_1360;
l9_1359=l9_1356;
}
else
{
float2 l9_1402=float2(0.0);
l9_1402=l9_1358.Surface_UVCoord0;
l9_1357=l9_1402;
l9_1359=l9_1357;
}
l9_1355=l9_1359;
float2 l9_1403=float2(0.0);
l9_1403=l9_1355;
float2 l9_1404=float2(0.0);
l9_1404=l9_1403;
l9_1348=l9_1404;
l9_1352=l9_1348;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1405=float2(0.0);
float2 l9_1406=float2(0.0);
float2 l9_1407=float2(0.0);
ssGlobals l9_1408=l9_1351;
float2 l9_1409;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1410=float2(0.0);
float2 l9_1411=float2(0.0);
float2 l9_1412=float2(0.0);
ssGlobals l9_1413=l9_1408;
float2 l9_1414;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
float2 l9_1417=float2(0.0);
float2 l9_1418=float2(0.0);
float2 l9_1419=float2(0.0);
float2 l9_1420=float2(0.0);
ssGlobals l9_1421=l9_1413;
float2 l9_1422;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1423=float2(0.0);
l9_1423=l9_1421.Surface_UVCoord0;
l9_1416=l9_1423;
l9_1422=l9_1416;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1424=float2(0.0);
l9_1424=l9_1421.Surface_UVCoord1;
l9_1417=l9_1424;
l9_1422=l9_1417;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1425=float2(0.0);
l9_1425=l9_1421.gScreenCoord;
l9_1418=l9_1425;
l9_1422=l9_1418;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1426=float2(0.0);
float2 l9_1427=float2(0.0);
float2 l9_1428=float2(0.0);
ssGlobals l9_1429=l9_1421;
float2 l9_1430;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1431=float2(0.0);
float2 l9_1432=float2(0.0);
float2 l9_1433=float2(0.0);
ssGlobals l9_1434=l9_1429;
float2 l9_1435;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1436=float2(0.0);
float2 l9_1437=float2(0.0);
float2 l9_1438=float2(0.0);
float2 l9_1439=float2(0.0);
float2 l9_1440=float2(0.0);
ssGlobals l9_1441=l9_1434;
float2 l9_1442;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1443=float2(0.0);
l9_1443=l9_1441.Surface_UVCoord0;
l9_1437=l9_1443;
l9_1442=l9_1437;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1444=float2(0.0);
l9_1444=l9_1441.Surface_UVCoord1;
l9_1438=l9_1444;
l9_1442=l9_1438;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1445=float2(0.0);
l9_1445=l9_1441.gScreenCoord;
l9_1439=l9_1445;
l9_1442=l9_1439;
}
else
{
float2 l9_1446=float2(0.0);
l9_1446=l9_1441.Surface_UVCoord0;
l9_1440=l9_1446;
l9_1442=l9_1440;
}
}
}
l9_1436=l9_1442;
float2 l9_1447=float2(0.0);
float2 l9_1448=(*sc_set0.UserUniforms).uv2Scale;
l9_1447=l9_1448;
float2 l9_1449=float2(0.0);
l9_1449=l9_1447;
float2 l9_1450=float2(0.0);
float2 l9_1451=(*sc_set0.UserUniforms).uv2Offset;
l9_1450=l9_1451;
float2 l9_1452=float2(0.0);
l9_1452=l9_1450;
float2 l9_1453=float2(0.0);
l9_1453=(l9_1436*l9_1449)+l9_1452;
float2 l9_1454=float2(0.0);
l9_1454=l9_1453+(l9_1452*(l9_1434.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1432=l9_1454;
l9_1435=l9_1432;
}
else
{
float2 l9_1455=float2(0.0);
float2 l9_1456=float2(0.0);
float2 l9_1457=float2(0.0);
float2 l9_1458=float2(0.0);
float2 l9_1459=float2(0.0);
ssGlobals l9_1460=l9_1434;
float2 l9_1461;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1462=float2(0.0);
l9_1462=l9_1460.Surface_UVCoord0;
l9_1456=l9_1462;
l9_1461=l9_1456;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1463=float2(0.0);
l9_1463=l9_1460.Surface_UVCoord1;
l9_1457=l9_1463;
l9_1461=l9_1457;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1464=float2(0.0);
l9_1464=l9_1460.gScreenCoord;
l9_1458=l9_1464;
l9_1461=l9_1458;
}
else
{
float2 l9_1465=float2(0.0);
l9_1465=l9_1460.Surface_UVCoord0;
l9_1459=l9_1465;
l9_1461=l9_1459;
}
}
}
l9_1455=l9_1461;
float2 l9_1466=float2(0.0);
float2 l9_1467=(*sc_set0.UserUniforms).uv2Scale;
l9_1466=l9_1467;
float2 l9_1468=float2(0.0);
l9_1468=l9_1466;
float2 l9_1469=float2(0.0);
float2 l9_1470=(*sc_set0.UserUniforms).uv2Offset;
l9_1469=l9_1470;
float2 l9_1471=float2(0.0);
l9_1471=l9_1469;
float2 l9_1472=float2(0.0);
l9_1472=(l9_1455*l9_1468)+l9_1471;
l9_1433=l9_1472;
l9_1435=l9_1433;
}
l9_1431=l9_1435;
l9_1427=l9_1431;
l9_1430=l9_1427;
}
else
{
float2 l9_1473=float2(0.0);
l9_1473=l9_1429.Surface_UVCoord0;
l9_1428=l9_1473;
l9_1430=l9_1428;
}
l9_1426=l9_1430;
float2 l9_1474=float2(0.0);
l9_1474=l9_1426;
float2 l9_1475=float2(0.0);
l9_1475=l9_1474;
l9_1419=l9_1475;
l9_1422=l9_1419;
}
else
{
float2 l9_1476=float2(0.0);
l9_1476=l9_1421.Surface_UVCoord0;
l9_1420=l9_1476;
l9_1422=l9_1420;
}
}
}
}
l9_1415=l9_1422;
float2 l9_1477=float2(0.0);
float2 l9_1478=(*sc_set0.UserUniforms).uv3Scale;
l9_1477=l9_1478;
float2 l9_1479=float2(0.0);
l9_1479=l9_1477;
float2 l9_1480=float2(0.0);
float2 l9_1481=(*sc_set0.UserUniforms).uv3Offset;
l9_1480=l9_1481;
float2 l9_1482=float2(0.0);
l9_1482=l9_1480;
float2 l9_1483=float2(0.0);
l9_1483=(l9_1415*l9_1479)+l9_1482;
float2 l9_1484=float2(0.0);
l9_1484=l9_1483+(l9_1482*(l9_1413.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1411=l9_1484;
l9_1414=l9_1411;
}
else
{
float2 l9_1485=float2(0.0);
float2 l9_1486=float2(0.0);
float2 l9_1487=float2(0.0);
float2 l9_1488=float2(0.0);
float2 l9_1489=float2(0.0);
float2 l9_1490=float2(0.0);
ssGlobals l9_1491=l9_1413;
float2 l9_1492;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1493=float2(0.0);
l9_1493=l9_1491.Surface_UVCoord0;
l9_1486=l9_1493;
l9_1492=l9_1486;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1494=float2(0.0);
l9_1494=l9_1491.Surface_UVCoord1;
l9_1487=l9_1494;
l9_1492=l9_1487;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1495=float2(0.0);
l9_1495=l9_1491.gScreenCoord;
l9_1488=l9_1495;
l9_1492=l9_1488;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1496=float2(0.0);
float2 l9_1497=float2(0.0);
float2 l9_1498=float2(0.0);
ssGlobals l9_1499=l9_1491;
float2 l9_1500;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1501=float2(0.0);
float2 l9_1502=float2(0.0);
float2 l9_1503=float2(0.0);
ssGlobals l9_1504=l9_1499;
float2 l9_1505;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1506=float2(0.0);
float2 l9_1507=float2(0.0);
float2 l9_1508=float2(0.0);
float2 l9_1509=float2(0.0);
float2 l9_1510=float2(0.0);
ssGlobals l9_1511=l9_1504;
float2 l9_1512;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1513=float2(0.0);
l9_1513=l9_1511.Surface_UVCoord0;
l9_1507=l9_1513;
l9_1512=l9_1507;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1514=float2(0.0);
l9_1514=l9_1511.Surface_UVCoord1;
l9_1508=l9_1514;
l9_1512=l9_1508;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1515=float2(0.0);
l9_1515=l9_1511.gScreenCoord;
l9_1509=l9_1515;
l9_1512=l9_1509;
}
else
{
float2 l9_1516=float2(0.0);
l9_1516=l9_1511.Surface_UVCoord0;
l9_1510=l9_1516;
l9_1512=l9_1510;
}
}
}
l9_1506=l9_1512;
float2 l9_1517=float2(0.0);
float2 l9_1518=(*sc_set0.UserUniforms).uv2Scale;
l9_1517=l9_1518;
float2 l9_1519=float2(0.0);
l9_1519=l9_1517;
float2 l9_1520=float2(0.0);
float2 l9_1521=(*sc_set0.UserUniforms).uv2Offset;
l9_1520=l9_1521;
float2 l9_1522=float2(0.0);
l9_1522=l9_1520;
float2 l9_1523=float2(0.0);
l9_1523=(l9_1506*l9_1519)+l9_1522;
float2 l9_1524=float2(0.0);
l9_1524=l9_1523+(l9_1522*(l9_1504.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1502=l9_1524;
l9_1505=l9_1502;
}
else
{
float2 l9_1525=float2(0.0);
float2 l9_1526=float2(0.0);
float2 l9_1527=float2(0.0);
float2 l9_1528=float2(0.0);
float2 l9_1529=float2(0.0);
ssGlobals l9_1530=l9_1504;
float2 l9_1531;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1532=float2(0.0);
l9_1532=l9_1530.Surface_UVCoord0;
l9_1526=l9_1532;
l9_1531=l9_1526;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1533=float2(0.0);
l9_1533=l9_1530.Surface_UVCoord1;
l9_1527=l9_1533;
l9_1531=l9_1527;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1534=float2(0.0);
l9_1534=l9_1530.gScreenCoord;
l9_1528=l9_1534;
l9_1531=l9_1528;
}
else
{
float2 l9_1535=float2(0.0);
l9_1535=l9_1530.Surface_UVCoord0;
l9_1529=l9_1535;
l9_1531=l9_1529;
}
}
}
l9_1525=l9_1531;
float2 l9_1536=float2(0.0);
float2 l9_1537=(*sc_set0.UserUniforms).uv2Scale;
l9_1536=l9_1537;
float2 l9_1538=float2(0.0);
l9_1538=l9_1536;
float2 l9_1539=float2(0.0);
float2 l9_1540=(*sc_set0.UserUniforms).uv2Offset;
l9_1539=l9_1540;
float2 l9_1541=float2(0.0);
l9_1541=l9_1539;
float2 l9_1542=float2(0.0);
l9_1542=(l9_1525*l9_1538)+l9_1541;
l9_1503=l9_1542;
l9_1505=l9_1503;
}
l9_1501=l9_1505;
l9_1497=l9_1501;
l9_1500=l9_1497;
}
else
{
float2 l9_1543=float2(0.0);
l9_1543=l9_1499.Surface_UVCoord0;
l9_1498=l9_1543;
l9_1500=l9_1498;
}
l9_1496=l9_1500;
float2 l9_1544=float2(0.0);
l9_1544=l9_1496;
float2 l9_1545=float2(0.0);
l9_1545=l9_1544;
l9_1489=l9_1545;
l9_1492=l9_1489;
}
else
{
float2 l9_1546=float2(0.0);
l9_1546=l9_1491.Surface_UVCoord0;
l9_1490=l9_1546;
l9_1492=l9_1490;
}
}
}
}
l9_1485=l9_1492;
float2 l9_1547=float2(0.0);
float2 l9_1548=(*sc_set0.UserUniforms).uv3Scale;
l9_1547=l9_1548;
float2 l9_1549=float2(0.0);
l9_1549=l9_1547;
float2 l9_1550=float2(0.0);
float2 l9_1551=(*sc_set0.UserUniforms).uv3Offset;
l9_1550=l9_1551;
float2 l9_1552=float2(0.0);
l9_1552=l9_1550;
float2 l9_1553=float2(0.0);
l9_1553=(l9_1485*l9_1549)+l9_1552;
l9_1412=l9_1553;
l9_1414=l9_1412;
}
l9_1410=l9_1414;
l9_1406=l9_1410;
l9_1409=l9_1406;
}
else
{
float2 l9_1554=float2(0.0);
l9_1554=l9_1408.Surface_UVCoord0;
l9_1407=l9_1554;
l9_1409=l9_1407;
}
l9_1405=l9_1409;
float2 l9_1555=float2(0.0);
l9_1555=l9_1405;
float2 l9_1556=float2(0.0);
l9_1556=l9_1555;
l9_1349=l9_1556;
l9_1352=l9_1349;
}
else
{
float2 l9_1557=float2(0.0);
l9_1557=l9_1351.Surface_UVCoord0;
l9_1350=l9_1557;
l9_1352=l9_1350;
}
}
}
}
l9_1345=l9_1352;
float4 l9_1558=float4(0.0);
int l9_1559=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1560=0;
}
else
{
l9_1560=in.varStereoViewID;
}
int l9_1561=l9_1560;
l9_1559=1-l9_1561;
}
else
{
int l9_1562=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1562=0;
}
else
{
l9_1562=in.varStereoViewID;
}
int l9_1563=l9_1562;
l9_1559=l9_1563;
}
int l9_1564=l9_1559;
int l9_1565=baseTexLayout_tmp;
int l9_1566=l9_1564;
float2 l9_1567=l9_1345;
bool l9_1568=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1569=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1570=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1571=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1572=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1573=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1574=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1575=0.0;
bool l9_1576=l9_1573&&(!l9_1571);
float l9_1577=1.0;
float l9_1578=l9_1567.x;
int l9_1579=l9_1570.x;
if (l9_1579==1)
{
l9_1578=fract(l9_1578);
}
else
{
if (l9_1579==2)
{
float l9_1580=fract(l9_1578);
float l9_1581=l9_1578-l9_1580;
float l9_1582=step(0.25,fract(l9_1581*0.5));
l9_1578=mix(l9_1580,1.0-l9_1580,fast::clamp(l9_1582,0.0,1.0));
}
}
l9_1567.x=l9_1578;
float l9_1583=l9_1567.y;
int l9_1584=l9_1570.y;
if (l9_1584==1)
{
l9_1583=fract(l9_1583);
}
else
{
if (l9_1584==2)
{
float l9_1585=fract(l9_1583);
float l9_1586=l9_1583-l9_1585;
float l9_1587=step(0.25,fract(l9_1586*0.5));
l9_1583=mix(l9_1585,1.0-l9_1585,fast::clamp(l9_1587,0.0,1.0));
}
}
l9_1567.y=l9_1583;
if (l9_1571)
{
bool l9_1588=l9_1573;
bool l9_1589;
if (l9_1588)
{
l9_1589=l9_1570.x==3;
}
else
{
l9_1589=l9_1588;
}
float l9_1590=l9_1567.x;
float l9_1591=l9_1572.x;
float l9_1592=l9_1572.z;
bool l9_1593=l9_1589;
float l9_1594=l9_1577;
float l9_1595=fast::clamp(l9_1590,l9_1591,l9_1592);
float l9_1596=step(abs(l9_1590-l9_1595),9.9999997e-06);
l9_1594*=(l9_1596+((1.0-float(l9_1593))*(1.0-l9_1596)));
l9_1590=l9_1595;
l9_1567.x=l9_1590;
l9_1577=l9_1594;
bool l9_1597=l9_1573;
bool l9_1598;
if (l9_1597)
{
l9_1598=l9_1570.y==3;
}
else
{
l9_1598=l9_1597;
}
float l9_1599=l9_1567.y;
float l9_1600=l9_1572.y;
float l9_1601=l9_1572.w;
bool l9_1602=l9_1598;
float l9_1603=l9_1577;
float l9_1604=fast::clamp(l9_1599,l9_1600,l9_1601);
float l9_1605=step(abs(l9_1599-l9_1604),9.9999997e-06);
l9_1603*=(l9_1605+((1.0-float(l9_1602))*(1.0-l9_1605)));
l9_1599=l9_1604;
l9_1567.y=l9_1599;
l9_1577=l9_1603;
}
float2 l9_1606=l9_1567;
bool l9_1607=l9_1568;
float3x3 l9_1608=l9_1569;
if (l9_1607)
{
l9_1606=float2((l9_1608*float3(l9_1606,1.0)).xy);
}
float2 l9_1609=l9_1606;
float2 l9_1610=l9_1609;
float2 l9_1611=l9_1610;
l9_1567=l9_1611;
float l9_1612=l9_1567.x;
int l9_1613=l9_1570.x;
bool l9_1614=l9_1576;
float l9_1615=l9_1577;
if ((l9_1613==0)||(l9_1613==3))
{
float l9_1616=l9_1612;
float l9_1617=0.0;
float l9_1618=1.0;
bool l9_1619=l9_1614;
float l9_1620=l9_1615;
float l9_1621=fast::clamp(l9_1616,l9_1617,l9_1618);
float l9_1622=step(abs(l9_1616-l9_1621),9.9999997e-06);
l9_1620*=(l9_1622+((1.0-float(l9_1619))*(1.0-l9_1622)));
l9_1616=l9_1621;
l9_1612=l9_1616;
l9_1615=l9_1620;
}
l9_1567.x=l9_1612;
l9_1577=l9_1615;
float l9_1623=l9_1567.y;
int l9_1624=l9_1570.y;
bool l9_1625=l9_1576;
float l9_1626=l9_1577;
if ((l9_1624==0)||(l9_1624==3))
{
float l9_1627=l9_1623;
float l9_1628=0.0;
float l9_1629=1.0;
bool l9_1630=l9_1625;
float l9_1631=l9_1626;
float l9_1632=fast::clamp(l9_1627,l9_1628,l9_1629);
float l9_1633=step(abs(l9_1627-l9_1632),9.9999997e-06);
l9_1631*=(l9_1633+((1.0-float(l9_1630))*(1.0-l9_1633)));
l9_1627=l9_1632;
l9_1623=l9_1627;
l9_1626=l9_1631;
}
l9_1567.y=l9_1623;
l9_1577=l9_1626;
float2 l9_1634=l9_1567;
int l9_1635=l9_1565;
int l9_1636=l9_1566;
float l9_1637=l9_1575;
float2 l9_1638=l9_1634;
int l9_1639=l9_1635;
int l9_1640=l9_1636;
float3 l9_1641=float3(0.0);
if (l9_1639==0)
{
l9_1641=float3(l9_1638,0.0);
}
else
{
if (l9_1639==1)
{
l9_1641=float3(l9_1638.x,(l9_1638.y*0.5)+(0.5-(float(l9_1640)*0.5)),0.0);
}
else
{
l9_1641=float3(l9_1638,float(l9_1640));
}
}
float3 l9_1642=l9_1641;
float3 l9_1643=l9_1642;
float2 l9_1644=l9_1643.xy;
float l9_1645=l9_1637;
float4 l9_1646=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1644,bias(l9_1645));
float4 l9_1647=l9_1646;
float4 l9_1648=l9_1647;
if (l9_1573)
{
l9_1648=mix(l9_1574,l9_1648,float4(l9_1577));
}
float4 l9_1649=l9_1648;
l9_1558=l9_1649;
param_5=l9_1558;
param_7=param_5;
}
else
{
param_7=param_6;
}
Result_N369=param_7;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_9=0.0;
float param_10=(*sc_set0.UserUniforms).Port_Default_N204;
ssGlobals param_12=Globals;
float param_11;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_1650=float2(0.0);
float2 l9_1651=float2(0.0);
float2 l9_1652=float2(0.0);
float2 l9_1653=float2(0.0);
float2 l9_1654=float2(0.0);
float2 l9_1655=float2(0.0);
ssGlobals l9_1656=param_12;
float2 l9_1657;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_1658=float2(0.0);
l9_1658=l9_1656.Surface_UVCoord0;
l9_1651=l9_1658;
l9_1657=l9_1651;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_1659=float2(0.0);
l9_1659=l9_1656.Surface_UVCoord1;
l9_1652=l9_1659;
l9_1657=l9_1652;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_1660=float2(0.0);
float2 l9_1661=float2(0.0);
float2 l9_1662=float2(0.0);
ssGlobals l9_1663=l9_1656;
float2 l9_1664;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1665=float2(0.0);
float2 l9_1666=float2(0.0);
float2 l9_1667=float2(0.0);
ssGlobals l9_1668=l9_1663;
float2 l9_1669;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1670=float2(0.0);
float2 l9_1671=float2(0.0);
float2 l9_1672=float2(0.0);
float2 l9_1673=float2(0.0);
float2 l9_1674=float2(0.0);
ssGlobals l9_1675=l9_1668;
float2 l9_1676;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1677=float2(0.0);
l9_1677=l9_1675.Surface_UVCoord0;
l9_1671=l9_1677;
l9_1676=l9_1671;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1678=float2(0.0);
l9_1678=l9_1675.Surface_UVCoord1;
l9_1672=l9_1678;
l9_1676=l9_1672;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1679=float2(0.0);
l9_1679=l9_1675.gScreenCoord;
l9_1673=l9_1679;
l9_1676=l9_1673;
}
else
{
float2 l9_1680=float2(0.0);
l9_1680=l9_1675.Surface_UVCoord0;
l9_1674=l9_1680;
l9_1676=l9_1674;
}
}
}
l9_1670=l9_1676;
float2 l9_1681=float2(0.0);
float2 l9_1682=(*sc_set0.UserUniforms).uv2Scale;
l9_1681=l9_1682;
float2 l9_1683=float2(0.0);
l9_1683=l9_1681;
float2 l9_1684=float2(0.0);
float2 l9_1685=(*sc_set0.UserUniforms).uv2Offset;
l9_1684=l9_1685;
float2 l9_1686=float2(0.0);
l9_1686=l9_1684;
float2 l9_1687=float2(0.0);
l9_1687=(l9_1670*l9_1683)+l9_1686;
float2 l9_1688=float2(0.0);
l9_1688=l9_1687+(l9_1686*(l9_1668.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1666=l9_1688;
l9_1669=l9_1666;
}
else
{
float2 l9_1689=float2(0.0);
float2 l9_1690=float2(0.0);
float2 l9_1691=float2(0.0);
float2 l9_1692=float2(0.0);
float2 l9_1693=float2(0.0);
ssGlobals l9_1694=l9_1668;
float2 l9_1695;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1696=float2(0.0);
l9_1696=l9_1694.Surface_UVCoord0;
l9_1690=l9_1696;
l9_1695=l9_1690;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1697=float2(0.0);
l9_1697=l9_1694.Surface_UVCoord1;
l9_1691=l9_1697;
l9_1695=l9_1691;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1698=float2(0.0);
l9_1698=l9_1694.gScreenCoord;
l9_1692=l9_1698;
l9_1695=l9_1692;
}
else
{
float2 l9_1699=float2(0.0);
l9_1699=l9_1694.Surface_UVCoord0;
l9_1693=l9_1699;
l9_1695=l9_1693;
}
}
}
l9_1689=l9_1695;
float2 l9_1700=float2(0.0);
float2 l9_1701=(*sc_set0.UserUniforms).uv2Scale;
l9_1700=l9_1701;
float2 l9_1702=float2(0.0);
l9_1702=l9_1700;
float2 l9_1703=float2(0.0);
float2 l9_1704=(*sc_set0.UserUniforms).uv2Offset;
l9_1703=l9_1704;
float2 l9_1705=float2(0.0);
l9_1705=l9_1703;
float2 l9_1706=float2(0.0);
l9_1706=(l9_1689*l9_1702)+l9_1705;
l9_1667=l9_1706;
l9_1669=l9_1667;
}
l9_1665=l9_1669;
l9_1661=l9_1665;
l9_1664=l9_1661;
}
else
{
float2 l9_1707=float2(0.0);
l9_1707=l9_1663.Surface_UVCoord0;
l9_1662=l9_1707;
l9_1664=l9_1662;
}
l9_1660=l9_1664;
float2 l9_1708=float2(0.0);
l9_1708=l9_1660;
float2 l9_1709=float2(0.0);
l9_1709=l9_1708;
l9_1653=l9_1709;
l9_1657=l9_1653;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_1710=float2(0.0);
float2 l9_1711=float2(0.0);
float2 l9_1712=float2(0.0);
ssGlobals l9_1713=l9_1656;
float2 l9_1714;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1715=float2(0.0);
float2 l9_1716=float2(0.0);
float2 l9_1717=float2(0.0);
ssGlobals l9_1718=l9_1713;
float2 l9_1719;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1720=float2(0.0);
float2 l9_1721=float2(0.0);
float2 l9_1722=float2(0.0);
float2 l9_1723=float2(0.0);
float2 l9_1724=float2(0.0);
float2 l9_1725=float2(0.0);
ssGlobals l9_1726=l9_1718;
float2 l9_1727;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1728=float2(0.0);
l9_1728=l9_1726.Surface_UVCoord0;
l9_1721=l9_1728;
l9_1727=l9_1721;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1729=float2(0.0);
l9_1729=l9_1726.Surface_UVCoord1;
l9_1722=l9_1729;
l9_1727=l9_1722;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1730=float2(0.0);
l9_1730=l9_1726.gScreenCoord;
l9_1723=l9_1730;
l9_1727=l9_1723;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1731=float2(0.0);
float2 l9_1732=float2(0.0);
float2 l9_1733=float2(0.0);
ssGlobals l9_1734=l9_1726;
float2 l9_1735;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1736=float2(0.0);
float2 l9_1737=float2(0.0);
float2 l9_1738=float2(0.0);
ssGlobals l9_1739=l9_1734;
float2 l9_1740;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1741=float2(0.0);
float2 l9_1742=float2(0.0);
float2 l9_1743=float2(0.0);
float2 l9_1744=float2(0.0);
float2 l9_1745=float2(0.0);
ssGlobals l9_1746=l9_1739;
float2 l9_1747;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1748=float2(0.0);
l9_1748=l9_1746.Surface_UVCoord0;
l9_1742=l9_1748;
l9_1747=l9_1742;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1749=float2(0.0);
l9_1749=l9_1746.Surface_UVCoord1;
l9_1743=l9_1749;
l9_1747=l9_1743;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1750=float2(0.0);
l9_1750=l9_1746.gScreenCoord;
l9_1744=l9_1750;
l9_1747=l9_1744;
}
else
{
float2 l9_1751=float2(0.0);
l9_1751=l9_1746.Surface_UVCoord0;
l9_1745=l9_1751;
l9_1747=l9_1745;
}
}
}
l9_1741=l9_1747;
float2 l9_1752=float2(0.0);
float2 l9_1753=(*sc_set0.UserUniforms).uv2Scale;
l9_1752=l9_1753;
float2 l9_1754=float2(0.0);
l9_1754=l9_1752;
float2 l9_1755=float2(0.0);
float2 l9_1756=(*sc_set0.UserUniforms).uv2Offset;
l9_1755=l9_1756;
float2 l9_1757=float2(0.0);
l9_1757=l9_1755;
float2 l9_1758=float2(0.0);
l9_1758=(l9_1741*l9_1754)+l9_1757;
float2 l9_1759=float2(0.0);
l9_1759=l9_1758+(l9_1757*(l9_1739.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1737=l9_1759;
l9_1740=l9_1737;
}
else
{
float2 l9_1760=float2(0.0);
float2 l9_1761=float2(0.0);
float2 l9_1762=float2(0.0);
float2 l9_1763=float2(0.0);
float2 l9_1764=float2(0.0);
ssGlobals l9_1765=l9_1739;
float2 l9_1766;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1767=float2(0.0);
l9_1767=l9_1765.Surface_UVCoord0;
l9_1761=l9_1767;
l9_1766=l9_1761;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1768=float2(0.0);
l9_1768=l9_1765.Surface_UVCoord1;
l9_1762=l9_1768;
l9_1766=l9_1762;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1769=float2(0.0);
l9_1769=l9_1765.gScreenCoord;
l9_1763=l9_1769;
l9_1766=l9_1763;
}
else
{
float2 l9_1770=float2(0.0);
l9_1770=l9_1765.Surface_UVCoord0;
l9_1764=l9_1770;
l9_1766=l9_1764;
}
}
}
l9_1760=l9_1766;
float2 l9_1771=float2(0.0);
float2 l9_1772=(*sc_set0.UserUniforms).uv2Scale;
l9_1771=l9_1772;
float2 l9_1773=float2(0.0);
l9_1773=l9_1771;
float2 l9_1774=float2(0.0);
float2 l9_1775=(*sc_set0.UserUniforms).uv2Offset;
l9_1774=l9_1775;
float2 l9_1776=float2(0.0);
l9_1776=l9_1774;
float2 l9_1777=float2(0.0);
l9_1777=(l9_1760*l9_1773)+l9_1776;
l9_1738=l9_1777;
l9_1740=l9_1738;
}
l9_1736=l9_1740;
l9_1732=l9_1736;
l9_1735=l9_1732;
}
else
{
float2 l9_1778=float2(0.0);
l9_1778=l9_1734.Surface_UVCoord0;
l9_1733=l9_1778;
l9_1735=l9_1733;
}
l9_1731=l9_1735;
float2 l9_1779=float2(0.0);
l9_1779=l9_1731;
float2 l9_1780=float2(0.0);
l9_1780=l9_1779;
l9_1724=l9_1780;
l9_1727=l9_1724;
}
else
{
float2 l9_1781=float2(0.0);
l9_1781=l9_1726.Surface_UVCoord0;
l9_1725=l9_1781;
l9_1727=l9_1725;
}
}
}
}
l9_1720=l9_1727;
float2 l9_1782=float2(0.0);
float2 l9_1783=(*sc_set0.UserUniforms).uv3Scale;
l9_1782=l9_1783;
float2 l9_1784=float2(0.0);
l9_1784=l9_1782;
float2 l9_1785=float2(0.0);
float2 l9_1786=(*sc_set0.UserUniforms).uv3Offset;
l9_1785=l9_1786;
float2 l9_1787=float2(0.0);
l9_1787=l9_1785;
float2 l9_1788=float2(0.0);
l9_1788=(l9_1720*l9_1784)+l9_1787;
float2 l9_1789=float2(0.0);
l9_1789=l9_1788+(l9_1787*(l9_1718.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1716=l9_1789;
l9_1719=l9_1716;
}
else
{
float2 l9_1790=float2(0.0);
float2 l9_1791=float2(0.0);
float2 l9_1792=float2(0.0);
float2 l9_1793=float2(0.0);
float2 l9_1794=float2(0.0);
float2 l9_1795=float2(0.0);
ssGlobals l9_1796=l9_1718;
float2 l9_1797;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1798=float2(0.0);
l9_1798=l9_1796.Surface_UVCoord0;
l9_1791=l9_1798;
l9_1797=l9_1791;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1799=float2(0.0);
l9_1799=l9_1796.Surface_UVCoord1;
l9_1792=l9_1799;
l9_1797=l9_1792;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1800=float2(0.0);
l9_1800=l9_1796.gScreenCoord;
l9_1793=l9_1800;
l9_1797=l9_1793;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1801=float2(0.0);
float2 l9_1802=float2(0.0);
float2 l9_1803=float2(0.0);
ssGlobals l9_1804=l9_1796;
float2 l9_1805;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1806=float2(0.0);
float2 l9_1807=float2(0.0);
float2 l9_1808=float2(0.0);
ssGlobals l9_1809=l9_1804;
float2 l9_1810;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1811=float2(0.0);
float2 l9_1812=float2(0.0);
float2 l9_1813=float2(0.0);
float2 l9_1814=float2(0.0);
float2 l9_1815=float2(0.0);
ssGlobals l9_1816=l9_1809;
float2 l9_1817;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1818=float2(0.0);
l9_1818=l9_1816.Surface_UVCoord0;
l9_1812=l9_1818;
l9_1817=l9_1812;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1819=float2(0.0);
l9_1819=l9_1816.Surface_UVCoord1;
l9_1813=l9_1819;
l9_1817=l9_1813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1820=float2(0.0);
l9_1820=l9_1816.gScreenCoord;
l9_1814=l9_1820;
l9_1817=l9_1814;
}
else
{
float2 l9_1821=float2(0.0);
l9_1821=l9_1816.Surface_UVCoord0;
l9_1815=l9_1821;
l9_1817=l9_1815;
}
}
}
l9_1811=l9_1817;
float2 l9_1822=float2(0.0);
float2 l9_1823=(*sc_set0.UserUniforms).uv2Scale;
l9_1822=l9_1823;
float2 l9_1824=float2(0.0);
l9_1824=l9_1822;
float2 l9_1825=float2(0.0);
float2 l9_1826=(*sc_set0.UserUniforms).uv2Offset;
l9_1825=l9_1826;
float2 l9_1827=float2(0.0);
l9_1827=l9_1825;
float2 l9_1828=float2(0.0);
l9_1828=(l9_1811*l9_1824)+l9_1827;
float2 l9_1829=float2(0.0);
l9_1829=l9_1828+(l9_1827*(l9_1809.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1807=l9_1829;
l9_1810=l9_1807;
}
else
{
float2 l9_1830=float2(0.0);
float2 l9_1831=float2(0.0);
float2 l9_1832=float2(0.0);
float2 l9_1833=float2(0.0);
float2 l9_1834=float2(0.0);
ssGlobals l9_1835=l9_1809;
float2 l9_1836;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1837=float2(0.0);
l9_1837=l9_1835.Surface_UVCoord0;
l9_1831=l9_1837;
l9_1836=l9_1831;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1838=float2(0.0);
l9_1838=l9_1835.Surface_UVCoord1;
l9_1832=l9_1838;
l9_1836=l9_1832;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1839=float2(0.0);
l9_1839=l9_1835.gScreenCoord;
l9_1833=l9_1839;
l9_1836=l9_1833;
}
else
{
float2 l9_1840=float2(0.0);
l9_1840=l9_1835.Surface_UVCoord0;
l9_1834=l9_1840;
l9_1836=l9_1834;
}
}
}
l9_1830=l9_1836;
float2 l9_1841=float2(0.0);
float2 l9_1842=(*sc_set0.UserUniforms).uv2Scale;
l9_1841=l9_1842;
float2 l9_1843=float2(0.0);
l9_1843=l9_1841;
float2 l9_1844=float2(0.0);
float2 l9_1845=(*sc_set0.UserUniforms).uv2Offset;
l9_1844=l9_1845;
float2 l9_1846=float2(0.0);
l9_1846=l9_1844;
float2 l9_1847=float2(0.0);
l9_1847=(l9_1830*l9_1843)+l9_1846;
l9_1808=l9_1847;
l9_1810=l9_1808;
}
l9_1806=l9_1810;
l9_1802=l9_1806;
l9_1805=l9_1802;
}
else
{
float2 l9_1848=float2(0.0);
l9_1848=l9_1804.Surface_UVCoord0;
l9_1803=l9_1848;
l9_1805=l9_1803;
}
l9_1801=l9_1805;
float2 l9_1849=float2(0.0);
l9_1849=l9_1801;
float2 l9_1850=float2(0.0);
l9_1850=l9_1849;
l9_1794=l9_1850;
l9_1797=l9_1794;
}
else
{
float2 l9_1851=float2(0.0);
l9_1851=l9_1796.Surface_UVCoord0;
l9_1795=l9_1851;
l9_1797=l9_1795;
}
}
}
}
l9_1790=l9_1797;
float2 l9_1852=float2(0.0);
float2 l9_1853=(*sc_set0.UserUniforms).uv3Scale;
l9_1852=l9_1853;
float2 l9_1854=float2(0.0);
l9_1854=l9_1852;
float2 l9_1855=float2(0.0);
float2 l9_1856=(*sc_set0.UserUniforms).uv3Offset;
l9_1855=l9_1856;
float2 l9_1857=float2(0.0);
l9_1857=l9_1855;
float2 l9_1858=float2(0.0);
l9_1858=(l9_1790*l9_1854)+l9_1857;
l9_1717=l9_1858;
l9_1719=l9_1717;
}
l9_1715=l9_1719;
l9_1711=l9_1715;
l9_1714=l9_1711;
}
else
{
float2 l9_1859=float2(0.0);
l9_1859=l9_1713.Surface_UVCoord0;
l9_1712=l9_1859;
l9_1714=l9_1712;
}
l9_1710=l9_1714;
float2 l9_1860=float2(0.0);
l9_1860=l9_1710;
float2 l9_1861=float2(0.0);
l9_1861=l9_1860;
l9_1654=l9_1861;
l9_1657=l9_1654;
}
else
{
float2 l9_1862=float2(0.0);
l9_1862=l9_1656.Surface_UVCoord0;
l9_1655=l9_1862;
l9_1657=l9_1655;
}
}
}
}
l9_1650=l9_1657;
float4 l9_1863=float4(0.0);
int l9_1864=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_1865=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1865=0;
}
else
{
l9_1865=in.varStereoViewID;
}
int l9_1866=l9_1865;
l9_1864=1-l9_1866;
}
else
{
int l9_1867=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1867=0;
}
else
{
l9_1867=in.varStereoViewID;
}
int l9_1868=l9_1867;
l9_1864=l9_1868;
}
int l9_1869=l9_1864;
int l9_1870=opacityTexLayout_tmp;
int l9_1871=l9_1869;
float2 l9_1872=l9_1650;
bool l9_1873=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_1874=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_1875=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_1876=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_1877=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_1878=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_1879=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_1880=0.0;
bool l9_1881=l9_1878&&(!l9_1876);
float l9_1882=1.0;
float l9_1883=l9_1872.x;
int l9_1884=l9_1875.x;
if (l9_1884==1)
{
l9_1883=fract(l9_1883);
}
else
{
if (l9_1884==2)
{
float l9_1885=fract(l9_1883);
float l9_1886=l9_1883-l9_1885;
float l9_1887=step(0.25,fract(l9_1886*0.5));
l9_1883=mix(l9_1885,1.0-l9_1885,fast::clamp(l9_1887,0.0,1.0));
}
}
l9_1872.x=l9_1883;
float l9_1888=l9_1872.y;
int l9_1889=l9_1875.y;
if (l9_1889==1)
{
l9_1888=fract(l9_1888);
}
else
{
if (l9_1889==2)
{
float l9_1890=fract(l9_1888);
float l9_1891=l9_1888-l9_1890;
float l9_1892=step(0.25,fract(l9_1891*0.5));
l9_1888=mix(l9_1890,1.0-l9_1890,fast::clamp(l9_1892,0.0,1.0));
}
}
l9_1872.y=l9_1888;
if (l9_1876)
{
bool l9_1893=l9_1878;
bool l9_1894;
if (l9_1893)
{
l9_1894=l9_1875.x==3;
}
else
{
l9_1894=l9_1893;
}
float l9_1895=l9_1872.x;
float l9_1896=l9_1877.x;
float l9_1897=l9_1877.z;
bool l9_1898=l9_1894;
float l9_1899=l9_1882;
float l9_1900=fast::clamp(l9_1895,l9_1896,l9_1897);
float l9_1901=step(abs(l9_1895-l9_1900),9.9999997e-06);
l9_1899*=(l9_1901+((1.0-float(l9_1898))*(1.0-l9_1901)));
l9_1895=l9_1900;
l9_1872.x=l9_1895;
l9_1882=l9_1899;
bool l9_1902=l9_1878;
bool l9_1903;
if (l9_1902)
{
l9_1903=l9_1875.y==3;
}
else
{
l9_1903=l9_1902;
}
float l9_1904=l9_1872.y;
float l9_1905=l9_1877.y;
float l9_1906=l9_1877.w;
bool l9_1907=l9_1903;
float l9_1908=l9_1882;
float l9_1909=fast::clamp(l9_1904,l9_1905,l9_1906);
float l9_1910=step(abs(l9_1904-l9_1909),9.9999997e-06);
l9_1908*=(l9_1910+((1.0-float(l9_1907))*(1.0-l9_1910)));
l9_1904=l9_1909;
l9_1872.y=l9_1904;
l9_1882=l9_1908;
}
float2 l9_1911=l9_1872;
bool l9_1912=l9_1873;
float3x3 l9_1913=l9_1874;
if (l9_1912)
{
l9_1911=float2((l9_1913*float3(l9_1911,1.0)).xy);
}
float2 l9_1914=l9_1911;
float2 l9_1915=l9_1914;
float2 l9_1916=l9_1915;
l9_1872=l9_1916;
float l9_1917=l9_1872.x;
int l9_1918=l9_1875.x;
bool l9_1919=l9_1881;
float l9_1920=l9_1882;
if ((l9_1918==0)||(l9_1918==3))
{
float l9_1921=l9_1917;
float l9_1922=0.0;
float l9_1923=1.0;
bool l9_1924=l9_1919;
float l9_1925=l9_1920;
float l9_1926=fast::clamp(l9_1921,l9_1922,l9_1923);
float l9_1927=step(abs(l9_1921-l9_1926),9.9999997e-06);
l9_1925*=(l9_1927+((1.0-float(l9_1924))*(1.0-l9_1927)));
l9_1921=l9_1926;
l9_1917=l9_1921;
l9_1920=l9_1925;
}
l9_1872.x=l9_1917;
l9_1882=l9_1920;
float l9_1928=l9_1872.y;
int l9_1929=l9_1875.y;
bool l9_1930=l9_1881;
float l9_1931=l9_1882;
if ((l9_1929==0)||(l9_1929==3))
{
float l9_1932=l9_1928;
float l9_1933=0.0;
float l9_1934=1.0;
bool l9_1935=l9_1930;
float l9_1936=l9_1931;
float l9_1937=fast::clamp(l9_1932,l9_1933,l9_1934);
float l9_1938=step(abs(l9_1932-l9_1937),9.9999997e-06);
l9_1936*=(l9_1938+((1.0-float(l9_1935))*(1.0-l9_1938)));
l9_1932=l9_1937;
l9_1928=l9_1932;
l9_1931=l9_1936;
}
l9_1872.y=l9_1928;
l9_1882=l9_1931;
float2 l9_1939=l9_1872;
int l9_1940=l9_1870;
int l9_1941=l9_1871;
float l9_1942=l9_1880;
float2 l9_1943=l9_1939;
int l9_1944=l9_1940;
int l9_1945=l9_1941;
float3 l9_1946=float3(0.0);
if (l9_1944==0)
{
l9_1946=float3(l9_1943,0.0);
}
else
{
if (l9_1944==1)
{
l9_1946=float3(l9_1943.x,(l9_1943.y*0.5)+(0.5-(float(l9_1945)*0.5)),0.0);
}
else
{
l9_1946=float3(l9_1943,float(l9_1945));
}
}
float3 l9_1947=l9_1946;
float3 l9_1948=l9_1947;
float2 l9_1949=l9_1948.xy;
float l9_1950=l9_1942;
float4 l9_1951=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_1949,bias(l9_1950));
float4 l9_1952=l9_1951;
float4 l9_1953=l9_1952;
if (l9_1878)
{
l9_1953=mix(l9_1879,l9_1953,float4(l9_1882));
}
float4 l9_1954=l9_1953;
l9_1863=l9_1954;
float l9_1955=0.0;
l9_1955=l9_1863.x;
param_9=l9_1955;
param_11=param_9;
}
else
{
param_11=param_10;
}
Result_N204=param_11;
float Output_N72=0.0;
float param_13=1.0;
float param_14=(*sc_set0.UserUniforms).Port_Input2_N072;
ssGlobals param_16=Globals;
float param_15;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_1956=float4(0.0);
l9_1956=param_16.VertexColor;
float l9_1957=0.0;
l9_1957=l9_1956.w;
param_13=l9_1957;
param_15=param_13;
}
else
{
param_15=param_14;
}
Output_N72=param_15;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float3 param_17=float3(0.0);
float3 param_18=float3(0.0);
ssGlobals param_20=Globals;
float3 param_19;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_1958=float3(0.0);
l9_1958=param_20.VertexTangent_WorldSpace;
float3 l9_1959=float3(0.0);
l9_1959=param_20.VertexBinormal_WorldSpace;
float3 l9_1960=float3(0.0);
l9_1960=param_20.VertexNormal_WorldSpace;
float3x3 l9_1961=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_1961=float3x3(float3(l9_1958),float3(l9_1959),float3(l9_1960));
float2 l9_1962=float2(0.0);
float2 l9_1963=float2(0.0);
float2 l9_1964=float2(0.0);
float2 l9_1965=float2(0.0);
float2 l9_1966=float2(0.0);
float2 l9_1967=float2(0.0);
ssGlobals l9_1968=param_20;
float2 l9_1969;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_1970=float2(0.0);
l9_1970=l9_1968.Surface_UVCoord0;
l9_1963=l9_1970;
l9_1969=l9_1963;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_1971=float2(0.0);
l9_1971=l9_1968.Surface_UVCoord1;
l9_1964=l9_1971;
l9_1969=l9_1964;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_1972=float2(0.0);
float2 l9_1973=float2(0.0);
float2 l9_1974=float2(0.0);
ssGlobals l9_1975=l9_1968;
float2 l9_1976;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1977=float2(0.0);
float2 l9_1978=float2(0.0);
float2 l9_1979=float2(0.0);
ssGlobals l9_1980=l9_1975;
float2 l9_1981;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1982=float2(0.0);
float2 l9_1983=float2(0.0);
float2 l9_1984=float2(0.0);
float2 l9_1985=float2(0.0);
float2 l9_1986=float2(0.0);
ssGlobals l9_1987=l9_1980;
float2 l9_1988;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1989=float2(0.0);
l9_1989=l9_1987.Surface_UVCoord0;
l9_1983=l9_1989;
l9_1988=l9_1983;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1990=float2(0.0);
l9_1990=l9_1987.Surface_UVCoord1;
l9_1984=l9_1990;
l9_1988=l9_1984;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1991=float2(0.0);
l9_1991=l9_1987.gScreenCoord;
l9_1985=l9_1991;
l9_1988=l9_1985;
}
else
{
float2 l9_1992=float2(0.0);
l9_1992=l9_1987.Surface_UVCoord0;
l9_1986=l9_1992;
l9_1988=l9_1986;
}
}
}
l9_1982=l9_1988;
float2 l9_1993=float2(0.0);
float2 l9_1994=(*sc_set0.UserUniforms).uv2Scale;
l9_1993=l9_1994;
float2 l9_1995=float2(0.0);
l9_1995=l9_1993;
float2 l9_1996=float2(0.0);
float2 l9_1997=(*sc_set0.UserUniforms).uv2Offset;
l9_1996=l9_1997;
float2 l9_1998=float2(0.0);
l9_1998=l9_1996;
float2 l9_1999=float2(0.0);
l9_1999=(l9_1982*l9_1995)+l9_1998;
float2 l9_2000=float2(0.0);
l9_2000=l9_1999+(l9_1998*(l9_1980.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1978=l9_2000;
l9_1981=l9_1978;
}
else
{
float2 l9_2001=float2(0.0);
float2 l9_2002=float2(0.0);
float2 l9_2003=float2(0.0);
float2 l9_2004=float2(0.0);
float2 l9_2005=float2(0.0);
ssGlobals l9_2006=l9_1980;
float2 l9_2007;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2008=float2(0.0);
l9_2008=l9_2006.Surface_UVCoord0;
l9_2002=l9_2008;
l9_2007=l9_2002;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2009=float2(0.0);
l9_2009=l9_2006.Surface_UVCoord1;
l9_2003=l9_2009;
l9_2007=l9_2003;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2010=float2(0.0);
l9_2010=l9_2006.gScreenCoord;
l9_2004=l9_2010;
l9_2007=l9_2004;
}
else
{
float2 l9_2011=float2(0.0);
l9_2011=l9_2006.Surface_UVCoord0;
l9_2005=l9_2011;
l9_2007=l9_2005;
}
}
}
l9_2001=l9_2007;
float2 l9_2012=float2(0.0);
float2 l9_2013=(*sc_set0.UserUniforms).uv2Scale;
l9_2012=l9_2013;
float2 l9_2014=float2(0.0);
l9_2014=l9_2012;
float2 l9_2015=float2(0.0);
float2 l9_2016=(*sc_set0.UserUniforms).uv2Offset;
l9_2015=l9_2016;
float2 l9_2017=float2(0.0);
l9_2017=l9_2015;
float2 l9_2018=float2(0.0);
l9_2018=(l9_2001*l9_2014)+l9_2017;
l9_1979=l9_2018;
l9_1981=l9_1979;
}
l9_1977=l9_1981;
l9_1973=l9_1977;
l9_1976=l9_1973;
}
else
{
float2 l9_2019=float2(0.0);
l9_2019=l9_1975.Surface_UVCoord0;
l9_1974=l9_2019;
l9_1976=l9_1974;
}
l9_1972=l9_1976;
float2 l9_2020=float2(0.0);
l9_2020=l9_1972;
float2 l9_2021=float2(0.0);
l9_2021=l9_2020;
l9_1965=l9_2021;
l9_1969=l9_1965;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_2022=float2(0.0);
float2 l9_2023=float2(0.0);
float2 l9_2024=float2(0.0);
ssGlobals l9_2025=l9_1968;
float2 l9_2026;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2027=float2(0.0);
float2 l9_2028=float2(0.0);
float2 l9_2029=float2(0.0);
ssGlobals l9_2030=l9_2025;
float2 l9_2031;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2032=float2(0.0);
float2 l9_2033=float2(0.0);
float2 l9_2034=float2(0.0);
float2 l9_2035=float2(0.0);
float2 l9_2036=float2(0.0);
float2 l9_2037=float2(0.0);
ssGlobals l9_2038=l9_2030;
float2 l9_2039;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2040=float2(0.0);
l9_2040=l9_2038.Surface_UVCoord0;
l9_2033=l9_2040;
l9_2039=l9_2033;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2041=float2(0.0);
l9_2041=l9_2038.Surface_UVCoord1;
l9_2034=l9_2041;
l9_2039=l9_2034;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2042=float2(0.0);
l9_2042=l9_2038.gScreenCoord;
l9_2035=l9_2042;
l9_2039=l9_2035;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2043=float2(0.0);
float2 l9_2044=float2(0.0);
float2 l9_2045=float2(0.0);
ssGlobals l9_2046=l9_2038;
float2 l9_2047;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2048=float2(0.0);
float2 l9_2049=float2(0.0);
float2 l9_2050=float2(0.0);
ssGlobals l9_2051=l9_2046;
float2 l9_2052;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2053=float2(0.0);
float2 l9_2054=float2(0.0);
float2 l9_2055=float2(0.0);
float2 l9_2056=float2(0.0);
float2 l9_2057=float2(0.0);
ssGlobals l9_2058=l9_2051;
float2 l9_2059;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2060=float2(0.0);
l9_2060=l9_2058.Surface_UVCoord0;
l9_2054=l9_2060;
l9_2059=l9_2054;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2061=float2(0.0);
l9_2061=l9_2058.Surface_UVCoord1;
l9_2055=l9_2061;
l9_2059=l9_2055;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2062=float2(0.0);
l9_2062=l9_2058.gScreenCoord;
l9_2056=l9_2062;
l9_2059=l9_2056;
}
else
{
float2 l9_2063=float2(0.0);
l9_2063=l9_2058.Surface_UVCoord0;
l9_2057=l9_2063;
l9_2059=l9_2057;
}
}
}
l9_2053=l9_2059;
float2 l9_2064=float2(0.0);
float2 l9_2065=(*sc_set0.UserUniforms).uv2Scale;
l9_2064=l9_2065;
float2 l9_2066=float2(0.0);
l9_2066=l9_2064;
float2 l9_2067=float2(0.0);
float2 l9_2068=(*sc_set0.UserUniforms).uv2Offset;
l9_2067=l9_2068;
float2 l9_2069=float2(0.0);
l9_2069=l9_2067;
float2 l9_2070=float2(0.0);
l9_2070=(l9_2053*l9_2066)+l9_2069;
float2 l9_2071=float2(0.0);
l9_2071=l9_2070+(l9_2069*(l9_2051.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2049=l9_2071;
l9_2052=l9_2049;
}
else
{
float2 l9_2072=float2(0.0);
float2 l9_2073=float2(0.0);
float2 l9_2074=float2(0.0);
float2 l9_2075=float2(0.0);
float2 l9_2076=float2(0.0);
ssGlobals l9_2077=l9_2051;
float2 l9_2078;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2079=float2(0.0);
l9_2079=l9_2077.Surface_UVCoord0;
l9_2073=l9_2079;
l9_2078=l9_2073;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2080=float2(0.0);
l9_2080=l9_2077.Surface_UVCoord1;
l9_2074=l9_2080;
l9_2078=l9_2074;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2081=float2(0.0);
l9_2081=l9_2077.gScreenCoord;
l9_2075=l9_2081;
l9_2078=l9_2075;
}
else
{
float2 l9_2082=float2(0.0);
l9_2082=l9_2077.Surface_UVCoord0;
l9_2076=l9_2082;
l9_2078=l9_2076;
}
}
}
l9_2072=l9_2078;
float2 l9_2083=float2(0.0);
float2 l9_2084=(*sc_set0.UserUniforms).uv2Scale;
l9_2083=l9_2084;
float2 l9_2085=float2(0.0);
l9_2085=l9_2083;
float2 l9_2086=float2(0.0);
float2 l9_2087=(*sc_set0.UserUniforms).uv2Offset;
l9_2086=l9_2087;
float2 l9_2088=float2(0.0);
l9_2088=l9_2086;
float2 l9_2089=float2(0.0);
l9_2089=(l9_2072*l9_2085)+l9_2088;
l9_2050=l9_2089;
l9_2052=l9_2050;
}
l9_2048=l9_2052;
l9_2044=l9_2048;
l9_2047=l9_2044;
}
else
{
float2 l9_2090=float2(0.0);
l9_2090=l9_2046.Surface_UVCoord0;
l9_2045=l9_2090;
l9_2047=l9_2045;
}
l9_2043=l9_2047;
float2 l9_2091=float2(0.0);
l9_2091=l9_2043;
float2 l9_2092=float2(0.0);
l9_2092=l9_2091;
l9_2036=l9_2092;
l9_2039=l9_2036;
}
else
{
float2 l9_2093=float2(0.0);
l9_2093=l9_2038.Surface_UVCoord0;
l9_2037=l9_2093;
l9_2039=l9_2037;
}
}
}
}
l9_2032=l9_2039;
float2 l9_2094=float2(0.0);
float2 l9_2095=(*sc_set0.UserUniforms).uv3Scale;
l9_2094=l9_2095;
float2 l9_2096=float2(0.0);
l9_2096=l9_2094;
float2 l9_2097=float2(0.0);
float2 l9_2098=(*sc_set0.UserUniforms).uv3Offset;
l9_2097=l9_2098;
float2 l9_2099=float2(0.0);
l9_2099=l9_2097;
float2 l9_2100=float2(0.0);
l9_2100=(l9_2032*l9_2096)+l9_2099;
float2 l9_2101=float2(0.0);
l9_2101=l9_2100+(l9_2099*(l9_2030.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2028=l9_2101;
l9_2031=l9_2028;
}
else
{
float2 l9_2102=float2(0.0);
float2 l9_2103=float2(0.0);
float2 l9_2104=float2(0.0);
float2 l9_2105=float2(0.0);
float2 l9_2106=float2(0.0);
float2 l9_2107=float2(0.0);
ssGlobals l9_2108=l9_2030;
float2 l9_2109;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2110=float2(0.0);
l9_2110=l9_2108.Surface_UVCoord0;
l9_2103=l9_2110;
l9_2109=l9_2103;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2111=float2(0.0);
l9_2111=l9_2108.Surface_UVCoord1;
l9_2104=l9_2111;
l9_2109=l9_2104;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2112=float2(0.0);
l9_2112=l9_2108.gScreenCoord;
l9_2105=l9_2112;
l9_2109=l9_2105;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2113=float2(0.0);
float2 l9_2114=float2(0.0);
float2 l9_2115=float2(0.0);
ssGlobals l9_2116=l9_2108;
float2 l9_2117;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2118=float2(0.0);
float2 l9_2119=float2(0.0);
float2 l9_2120=float2(0.0);
ssGlobals l9_2121=l9_2116;
float2 l9_2122;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2123=float2(0.0);
float2 l9_2124=float2(0.0);
float2 l9_2125=float2(0.0);
float2 l9_2126=float2(0.0);
float2 l9_2127=float2(0.0);
ssGlobals l9_2128=l9_2121;
float2 l9_2129;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2130=float2(0.0);
l9_2130=l9_2128.Surface_UVCoord0;
l9_2124=l9_2130;
l9_2129=l9_2124;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2131=float2(0.0);
l9_2131=l9_2128.Surface_UVCoord1;
l9_2125=l9_2131;
l9_2129=l9_2125;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2132=float2(0.0);
l9_2132=l9_2128.gScreenCoord;
l9_2126=l9_2132;
l9_2129=l9_2126;
}
else
{
float2 l9_2133=float2(0.0);
l9_2133=l9_2128.Surface_UVCoord0;
l9_2127=l9_2133;
l9_2129=l9_2127;
}
}
}
l9_2123=l9_2129;
float2 l9_2134=float2(0.0);
float2 l9_2135=(*sc_set0.UserUniforms).uv2Scale;
l9_2134=l9_2135;
float2 l9_2136=float2(0.0);
l9_2136=l9_2134;
float2 l9_2137=float2(0.0);
float2 l9_2138=(*sc_set0.UserUniforms).uv2Offset;
l9_2137=l9_2138;
float2 l9_2139=float2(0.0);
l9_2139=l9_2137;
float2 l9_2140=float2(0.0);
l9_2140=(l9_2123*l9_2136)+l9_2139;
float2 l9_2141=float2(0.0);
l9_2141=l9_2140+(l9_2139*(l9_2121.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2119=l9_2141;
l9_2122=l9_2119;
}
else
{
float2 l9_2142=float2(0.0);
float2 l9_2143=float2(0.0);
float2 l9_2144=float2(0.0);
float2 l9_2145=float2(0.0);
float2 l9_2146=float2(0.0);
ssGlobals l9_2147=l9_2121;
float2 l9_2148;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2149=float2(0.0);
l9_2149=l9_2147.Surface_UVCoord0;
l9_2143=l9_2149;
l9_2148=l9_2143;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2150=float2(0.0);
l9_2150=l9_2147.Surface_UVCoord1;
l9_2144=l9_2150;
l9_2148=l9_2144;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2151=float2(0.0);
l9_2151=l9_2147.gScreenCoord;
l9_2145=l9_2151;
l9_2148=l9_2145;
}
else
{
float2 l9_2152=float2(0.0);
l9_2152=l9_2147.Surface_UVCoord0;
l9_2146=l9_2152;
l9_2148=l9_2146;
}
}
}
l9_2142=l9_2148;
float2 l9_2153=float2(0.0);
float2 l9_2154=(*sc_set0.UserUniforms).uv2Scale;
l9_2153=l9_2154;
float2 l9_2155=float2(0.0);
l9_2155=l9_2153;
float2 l9_2156=float2(0.0);
float2 l9_2157=(*sc_set0.UserUniforms).uv2Offset;
l9_2156=l9_2157;
float2 l9_2158=float2(0.0);
l9_2158=l9_2156;
float2 l9_2159=float2(0.0);
l9_2159=(l9_2142*l9_2155)+l9_2158;
l9_2120=l9_2159;
l9_2122=l9_2120;
}
l9_2118=l9_2122;
l9_2114=l9_2118;
l9_2117=l9_2114;
}
else
{
float2 l9_2160=float2(0.0);
l9_2160=l9_2116.Surface_UVCoord0;
l9_2115=l9_2160;
l9_2117=l9_2115;
}
l9_2113=l9_2117;
float2 l9_2161=float2(0.0);
l9_2161=l9_2113;
float2 l9_2162=float2(0.0);
l9_2162=l9_2161;
l9_2106=l9_2162;
l9_2109=l9_2106;
}
else
{
float2 l9_2163=float2(0.0);
l9_2163=l9_2108.Surface_UVCoord0;
l9_2107=l9_2163;
l9_2109=l9_2107;
}
}
}
}
l9_2102=l9_2109;
float2 l9_2164=float2(0.0);
float2 l9_2165=(*sc_set0.UserUniforms).uv3Scale;
l9_2164=l9_2165;
float2 l9_2166=float2(0.0);
l9_2166=l9_2164;
float2 l9_2167=float2(0.0);
float2 l9_2168=(*sc_set0.UserUniforms).uv3Offset;
l9_2167=l9_2168;
float2 l9_2169=float2(0.0);
l9_2169=l9_2167;
float2 l9_2170=float2(0.0);
l9_2170=(l9_2102*l9_2166)+l9_2169;
l9_2029=l9_2170;
l9_2031=l9_2029;
}
l9_2027=l9_2031;
l9_2023=l9_2027;
l9_2026=l9_2023;
}
else
{
float2 l9_2171=float2(0.0);
l9_2171=l9_2025.Surface_UVCoord0;
l9_2024=l9_2171;
l9_2026=l9_2024;
}
l9_2022=l9_2026;
float2 l9_2172=float2(0.0);
l9_2172=l9_2022;
float2 l9_2173=float2(0.0);
l9_2173=l9_2172;
l9_1966=l9_2173;
l9_1969=l9_1966;
}
else
{
float2 l9_2174=float2(0.0);
l9_2174=l9_1968.Surface_UVCoord0;
l9_1967=l9_2174;
l9_1969=l9_1967;
}
}
}
}
l9_1962=l9_1969;
float4 l9_2175=float4(0.0);
float2 l9_2176=l9_1962;
int l9_2177=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_2178=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2178=0;
}
else
{
l9_2178=in.varStereoViewID;
}
int l9_2179=l9_2178;
l9_2177=1-l9_2179;
}
else
{
int l9_2180=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2180=0;
}
else
{
l9_2180=in.varStereoViewID;
}
int l9_2181=l9_2180;
l9_2177=l9_2181;
}
int l9_2182=l9_2177;
int l9_2183=normalTexLayout_tmp;
int l9_2184=l9_2182;
float2 l9_2185=l9_2176;
bool l9_2186=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_2187=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_2188=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_2189=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_2190=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_2191=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_2192=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_2193=0.0;
bool l9_2194=l9_2191&&(!l9_2189);
float l9_2195=1.0;
float l9_2196=l9_2185.x;
int l9_2197=l9_2188.x;
if (l9_2197==1)
{
l9_2196=fract(l9_2196);
}
else
{
if (l9_2197==2)
{
float l9_2198=fract(l9_2196);
float l9_2199=l9_2196-l9_2198;
float l9_2200=step(0.25,fract(l9_2199*0.5));
l9_2196=mix(l9_2198,1.0-l9_2198,fast::clamp(l9_2200,0.0,1.0));
}
}
l9_2185.x=l9_2196;
float l9_2201=l9_2185.y;
int l9_2202=l9_2188.y;
if (l9_2202==1)
{
l9_2201=fract(l9_2201);
}
else
{
if (l9_2202==2)
{
float l9_2203=fract(l9_2201);
float l9_2204=l9_2201-l9_2203;
float l9_2205=step(0.25,fract(l9_2204*0.5));
l9_2201=mix(l9_2203,1.0-l9_2203,fast::clamp(l9_2205,0.0,1.0));
}
}
l9_2185.y=l9_2201;
if (l9_2189)
{
bool l9_2206=l9_2191;
bool l9_2207;
if (l9_2206)
{
l9_2207=l9_2188.x==3;
}
else
{
l9_2207=l9_2206;
}
float l9_2208=l9_2185.x;
float l9_2209=l9_2190.x;
float l9_2210=l9_2190.z;
bool l9_2211=l9_2207;
float l9_2212=l9_2195;
float l9_2213=fast::clamp(l9_2208,l9_2209,l9_2210);
float l9_2214=step(abs(l9_2208-l9_2213),9.9999997e-06);
l9_2212*=(l9_2214+((1.0-float(l9_2211))*(1.0-l9_2214)));
l9_2208=l9_2213;
l9_2185.x=l9_2208;
l9_2195=l9_2212;
bool l9_2215=l9_2191;
bool l9_2216;
if (l9_2215)
{
l9_2216=l9_2188.y==3;
}
else
{
l9_2216=l9_2215;
}
float l9_2217=l9_2185.y;
float l9_2218=l9_2190.y;
float l9_2219=l9_2190.w;
bool l9_2220=l9_2216;
float l9_2221=l9_2195;
float l9_2222=fast::clamp(l9_2217,l9_2218,l9_2219);
float l9_2223=step(abs(l9_2217-l9_2222),9.9999997e-06);
l9_2221*=(l9_2223+((1.0-float(l9_2220))*(1.0-l9_2223)));
l9_2217=l9_2222;
l9_2185.y=l9_2217;
l9_2195=l9_2221;
}
float2 l9_2224=l9_2185;
bool l9_2225=l9_2186;
float3x3 l9_2226=l9_2187;
if (l9_2225)
{
l9_2224=float2((l9_2226*float3(l9_2224,1.0)).xy);
}
float2 l9_2227=l9_2224;
float2 l9_2228=l9_2227;
float2 l9_2229=l9_2228;
l9_2185=l9_2229;
float l9_2230=l9_2185.x;
int l9_2231=l9_2188.x;
bool l9_2232=l9_2194;
float l9_2233=l9_2195;
if ((l9_2231==0)||(l9_2231==3))
{
float l9_2234=l9_2230;
float l9_2235=0.0;
float l9_2236=1.0;
bool l9_2237=l9_2232;
float l9_2238=l9_2233;
float l9_2239=fast::clamp(l9_2234,l9_2235,l9_2236);
float l9_2240=step(abs(l9_2234-l9_2239),9.9999997e-06);
l9_2238*=(l9_2240+((1.0-float(l9_2237))*(1.0-l9_2240)));
l9_2234=l9_2239;
l9_2230=l9_2234;
l9_2233=l9_2238;
}
l9_2185.x=l9_2230;
l9_2195=l9_2233;
float l9_2241=l9_2185.y;
int l9_2242=l9_2188.y;
bool l9_2243=l9_2194;
float l9_2244=l9_2195;
if ((l9_2242==0)||(l9_2242==3))
{
float l9_2245=l9_2241;
float l9_2246=0.0;
float l9_2247=1.0;
bool l9_2248=l9_2243;
float l9_2249=l9_2244;
float l9_2250=fast::clamp(l9_2245,l9_2246,l9_2247);
float l9_2251=step(abs(l9_2245-l9_2250),9.9999997e-06);
l9_2249*=(l9_2251+((1.0-float(l9_2248))*(1.0-l9_2251)));
l9_2245=l9_2250;
l9_2241=l9_2245;
l9_2244=l9_2249;
}
l9_2185.y=l9_2241;
l9_2195=l9_2244;
float2 l9_2252=l9_2185;
int l9_2253=l9_2183;
int l9_2254=l9_2184;
float l9_2255=l9_2193;
float2 l9_2256=l9_2252;
int l9_2257=l9_2253;
int l9_2258=l9_2254;
float3 l9_2259=float3(0.0);
if (l9_2257==0)
{
l9_2259=float3(l9_2256,0.0);
}
else
{
if (l9_2257==1)
{
l9_2259=float3(l9_2256.x,(l9_2256.y*0.5)+(0.5-(float(l9_2258)*0.5)),0.0);
}
else
{
l9_2259=float3(l9_2256,float(l9_2258));
}
}
float3 l9_2260=l9_2259;
float3 l9_2261=l9_2260;
float2 l9_2262=l9_2261.xy;
float l9_2263=l9_2255;
float4 l9_2264=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_2262,bias(l9_2263));
float4 l9_2265=l9_2264;
float4 l9_2266=l9_2265;
if (l9_2191)
{
l9_2266=mix(l9_2192,l9_2266,float4(l9_2195));
}
float4 l9_2267=l9_2266;
float4 l9_2268=l9_2267;
float3 l9_2269=(l9_2268.xyz*1.9921875)-float3(1.0);
l9_2268=float4(l9_2269.x,l9_2269.y,l9_2269.z,l9_2268.w);
l9_2175=l9_2268;
float3 l9_2270=float3(0.0);
float3 l9_2271=float3(0.0);
float3 l9_2272=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_2273=param_20;
float3 l9_2274;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_2275=float2(0.0);
float2 l9_2276=float2(0.0);
float2 l9_2277=float2(0.0);
float2 l9_2278=float2(0.0);
float2 l9_2279=float2(0.0);
float2 l9_2280=float2(0.0);
ssGlobals l9_2281=l9_2273;
float2 l9_2282;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_2283=float2(0.0);
l9_2283=l9_2281.Surface_UVCoord0;
l9_2276=l9_2283;
l9_2282=l9_2276;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_2284=float2(0.0);
l9_2284=l9_2281.Surface_UVCoord1;
l9_2277=l9_2284;
l9_2282=l9_2277;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_2285=float2(0.0);
float2 l9_2286=float2(0.0);
float2 l9_2287=float2(0.0);
ssGlobals l9_2288=l9_2281;
float2 l9_2289;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2290=float2(0.0);
float2 l9_2291=float2(0.0);
float2 l9_2292=float2(0.0);
ssGlobals l9_2293=l9_2288;
float2 l9_2294;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2295=float2(0.0);
float2 l9_2296=float2(0.0);
float2 l9_2297=float2(0.0);
float2 l9_2298=float2(0.0);
float2 l9_2299=float2(0.0);
ssGlobals l9_2300=l9_2293;
float2 l9_2301;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2302=float2(0.0);
l9_2302=l9_2300.Surface_UVCoord0;
l9_2296=l9_2302;
l9_2301=l9_2296;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2303=float2(0.0);
l9_2303=l9_2300.Surface_UVCoord1;
l9_2297=l9_2303;
l9_2301=l9_2297;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2304=float2(0.0);
l9_2304=l9_2300.gScreenCoord;
l9_2298=l9_2304;
l9_2301=l9_2298;
}
else
{
float2 l9_2305=float2(0.0);
l9_2305=l9_2300.Surface_UVCoord0;
l9_2299=l9_2305;
l9_2301=l9_2299;
}
}
}
l9_2295=l9_2301;
float2 l9_2306=float2(0.0);
float2 l9_2307=(*sc_set0.UserUniforms).uv2Scale;
l9_2306=l9_2307;
float2 l9_2308=float2(0.0);
l9_2308=l9_2306;
float2 l9_2309=float2(0.0);
float2 l9_2310=(*sc_set0.UserUniforms).uv2Offset;
l9_2309=l9_2310;
float2 l9_2311=float2(0.0);
l9_2311=l9_2309;
float2 l9_2312=float2(0.0);
l9_2312=(l9_2295*l9_2308)+l9_2311;
float2 l9_2313=float2(0.0);
l9_2313=l9_2312+(l9_2311*(l9_2293.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2291=l9_2313;
l9_2294=l9_2291;
}
else
{
float2 l9_2314=float2(0.0);
float2 l9_2315=float2(0.0);
float2 l9_2316=float2(0.0);
float2 l9_2317=float2(0.0);
float2 l9_2318=float2(0.0);
ssGlobals l9_2319=l9_2293;
float2 l9_2320;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2321=float2(0.0);
l9_2321=l9_2319.Surface_UVCoord0;
l9_2315=l9_2321;
l9_2320=l9_2315;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2322=float2(0.0);
l9_2322=l9_2319.Surface_UVCoord1;
l9_2316=l9_2322;
l9_2320=l9_2316;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2323=float2(0.0);
l9_2323=l9_2319.gScreenCoord;
l9_2317=l9_2323;
l9_2320=l9_2317;
}
else
{
float2 l9_2324=float2(0.0);
l9_2324=l9_2319.Surface_UVCoord0;
l9_2318=l9_2324;
l9_2320=l9_2318;
}
}
}
l9_2314=l9_2320;
float2 l9_2325=float2(0.0);
float2 l9_2326=(*sc_set0.UserUniforms).uv2Scale;
l9_2325=l9_2326;
float2 l9_2327=float2(0.0);
l9_2327=l9_2325;
float2 l9_2328=float2(0.0);
float2 l9_2329=(*sc_set0.UserUniforms).uv2Offset;
l9_2328=l9_2329;
float2 l9_2330=float2(0.0);
l9_2330=l9_2328;
float2 l9_2331=float2(0.0);
l9_2331=(l9_2314*l9_2327)+l9_2330;
l9_2292=l9_2331;
l9_2294=l9_2292;
}
l9_2290=l9_2294;
l9_2286=l9_2290;
l9_2289=l9_2286;
}
else
{
float2 l9_2332=float2(0.0);
l9_2332=l9_2288.Surface_UVCoord0;
l9_2287=l9_2332;
l9_2289=l9_2287;
}
l9_2285=l9_2289;
float2 l9_2333=float2(0.0);
l9_2333=l9_2285;
float2 l9_2334=float2(0.0);
l9_2334=l9_2333;
l9_2278=l9_2334;
l9_2282=l9_2278;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_2335=float2(0.0);
float2 l9_2336=float2(0.0);
float2 l9_2337=float2(0.0);
ssGlobals l9_2338=l9_2281;
float2 l9_2339;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2340=float2(0.0);
float2 l9_2341=float2(0.0);
float2 l9_2342=float2(0.0);
ssGlobals l9_2343=l9_2338;
float2 l9_2344;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2345=float2(0.0);
float2 l9_2346=float2(0.0);
float2 l9_2347=float2(0.0);
float2 l9_2348=float2(0.0);
float2 l9_2349=float2(0.0);
float2 l9_2350=float2(0.0);
ssGlobals l9_2351=l9_2343;
float2 l9_2352;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2353=float2(0.0);
l9_2353=l9_2351.Surface_UVCoord0;
l9_2346=l9_2353;
l9_2352=l9_2346;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2354=float2(0.0);
l9_2354=l9_2351.Surface_UVCoord1;
l9_2347=l9_2354;
l9_2352=l9_2347;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2355=float2(0.0);
l9_2355=l9_2351.gScreenCoord;
l9_2348=l9_2355;
l9_2352=l9_2348;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2356=float2(0.0);
float2 l9_2357=float2(0.0);
float2 l9_2358=float2(0.0);
ssGlobals l9_2359=l9_2351;
float2 l9_2360;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2361=float2(0.0);
float2 l9_2362=float2(0.0);
float2 l9_2363=float2(0.0);
ssGlobals l9_2364=l9_2359;
float2 l9_2365;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2366=float2(0.0);
float2 l9_2367=float2(0.0);
float2 l9_2368=float2(0.0);
float2 l9_2369=float2(0.0);
float2 l9_2370=float2(0.0);
ssGlobals l9_2371=l9_2364;
float2 l9_2372;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2373=float2(0.0);
l9_2373=l9_2371.Surface_UVCoord0;
l9_2367=l9_2373;
l9_2372=l9_2367;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2374=float2(0.0);
l9_2374=l9_2371.Surface_UVCoord1;
l9_2368=l9_2374;
l9_2372=l9_2368;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2375=float2(0.0);
l9_2375=l9_2371.gScreenCoord;
l9_2369=l9_2375;
l9_2372=l9_2369;
}
else
{
float2 l9_2376=float2(0.0);
l9_2376=l9_2371.Surface_UVCoord0;
l9_2370=l9_2376;
l9_2372=l9_2370;
}
}
}
l9_2366=l9_2372;
float2 l9_2377=float2(0.0);
float2 l9_2378=(*sc_set0.UserUniforms).uv2Scale;
l9_2377=l9_2378;
float2 l9_2379=float2(0.0);
l9_2379=l9_2377;
float2 l9_2380=float2(0.0);
float2 l9_2381=(*sc_set0.UserUniforms).uv2Offset;
l9_2380=l9_2381;
float2 l9_2382=float2(0.0);
l9_2382=l9_2380;
float2 l9_2383=float2(0.0);
l9_2383=(l9_2366*l9_2379)+l9_2382;
float2 l9_2384=float2(0.0);
l9_2384=l9_2383+(l9_2382*(l9_2364.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2362=l9_2384;
l9_2365=l9_2362;
}
else
{
float2 l9_2385=float2(0.0);
float2 l9_2386=float2(0.0);
float2 l9_2387=float2(0.0);
float2 l9_2388=float2(0.0);
float2 l9_2389=float2(0.0);
ssGlobals l9_2390=l9_2364;
float2 l9_2391;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2392=float2(0.0);
l9_2392=l9_2390.Surface_UVCoord0;
l9_2386=l9_2392;
l9_2391=l9_2386;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2393=float2(0.0);
l9_2393=l9_2390.Surface_UVCoord1;
l9_2387=l9_2393;
l9_2391=l9_2387;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2394=float2(0.0);
l9_2394=l9_2390.gScreenCoord;
l9_2388=l9_2394;
l9_2391=l9_2388;
}
else
{
float2 l9_2395=float2(0.0);
l9_2395=l9_2390.Surface_UVCoord0;
l9_2389=l9_2395;
l9_2391=l9_2389;
}
}
}
l9_2385=l9_2391;
float2 l9_2396=float2(0.0);
float2 l9_2397=(*sc_set0.UserUniforms).uv2Scale;
l9_2396=l9_2397;
float2 l9_2398=float2(0.0);
l9_2398=l9_2396;
float2 l9_2399=float2(0.0);
float2 l9_2400=(*sc_set0.UserUniforms).uv2Offset;
l9_2399=l9_2400;
float2 l9_2401=float2(0.0);
l9_2401=l9_2399;
float2 l9_2402=float2(0.0);
l9_2402=(l9_2385*l9_2398)+l9_2401;
l9_2363=l9_2402;
l9_2365=l9_2363;
}
l9_2361=l9_2365;
l9_2357=l9_2361;
l9_2360=l9_2357;
}
else
{
float2 l9_2403=float2(0.0);
l9_2403=l9_2359.Surface_UVCoord0;
l9_2358=l9_2403;
l9_2360=l9_2358;
}
l9_2356=l9_2360;
float2 l9_2404=float2(0.0);
l9_2404=l9_2356;
float2 l9_2405=float2(0.0);
l9_2405=l9_2404;
l9_2349=l9_2405;
l9_2352=l9_2349;
}
else
{
float2 l9_2406=float2(0.0);
l9_2406=l9_2351.Surface_UVCoord0;
l9_2350=l9_2406;
l9_2352=l9_2350;
}
}
}
}
l9_2345=l9_2352;
float2 l9_2407=float2(0.0);
float2 l9_2408=(*sc_set0.UserUniforms).uv3Scale;
l9_2407=l9_2408;
float2 l9_2409=float2(0.0);
l9_2409=l9_2407;
float2 l9_2410=float2(0.0);
float2 l9_2411=(*sc_set0.UserUniforms).uv3Offset;
l9_2410=l9_2411;
float2 l9_2412=float2(0.0);
l9_2412=l9_2410;
float2 l9_2413=float2(0.0);
l9_2413=(l9_2345*l9_2409)+l9_2412;
float2 l9_2414=float2(0.0);
l9_2414=l9_2413+(l9_2412*(l9_2343.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2341=l9_2414;
l9_2344=l9_2341;
}
else
{
float2 l9_2415=float2(0.0);
float2 l9_2416=float2(0.0);
float2 l9_2417=float2(0.0);
float2 l9_2418=float2(0.0);
float2 l9_2419=float2(0.0);
float2 l9_2420=float2(0.0);
ssGlobals l9_2421=l9_2343;
float2 l9_2422;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2423=float2(0.0);
l9_2423=l9_2421.Surface_UVCoord0;
l9_2416=l9_2423;
l9_2422=l9_2416;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2424=float2(0.0);
l9_2424=l9_2421.Surface_UVCoord1;
l9_2417=l9_2424;
l9_2422=l9_2417;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2425=float2(0.0);
l9_2425=l9_2421.gScreenCoord;
l9_2418=l9_2425;
l9_2422=l9_2418;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2426=float2(0.0);
float2 l9_2427=float2(0.0);
float2 l9_2428=float2(0.0);
ssGlobals l9_2429=l9_2421;
float2 l9_2430;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2431=float2(0.0);
float2 l9_2432=float2(0.0);
float2 l9_2433=float2(0.0);
ssGlobals l9_2434=l9_2429;
float2 l9_2435;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2436=float2(0.0);
float2 l9_2437=float2(0.0);
float2 l9_2438=float2(0.0);
float2 l9_2439=float2(0.0);
float2 l9_2440=float2(0.0);
ssGlobals l9_2441=l9_2434;
float2 l9_2442;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2443=float2(0.0);
l9_2443=l9_2441.Surface_UVCoord0;
l9_2437=l9_2443;
l9_2442=l9_2437;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2444=float2(0.0);
l9_2444=l9_2441.Surface_UVCoord1;
l9_2438=l9_2444;
l9_2442=l9_2438;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2445=float2(0.0);
l9_2445=l9_2441.gScreenCoord;
l9_2439=l9_2445;
l9_2442=l9_2439;
}
else
{
float2 l9_2446=float2(0.0);
l9_2446=l9_2441.Surface_UVCoord0;
l9_2440=l9_2446;
l9_2442=l9_2440;
}
}
}
l9_2436=l9_2442;
float2 l9_2447=float2(0.0);
float2 l9_2448=(*sc_set0.UserUniforms).uv2Scale;
l9_2447=l9_2448;
float2 l9_2449=float2(0.0);
l9_2449=l9_2447;
float2 l9_2450=float2(0.0);
float2 l9_2451=(*sc_set0.UserUniforms).uv2Offset;
l9_2450=l9_2451;
float2 l9_2452=float2(0.0);
l9_2452=l9_2450;
float2 l9_2453=float2(0.0);
l9_2453=(l9_2436*l9_2449)+l9_2452;
float2 l9_2454=float2(0.0);
l9_2454=l9_2453+(l9_2452*(l9_2434.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2432=l9_2454;
l9_2435=l9_2432;
}
else
{
float2 l9_2455=float2(0.0);
float2 l9_2456=float2(0.0);
float2 l9_2457=float2(0.0);
float2 l9_2458=float2(0.0);
float2 l9_2459=float2(0.0);
ssGlobals l9_2460=l9_2434;
float2 l9_2461;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2462=float2(0.0);
l9_2462=l9_2460.Surface_UVCoord0;
l9_2456=l9_2462;
l9_2461=l9_2456;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2463=float2(0.0);
l9_2463=l9_2460.Surface_UVCoord1;
l9_2457=l9_2463;
l9_2461=l9_2457;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2464=float2(0.0);
l9_2464=l9_2460.gScreenCoord;
l9_2458=l9_2464;
l9_2461=l9_2458;
}
else
{
float2 l9_2465=float2(0.0);
l9_2465=l9_2460.Surface_UVCoord0;
l9_2459=l9_2465;
l9_2461=l9_2459;
}
}
}
l9_2455=l9_2461;
float2 l9_2466=float2(0.0);
float2 l9_2467=(*sc_set0.UserUniforms).uv2Scale;
l9_2466=l9_2467;
float2 l9_2468=float2(0.0);
l9_2468=l9_2466;
float2 l9_2469=float2(0.0);
float2 l9_2470=(*sc_set0.UserUniforms).uv2Offset;
l9_2469=l9_2470;
float2 l9_2471=float2(0.0);
l9_2471=l9_2469;
float2 l9_2472=float2(0.0);
l9_2472=(l9_2455*l9_2468)+l9_2471;
l9_2433=l9_2472;
l9_2435=l9_2433;
}
l9_2431=l9_2435;
l9_2427=l9_2431;
l9_2430=l9_2427;
}
else
{
float2 l9_2473=float2(0.0);
l9_2473=l9_2429.Surface_UVCoord0;
l9_2428=l9_2473;
l9_2430=l9_2428;
}
l9_2426=l9_2430;
float2 l9_2474=float2(0.0);
l9_2474=l9_2426;
float2 l9_2475=float2(0.0);
l9_2475=l9_2474;
l9_2419=l9_2475;
l9_2422=l9_2419;
}
else
{
float2 l9_2476=float2(0.0);
l9_2476=l9_2421.Surface_UVCoord0;
l9_2420=l9_2476;
l9_2422=l9_2420;
}
}
}
}
l9_2415=l9_2422;
float2 l9_2477=float2(0.0);
float2 l9_2478=(*sc_set0.UserUniforms).uv3Scale;
l9_2477=l9_2478;
float2 l9_2479=float2(0.0);
l9_2479=l9_2477;
float2 l9_2480=float2(0.0);
float2 l9_2481=(*sc_set0.UserUniforms).uv3Offset;
l9_2480=l9_2481;
float2 l9_2482=float2(0.0);
l9_2482=l9_2480;
float2 l9_2483=float2(0.0);
l9_2483=(l9_2415*l9_2479)+l9_2482;
l9_2342=l9_2483;
l9_2344=l9_2342;
}
l9_2340=l9_2344;
l9_2336=l9_2340;
l9_2339=l9_2336;
}
else
{
float2 l9_2484=float2(0.0);
l9_2484=l9_2338.Surface_UVCoord0;
l9_2337=l9_2484;
l9_2339=l9_2337;
}
l9_2335=l9_2339;
float2 l9_2485=float2(0.0);
l9_2485=l9_2335;
float2 l9_2486=float2(0.0);
l9_2486=l9_2485;
l9_2279=l9_2486;
l9_2282=l9_2279;
}
else
{
float2 l9_2487=float2(0.0);
l9_2487=l9_2281.Surface_UVCoord0;
l9_2280=l9_2487;
l9_2282=l9_2280;
}
}
}
}
l9_2275=l9_2282;
float4 l9_2488=float4(0.0);
float2 l9_2489=l9_2275;
int l9_2490=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_2491=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2491=0;
}
else
{
l9_2491=in.varStereoViewID;
}
int l9_2492=l9_2491;
l9_2490=1-l9_2492;
}
else
{
int l9_2493=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2493=0;
}
else
{
l9_2493=in.varStereoViewID;
}
int l9_2494=l9_2493;
l9_2490=l9_2494;
}
int l9_2495=l9_2490;
int l9_2496=detailNormalTexLayout_tmp;
int l9_2497=l9_2495;
float2 l9_2498=l9_2489;
bool l9_2499=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_2500=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_2501=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_2502=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_2503=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_2504=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_2505=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_2506=0.0;
bool l9_2507=l9_2504&&(!l9_2502);
float l9_2508=1.0;
float l9_2509=l9_2498.x;
int l9_2510=l9_2501.x;
if (l9_2510==1)
{
l9_2509=fract(l9_2509);
}
else
{
if (l9_2510==2)
{
float l9_2511=fract(l9_2509);
float l9_2512=l9_2509-l9_2511;
float l9_2513=step(0.25,fract(l9_2512*0.5));
l9_2509=mix(l9_2511,1.0-l9_2511,fast::clamp(l9_2513,0.0,1.0));
}
}
l9_2498.x=l9_2509;
float l9_2514=l9_2498.y;
int l9_2515=l9_2501.y;
if (l9_2515==1)
{
l9_2514=fract(l9_2514);
}
else
{
if (l9_2515==2)
{
float l9_2516=fract(l9_2514);
float l9_2517=l9_2514-l9_2516;
float l9_2518=step(0.25,fract(l9_2517*0.5));
l9_2514=mix(l9_2516,1.0-l9_2516,fast::clamp(l9_2518,0.0,1.0));
}
}
l9_2498.y=l9_2514;
if (l9_2502)
{
bool l9_2519=l9_2504;
bool l9_2520;
if (l9_2519)
{
l9_2520=l9_2501.x==3;
}
else
{
l9_2520=l9_2519;
}
float l9_2521=l9_2498.x;
float l9_2522=l9_2503.x;
float l9_2523=l9_2503.z;
bool l9_2524=l9_2520;
float l9_2525=l9_2508;
float l9_2526=fast::clamp(l9_2521,l9_2522,l9_2523);
float l9_2527=step(abs(l9_2521-l9_2526),9.9999997e-06);
l9_2525*=(l9_2527+((1.0-float(l9_2524))*(1.0-l9_2527)));
l9_2521=l9_2526;
l9_2498.x=l9_2521;
l9_2508=l9_2525;
bool l9_2528=l9_2504;
bool l9_2529;
if (l9_2528)
{
l9_2529=l9_2501.y==3;
}
else
{
l9_2529=l9_2528;
}
float l9_2530=l9_2498.y;
float l9_2531=l9_2503.y;
float l9_2532=l9_2503.w;
bool l9_2533=l9_2529;
float l9_2534=l9_2508;
float l9_2535=fast::clamp(l9_2530,l9_2531,l9_2532);
float l9_2536=step(abs(l9_2530-l9_2535),9.9999997e-06);
l9_2534*=(l9_2536+((1.0-float(l9_2533))*(1.0-l9_2536)));
l9_2530=l9_2535;
l9_2498.y=l9_2530;
l9_2508=l9_2534;
}
float2 l9_2537=l9_2498;
bool l9_2538=l9_2499;
float3x3 l9_2539=l9_2500;
if (l9_2538)
{
l9_2537=float2((l9_2539*float3(l9_2537,1.0)).xy);
}
float2 l9_2540=l9_2537;
float2 l9_2541=l9_2540;
float2 l9_2542=l9_2541;
l9_2498=l9_2542;
float l9_2543=l9_2498.x;
int l9_2544=l9_2501.x;
bool l9_2545=l9_2507;
float l9_2546=l9_2508;
if ((l9_2544==0)||(l9_2544==3))
{
float l9_2547=l9_2543;
float l9_2548=0.0;
float l9_2549=1.0;
bool l9_2550=l9_2545;
float l9_2551=l9_2546;
float l9_2552=fast::clamp(l9_2547,l9_2548,l9_2549);
float l9_2553=step(abs(l9_2547-l9_2552),9.9999997e-06);
l9_2551*=(l9_2553+((1.0-float(l9_2550))*(1.0-l9_2553)));
l9_2547=l9_2552;
l9_2543=l9_2547;
l9_2546=l9_2551;
}
l9_2498.x=l9_2543;
l9_2508=l9_2546;
float l9_2554=l9_2498.y;
int l9_2555=l9_2501.y;
bool l9_2556=l9_2507;
float l9_2557=l9_2508;
if ((l9_2555==0)||(l9_2555==3))
{
float l9_2558=l9_2554;
float l9_2559=0.0;
float l9_2560=1.0;
bool l9_2561=l9_2556;
float l9_2562=l9_2557;
float l9_2563=fast::clamp(l9_2558,l9_2559,l9_2560);
float l9_2564=step(abs(l9_2558-l9_2563),9.9999997e-06);
l9_2562*=(l9_2564+((1.0-float(l9_2561))*(1.0-l9_2564)));
l9_2558=l9_2563;
l9_2554=l9_2558;
l9_2557=l9_2562;
}
l9_2498.y=l9_2554;
l9_2508=l9_2557;
float2 l9_2565=l9_2498;
int l9_2566=l9_2496;
int l9_2567=l9_2497;
float l9_2568=l9_2506;
float2 l9_2569=l9_2565;
int l9_2570=l9_2566;
int l9_2571=l9_2567;
float3 l9_2572=float3(0.0);
if (l9_2570==0)
{
l9_2572=float3(l9_2569,0.0);
}
else
{
if (l9_2570==1)
{
l9_2572=float3(l9_2569.x,(l9_2569.y*0.5)+(0.5-(float(l9_2571)*0.5)),0.0);
}
else
{
l9_2572=float3(l9_2569,float(l9_2571));
}
}
float3 l9_2573=l9_2572;
float3 l9_2574=l9_2573;
float2 l9_2575=l9_2574.xy;
float l9_2576=l9_2568;
float4 l9_2577=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_2575,bias(l9_2576));
float4 l9_2578=l9_2577;
float4 l9_2579=l9_2578;
if (l9_2504)
{
l9_2579=mix(l9_2505,l9_2579,float4(l9_2508));
}
float4 l9_2580=l9_2579;
float4 l9_2581=l9_2580;
float3 l9_2582=(l9_2581.xyz*1.9921875)-float3(1.0);
l9_2581=float4(l9_2582.x,l9_2582.y,l9_2582.z,l9_2581.w);
l9_2488=l9_2581;
l9_2271=l9_2488.xyz;
l9_2274=l9_2271;
}
else
{
l9_2274=l9_2272;
}
l9_2270=l9_2274;
float3 l9_2583=float3(0.0);
float3 l9_2584=l9_2175.xyz;
float l9_2585=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_2586=l9_2270;
float l9_2587=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_2588=l9_2584;
float l9_2589=l9_2585;
float3 l9_2590=l9_2586;
float l9_2591=l9_2587;
float3 l9_2592=mix(float3(0.0,0.0,1.0),l9_2588,float3(l9_2589))+float3(0.0,0.0,1.0);
float3 l9_2593=mix(float3(0.0,0.0,1.0),l9_2590,float3(l9_2591))*float3(-1.0,-1.0,1.0);
float3 l9_2594=normalize((l9_2592*dot(l9_2592,l9_2593))-(l9_2593*l9_2592.z));
l9_2586=l9_2594;
float3 l9_2595=l9_2586;
l9_2583=l9_2595;
float3 l9_2596=float3(0.0);
l9_2596=l9_1961*l9_2583;
float3 l9_2597=float3(0.0);
float3 l9_2598=l9_2596;
float l9_2599=dot(l9_2598,l9_2598);
float l9_2600;
if (l9_2599>0.0)
{
l9_2600=1.0/sqrt(l9_2599);
}
else
{
l9_2600=0.0;
}
float l9_2601=l9_2600;
float3 l9_2602=l9_2598*l9_2601;
l9_2597=l9_2602;
param_17=l9_2597;
param_19=param_17;
}
else
{
float3 l9_2603=float3(0.0);
l9_2603=param_20.VertexNormal_WorldSpace;
float3 l9_2604=float3(0.0);
float3 l9_2605=l9_2603;
float l9_2606=dot(l9_2605,l9_2605);
float l9_2607;
if (l9_2606>0.0)
{
l9_2607=1.0/sqrt(l9_2606);
}
else
{
l9_2607=0.0;
}
float l9_2608=l9_2607;
float3 l9_2609=l9_2605*l9_2608;
l9_2604=l9_2609;
param_18=l9_2604;
param_19=param_18;
}
Result_N337=param_19;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float3 Result_N103=float3(0.0);
float3 param_21=float3(0.0);
float3 param_22=(*sc_set0.UserUniforms).Port_Default_N103;
ssGlobals param_24=Globals;
float3 param_23;
if ((NODE_38_DROPLIST_ITEM_tmp==2)||(int(ENABLE_EMISSIVE_tmp)!=0))
{
float3 l9_2610=float3(0.0);
float3 l9_2611=float3(0.0);
float3 l9_2612=float3(0.0);
ssGlobals l9_2613=param_24;
float3 l9_2614;
if (NODE_38_DROPLIST_ITEM_tmp==2)
{
float4 l9_2615=float4(0.0);
l9_2615=l9_2613.VertexColor;
float3 l9_2616=float3(0.0);
float3 l9_2617=float3(0.0);
float3 l9_2618=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_2619=l9_2613;
float3 l9_2620;
if ((int(ENABLE_EMISSIVE_tmp)!=0))
{
float2 l9_2621=float2(0.0);
float2 l9_2622=float2(0.0);
float2 l9_2623=float2(0.0);
float2 l9_2624=float2(0.0);
float2 l9_2625=float2(0.0);
float2 l9_2626=float2(0.0);
ssGlobals l9_2627=l9_2619;
float2 l9_2628;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_2629=float2(0.0);
l9_2629=l9_2627.Surface_UVCoord0;
l9_2622=l9_2629;
l9_2628=l9_2622;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_2630=float2(0.0);
l9_2630=l9_2627.Surface_UVCoord1;
l9_2623=l9_2630;
l9_2628=l9_2623;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_2631=float2(0.0);
float2 l9_2632=float2(0.0);
float2 l9_2633=float2(0.0);
ssGlobals l9_2634=l9_2627;
float2 l9_2635;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2636=float2(0.0);
float2 l9_2637=float2(0.0);
float2 l9_2638=float2(0.0);
ssGlobals l9_2639=l9_2634;
float2 l9_2640;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2641=float2(0.0);
float2 l9_2642=float2(0.0);
float2 l9_2643=float2(0.0);
float2 l9_2644=float2(0.0);
float2 l9_2645=float2(0.0);
ssGlobals l9_2646=l9_2639;
float2 l9_2647;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2648=float2(0.0);
l9_2648=l9_2646.Surface_UVCoord0;
l9_2642=l9_2648;
l9_2647=l9_2642;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2649=float2(0.0);
l9_2649=l9_2646.Surface_UVCoord1;
l9_2643=l9_2649;
l9_2647=l9_2643;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2650=float2(0.0);
l9_2650=l9_2646.gScreenCoord;
l9_2644=l9_2650;
l9_2647=l9_2644;
}
else
{
float2 l9_2651=float2(0.0);
l9_2651=l9_2646.Surface_UVCoord0;
l9_2645=l9_2651;
l9_2647=l9_2645;
}
}
}
l9_2641=l9_2647;
float2 l9_2652=float2(0.0);
float2 l9_2653=(*sc_set0.UserUniforms).uv2Scale;
l9_2652=l9_2653;
float2 l9_2654=float2(0.0);
l9_2654=l9_2652;
float2 l9_2655=float2(0.0);
float2 l9_2656=(*sc_set0.UserUniforms).uv2Offset;
l9_2655=l9_2656;
float2 l9_2657=float2(0.0);
l9_2657=l9_2655;
float2 l9_2658=float2(0.0);
l9_2658=(l9_2641*l9_2654)+l9_2657;
float2 l9_2659=float2(0.0);
l9_2659=l9_2658+(l9_2657*(l9_2639.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2637=l9_2659;
l9_2640=l9_2637;
}
else
{
float2 l9_2660=float2(0.0);
float2 l9_2661=float2(0.0);
float2 l9_2662=float2(0.0);
float2 l9_2663=float2(0.0);
float2 l9_2664=float2(0.0);
ssGlobals l9_2665=l9_2639;
float2 l9_2666;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2667=float2(0.0);
l9_2667=l9_2665.Surface_UVCoord0;
l9_2661=l9_2667;
l9_2666=l9_2661;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2668=float2(0.0);
l9_2668=l9_2665.Surface_UVCoord1;
l9_2662=l9_2668;
l9_2666=l9_2662;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2669=float2(0.0);
l9_2669=l9_2665.gScreenCoord;
l9_2663=l9_2669;
l9_2666=l9_2663;
}
else
{
float2 l9_2670=float2(0.0);
l9_2670=l9_2665.Surface_UVCoord0;
l9_2664=l9_2670;
l9_2666=l9_2664;
}
}
}
l9_2660=l9_2666;
float2 l9_2671=float2(0.0);
float2 l9_2672=(*sc_set0.UserUniforms).uv2Scale;
l9_2671=l9_2672;
float2 l9_2673=float2(0.0);
l9_2673=l9_2671;
float2 l9_2674=float2(0.0);
float2 l9_2675=(*sc_set0.UserUniforms).uv2Offset;
l9_2674=l9_2675;
float2 l9_2676=float2(0.0);
l9_2676=l9_2674;
float2 l9_2677=float2(0.0);
l9_2677=(l9_2660*l9_2673)+l9_2676;
l9_2638=l9_2677;
l9_2640=l9_2638;
}
l9_2636=l9_2640;
l9_2632=l9_2636;
l9_2635=l9_2632;
}
else
{
float2 l9_2678=float2(0.0);
l9_2678=l9_2634.Surface_UVCoord0;
l9_2633=l9_2678;
l9_2635=l9_2633;
}
l9_2631=l9_2635;
float2 l9_2679=float2(0.0);
l9_2679=l9_2631;
float2 l9_2680=float2(0.0);
l9_2680=l9_2679;
l9_2624=l9_2680;
l9_2628=l9_2624;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2681=float2(0.0);
float2 l9_2682=float2(0.0);
float2 l9_2683=float2(0.0);
ssGlobals l9_2684=l9_2627;
float2 l9_2685;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2686=float2(0.0);
float2 l9_2687=float2(0.0);
float2 l9_2688=float2(0.0);
ssGlobals l9_2689=l9_2684;
float2 l9_2690;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2691=float2(0.0);
float2 l9_2692=float2(0.0);
float2 l9_2693=float2(0.0);
float2 l9_2694=float2(0.0);
float2 l9_2695=float2(0.0);
float2 l9_2696=float2(0.0);
ssGlobals l9_2697=l9_2689;
float2 l9_2698;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2699=float2(0.0);
l9_2699=l9_2697.Surface_UVCoord0;
l9_2692=l9_2699;
l9_2698=l9_2692;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2700=float2(0.0);
l9_2700=l9_2697.Surface_UVCoord1;
l9_2693=l9_2700;
l9_2698=l9_2693;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2701=float2(0.0);
l9_2701=l9_2697.gScreenCoord;
l9_2694=l9_2701;
l9_2698=l9_2694;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2702=float2(0.0);
float2 l9_2703=float2(0.0);
float2 l9_2704=float2(0.0);
ssGlobals l9_2705=l9_2697;
float2 l9_2706;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2707=float2(0.0);
float2 l9_2708=float2(0.0);
float2 l9_2709=float2(0.0);
ssGlobals l9_2710=l9_2705;
float2 l9_2711;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2712=float2(0.0);
float2 l9_2713=float2(0.0);
float2 l9_2714=float2(0.0);
float2 l9_2715=float2(0.0);
float2 l9_2716=float2(0.0);
ssGlobals l9_2717=l9_2710;
float2 l9_2718;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2719=float2(0.0);
l9_2719=l9_2717.Surface_UVCoord0;
l9_2713=l9_2719;
l9_2718=l9_2713;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2720=float2(0.0);
l9_2720=l9_2717.Surface_UVCoord1;
l9_2714=l9_2720;
l9_2718=l9_2714;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2721=float2(0.0);
l9_2721=l9_2717.gScreenCoord;
l9_2715=l9_2721;
l9_2718=l9_2715;
}
else
{
float2 l9_2722=float2(0.0);
l9_2722=l9_2717.Surface_UVCoord0;
l9_2716=l9_2722;
l9_2718=l9_2716;
}
}
}
l9_2712=l9_2718;
float2 l9_2723=float2(0.0);
float2 l9_2724=(*sc_set0.UserUniforms).uv2Scale;
l9_2723=l9_2724;
float2 l9_2725=float2(0.0);
l9_2725=l9_2723;
float2 l9_2726=float2(0.0);
float2 l9_2727=(*sc_set0.UserUniforms).uv2Offset;
l9_2726=l9_2727;
float2 l9_2728=float2(0.0);
l9_2728=l9_2726;
float2 l9_2729=float2(0.0);
l9_2729=(l9_2712*l9_2725)+l9_2728;
float2 l9_2730=float2(0.0);
l9_2730=l9_2729+(l9_2728*(l9_2710.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2708=l9_2730;
l9_2711=l9_2708;
}
else
{
float2 l9_2731=float2(0.0);
float2 l9_2732=float2(0.0);
float2 l9_2733=float2(0.0);
float2 l9_2734=float2(0.0);
float2 l9_2735=float2(0.0);
ssGlobals l9_2736=l9_2710;
float2 l9_2737;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2738=float2(0.0);
l9_2738=l9_2736.Surface_UVCoord0;
l9_2732=l9_2738;
l9_2737=l9_2732;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2739=float2(0.0);
l9_2739=l9_2736.Surface_UVCoord1;
l9_2733=l9_2739;
l9_2737=l9_2733;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2740=float2(0.0);
l9_2740=l9_2736.gScreenCoord;
l9_2734=l9_2740;
l9_2737=l9_2734;
}
else
{
float2 l9_2741=float2(0.0);
l9_2741=l9_2736.Surface_UVCoord0;
l9_2735=l9_2741;
l9_2737=l9_2735;
}
}
}
l9_2731=l9_2737;
float2 l9_2742=float2(0.0);
float2 l9_2743=(*sc_set0.UserUniforms).uv2Scale;
l9_2742=l9_2743;
float2 l9_2744=float2(0.0);
l9_2744=l9_2742;
float2 l9_2745=float2(0.0);
float2 l9_2746=(*sc_set0.UserUniforms).uv2Offset;
l9_2745=l9_2746;
float2 l9_2747=float2(0.0);
l9_2747=l9_2745;
float2 l9_2748=float2(0.0);
l9_2748=(l9_2731*l9_2744)+l9_2747;
l9_2709=l9_2748;
l9_2711=l9_2709;
}
l9_2707=l9_2711;
l9_2703=l9_2707;
l9_2706=l9_2703;
}
else
{
float2 l9_2749=float2(0.0);
l9_2749=l9_2705.Surface_UVCoord0;
l9_2704=l9_2749;
l9_2706=l9_2704;
}
l9_2702=l9_2706;
float2 l9_2750=float2(0.0);
l9_2750=l9_2702;
float2 l9_2751=float2(0.0);
l9_2751=l9_2750;
l9_2695=l9_2751;
l9_2698=l9_2695;
}
else
{
float2 l9_2752=float2(0.0);
l9_2752=l9_2697.Surface_UVCoord0;
l9_2696=l9_2752;
l9_2698=l9_2696;
}
}
}
}
l9_2691=l9_2698;
float2 l9_2753=float2(0.0);
float2 l9_2754=(*sc_set0.UserUniforms).uv3Scale;
l9_2753=l9_2754;
float2 l9_2755=float2(0.0);
l9_2755=l9_2753;
float2 l9_2756=float2(0.0);
float2 l9_2757=(*sc_set0.UserUniforms).uv3Offset;
l9_2756=l9_2757;
float2 l9_2758=float2(0.0);
l9_2758=l9_2756;
float2 l9_2759=float2(0.0);
l9_2759=(l9_2691*l9_2755)+l9_2758;
float2 l9_2760=float2(0.0);
l9_2760=l9_2759+(l9_2758*(l9_2689.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2687=l9_2760;
l9_2690=l9_2687;
}
else
{
float2 l9_2761=float2(0.0);
float2 l9_2762=float2(0.0);
float2 l9_2763=float2(0.0);
float2 l9_2764=float2(0.0);
float2 l9_2765=float2(0.0);
float2 l9_2766=float2(0.0);
ssGlobals l9_2767=l9_2689;
float2 l9_2768;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2769=float2(0.0);
l9_2769=l9_2767.Surface_UVCoord0;
l9_2762=l9_2769;
l9_2768=l9_2762;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2770=float2(0.0);
l9_2770=l9_2767.Surface_UVCoord1;
l9_2763=l9_2770;
l9_2768=l9_2763;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2771=float2(0.0);
l9_2771=l9_2767.gScreenCoord;
l9_2764=l9_2771;
l9_2768=l9_2764;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2772=float2(0.0);
float2 l9_2773=float2(0.0);
float2 l9_2774=float2(0.0);
ssGlobals l9_2775=l9_2767;
float2 l9_2776;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2777=float2(0.0);
float2 l9_2778=float2(0.0);
float2 l9_2779=float2(0.0);
ssGlobals l9_2780=l9_2775;
float2 l9_2781;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2782=float2(0.0);
float2 l9_2783=float2(0.0);
float2 l9_2784=float2(0.0);
float2 l9_2785=float2(0.0);
float2 l9_2786=float2(0.0);
ssGlobals l9_2787=l9_2780;
float2 l9_2788;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2789=float2(0.0);
l9_2789=l9_2787.Surface_UVCoord0;
l9_2783=l9_2789;
l9_2788=l9_2783;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2790=float2(0.0);
l9_2790=l9_2787.Surface_UVCoord1;
l9_2784=l9_2790;
l9_2788=l9_2784;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2791=float2(0.0);
l9_2791=l9_2787.gScreenCoord;
l9_2785=l9_2791;
l9_2788=l9_2785;
}
else
{
float2 l9_2792=float2(0.0);
l9_2792=l9_2787.Surface_UVCoord0;
l9_2786=l9_2792;
l9_2788=l9_2786;
}
}
}
l9_2782=l9_2788;
float2 l9_2793=float2(0.0);
float2 l9_2794=(*sc_set0.UserUniforms).uv2Scale;
l9_2793=l9_2794;
float2 l9_2795=float2(0.0);
l9_2795=l9_2793;
float2 l9_2796=float2(0.0);
float2 l9_2797=(*sc_set0.UserUniforms).uv2Offset;
l9_2796=l9_2797;
float2 l9_2798=float2(0.0);
l9_2798=l9_2796;
float2 l9_2799=float2(0.0);
l9_2799=(l9_2782*l9_2795)+l9_2798;
float2 l9_2800=float2(0.0);
l9_2800=l9_2799+(l9_2798*(l9_2780.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2778=l9_2800;
l9_2781=l9_2778;
}
else
{
float2 l9_2801=float2(0.0);
float2 l9_2802=float2(0.0);
float2 l9_2803=float2(0.0);
float2 l9_2804=float2(0.0);
float2 l9_2805=float2(0.0);
ssGlobals l9_2806=l9_2780;
float2 l9_2807;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2808=float2(0.0);
l9_2808=l9_2806.Surface_UVCoord0;
l9_2802=l9_2808;
l9_2807=l9_2802;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2809=float2(0.0);
l9_2809=l9_2806.Surface_UVCoord1;
l9_2803=l9_2809;
l9_2807=l9_2803;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2810=float2(0.0);
l9_2810=l9_2806.gScreenCoord;
l9_2804=l9_2810;
l9_2807=l9_2804;
}
else
{
float2 l9_2811=float2(0.0);
l9_2811=l9_2806.Surface_UVCoord0;
l9_2805=l9_2811;
l9_2807=l9_2805;
}
}
}
l9_2801=l9_2807;
float2 l9_2812=float2(0.0);
float2 l9_2813=(*sc_set0.UserUniforms).uv2Scale;
l9_2812=l9_2813;
float2 l9_2814=float2(0.0);
l9_2814=l9_2812;
float2 l9_2815=float2(0.0);
float2 l9_2816=(*sc_set0.UserUniforms).uv2Offset;
l9_2815=l9_2816;
float2 l9_2817=float2(0.0);
l9_2817=l9_2815;
float2 l9_2818=float2(0.0);
l9_2818=(l9_2801*l9_2814)+l9_2817;
l9_2779=l9_2818;
l9_2781=l9_2779;
}
l9_2777=l9_2781;
l9_2773=l9_2777;
l9_2776=l9_2773;
}
else
{
float2 l9_2819=float2(0.0);
l9_2819=l9_2775.Surface_UVCoord0;
l9_2774=l9_2819;
l9_2776=l9_2774;
}
l9_2772=l9_2776;
float2 l9_2820=float2(0.0);
l9_2820=l9_2772;
float2 l9_2821=float2(0.0);
l9_2821=l9_2820;
l9_2765=l9_2821;
l9_2768=l9_2765;
}
else
{
float2 l9_2822=float2(0.0);
l9_2822=l9_2767.Surface_UVCoord0;
l9_2766=l9_2822;
l9_2768=l9_2766;
}
}
}
}
l9_2761=l9_2768;
float2 l9_2823=float2(0.0);
float2 l9_2824=(*sc_set0.UserUniforms).uv3Scale;
l9_2823=l9_2824;
float2 l9_2825=float2(0.0);
l9_2825=l9_2823;
float2 l9_2826=float2(0.0);
float2 l9_2827=(*sc_set0.UserUniforms).uv3Offset;
l9_2826=l9_2827;
float2 l9_2828=float2(0.0);
l9_2828=l9_2826;
float2 l9_2829=float2(0.0);
l9_2829=(l9_2761*l9_2825)+l9_2828;
l9_2688=l9_2829;
l9_2690=l9_2688;
}
l9_2686=l9_2690;
l9_2682=l9_2686;
l9_2685=l9_2682;
}
else
{
float2 l9_2830=float2(0.0);
l9_2830=l9_2684.Surface_UVCoord0;
l9_2683=l9_2830;
l9_2685=l9_2683;
}
l9_2681=l9_2685;
float2 l9_2831=float2(0.0);
l9_2831=l9_2681;
float2 l9_2832=float2(0.0);
l9_2832=l9_2831;
l9_2625=l9_2832;
l9_2628=l9_2625;
}
else
{
float2 l9_2833=float2(0.0);
l9_2833=l9_2627.Surface_UVCoord0;
l9_2626=l9_2833;
l9_2628=l9_2626;
}
}
}
}
l9_2621=l9_2628;
float4 l9_2834=float4(0.0);
int l9_2835=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_2836=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2836=0;
}
else
{
l9_2836=in.varStereoViewID;
}
int l9_2837=l9_2836;
l9_2835=1-l9_2837;
}
else
{
int l9_2838=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2838=0;
}
else
{
l9_2838=in.varStereoViewID;
}
int l9_2839=l9_2838;
l9_2835=l9_2839;
}
int l9_2840=l9_2835;
int l9_2841=emissiveTexLayout_tmp;
int l9_2842=l9_2840;
float2 l9_2843=l9_2621;
bool l9_2844=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_2845=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_2846=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_2847=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_2848=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_2849=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_2850=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_2851=0.0;
bool l9_2852=l9_2849&&(!l9_2847);
float l9_2853=1.0;
float l9_2854=l9_2843.x;
int l9_2855=l9_2846.x;
if (l9_2855==1)
{
l9_2854=fract(l9_2854);
}
else
{
if (l9_2855==2)
{
float l9_2856=fract(l9_2854);
float l9_2857=l9_2854-l9_2856;
float l9_2858=step(0.25,fract(l9_2857*0.5));
l9_2854=mix(l9_2856,1.0-l9_2856,fast::clamp(l9_2858,0.0,1.0));
}
}
l9_2843.x=l9_2854;
float l9_2859=l9_2843.y;
int l9_2860=l9_2846.y;
if (l9_2860==1)
{
l9_2859=fract(l9_2859);
}
else
{
if (l9_2860==2)
{
float l9_2861=fract(l9_2859);
float l9_2862=l9_2859-l9_2861;
float l9_2863=step(0.25,fract(l9_2862*0.5));
l9_2859=mix(l9_2861,1.0-l9_2861,fast::clamp(l9_2863,0.0,1.0));
}
}
l9_2843.y=l9_2859;
if (l9_2847)
{
bool l9_2864=l9_2849;
bool l9_2865;
if (l9_2864)
{
l9_2865=l9_2846.x==3;
}
else
{
l9_2865=l9_2864;
}
float l9_2866=l9_2843.x;
float l9_2867=l9_2848.x;
float l9_2868=l9_2848.z;
bool l9_2869=l9_2865;
float l9_2870=l9_2853;
float l9_2871=fast::clamp(l9_2866,l9_2867,l9_2868);
float l9_2872=step(abs(l9_2866-l9_2871),9.9999997e-06);
l9_2870*=(l9_2872+((1.0-float(l9_2869))*(1.0-l9_2872)));
l9_2866=l9_2871;
l9_2843.x=l9_2866;
l9_2853=l9_2870;
bool l9_2873=l9_2849;
bool l9_2874;
if (l9_2873)
{
l9_2874=l9_2846.y==3;
}
else
{
l9_2874=l9_2873;
}
float l9_2875=l9_2843.y;
float l9_2876=l9_2848.y;
float l9_2877=l9_2848.w;
bool l9_2878=l9_2874;
float l9_2879=l9_2853;
float l9_2880=fast::clamp(l9_2875,l9_2876,l9_2877);
float l9_2881=step(abs(l9_2875-l9_2880),9.9999997e-06);
l9_2879*=(l9_2881+((1.0-float(l9_2878))*(1.0-l9_2881)));
l9_2875=l9_2880;
l9_2843.y=l9_2875;
l9_2853=l9_2879;
}
float2 l9_2882=l9_2843;
bool l9_2883=l9_2844;
float3x3 l9_2884=l9_2845;
if (l9_2883)
{
l9_2882=float2((l9_2884*float3(l9_2882,1.0)).xy);
}
float2 l9_2885=l9_2882;
float2 l9_2886=l9_2885;
float2 l9_2887=l9_2886;
l9_2843=l9_2887;
float l9_2888=l9_2843.x;
int l9_2889=l9_2846.x;
bool l9_2890=l9_2852;
float l9_2891=l9_2853;
if ((l9_2889==0)||(l9_2889==3))
{
float l9_2892=l9_2888;
float l9_2893=0.0;
float l9_2894=1.0;
bool l9_2895=l9_2890;
float l9_2896=l9_2891;
float l9_2897=fast::clamp(l9_2892,l9_2893,l9_2894);
float l9_2898=step(abs(l9_2892-l9_2897),9.9999997e-06);
l9_2896*=(l9_2898+((1.0-float(l9_2895))*(1.0-l9_2898)));
l9_2892=l9_2897;
l9_2888=l9_2892;
l9_2891=l9_2896;
}
l9_2843.x=l9_2888;
l9_2853=l9_2891;
float l9_2899=l9_2843.y;
int l9_2900=l9_2846.y;
bool l9_2901=l9_2852;
float l9_2902=l9_2853;
if ((l9_2900==0)||(l9_2900==3))
{
float l9_2903=l9_2899;
float l9_2904=0.0;
float l9_2905=1.0;
bool l9_2906=l9_2901;
float l9_2907=l9_2902;
float l9_2908=fast::clamp(l9_2903,l9_2904,l9_2905);
float l9_2909=step(abs(l9_2903-l9_2908),9.9999997e-06);
l9_2907*=(l9_2909+((1.0-float(l9_2906))*(1.0-l9_2909)));
l9_2903=l9_2908;
l9_2899=l9_2903;
l9_2902=l9_2907;
}
l9_2843.y=l9_2899;
l9_2853=l9_2902;
float2 l9_2910=l9_2843;
int l9_2911=l9_2841;
int l9_2912=l9_2842;
float l9_2913=l9_2851;
float2 l9_2914=l9_2910;
int l9_2915=l9_2911;
int l9_2916=l9_2912;
float3 l9_2917=float3(0.0);
if (l9_2915==0)
{
l9_2917=float3(l9_2914,0.0);
}
else
{
if (l9_2915==1)
{
l9_2917=float3(l9_2914.x,(l9_2914.y*0.5)+(0.5-(float(l9_2916)*0.5)),0.0);
}
else
{
l9_2917=float3(l9_2914,float(l9_2916));
}
}
float3 l9_2918=l9_2917;
float3 l9_2919=l9_2918;
float2 l9_2920=l9_2919.xy;
float l9_2921=l9_2913;
float4 l9_2922=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_2920,bias(l9_2921));
float4 l9_2923=l9_2922;
float4 l9_2924=l9_2923;
if (l9_2849)
{
l9_2924=mix(l9_2850,l9_2924,float4(l9_2853));
}
float4 l9_2925=l9_2924;
l9_2834=l9_2925;
l9_2617=l9_2834.xyz;
l9_2620=l9_2617;
}
else
{
l9_2620=l9_2618;
}
l9_2616=l9_2620;
float3 l9_2926=float3(0.0);
l9_2926=l9_2615.xyz+l9_2616;
l9_2611=l9_2926;
l9_2614=l9_2611;
}
else
{
float3 l9_2927=float3(0.0);
float3 l9_2928=float3(0.0);
float3 l9_2929=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_2930=l9_2613;
float3 l9_2931;
if ((int(ENABLE_EMISSIVE_tmp)!=0))
{
float2 l9_2932=float2(0.0);
float2 l9_2933=float2(0.0);
float2 l9_2934=float2(0.0);
float2 l9_2935=float2(0.0);
float2 l9_2936=float2(0.0);
float2 l9_2937=float2(0.0);
ssGlobals l9_2938=l9_2930;
float2 l9_2939;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_2940=float2(0.0);
l9_2940=l9_2938.Surface_UVCoord0;
l9_2933=l9_2940;
l9_2939=l9_2933;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_2941=float2(0.0);
l9_2941=l9_2938.Surface_UVCoord1;
l9_2934=l9_2941;
l9_2939=l9_2934;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_2942=float2(0.0);
float2 l9_2943=float2(0.0);
float2 l9_2944=float2(0.0);
ssGlobals l9_2945=l9_2938;
float2 l9_2946;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2947=float2(0.0);
float2 l9_2948=float2(0.0);
float2 l9_2949=float2(0.0);
ssGlobals l9_2950=l9_2945;
float2 l9_2951;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2952=float2(0.0);
float2 l9_2953=float2(0.0);
float2 l9_2954=float2(0.0);
float2 l9_2955=float2(0.0);
float2 l9_2956=float2(0.0);
ssGlobals l9_2957=l9_2950;
float2 l9_2958;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2959=float2(0.0);
l9_2959=l9_2957.Surface_UVCoord0;
l9_2953=l9_2959;
l9_2958=l9_2953;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2960=float2(0.0);
l9_2960=l9_2957.Surface_UVCoord1;
l9_2954=l9_2960;
l9_2958=l9_2954;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2961=float2(0.0);
l9_2961=l9_2957.gScreenCoord;
l9_2955=l9_2961;
l9_2958=l9_2955;
}
else
{
float2 l9_2962=float2(0.0);
l9_2962=l9_2957.Surface_UVCoord0;
l9_2956=l9_2962;
l9_2958=l9_2956;
}
}
}
l9_2952=l9_2958;
float2 l9_2963=float2(0.0);
float2 l9_2964=(*sc_set0.UserUniforms).uv2Scale;
l9_2963=l9_2964;
float2 l9_2965=float2(0.0);
l9_2965=l9_2963;
float2 l9_2966=float2(0.0);
float2 l9_2967=(*sc_set0.UserUniforms).uv2Offset;
l9_2966=l9_2967;
float2 l9_2968=float2(0.0);
l9_2968=l9_2966;
float2 l9_2969=float2(0.0);
l9_2969=(l9_2952*l9_2965)+l9_2968;
float2 l9_2970=float2(0.0);
l9_2970=l9_2969+(l9_2968*(l9_2950.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2948=l9_2970;
l9_2951=l9_2948;
}
else
{
float2 l9_2971=float2(0.0);
float2 l9_2972=float2(0.0);
float2 l9_2973=float2(0.0);
float2 l9_2974=float2(0.0);
float2 l9_2975=float2(0.0);
ssGlobals l9_2976=l9_2950;
float2 l9_2977;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2978=float2(0.0);
l9_2978=l9_2976.Surface_UVCoord0;
l9_2972=l9_2978;
l9_2977=l9_2972;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2979=float2(0.0);
l9_2979=l9_2976.Surface_UVCoord1;
l9_2973=l9_2979;
l9_2977=l9_2973;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2980=float2(0.0);
l9_2980=l9_2976.gScreenCoord;
l9_2974=l9_2980;
l9_2977=l9_2974;
}
else
{
float2 l9_2981=float2(0.0);
l9_2981=l9_2976.Surface_UVCoord0;
l9_2975=l9_2981;
l9_2977=l9_2975;
}
}
}
l9_2971=l9_2977;
float2 l9_2982=float2(0.0);
float2 l9_2983=(*sc_set0.UserUniforms).uv2Scale;
l9_2982=l9_2983;
float2 l9_2984=float2(0.0);
l9_2984=l9_2982;
float2 l9_2985=float2(0.0);
float2 l9_2986=(*sc_set0.UserUniforms).uv2Offset;
l9_2985=l9_2986;
float2 l9_2987=float2(0.0);
l9_2987=l9_2985;
float2 l9_2988=float2(0.0);
l9_2988=(l9_2971*l9_2984)+l9_2987;
l9_2949=l9_2988;
l9_2951=l9_2949;
}
l9_2947=l9_2951;
l9_2943=l9_2947;
l9_2946=l9_2943;
}
else
{
float2 l9_2989=float2(0.0);
l9_2989=l9_2945.Surface_UVCoord0;
l9_2944=l9_2989;
l9_2946=l9_2944;
}
l9_2942=l9_2946;
float2 l9_2990=float2(0.0);
l9_2990=l9_2942;
float2 l9_2991=float2(0.0);
l9_2991=l9_2990;
l9_2935=l9_2991;
l9_2939=l9_2935;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2992=float2(0.0);
float2 l9_2993=float2(0.0);
float2 l9_2994=float2(0.0);
ssGlobals l9_2995=l9_2938;
float2 l9_2996;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2997=float2(0.0);
float2 l9_2998=float2(0.0);
float2 l9_2999=float2(0.0);
ssGlobals l9_3000=l9_2995;
float2 l9_3001;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_3002=float2(0.0);
float2 l9_3003=float2(0.0);
float2 l9_3004=float2(0.0);
float2 l9_3005=float2(0.0);
float2 l9_3006=float2(0.0);
float2 l9_3007=float2(0.0);
ssGlobals l9_3008=l9_3000;
float2 l9_3009;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3010=float2(0.0);
l9_3010=l9_3008.Surface_UVCoord0;
l9_3003=l9_3010;
l9_3009=l9_3003;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3011=float2(0.0);
l9_3011=l9_3008.Surface_UVCoord1;
l9_3004=l9_3011;
l9_3009=l9_3004;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3012=float2(0.0);
l9_3012=l9_3008.gScreenCoord;
l9_3005=l9_3012;
l9_3009=l9_3005;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3013=float2(0.0);
float2 l9_3014=float2(0.0);
float2 l9_3015=float2(0.0);
ssGlobals l9_3016=l9_3008;
float2 l9_3017;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3018=float2(0.0);
float2 l9_3019=float2(0.0);
float2 l9_3020=float2(0.0);
ssGlobals l9_3021=l9_3016;
float2 l9_3022;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3023=float2(0.0);
float2 l9_3024=float2(0.0);
float2 l9_3025=float2(0.0);
float2 l9_3026=float2(0.0);
float2 l9_3027=float2(0.0);
ssGlobals l9_3028=l9_3021;
float2 l9_3029;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3030=float2(0.0);
l9_3030=l9_3028.Surface_UVCoord0;
l9_3024=l9_3030;
l9_3029=l9_3024;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3031=float2(0.0);
l9_3031=l9_3028.Surface_UVCoord1;
l9_3025=l9_3031;
l9_3029=l9_3025;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3032=float2(0.0);
l9_3032=l9_3028.gScreenCoord;
l9_3026=l9_3032;
l9_3029=l9_3026;
}
else
{
float2 l9_3033=float2(0.0);
l9_3033=l9_3028.Surface_UVCoord0;
l9_3027=l9_3033;
l9_3029=l9_3027;
}
}
}
l9_3023=l9_3029;
float2 l9_3034=float2(0.0);
float2 l9_3035=(*sc_set0.UserUniforms).uv2Scale;
l9_3034=l9_3035;
float2 l9_3036=float2(0.0);
l9_3036=l9_3034;
float2 l9_3037=float2(0.0);
float2 l9_3038=(*sc_set0.UserUniforms).uv2Offset;
l9_3037=l9_3038;
float2 l9_3039=float2(0.0);
l9_3039=l9_3037;
float2 l9_3040=float2(0.0);
l9_3040=(l9_3023*l9_3036)+l9_3039;
float2 l9_3041=float2(0.0);
l9_3041=l9_3040+(l9_3039*(l9_3021.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3019=l9_3041;
l9_3022=l9_3019;
}
else
{
float2 l9_3042=float2(0.0);
float2 l9_3043=float2(0.0);
float2 l9_3044=float2(0.0);
float2 l9_3045=float2(0.0);
float2 l9_3046=float2(0.0);
ssGlobals l9_3047=l9_3021;
float2 l9_3048;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3049=float2(0.0);
l9_3049=l9_3047.Surface_UVCoord0;
l9_3043=l9_3049;
l9_3048=l9_3043;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3050=float2(0.0);
l9_3050=l9_3047.Surface_UVCoord1;
l9_3044=l9_3050;
l9_3048=l9_3044;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3051=float2(0.0);
l9_3051=l9_3047.gScreenCoord;
l9_3045=l9_3051;
l9_3048=l9_3045;
}
else
{
float2 l9_3052=float2(0.0);
l9_3052=l9_3047.Surface_UVCoord0;
l9_3046=l9_3052;
l9_3048=l9_3046;
}
}
}
l9_3042=l9_3048;
float2 l9_3053=float2(0.0);
float2 l9_3054=(*sc_set0.UserUniforms).uv2Scale;
l9_3053=l9_3054;
float2 l9_3055=float2(0.0);
l9_3055=l9_3053;
float2 l9_3056=float2(0.0);
float2 l9_3057=(*sc_set0.UserUniforms).uv2Offset;
l9_3056=l9_3057;
float2 l9_3058=float2(0.0);
l9_3058=l9_3056;
float2 l9_3059=float2(0.0);
l9_3059=(l9_3042*l9_3055)+l9_3058;
l9_3020=l9_3059;
l9_3022=l9_3020;
}
l9_3018=l9_3022;
l9_3014=l9_3018;
l9_3017=l9_3014;
}
else
{
float2 l9_3060=float2(0.0);
l9_3060=l9_3016.Surface_UVCoord0;
l9_3015=l9_3060;
l9_3017=l9_3015;
}
l9_3013=l9_3017;
float2 l9_3061=float2(0.0);
l9_3061=l9_3013;
float2 l9_3062=float2(0.0);
l9_3062=l9_3061;
l9_3006=l9_3062;
l9_3009=l9_3006;
}
else
{
float2 l9_3063=float2(0.0);
l9_3063=l9_3008.Surface_UVCoord0;
l9_3007=l9_3063;
l9_3009=l9_3007;
}
}
}
}
l9_3002=l9_3009;
float2 l9_3064=float2(0.0);
float2 l9_3065=(*sc_set0.UserUniforms).uv3Scale;
l9_3064=l9_3065;
float2 l9_3066=float2(0.0);
l9_3066=l9_3064;
float2 l9_3067=float2(0.0);
float2 l9_3068=(*sc_set0.UserUniforms).uv3Offset;
l9_3067=l9_3068;
float2 l9_3069=float2(0.0);
l9_3069=l9_3067;
float2 l9_3070=float2(0.0);
l9_3070=(l9_3002*l9_3066)+l9_3069;
float2 l9_3071=float2(0.0);
l9_3071=l9_3070+(l9_3069*(l9_3000.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2998=l9_3071;
l9_3001=l9_2998;
}
else
{
float2 l9_3072=float2(0.0);
float2 l9_3073=float2(0.0);
float2 l9_3074=float2(0.0);
float2 l9_3075=float2(0.0);
float2 l9_3076=float2(0.0);
float2 l9_3077=float2(0.0);
ssGlobals l9_3078=l9_3000;
float2 l9_3079;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3080=float2(0.0);
l9_3080=l9_3078.Surface_UVCoord0;
l9_3073=l9_3080;
l9_3079=l9_3073;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3081=float2(0.0);
l9_3081=l9_3078.Surface_UVCoord1;
l9_3074=l9_3081;
l9_3079=l9_3074;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3082=float2(0.0);
l9_3082=l9_3078.gScreenCoord;
l9_3075=l9_3082;
l9_3079=l9_3075;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3083=float2(0.0);
float2 l9_3084=float2(0.0);
float2 l9_3085=float2(0.0);
ssGlobals l9_3086=l9_3078;
float2 l9_3087;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3088=float2(0.0);
float2 l9_3089=float2(0.0);
float2 l9_3090=float2(0.0);
ssGlobals l9_3091=l9_3086;
float2 l9_3092;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3093=float2(0.0);
float2 l9_3094=float2(0.0);
float2 l9_3095=float2(0.0);
float2 l9_3096=float2(0.0);
float2 l9_3097=float2(0.0);
ssGlobals l9_3098=l9_3091;
float2 l9_3099;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3100=float2(0.0);
l9_3100=l9_3098.Surface_UVCoord0;
l9_3094=l9_3100;
l9_3099=l9_3094;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3101=float2(0.0);
l9_3101=l9_3098.Surface_UVCoord1;
l9_3095=l9_3101;
l9_3099=l9_3095;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3102=float2(0.0);
l9_3102=l9_3098.gScreenCoord;
l9_3096=l9_3102;
l9_3099=l9_3096;
}
else
{
float2 l9_3103=float2(0.0);
l9_3103=l9_3098.Surface_UVCoord0;
l9_3097=l9_3103;
l9_3099=l9_3097;
}
}
}
l9_3093=l9_3099;
float2 l9_3104=float2(0.0);
float2 l9_3105=(*sc_set0.UserUniforms).uv2Scale;
l9_3104=l9_3105;
float2 l9_3106=float2(0.0);
l9_3106=l9_3104;
float2 l9_3107=float2(0.0);
float2 l9_3108=(*sc_set0.UserUniforms).uv2Offset;
l9_3107=l9_3108;
float2 l9_3109=float2(0.0);
l9_3109=l9_3107;
float2 l9_3110=float2(0.0);
l9_3110=(l9_3093*l9_3106)+l9_3109;
float2 l9_3111=float2(0.0);
l9_3111=l9_3110+(l9_3109*(l9_3091.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3089=l9_3111;
l9_3092=l9_3089;
}
else
{
float2 l9_3112=float2(0.0);
float2 l9_3113=float2(0.0);
float2 l9_3114=float2(0.0);
float2 l9_3115=float2(0.0);
float2 l9_3116=float2(0.0);
ssGlobals l9_3117=l9_3091;
float2 l9_3118;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3119=float2(0.0);
l9_3119=l9_3117.Surface_UVCoord0;
l9_3113=l9_3119;
l9_3118=l9_3113;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3120=float2(0.0);
l9_3120=l9_3117.Surface_UVCoord1;
l9_3114=l9_3120;
l9_3118=l9_3114;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3121=float2(0.0);
l9_3121=l9_3117.gScreenCoord;
l9_3115=l9_3121;
l9_3118=l9_3115;
}
else
{
float2 l9_3122=float2(0.0);
l9_3122=l9_3117.Surface_UVCoord0;
l9_3116=l9_3122;
l9_3118=l9_3116;
}
}
}
l9_3112=l9_3118;
float2 l9_3123=float2(0.0);
float2 l9_3124=(*sc_set0.UserUniforms).uv2Scale;
l9_3123=l9_3124;
float2 l9_3125=float2(0.0);
l9_3125=l9_3123;
float2 l9_3126=float2(0.0);
float2 l9_3127=(*sc_set0.UserUniforms).uv2Offset;
l9_3126=l9_3127;
float2 l9_3128=float2(0.0);
l9_3128=l9_3126;
float2 l9_3129=float2(0.0);
l9_3129=(l9_3112*l9_3125)+l9_3128;
l9_3090=l9_3129;
l9_3092=l9_3090;
}
l9_3088=l9_3092;
l9_3084=l9_3088;
l9_3087=l9_3084;
}
else
{
float2 l9_3130=float2(0.0);
l9_3130=l9_3086.Surface_UVCoord0;
l9_3085=l9_3130;
l9_3087=l9_3085;
}
l9_3083=l9_3087;
float2 l9_3131=float2(0.0);
l9_3131=l9_3083;
float2 l9_3132=float2(0.0);
l9_3132=l9_3131;
l9_3076=l9_3132;
l9_3079=l9_3076;
}
else
{
float2 l9_3133=float2(0.0);
l9_3133=l9_3078.Surface_UVCoord0;
l9_3077=l9_3133;
l9_3079=l9_3077;
}
}
}
}
l9_3072=l9_3079;
float2 l9_3134=float2(0.0);
float2 l9_3135=(*sc_set0.UserUniforms).uv3Scale;
l9_3134=l9_3135;
float2 l9_3136=float2(0.0);
l9_3136=l9_3134;
float2 l9_3137=float2(0.0);
float2 l9_3138=(*sc_set0.UserUniforms).uv3Offset;
l9_3137=l9_3138;
float2 l9_3139=float2(0.0);
l9_3139=l9_3137;
float2 l9_3140=float2(0.0);
l9_3140=(l9_3072*l9_3136)+l9_3139;
l9_2999=l9_3140;
l9_3001=l9_2999;
}
l9_2997=l9_3001;
l9_2993=l9_2997;
l9_2996=l9_2993;
}
else
{
float2 l9_3141=float2(0.0);
l9_3141=l9_2995.Surface_UVCoord0;
l9_2994=l9_3141;
l9_2996=l9_2994;
}
l9_2992=l9_2996;
float2 l9_3142=float2(0.0);
l9_3142=l9_2992;
float2 l9_3143=float2(0.0);
l9_3143=l9_3142;
l9_2936=l9_3143;
l9_2939=l9_2936;
}
else
{
float2 l9_3144=float2(0.0);
l9_3144=l9_2938.Surface_UVCoord0;
l9_2937=l9_3144;
l9_2939=l9_2937;
}
}
}
}
l9_2932=l9_2939;
float4 l9_3145=float4(0.0);
int l9_3146=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_3147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3147=0;
}
else
{
l9_3147=in.varStereoViewID;
}
int l9_3148=l9_3147;
l9_3146=1-l9_3148;
}
else
{
int l9_3149=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3149=0;
}
else
{
l9_3149=in.varStereoViewID;
}
int l9_3150=l9_3149;
l9_3146=l9_3150;
}
int l9_3151=l9_3146;
int l9_3152=emissiveTexLayout_tmp;
int l9_3153=l9_3151;
float2 l9_3154=l9_2932;
bool l9_3155=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_3156=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_3157=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_3158=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_3159=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_3160=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_3161=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_3162=0.0;
bool l9_3163=l9_3160&&(!l9_3158);
float l9_3164=1.0;
float l9_3165=l9_3154.x;
int l9_3166=l9_3157.x;
if (l9_3166==1)
{
l9_3165=fract(l9_3165);
}
else
{
if (l9_3166==2)
{
float l9_3167=fract(l9_3165);
float l9_3168=l9_3165-l9_3167;
float l9_3169=step(0.25,fract(l9_3168*0.5));
l9_3165=mix(l9_3167,1.0-l9_3167,fast::clamp(l9_3169,0.0,1.0));
}
}
l9_3154.x=l9_3165;
float l9_3170=l9_3154.y;
int l9_3171=l9_3157.y;
if (l9_3171==1)
{
l9_3170=fract(l9_3170);
}
else
{
if (l9_3171==2)
{
float l9_3172=fract(l9_3170);
float l9_3173=l9_3170-l9_3172;
float l9_3174=step(0.25,fract(l9_3173*0.5));
l9_3170=mix(l9_3172,1.0-l9_3172,fast::clamp(l9_3174,0.0,1.0));
}
}
l9_3154.y=l9_3170;
if (l9_3158)
{
bool l9_3175=l9_3160;
bool l9_3176;
if (l9_3175)
{
l9_3176=l9_3157.x==3;
}
else
{
l9_3176=l9_3175;
}
float l9_3177=l9_3154.x;
float l9_3178=l9_3159.x;
float l9_3179=l9_3159.z;
bool l9_3180=l9_3176;
float l9_3181=l9_3164;
float l9_3182=fast::clamp(l9_3177,l9_3178,l9_3179);
float l9_3183=step(abs(l9_3177-l9_3182),9.9999997e-06);
l9_3181*=(l9_3183+((1.0-float(l9_3180))*(1.0-l9_3183)));
l9_3177=l9_3182;
l9_3154.x=l9_3177;
l9_3164=l9_3181;
bool l9_3184=l9_3160;
bool l9_3185;
if (l9_3184)
{
l9_3185=l9_3157.y==3;
}
else
{
l9_3185=l9_3184;
}
float l9_3186=l9_3154.y;
float l9_3187=l9_3159.y;
float l9_3188=l9_3159.w;
bool l9_3189=l9_3185;
float l9_3190=l9_3164;
float l9_3191=fast::clamp(l9_3186,l9_3187,l9_3188);
float l9_3192=step(abs(l9_3186-l9_3191),9.9999997e-06);
l9_3190*=(l9_3192+((1.0-float(l9_3189))*(1.0-l9_3192)));
l9_3186=l9_3191;
l9_3154.y=l9_3186;
l9_3164=l9_3190;
}
float2 l9_3193=l9_3154;
bool l9_3194=l9_3155;
float3x3 l9_3195=l9_3156;
if (l9_3194)
{
l9_3193=float2((l9_3195*float3(l9_3193,1.0)).xy);
}
float2 l9_3196=l9_3193;
float2 l9_3197=l9_3196;
float2 l9_3198=l9_3197;
l9_3154=l9_3198;
float l9_3199=l9_3154.x;
int l9_3200=l9_3157.x;
bool l9_3201=l9_3163;
float l9_3202=l9_3164;
if ((l9_3200==0)||(l9_3200==3))
{
float l9_3203=l9_3199;
float l9_3204=0.0;
float l9_3205=1.0;
bool l9_3206=l9_3201;
float l9_3207=l9_3202;
float l9_3208=fast::clamp(l9_3203,l9_3204,l9_3205);
float l9_3209=step(abs(l9_3203-l9_3208),9.9999997e-06);
l9_3207*=(l9_3209+((1.0-float(l9_3206))*(1.0-l9_3209)));
l9_3203=l9_3208;
l9_3199=l9_3203;
l9_3202=l9_3207;
}
l9_3154.x=l9_3199;
l9_3164=l9_3202;
float l9_3210=l9_3154.y;
int l9_3211=l9_3157.y;
bool l9_3212=l9_3163;
float l9_3213=l9_3164;
if ((l9_3211==0)||(l9_3211==3))
{
float l9_3214=l9_3210;
float l9_3215=0.0;
float l9_3216=1.0;
bool l9_3217=l9_3212;
float l9_3218=l9_3213;
float l9_3219=fast::clamp(l9_3214,l9_3215,l9_3216);
float l9_3220=step(abs(l9_3214-l9_3219),9.9999997e-06);
l9_3218*=(l9_3220+((1.0-float(l9_3217))*(1.0-l9_3220)));
l9_3214=l9_3219;
l9_3210=l9_3214;
l9_3213=l9_3218;
}
l9_3154.y=l9_3210;
l9_3164=l9_3213;
float2 l9_3221=l9_3154;
int l9_3222=l9_3152;
int l9_3223=l9_3153;
float l9_3224=l9_3162;
float2 l9_3225=l9_3221;
int l9_3226=l9_3222;
int l9_3227=l9_3223;
float3 l9_3228=float3(0.0);
if (l9_3226==0)
{
l9_3228=float3(l9_3225,0.0);
}
else
{
if (l9_3226==1)
{
l9_3228=float3(l9_3225.x,(l9_3225.y*0.5)+(0.5-(float(l9_3227)*0.5)),0.0);
}
else
{
l9_3228=float3(l9_3225,float(l9_3227));
}
}
float3 l9_3229=l9_3228;
float3 l9_3230=l9_3229;
float2 l9_3231=l9_3230.xy;
float l9_3232=l9_3224;
float4 l9_3233=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_3231,bias(l9_3232));
float4 l9_3234=l9_3233;
float4 l9_3235=l9_3234;
if (l9_3160)
{
l9_3235=mix(l9_3161,l9_3235,float4(l9_3164));
}
float4 l9_3236=l9_3235;
l9_3145=l9_3236;
l9_2928=l9_3145.xyz;
l9_2931=l9_2928;
}
else
{
l9_2931=l9_2929;
}
l9_2927=l9_2931;
l9_2612=l9_2927;
l9_2614=l9_2612;
}
l9_2610=l9_2614;
float3 l9_3237=float3(0.0);
float3 l9_3238=(*sc_set0.UserUniforms).emissiveColor;
l9_3237=l9_3238;
float3 l9_3239=float3(0.0);
l9_3239=l9_3237;
float l9_3240=0.0;
float l9_3241=(*sc_set0.UserUniforms).emissiveIntensity;
l9_3240=l9_3241;
float l9_3242=0.0;
l9_3242=l9_3240;
float3 l9_3243=float3(0.0);
l9_3243=(l9_2610*l9_3239)*float3(l9_3242);
float3 l9_3244=float3(0.0);
float3 l9_3245=l9_3243;
float3 l9_3246;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3246=float3(pow(l9_3245.x,2.2),pow(l9_3245.y,2.2),pow(l9_3245.z,2.2));
}
else
{
l9_3246=l9_3245*l9_3245;
}
float3 l9_3247=l9_3246;
l9_3244=l9_3247;
param_21=l9_3244;
param_23=param_21;
}
else
{
param_23=param_22;
}
Result_N103=param_23;
float3 Result_N134=float3(0.0);
float3 param_25=float3(0.0);
float3 param_26=(*sc_set0.UserUniforms).Port_Default_N134;
ssGlobals param_28=Globals;
float3 param_27;
if ((int(Tweak_N179_tmp)!=0))
{
float l9_3248=0.0;
float l9_3249=(*sc_set0.UserUniforms).reflectionIntensity;
l9_3248=l9_3249;
float l9_3250=0.0;
l9_3250=l9_3248;
float3 l9_3251=float3(0.0);
l9_3251=param_28.ViewDirWS;
float3 l9_3252=float3(0.0);
float3 l9_3253=float3(0.0);
float3 l9_3254=float3(0.0);
ssGlobals l9_3255=param_28;
float3 l9_3256;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_3257=float3(0.0);
l9_3257=l9_3255.VertexTangent_WorldSpace;
float3 l9_3258=float3(0.0);
l9_3258=l9_3255.VertexBinormal_WorldSpace;
float3 l9_3259=float3(0.0);
l9_3259=l9_3255.VertexNormal_WorldSpace;
float3x3 l9_3260=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_3260=float3x3(float3(l9_3257),float3(l9_3258),float3(l9_3259));
float2 l9_3261=float2(0.0);
float2 l9_3262=float2(0.0);
float2 l9_3263=float2(0.0);
float2 l9_3264=float2(0.0);
float2 l9_3265=float2(0.0);
float2 l9_3266=float2(0.0);
ssGlobals l9_3267=l9_3255;
float2 l9_3268;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_3269=float2(0.0);
l9_3269=l9_3267.Surface_UVCoord0;
l9_3262=l9_3269;
l9_3268=l9_3262;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_3270=float2(0.0);
l9_3270=l9_3267.Surface_UVCoord1;
l9_3263=l9_3270;
l9_3268=l9_3263;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_3271=float2(0.0);
float2 l9_3272=float2(0.0);
float2 l9_3273=float2(0.0);
ssGlobals l9_3274=l9_3267;
float2 l9_3275;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3276=float2(0.0);
float2 l9_3277=float2(0.0);
float2 l9_3278=float2(0.0);
ssGlobals l9_3279=l9_3274;
float2 l9_3280;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3281=float2(0.0);
float2 l9_3282=float2(0.0);
float2 l9_3283=float2(0.0);
float2 l9_3284=float2(0.0);
float2 l9_3285=float2(0.0);
ssGlobals l9_3286=l9_3279;
float2 l9_3287;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3288=float2(0.0);
l9_3288=l9_3286.Surface_UVCoord0;
l9_3282=l9_3288;
l9_3287=l9_3282;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3289=float2(0.0);
l9_3289=l9_3286.Surface_UVCoord1;
l9_3283=l9_3289;
l9_3287=l9_3283;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3290=float2(0.0);
l9_3290=l9_3286.gScreenCoord;
l9_3284=l9_3290;
l9_3287=l9_3284;
}
else
{
float2 l9_3291=float2(0.0);
l9_3291=l9_3286.Surface_UVCoord0;
l9_3285=l9_3291;
l9_3287=l9_3285;
}
}
}
l9_3281=l9_3287;
float2 l9_3292=float2(0.0);
float2 l9_3293=(*sc_set0.UserUniforms).uv2Scale;
l9_3292=l9_3293;
float2 l9_3294=float2(0.0);
l9_3294=l9_3292;
float2 l9_3295=float2(0.0);
float2 l9_3296=(*sc_set0.UserUniforms).uv2Offset;
l9_3295=l9_3296;
float2 l9_3297=float2(0.0);
l9_3297=l9_3295;
float2 l9_3298=float2(0.0);
l9_3298=(l9_3281*l9_3294)+l9_3297;
float2 l9_3299=float2(0.0);
l9_3299=l9_3298+(l9_3297*(l9_3279.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3277=l9_3299;
l9_3280=l9_3277;
}
else
{
float2 l9_3300=float2(0.0);
float2 l9_3301=float2(0.0);
float2 l9_3302=float2(0.0);
float2 l9_3303=float2(0.0);
float2 l9_3304=float2(0.0);
ssGlobals l9_3305=l9_3279;
float2 l9_3306;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3307=float2(0.0);
l9_3307=l9_3305.Surface_UVCoord0;
l9_3301=l9_3307;
l9_3306=l9_3301;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3308=float2(0.0);
l9_3308=l9_3305.Surface_UVCoord1;
l9_3302=l9_3308;
l9_3306=l9_3302;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3309=float2(0.0);
l9_3309=l9_3305.gScreenCoord;
l9_3303=l9_3309;
l9_3306=l9_3303;
}
else
{
float2 l9_3310=float2(0.0);
l9_3310=l9_3305.Surface_UVCoord0;
l9_3304=l9_3310;
l9_3306=l9_3304;
}
}
}
l9_3300=l9_3306;
float2 l9_3311=float2(0.0);
float2 l9_3312=(*sc_set0.UserUniforms).uv2Scale;
l9_3311=l9_3312;
float2 l9_3313=float2(0.0);
l9_3313=l9_3311;
float2 l9_3314=float2(0.0);
float2 l9_3315=(*sc_set0.UserUniforms).uv2Offset;
l9_3314=l9_3315;
float2 l9_3316=float2(0.0);
l9_3316=l9_3314;
float2 l9_3317=float2(0.0);
l9_3317=(l9_3300*l9_3313)+l9_3316;
l9_3278=l9_3317;
l9_3280=l9_3278;
}
l9_3276=l9_3280;
l9_3272=l9_3276;
l9_3275=l9_3272;
}
else
{
float2 l9_3318=float2(0.0);
l9_3318=l9_3274.Surface_UVCoord0;
l9_3273=l9_3318;
l9_3275=l9_3273;
}
l9_3271=l9_3275;
float2 l9_3319=float2(0.0);
l9_3319=l9_3271;
float2 l9_3320=float2(0.0);
l9_3320=l9_3319;
l9_3264=l9_3320;
l9_3268=l9_3264;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_3321=float2(0.0);
float2 l9_3322=float2(0.0);
float2 l9_3323=float2(0.0);
ssGlobals l9_3324=l9_3267;
float2 l9_3325;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_3326=float2(0.0);
float2 l9_3327=float2(0.0);
float2 l9_3328=float2(0.0);
ssGlobals l9_3329=l9_3324;
float2 l9_3330;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_3331=float2(0.0);
float2 l9_3332=float2(0.0);
float2 l9_3333=float2(0.0);
float2 l9_3334=float2(0.0);
float2 l9_3335=float2(0.0);
float2 l9_3336=float2(0.0);
ssGlobals l9_3337=l9_3329;
float2 l9_3338;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3339=float2(0.0);
l9_3339=l9_3337.Surface_UVCoord0;
l9_3332=l9_3339;
l9_3338=l9_3332;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3340=float2(0.0);
l9_3340=l9_3337.Surface_UVCoord1;
l9_3333=l9_3340;
l9_3338=l9_3333;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3341=float2(0.0);
l9_3341=l9_3337.gScreenCoord;
l9_3334=l9_3341;
l9_3338=l9_3334;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3342=float2(0.0);
float2 l9_3343=float2(0.0);
float2 l9_3344=float2(0.0);
ssGlobals l9_3345=l9_3337;
float2 l9_3346;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3347=float2(0.0);
float2 l9_3348=float2(0.0);
float2 l9_3349=float2(0.0);
ssGlobals l9_3350=l9_3345;
float2 l9_3351;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3352=float2(0.0);
float2 l9_3353=float2(0.0);
float2 l9_3354=float2(0.0);
float2 l9_3355=float2(0.0);
float2 l9_3356=float2(0.0);
ssGlobals l9_3357=l9_3350;
float2 l9_3358;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3359=float2(0.0);
l9_3359=l9_3357.Surface_UVCoord0;
l9_3353=l9_3359;
l9_3358=l9_3353;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3360=float2(0.0);
l9_3360=l9_3357.Surface_UVCoord1;
l9_3354=l9_3360;
l9_3358=l9_3354;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3361=float2(0.0);
l9_3361=l9_3357.gScreenCoord;
l9_3355=l9_3361;
l9_3358=l9_3355;
}
else
{
float2 l9_3362=float2(0.0);
l9_3362=l9_3357.Surface_UVCoord0;
l9_3356=l9_3362;
l9_3358=l9_3356;
}
}
}
l9_3352=l9_3358;
float2 l9_3363=float2(0.0);
float2 l9_3364=(*sc_set0.UserUniforms).uv2Scale;
l9_3363=l9_3364;
float2 l9_3365=float2(0.0);
l9_3365=l9_3363;
float2 l9_3366=float2(0.0);
float2 l9_3367=(*sc_set0.UserUniforms).uv2Offset;
l9_3366=l9_3367;
float2 l9_3368=float2(0.0);
l9_3368=l9_3366;
float2 l9_3369=float2(0.0);
l9_3369=(l9_3352*l9_3365)+l9_3368;
float2 l9_3370=float2(0.0);
l9_3370=l9_3369+(l9_3368*(l9_3350.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3348=l9_3370;
l9_3351=l9_3348;
}
else
{
float2 l9_3371=float2(0.0);
float2 l9_3372=float2(0.0);
float2 l9_3373=float2(0.0);
float2 l9_3374=float2(0.0);
float2 l9_3375=float2(0.0);
ssGlobals l9_3376=l9_3350;
float2 l9_3377;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3378=float2(0.0);
l9_3378=l9_3376.Surface_UVCoord0;
l9_3372=l9_3378;
l9_3377=l9_3372;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3379=float2(0.0);
l9_3379=l9_3376.Surface_UVCoord1;
l9_3373=l9_3379;
l9_3377=l9_3373;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3380=float2(0.0);
l9_3380=l9_3376.gScreenCoord;
l9_3374=l9_3380;
l9_3377=l9_3374;
}
else
{
float2 l9_3381=float2(0.0);
l9_3381=l9_3376.Surface_UVCoord0;
l9_3375=l9_3381;
l9_3377=l9_3375;
}
}
}
l9_3371=l9_3377;
float2 l9_3382=float2(0.0);
float2 l9_3383=(*sc_set0.UserUniforms).uv2Scale;
l9_3382=l9_3383;
float2 l9_3384=float2(0.0);
l9_3384=l9_3382;
float2 l9_3385=float2(0.0);
float2 l9_3386=(*sc_set0.UserUniforms).uv2Offset;
l9_3385=l9_3386;
float2 l9_3387=float2(0.0);
l9_3387=l9_3385;
float2 l9_3388=float2(0.0);
l9_3388=(l9_3371*l9_3384)+l9_3387;
l9_3349=l9_3388;
l9_3351=l9_3349;
}
l9_3347=l9_3351;
l9_3343=l9_3347;
l9_3346=l9_3343;
}
else
{
float2 l9_3389=float2(0.0);
l9_3389=l9_3345.Surface_UVCoord0;
l9_3344=l9_3389;
l9_3346=l9_3344;
}
l9_3342=l9_3346;
float2 l9_3390=float2(0.0);
l9_3390=l9_3342;
float2 l9_3391=float2(0.0);
l9_3391=l9_3390;
l9_3335=l9_3391;
l9_3338=l9_3335;
}
else
{
float2 l9_3392=float2(0.0);
l9_3392=l9_3337.Surface_UVCoord0;
l9_3336=l9_3392;
l9_3338=l9_3336;
}
}
}
}
l9_3331=l9_3338;
float2 l9_3393=float2(0.0);
float2 l9_3394=(*sc_set0.UserUniforms).uv3Scale;
l9_3393=l9_3394;
float2 l9_3395=float2(0.0);
l9_3395=l9_3393;
float2 l9_3396=float2(0.0);
float2 l9_3397=(*sc_set0.UserUniforms).uv3Offset;
l9_3396=l9_3397;
float2 l9_3398=float2(0.0);
l9_3398=l9_3396;
float2 l9_3399=float2(0.0);
l9_3399=(l9_3331*l9_3395)+l9_3398;
float2 l9_3400=float2(0.0);
l9_3400=l9_3399+(l9_3398*(l9_3329.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3327=l9_3400;
l9_3330=l9_3327;
}
else
{
float2 l9_3401=float2(0.0);
float2 l9_3402=float2(0.0);
float2 l9_3403=float2(0.0);
float2 l9_3404=float2(0.0);
float2 l9_3405=float2(0.0);
float2 l9_3406=float2(0.0);
ssGlobals l9_3407=l9_3329;
float2 l9_3408;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3409=float2(0.0);
l9_3409=l9_3407.Surface_UVCoord0;
l9_3402=l9_3409;
l9_3408=l9_3402;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3410=float2(0.0);
l9_3410=l9_3407.Surface_UVCoord1;
l9_3403=l9_3410;
l9_3408=l9_3403;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3411=float2(0.0);
l9_3411=l9_3407.gScreenCoord;
l9_3404=l9_3411;
l9_3408=l9_3404;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3412=float2(0.0);
float2 l9_3413=float2(0.0);
float2 l9_3414=float2(0.0);
ssGlobals l9_3415=l9_3407;
float2 l9_3416;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3417=float2(0.0);
float2 l9_3418=float2(0.0);
float2 l9_3419=float2(0.0);
ssGlobals l9_3420=l9_3415;
float2 l9_3421;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3422=float2(0.0);
float2 l9_3423=float2(0.0);
float2 l9_3424=float2(0.0);
float2 l9_3425=float2(0.0);
float2 l9_3426=float2(0.0);
ssGlobals l9_3427=l9_3420;
float2 l9_3428;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3429=float2(0.0);
l9_3429=l9_3427.Surface_UVCoord0;
l9_3423=l9_3429;
l9_3428=l9_3423;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3430=float2(0.0);
l9_3430=l9_3427.Surface_UVCoord1;
l9_3424=l9_3430;
l9_3428=l9_3424;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3431=float2(0.0);
l9_3431=l9_3427.gScreenCoord;
l9_3425=l9_3431;
l9_3428=l9_3425;
}
else
{
float2 l9_3432=float2(0.0);
l9_3432=l9_3427.Surface_UVCoord0;
l9_3426=l9_3432;
l9_3428=l9_3426;
}
}
}
l9_3422=l9_3428;
float2 l9_3433=float2(0.0);
float2 l9_3434=(*sc_set0.UserUniforms).uv2Scale;
l9_3433=l9_3434;
float2 l9_3435=float2(0.0);
l9_3435=l9_3433;
float2 l9_3436=float2(0.0);
float2 l9_3437=(*sc_set0.UserUniforms).uv2Offset;
l9_3436=l9_3437;
float2 l9_3438=float2(0.0);
l9_3438=l9_3436;
float2 l9_3439=float2(0.0);
l9_3439=(l9_3422*l9_3435)+l9_3438;
float2 l9_3440=float2(0.0);
l9_3440=l9_3439+(l9_3438*(l9_3420.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3418=l9_3440;
l9_3421=l9_3418;
}
else
{
float2 l9_3441=float2(0.0);
float2 l9_3442=float2(0.0);
float2 l9_3443=float2(0.0);
float2 l9_3444=float2(0.0);
float2 l9_3445=float2(0.0);
ssGlobals l9_3446=l9_3420;
float2 l9_3447;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3448=float2(0.0);
l9_3448=l9_3446.Surface_UVCoord0;
l9_3442=l9_3448;
l9_3447=l9_3442;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3449=float2(0.0);
l9_3449=l9_3446.Surface_UVCoord1;
l9_3443=l9_3449;
l9_3447=l9_3443;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3450=float2(0.0);
l9_3450=l9_3446.gScreenCoord;
l9_3444=l9_3450;
l9_3447=l9_3444;
}
else
{
float2 l9_3451=float2(0.0);
l9_3451=l9_3446.Surface_UVCoord0;
l9_3445=l9_3451;
l9_3447=l9_3445;
}
}
}
l9_3441=l9_3447;
float2 l9_3452=float2(0.0);
float2 l9_3453=(*sc_set0.UserUniforms).uv2Scale;
l9_3452=l9_3453;
float2 l9_3454=float2(0.0);
l9_3454=l9_3452;
float2 l9_3455=float2(0.0);
float2 l9_3456=(*sc_set0.UserUniforms).uv2Offset;
l9_3455=l9_3456;
float2 l9_3457=float2(0.0);
l9_3457=l9_3455;
float2 l9_3458=float2(0.0);
l9_3458=(l9_3441*l9_3454)+l9_3457;
l9_3419=l9_3458;
l9_3421=l9_3419;
}
l9_3417=l9_3421;
l9_3413=l9_3417;
l9_3416=l9_3413;
}
else
{
float2 l9_3459=float2(0.0);
l9_3459=l9_3415.Surface_UVCoord0;
l9_3414=l9_3459;
l9_3416=l9_3414;
}
l9_3412=l9_3416;
float2 l9_3460=float2(0.0);
l9_3460=l9_3412;
float2 l9_3461=float2(0.0);
l9_3461=l9_3460;
l9_3405=l9_3461;
l9_3408=l9_3405;
}
else
{
float2 l9_3462=float2(0.0);
l9_3462=l9_3407.Surface_UVCoord0;
l9_3406=l9_3462;
l9_3408=l9_3406;
}
}
}
}
l9_3401=l9_3408;
float2 l9_3463=float2(0.0);
float2 l9_3464=(*sc_set0.UserUniforms).uv3Scale;
l9_3463=l9_3464;
float2 l9_3465=float2(0.0);
l9_3465=l9_3463;
float2 l9_3466=float2(0.0);
float2 l9_3467=(*sc_set0.UserUniforms).uv3Offset;
l9_3466=l9_3467;
float2 l9_3468=float2(0.0);
l9_3468=l9_3466;
float2 l9_3469=float2(0.0);
l9_3469=(l9_3401*l9_3465)+l9_3468;
l9_3328=l9_3469;
l9_3330=l9_3328;
}
l9_3326=l9_3330;
l9_3322=l9_3326;
l9_3325=l9_3322;
}
else
{
float2 l9_3470=float2(0.0);
l9_3470=l9_3324.Surface_UVCoord0;
l9_3323=l9_3470;
l9_3325=l9_3323;
}
l9_3321=l9_3325;
float2 l9_3471=float2(0.0);
l9_3471=l9_3321;
float2 l9_3472=float2(0.0);
l9_3472=l9_3471;
l9_3265=l9_3472;
l9_3268=l9_3265;
}
else
{
float2 l9_3473=float2(0.0);
l9_3473=l9_3267.Surface_UVCoord0;
l9_3266=l9_3473;
l9_3268=l9_3266;
}
}
}
}
l9_3261=l9_3268;
float4 l9_3474=float4(0.0);
float2 l9_3475=l9_3261;
int l9_3476=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_3477=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3477=0;
}
else
{
l9_3477=in.varStereoViewID;
}
int l9_3478=l9_3477;
l9_3476=1-l9_3478;
}
else
{
int l9_3479=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3479=0;
}
else
{
l9_3479=in.varStereoViewID;
}
int l9_3480=l9_3479;
l9_3476=l9_3480;
}
int l9_3481=l9_3476;
int l9_3482=normalTexLayout_tmp;
int l9_3483=l9_3481;
float2 l9_3484=l9_3475;
bool l9_3485=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_3486=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_3487=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_3488=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_3489=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_3490=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_3491=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_3492=0.0;
bool l9_3493=l9_3490&&(!l9_3488);
float l9_3494=1.0;
float l9_3495=l9_3484.x;
int l9_3496=l9_3487.x;
if (l9_3496==1)
{
l9_3495=fract(l9_3495);
}
else
{
if (l9_3496==2)
{
float l9_3497=fract(l9_3495);
float l9_3498=l9_3495-l9_3497;
float l9_3499=step(0.25,fract(l9_3498*0.5));
l9_3495=mix(l9_3497,1.0-l9_3497,fast::clamp(l9_3499,0.0,1.0));
}
}
l9_3484.x=l9_3495;
float l9_3500=l9_3484.y;
int l9_3501=l9_3487.y;
if (l9_3501==1)
{
l9_3500=fract(l9_3500);
}
else
{
if (l9_3501==2)
{
float l9_3502=fract(l9_3500);
float l9_3503=l9_3500-l9_3502;
float l9_3504=step(0.25,fract(l9_3503*0.5));
l9_3500=mix(l9_3502,1.0-l9_3502,fast::clamp(l9_3504,0.0,1.0));
}
}
l9_3484.y=l9_3500;
if (l9_3488)
{
bool l9_3505=l9_3490;
bool l9_3506;
if (l9_3505)
{
l9_3506=l9_3487.x==3;
}
else
{
l9_3506=l9_3505;
}
float l9_3507=l9_3484.x;
float l9_3508=l9_3489.x;
float l9_3509=l9_3489.z;
bool l9_3510=l9_3506;
float l9_3511=l9_3494;
float l9_3512=fast::clamp(l9_3507,l9_3508,l9_3509);
float l9_3513=step(abs(l9_3507-l9_3512),9.9999997e-06);
l9_3511*=(l9_3513+((1.0-float(l9_3510))*(1.0-l9_3513)));
l9_3507=l9_3512;
l9_3484.x=l9_3507;
l9_3494=l9_3511;
bool l9_3514=l9_3490;
bool l9_3515;
if (l9_3514)
{
l9_3515=l9_3487.y==3;
}
else
{
l9_3515=l9_3514;
}
float l9_3516=l9_3484.y;
float l9_3517=l9_3489.y;
float l9_3518=l9_3489.w;
bool l9_3519=l9_3515;
float l9_3520=l9_3494;
float l9_3521=fast::clamp(l9_3516,l9_3517,l9_3518);
float l9_3522=step(abs(l9_3516-l9_3521),9.9999997e-06);
l9_3520*=(l9_3522+((1.0-float(l9_3519))*(1.0-l9_3522)));
l9_3516=l9_3521;
l9_3484.y=l9_3516;
l9_3494=l9_3520;
}
float2 l9_3523=l9_3484;
bool l9_3524=l9_3485;
float3x3 l9_3525=l9_3486;
if (l9_3524)
{
l9_3523=float2((l9_3525*float3(l9_3523,1.0)).xy);
}
float2 l9_3526=l9_3523;
float2 l9_3527=l9_3526;
float2 l9_3528=l9_3527;
l9_3484=l9_3528;
float l9_3529=l9_3484.x;
int l9_3530=l9_3487.x;
bool l9_3531=l9_3493;
float l9_3532=l9_3494;
if ((l9_3530==0)||(l9_3530==3))
{
float l9_3533=l9_3529;
float l9_3534=0.0;
float l9_3535=1.0;
bool l9_3536=l9_3531;
float l9_3537=l9_3532;
float l9_3538=fast::clamp(l9_3533,l9_3534,l9_3535);
float l9_3539=step(abs(l9_3533-l9_3538),9.9999997e-06);
l9_3537*=(l9_3539+((1.0-float(l9_3536))*(1.0-l9_3539)));
l9_3533=l9_3538;
l9_3529=l9_3533;
l9_3532=l9_3537;
}
l9_3484.x=l9_3529;
l9_3494=l9_3532;
float l9_3540=l9_3484.y;
int l9_3541=l9_3487.y;
bool l9_3542=l9_3493;
float l9_3543=l9_3494;
if ((l9_3541==0)||(l9_3541==3))
{
float l9_3544=l9_3540;
float l9_3545=0.0;
float l9_3546=1.0;
bool l9_3547=l9_3542;
float l9_3548=l9_3543;
float l9_3549=fast::clamp(l9_3544,l9_3545,l9_3546);
float l9_3550=step(abs(l9_3544-l9_3549),9.9999997e-06);
l9_3548*=(l9_3550+((1.0-float(l9_3547))*(1.0-l9_3550)));
l9_3544=l9_3549;
l9_3540=l9_3544;
l9_3543=l9_3548;
}
l9_3484.y=l9_3540;
l9_3494=l9_3543;
float2 l9_3551=l9_3484;
int l9_3552=l9_3482;
int l9_3553=l9_3483;
float l9_3554=l9_3492;
float2 l9_3555=l9_3551;
int l9_3556=l9_3552;
int l9_3557=l9_3553;
float3 l9_3558=float3(0.0);
if (l9_3556==0)
{
l9_3558=float3(l9_3555,0.0);
}
else
{
if (l9_3556==1)
{
l9_3558=float3(l9_3555.x,(l9_3555.y*0.5)+(0.5-(float(l9_3557)*0.5)),0.0);
}
else
{
l9_3558=float3(l9_3555,float(l9_3557));
}
}
float3 l9_3559=l9_3558;
float3 l9_3560=l9_3559;
float2 l9_3561=l9_3560.xy;
float l9_3562=l9_3554;
float4 l9_3563=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_3561,bias(l9_3562));
float4 l9_3564=l9_3563;
float4 l9_3565=l9_3564;
if (l9_3490)
{
l9_3565=mix(l9_3491,l9_3565,float4(l9_3494));
}
float4 l9_3566=l9_3565;
float4 l9_3567=l9_3566;
float3 l9_3568=(l9_3567.xyz*1.9921875)-float3(1.0);
l9_3567=float4(l9_3568.x,l9_3568.y,l9_3568.z,l9_3567.w);
l9_3474=l9_3567;
float3 l9_3569=float3(0.0);
float3 l9_3570=float3(0.0);
float3 l9_3571=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_3572=l9_3255;
float3 l9_3573;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_3574=float2(0.0);
float2 l9_3575=float2(0.0);
float2 l9_3576=float2(0.0);
float2 l9_3577=float2(0.0);
float2 l9_3578=float2(0.0);
float2 l9_3579=float2(0.0);
ssGlobals l9_3580=l9_3572;
float2 l9_3581;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_3582=float2(0.0);
l9_3582=l9_3580.Surface_UVCoord0;
l9_3575=l9_3582;
l9_3581=l9_3575;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_3583=float2(0.0);
l9_3583=l9_3580.Surface_UVCoord1;
l9_3576=l9_3583;
l9_3581=l9_3576;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_3584=float2(0.0);
float2 l9_3585=float2(0.0);
float2 l9_3586=float2(0.0);
ssGlobals l9_3587=l9_3580;
float2 l9_3588;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3589=float2(0.0);
float2 l9_3590=float2(0.0);
float2 l9_3591=float2(0.0);
ssGlobals l9_3592=l9_3587;
float2 l9_3593;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3594=float2(0.0);
float2 l9_3595=float2(0.0);
float2 l9_3596=float2(0.0);
float2 l9_3597=float2(0.0);
float2 l9_3598=float2(0.0);
ssGlobals l9_3599=l9_3592;
float2 l9_3600;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3601=float2(0.0);
l9_3601=l9_3599.Surface_UVCoord0;
l9_3595=l9_3601;
l9_3600=l9_3595;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3602=float2(0.0);
l9_3602=l9_3599.Surface_UVCoord1;
l9_3596=l9_3602;
l9_3600=l9_3596;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3603=float2(0.0);
l9_3603=l9_3599.gScreenCoord;
l9_3597=l9_3603;
l9_3600=l9_3597;
}
else
{
float2 l9_3604=float2(0.0);
l9_3604=l9_3599.Surface_UVCoord0;
l9_3598=l9_3604;
l9_3600=l9_3598;
}
}
}
l9_3594=l9_3600;
float2 l9_3605=float2(0.0);
float2 l9_3606=(*sc_set0.UserUniforms).uv2Scale;
l9_3605=l9_3606;
float2 l9_3607=float2(0.0);
l9_3607=l9_3605;
float2 l9_3608=float2(0.0);
float2 l9_3609=(*sc_set0.UserUniforms).uv2Offset;
l9_3608=l9_3609;
float2 l9_3610=float2(0.0);
l9_3610=l9_3608;
float2 l9_3611=float2(0.0);
l9_3611=(l9_3594*l9_3607)+l9_3610;
float2 l9_3612=float2(0.0);
l9_3612=l9_3611+(l9_3610*(l9_3592.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3590=l9_3612;
l9_3593=l9_3590;
}
else
{
float2 l9_3613=float2(0.0);
float2 l9_3614=float2(0.0);
float2 l9_3615=float2(0.0);
float2 l9_3616=float2(0.0);
float2 l9_3617=float2(0.0);
ssGlobals l9_3618=l9_3592;
float2 l9_3619;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3620=float2(0.0);
l9_3620=l9_3618.Surface_UVCoord0;
l9_3614=l9_3620;
l9_3619=l9_3614;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3621=float2(0.0);
l9_3621=l9_3618.Surface_UVCoord1;
l9_3615=l9_3621;
l9_3619=l9_3615;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3622=float2(0.0);
l9_3622=l9_3618.gScreenCoord;
l9_3616=l9_3622;
l9_3619=l9_3616;
}
else
{
float2 l9_3623=float2(0.0);
l9_3623=l9_3618.Surface_UVCoord0;
l9_3617=l9_3623;
l9_3619=l9_3617;
}
}
}
l9_3613=l9_3619;
float2 l9_3624=float2(0.0);
float2 l9_3625=(*sc_set0.UserUniforms).uv2Scale;
l9_3624=l9_3625;
float2 l9_3626=float2(0.0);
l9_3626=l9_3624;
float2 l9_3627=float2(0.0);
float2 l9_3628=(*sc_set0.UserUniforms).uv2Offset;
l9_3627=l9_3628;
float2 l9_3629=float2(0.0);
l9_3629=l9_3627;
float2 l9_3630=float2(0.0);
l9_3630=(l9_3613*l9_3626)+l9_3629;
l9_3591=l9_3630;
l9_3593=l9_3591;
}
l9_3589=l9_3593;
l9_3585=l9_3589;
l9_3588=l9_3585;
}
else
{
float2 l9_3631=float2(0.0);
l9_3631=l9_3587.Surface_UVCoord0;
l9_3586=l9_3631;
l9_3588=l9_3586;
}
l9_3584=l9_3588;
float2 l9_3632=float2(0.0);
l9_3632=l9_3584;
float2 l9_3633=float2(0.0);
l9_3633=l9_3632;
l9_3577=l9_3633;
l9_3581=l9_3577;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_3634=float2(0.0);
float2 l9_3635=float2(0.0);
float2 l9_3636=float2(0.0);
ssGlobals l9_3637=l9_3580;
float2 l9_3638;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_3639=float2(0.0);
float2 l9_3640=float2(0.0);
float2 l9_3641=float2(0.0);
ssGlobals l9_3642=l9_3637;
float2 l9_3643;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_3644=float2(0.0);
float2 l9_3645=float2(0.0);
float2 l9_3646=float2(0.0);
float2 l9_3647=float2(0.0);
float2 l9_3648=float2(0.0);
float2 l9_3649=float2(0.0);
ssGlobals l9_3650=l9_3642;
float2 l9_3651;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3652=float2(0.0);
l9_3652=l9_3650.Surface_UVCoord0;
l9_3645=l9_3652;
l9_3651=l9_3645;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3653=float2(0.0);
l9_3653=l9_3650.Surface_UVCoord1;
l9_3646=l9_3653;
l9_3651=l9_3646;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3654=float2(0.0);
l9_3654=l9_3650.gScreenCoord;
l9_3647=l9_3654;
l9_3651=l9_3647;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3655=float2(0.0);
float2 l9_3656=float2(0.0);
float2 l9_3657=float2(0.0);
ssGlobals l9_3658=l9_3650;
float2 l9_3659;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3660=float2(0.0);
float2 l9_3661=float2(0.0);
float2 l9_3662=float2(0.0);
ssGlobals l9_3663=l9_3658;
float2 l9_3664;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3665=float2(0.0);
float2 l9_3666=float2(0.0);
float2 l9_3667=float2(0.0);
float2 l9_3668=float2(0.0);
float2 l9_3669=float2(0.0);
ssGlobals l9_3670=l9_3663;
float2 l9_3671;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3672=float2(0.0);
l9_3672=l9_3670.Surface_UVCoord0;
l9_3666=l9_3672;
l9_3671=l9_3666;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3673=float2(0.0);
l9_3673=l9_3670.Surface_UVCoord1;
l9_3667=l9_3673;
l9_3671=l9_3667;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3674=float2(0.0);
l9_3674=l9_3670.gScreenCoord;
l9_3668=l9_3674;
l9_3671=l9_3668;
}
else
{
float2 l9_3675=float2(0.0);
l9_3675=l9_3670.Surface_UVCoord0;
l9_3669=l9_3675;
l9_3671=l9_3669;
}
}
}
l9_3665=l9_3671;
float2 l9_3676=float2(0.0);
float2 l9_3677=(*sc_set0.UserUniforms).uv2Scale;
l9_3676=l9_3677;
float2 l9_3678=float2(0.0);
l9_3678=l9_3676;
float2 l9_3679=float2(0.0);
float2 l9_3680=(*sc_set0.UserUniforms).uv2Offset;
l9_3679=l9_3680;
float2 l9_3681=float2(0.0);
l9_3681=l9_3679;
float2 l9_3682=float2(0.0);
l9_3682=(l9_3665*l9_3678)+l9_3681;
float2 l9_3683=float2(0.0);
l9_3683=l9_3682+(l9_3681*(l9_3663.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3661=l9_3683;
l9_3664=l9_3661;
}
else
{
float2 l9_3684=float2(0.0);
float2 l9_3685=float2(0.0);
float2 l9_3686=float2(0.0);
float2 l9_3687=float2(0.0);
float2 l9_3688=float2(0.0);
ssGlobals l9_3689=l9_3663;
float2 l9_3690;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3691=float2(0.0);
l9_3691=l9_3689.Surface_UVCoord0;
l9_3685=l9_3691;
l9_3690=l9_3685;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3692=float2(0.0);
l9_3692=l9_3689.Surface_UVCoord1;
l9_3686=l9_3692;
l9_3690=l9_3686;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3693=float2(0.0);
l9_3693=l9_3689.gScreenCoord;
l9_3687=l9_3693;
l9_3690=l9_3687;
}
else
{
float2 l9_3694=float2(0.0);
l9_3694=l9_3689.Surface_UVCoord0;
l9_3688=l9_3694;
l9_3690=l9_3688;
}
}
}
l9_3684=l9_3690;
float2 l9_3695=float2(0.0);
float2 l9_3696=(*sc_set0.UserUniforms).uv2Scale;
l9_3695=l9_3696;
float2 l9_3697=float2(0.0);
l9_3697=l9_3695;
float2 l9_3698=float2(0.0);
float2 l9_3699=(*sc_set0.UserUniforms).uv2Offset;
l9_3698=l9_3699;
float2 l9_3700=float2(0.0);
l9_3700=l9_3698;
float2 l9_3701=float2(0.0);
l9_3701=(l9_3684*l9_3697)+l9_3700;
l9_3662=l9_3701;
l9_3664=l9_3662;
}
l9_3660=l9_3664;
l9_3656=l9_3660;
l9_3659=l9_3656;
}
else
{
float2 l9_3702=float2(0.0);
l9_3702=l9_3658.Surface_UVCoord0;
l9_3657=l9_3702;
l9_3659=l9_3657;
}
l9_3655=l9_3659;
float2 l9_3703=float2(0.0);
l9_3703=l9_3655;
float2 l9_3704=float2(0.0);
l9_3704=l9_3703;
l9_3648=l9_3704;
l9_3651=l9_3648;
}
else
{
float2 l9_3705=float2(0.0);
l9_3705=l9_3650.Surface_UVCoord0;
l9_3649=l9_3705;
l9_3651=l9_3649;
}
}
}
}
l9_3644=l9_3651;
float2 l9_3706=float2(0.0);
float2 l9_3707=(*sc_set0.UserUniforms).uv3Scale;
l9_3706=l9_3707;
float2 l9_3708=float2(0.0);
l9_3708=l9_3706;
float2 l9_3709=float2(0.0);
float2 l9_3710=(*sc_set0.UserUniforms).uv3Offset;
l9_3709=l9_3710;
float2 l9_3711=float2(0.0);
l9_3711=l9_3709;
float2 l9_3712=float2(0.0);
l9_3712=(l9_3644*l9_3708)+l9_3711;
float2 l9_3713=float2(0.0);
l9_3713=l9_3712+(l9_3711*(l9_3642.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3640=l9_3713;
l9_3643=l9_3640;
}
else
{
float2 l9_3714=float2(0.0);
float2 l9_3715=float2(0.0);
float2 l9_3716=float2(0.0);
float2 l9_3717=float2(0.0);
float2 l9_3718=float2(0.0);
float2 l9_3719=float2(0.0);
ssGlobals l9_3720=l9_3642;
float2 l9_3721;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3722=float2(0.0);
l9_3722=l9_3720.Surface_UVCoord0;
l9_3715=l9_3722;
l9_3721=l9_3715;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3723=float2(0.0);
l9_3723=l9_3720.Surface_UVCoord1;
l9_3716=l9_3723;
l9_3721=l9_3716;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3724=float2(0.0);
l9_3724=l9_3720.gScreenCoord;
l9_3717=l9_3724;
l9_3721=l9_3717;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3725=float2(0.0);
float2 l9_3726=float2(0.0);
float2 l9_3727=float2(0.0);
ssGlobals l9_3728=l9_3720;
float2 l9_3729;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_3730=float2(0.0);
float2 l9_3731=float2(0.0);
float2 l9_3732=float2(0.0);
ssGlobals l9_3733=l9_3728;
float2 l9_3734;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_3735=float2(0.0);
float2 l9_3736=float2(0.0);
float2 l9_3737=float2(0.0);
float2 l9_3738=float2(0.0);
float2 l9_3739=float2(0.0);
ssGlobals l9_3740=l9_3733;
float2 l9_3741;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3742=float2(0.0);
l9_3742=l9_3740.Surface_UVCoord0;
l9_3736=l9_3742;
l9_3741=l9_3736;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3743=float2(0.0);
l9_3743=l9_3740.Surface_UVCoord1;
l9_3737=l9_3743;
l9_3741=l9_3737;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3744=float2(0.0);
l9_3744=l9_3740.gScreenCoord;
l9_3738=l9_3744;
l9_3741=l9_3738;
}
else
{
float2 l9_3745=float2(0.0);
l9_3745=l9_3740.Surface_UVCoord0;
l9_3739=l9_3745;
l9_3741=l9_3739;
}
}
}
l9_3735=l9_3741;
float2 l9_3746=float2(0.0);
float2 l9_3747=(*sc_set0.UserUniforms).uv2Scale;
l9_3746=l9_3747;
float2 l9_3748=float2(0.0);
l9_3748=l9_3746;
float2 l9_3749=float2(0.0);
float2 l9_3750=(*sc_set0.UserUniforms).uv2Offset;
l9_3749=l9_3750;
float2 l9_3751=float2(0.0);
l9_3751=l9_3749;
float2 l9_3752=float2(0.0);
l9_3752=(l9_3735*l9_3748)+l9_3751;
float2 l9_3753=float2(0.0);
l9_3753=l9_3752+(l9_3751*(l9_3733.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3731=l9_3753;
l9_3734=l9_3731;
}
else
{
float2 l9_3754=float2(0.0);
float2 l9_3755=float2(0.0);
float2 l9_3756=float2(0.0);
float2 l9_3757=float2(0.0);
float2 l9_3758=float2(0.0);
ssGlobals l9_3759=l9_3733;
float2 l9_3760;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3761=float2(0.0);
l9_3761=l9_3759.Surface_UVCoord0;
l9_3755=l9_3761;
l9_3760=l9_3755;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3762=float2(0.0);
l9_3762=l9_3759.Surface_UVCoord1;
l9_3756=l9_3762;
l9_3760=l9_3756;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3763=float2(0.0);
l9_3763=l9_3759.gScreenCoord;
l9_3757=l9_3763;
l9_3760=l9_3757;
}
else
{
float2 l9_3764=float2(0.0);
l9_3764=l9_3759.Surface_UVCoord0;
l9_3758=l9_3764;
l9_3760=l9_3758;
}
}
}
l9_3754=l9_3760;
float2 l9_3765=float2(0.0);
float2 l9_3766=(*sc_set0.UserUniforms).uv2Scale;
l9_3765=l9_3766;
float2 l9_3767=float2(0.0);
l9_3767=l9_3765;
float2 l9_3768=float2(0.0);
float2 l9_3769=(*sc_set0.UserUniforms).uv2Offset;
l9_3768=l9_3769;
float2 l9_3770=float2(0.0);
l9_3770=l9_3768;
float2 l9_3771=float2(0.0);
l9_3771=(l9_3754*l9_3767)+l9_3770;
l9_3732=l9_3771;
l9_3734=l9_3732;
}
l9_3730=l9_3734;
l9_3726=l9_3730;
l9_3729=l9_3726;
}
else
{
float2 l9_3772=float2(0.0);
l9_3772=l9_3728.Surface_UVCoord0;
l9_3727=l9_3772;
l9_3729=l9_3727;
}
l9_3725=l9_3729;
float2 l9_3773=float2(0.0);
l9_3773=l9_3725;
float2 l9_3774=float2(0.0);
l9_3774=l9_3773;
l9_3718=l9_3774;
l9_3721=l9_3718;
}
else
{
float2 l9_3775=float2(0.0);
l9_3775=l9_3720.Surface_UVCoord0;
l9_3719=l9_3775;
l9_3721=l9_3719;
}
}
}
}
l9_3714=l9_3721;
float2 l9_3776=float2(0.0);
float2 l9_3777=(*sc_set0.UserUniforms).uv3Scale;
l9_3776=l9_3777;
float2 l9_3778=float2(0.0);
l9_3778=l9_3776;
float2 l9_3779=float2(0.0);
float2 l9_3780=(*sc_set0.UserUniforms).uv3Offset;
l9_3779=l9_3780;
float2 l9_3781=float2(0.0);
l9_3781=l9_3779;
float2 l9_3782=float2(0.0);
l9_3782=(l9_3714*l9_3778)+l9_3781;
l9_3641=l9_3782;
l9_3643=l9_3641;
}
l9_3639=l9_3643;
l9_3635=l9_3639;
l9_3638=l9_3635;
}
else
{
float2 l9_3783=float2(0.0);
l9_3783=l9_3637.Surface_UVCoord0;
l9_3636=l9_3783;
l9_3638=l9_3636;
}
l9_3634=l9_3638;
float2 l9_3784=float2(0.0);
l9_3784=l9_3634;
float2 l9_3785=float2(0.0);
l9_3785=l9_3784;
l9_3578=l9_3785;
l9_3581=l9_3578;
}
else
{
float2 l9_3786=float2(0.0);
l9_3786=l9_3580.Surface_UVCoord0;
l9_3579=l9_3786;
l9_3581=l9_3579;
}
}
}
}
l9_3574=l9_3581;
float4 l9_3787=float4(0.0);
float2 l9_3788=l9_3574;
int l9_3789=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_3790=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3790=0;
}
else
{
l9_3790=in.varStereoViewID;
}
int l9_3791=l9_3790;
l9_3789=1-l9_3791;
}
else
{
int l9_3792=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3792=0;
}
else
{
l9_3792=in.varStereoViewID;
}
int l9_3793=l9_3792;
l9_3789=l9_3793;
}
int l9_3794=l9_3789;
int l9_3795=detailNormalTexLayout_tmp;
int l9_3796=l9_3794;
float2 l9_3797=l9_3788;
bool l9_3798=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_3799=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_3800=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_3801=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_3802=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_3803=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_3804=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_3805=0.0;
bool l9_3806=l9_3803&&(!l9_3801);
float l9_3807=1.0;
float l9_3808=l9_3797.x;
int l9_3809=l9_3800.x;
if (l9_3809==1)
{
l9_3808=fract(l9_3808);
}
else
{
if (l9_3809==2)
{
float l9_3810=fract(l9_3808);
float l9_3811=l9_3808-l9_3810;
float l9_3812=step(0.25,fract(l9_3811*0.5));
l9_3808=mix(l9_3810,1.0-l9_3810,fast::clamp(l9_3812,0.0,1.0));
}
}
l9_3797.x=l9_3808;
float l9_3813=l9_3797.y;
int l9_3814=l9_3800.y;
if (l9_3814==1)
{
l9_3813=fract(l9_3813);
}
else
{
if (l9_3814==2)
{
float l9_3815=fract(l9_3813);
float l9_3816=l9_3813-l9_3815;
float l9_3817=step(0.25,fract(l9_3816*0.5));
l9_3813=mix(l9_3815,1.0-l9_3815,fast::clamp(l9_3817,0.0,1.0));
}
}
l9_3797.y=l9_3813;
if (l9_3801)
{
bool l9_3818=l9_3803;
bool l9_3819;
if (l9_3818)
{
l9_3819=l9_3800.x==3;
}
else
{
l9_3819=l9_3818;
}
float l9_3820=l9_3797.x;
float l9_3821=l9_3802.x;
float l9_3822=l9_3802.z;
bool l9_3823=l9_3819;
float l9_3824=l9_3807;
float l9_3825=fast::clamp(l9_3820,l9_3821,l9_3822);
float l9_3826=step(abs(l9_3820-l9_3825),9.9999997e-06);
l9_3824*=(l9_3826+((1.0-float(l9_3823))*(1.0-l9_3826)));
l9_3820=l9_3825;
l9_3797.x=l9_3820;
l9_3807=l9_3824;
bool l9_3827=l9_3803;
bool l9_3828;
if (l9_3827)
{
l9_3828=l9_3800.y==3;
}
else
{
l9_3828=l9_3827;
}
float l9_3829=l9_3797.y;
float l9_3830=l9_3802.y;
float l9_3831=l9_3802.w;
bool l9_3832=l9_3828;
float l9_3833=l9_3807;
float l9_3834=fast::clamp(l9_3829,l9_3830,l9_3831);
float l9_3835=step(abs(l9_3829-l9_3834),9.9999997e-06);
l9_3833*=(l9_3835+((1.0-float(l9_3832))*(1.0-l9_3835)));
l9_3829=l9_3834;
l9_3797.y=l9_3829;
l9_3807=l9_3833;
}
float2 l9_3836=l9_3797;
bool l9_3837=l9_3798;
float3x3 l9_3838=l9_3799;
if (l9_3837)
{
l9_3836=float2((l9_3838*float3(l9_3836,1.0)).xy);
}
float2 l9_3839=l9_3836;
float2 l9_3840=l9_3839;
float2 l9_3841=l9_3840;
l9_3797=l9_3841;
float l9_3842=l9_3797.x;
int l9_3843=l9_3800.x;
bool l9_3844=l9_3806;
float l9_3845=l9_3807;
if ((l9_3843==0)||(l9_3843==3))
{
float l9_3846=l9_3842;
float l9_3847=0.0;
float l9_3848=1.0;
bool l9_3849=l9_3844;
float l9_3850=l9_3845;
float l9_3851=fast::clamp(l9_3846,l9_3847,l9_3848);
float l9_3852=step(abs(l9_3846-l9_3851),9.9999997e-06);
l9_3850*=(l9_3852+((1.0-float(l9_3849))*(1.0-l9_3852)));
l9_3846=l9_3851;
l9_3842=l9_3846;
l9_3845=l9_3850;
}
l9_3797.x=l9_3842;
l9_3807=l9_3845;
float l9_3853=l9_3797.y;
int l9_3854=l9_3800.y;
bool l9_3855=l9_3806;
float l9_3856=l9_3807;
if ((l9_3854==0)||(l9_3854==3))
{
float l9_3857=l9_3853;
float l9_3858=0.0;
float l9_3859=1.0;
bool l9_3860=l9_3855;
float l9_3861=l9_3856;
float l9_3862=fast::clamp(l9_3857,l9_3858,l9_3859);
float l9_3863=step(abs(l9_3857-l9_3862),9.9999997e-06);
l9_3861*=(l9_3863+((1.0-float(l9_3860))*(1.0-l9_3863)));
l9_3857=l9_3862;
l9_3853=l9_3857;
l9_3856=l9_3861;
}
l9_3797.y=l9_3853;
l9_3807=l9_3856;
float2 l9_3864=l9_3797;
int l9_3865=l9_3795;
int l9_3866=l9_3796;
float l9_3867=l9_3805;
float2 l9_3868=l9_3864;
int l9_3869=l9_3865;
int l9_3870=l9_3866;
float3 l9_3871=float3(0.0);
if (l9_3869==0)
{
l9_3871=float3(l9_3868,0.0);
}
else
{
if (l9_3869==1)
{
l9_3871=float3(l9_3868.x,(l9_3868.y*0.5)+(0.5-(float(l9_3870)*0.5)),0.0);
}
else
{
l9_3871=float3(l9_3868,float(l9_3870));
}
}
float3 l9_3872=l9_3871;
float3 l9_3873=l9_3872;
float2 l9_3874=l9_3873.xy;
float l9_3875=l9_3867;
float4 l9_3876=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_3874,bias(l9_3875));
float4 l9_3877=l9_3876;
float4 l9_3878=l9_3877;
if (l9_3803)
{
l9_3878=mix(l9_3804,l9_3878,float4(l9_3807));
}
float4 l9_3879=l9_3878;
float4 l9_3880=l9_3879;
float3 l9_3881=(l9_3880.xyz*1.9921875)-float3(1.0);
l9_3880=float4(l9_3881.x,l9_3881.y,l9_3881.z,l9_3880.w);
l9_3787=l9_3880;
l9_3570=l9_3787.xyz;
l9_3573=l9_3570;
}
else
{
l9_3573=l9_3571;
}
l9_3569=l9_3573;
float3 l9_3882=float3(0.0);
float3 l9_3883=l9_3474.xyz;
float l9_3884=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_3885=l9_3569;
float l9_3886=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_3887=l9_3883;
float l9_3888=l9_3884;
float3 l9_3889=l9_3885;
float l9_3890=l9_3886;
float3 l9_3891=mix(float3(0.0,0.0,1.0),l9_3887,float3(l9_3888))+float3(0.0,0.0,1.0);
float3 l9_3892=mix(float3(0.0,0.0,1.0),l9_3889,float3(l9_3890))*float3(-1.0,-1.0,1.0);
float3 l9_3893=normalize((l9_3891*dot(l9_3891,l9_3892))-(l9_3892*l9_3891.z));
l9_3885=l9_3893;
float3 l9_3894=l9_3885;
l9_3882=l9_3894;
float3 l9_3895=float3(0.0);
l9_3895=l9_3260*l9_3882;
float3 l9_3896=float3(0.0);
float3 l9_3897=l9_3895;
float l9_3898=dot(l9_3897,l9_3897);
float l9_3899;
if (l9_3898>0.0)
{
l9_3899=1.0/sqrt(l9_3898);
}
else
{
l9_3899=0.0;
}
float l9_3900=l9_3899;
float3 l9_3901=l9_3897*l9_3900;
l9_3896=l9_3901;
l9_3253=l9_3896;
l9_3256=l9_3253;
}
else
{
float3 l9_3902=float3(0.0);
l9_3902=l9_3255.VertexNormal_WorldSpace;
float3 l9_3903=float3(0.0);
float3 l9_3904=l9_3902;
float l9_3905=dot(l9_3904,l9_3904);
float l9_3906;
if (l9_3905>0.0)
{
l9_3906=1.0/sqrt(l9_3905);
}
else
{
l9_3906=0.0;
}
float l9_3907=l9_3906;
float3 l9_3908=l9_3904*l9_3907;
l9_3903=l9_3908;
l9_3254=l9_3903;
l9_3256=l9_3254;
}
l9_3252=l9_3256;
float3 l9_3909=float3(0.0);
l9_3909=l9_3252;
float3 l9_3910=float3(0.0);
l9_3910=l9_3909;
float3 l9_3911=float3(0.0);
l9_3911=reflect(l9_3251,l9_3910);
float3 l9_3912=float3(0.0);
l9_3912=l9_3911*(*sc_set0.UserUniforms).Port_Input1_N257;
float3 l9_3913=float3(0.0);
l9_3913=l9_3912;
float2 l9_3914=float2(0.0);
l9_3914=float2(l9_3913.x,l9_3913.y);
float l9_3915=0.0;
float l9_3916=0.0;
float l9_3917=0.0;
float3 l9_3918=l9_3913;
float l9_3919=l9_3918.x;
float l9_3920=l9_3918.y;
float l9_3921=l9_3918.z;
l9_3915=l9_3919;
l9_3916=l9_3920;
l9_3917=l9_3921;
float l9_3922=0.0;
l9_3922=l9_3915*l9_3915;
float l9_3923=0.0;
l9_3923=l9_3916*l9_3916;
float l9_3924=0.0;
l9_3924=l9_3917+(*sc_set0.UserUniforms).Port_Input1_N264;
float l9_3925=0.0;
l9_3925=l9_3924*l9_3924;
float l9_3926=0.0;
l9_3926=(l9_3922+l9_3923)+l9_3925;
float l9_3927=0.0;
float l9_3928;
if (l9_3926<=0.0)
{
l9_3928=0.0;
}
else
{
l9_3928=sqrt(l9_3926);
}
l9_3927=l9_3928;
float l9_3929=0.0;
l9_3929=l9_3927*(*sc_set0.UserUniforms).Port_Input1_N268;
float2 l9_3930=float2(0.0);
l9_3930=l9_3914/float2(l9_3929);
float2 l9_3931=float2(0.0);
l9_3931=l9_3930+float2((*sc_set0.UserUniforms).Port_Input1_N270);
float2 l9_3932=float2(0.0);
l9_3932=float2(1.0)-l9_3931;
float2 l9_3933=float2(0.0);
l9_3933=l9_3932;
float4 l9_3934=float4(0.0);
int l9_3935=0;
if ((int(reflectionTexHasSwappedViews_tmp)!=0))
{
int l9_3936=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3936=0;
}
else
{
l9_3936=in.varStereoViewID;
}
int l9_3937=l9_3936;
l9_3935=1-l9_3937;
}
else
{
int l9_3938=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3938=0;
}
else
{
l9_3938=in.varStereoViewID;
}
int l9_3939=l9_3938;
l9_3935=l9_3939;
}
int l9_3940=l9_3935;
int l9_3941=reflectionTexLayout_tmp;
int l9_3942=l9_3940;
float2 l9_3943=l9_3933;
bool l9_3944=(int(SC_USE_UV_TRANSFORM_reflectionTex_tmp)!=0);
float3x3 l9_3945=(*sc_set0.UserUniforms).reflectionTexTransform;
int2 l9_3946=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp);
bool l9_3947=(int(SC_USE_UV_MIN_MAX_reflectionTex_tmp)!=0);
float4 l9_3948=(*sc_set0.UserUniforms).reflectionTexUvMinMax;
bool l9_3949=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp)!=0);
float4 l9_3950=(*sc_set0.UserUniforms).reflectionTexBorderColor;
float l9_3951=0.0;
bool l9_3952=l9_3949&&(!l9_3947);
float l9_3953=1.0;
float l9_3954=l9_3943.x;
int l9_3955=l9_3946.x;
if (l9_3955==1)
{
l9_3954=fract(l9_3954);
}
else
{
if (l9_3955==2)
{
float l9_3956=fract(l9_3954);
float l9_3957=l9_3954-l9_3956;
float l9_3958=step(0.25,fract(l9_3957*0.5));
l9_3954=mix(l9_3956,1.0-l9_3956,fast::clamp(l9_3958,0.0,1.0));
}
}
l9_3943.x=l9_3954;
float l9_3959=l9_3943.y;
int l9_3960=l9_3946.y;
if (l9_3960==1)
{
l9_3959=fract(l9_3959);
}
else
{
if (l9_3960==2)
{
float l9_3961=fract(l9_3959);
float l9_3962=l9_3959-l9_3961;
float l9_3963=step(0.25,fract(l9_3962*0.5));
l9_3959=mix(l9_3961,1.0-l9_3961,fast::clamp(l9_3963,0.0,1.0));
}
}
l9_3943.y=l9_3959;
if (l9_3947)
{
bool l9_3964=l9_3949;
bool l9_3965;
if (l9_3964)
{
l9_3965=l9_3946.x==3;
}
else
{
l9_3965=l9_3964;
}
float l9_3966=l9_3943.x;
float l9_3967=l9_3948.x;
float l9_3968=l9_3948.z;
bool l9_3969=l9_3965;
float l9_3970=l9_3953;
float l9_3971=fast::clamp(l9_3966,l9_3967,l9_3968);
float l9_3972=step(abs(l9_3966-l9_3971),9.9999997e-06);
l9_3970*=(l9_3972+((1.0-float(l9_3969))*(1.0-l9_3972)));
l9_3966=l9_3971;
l9_3943.x=l9_3966;
l9_3953=l9_3970;
bool l9_3973=l9_3949;
bool l9_3974;
if (l9_3973)
{
l9_3974=l9_3946.y==3;
}
else
{
l9_3974=l9_3973;
}
float l9_3975=l9_3943.y;
float l9_3976=l9_3948.y;
float l9_3977=l9_3948.w;
bool l9_3978=l9_3974;
float l9_3979=l9_3953;
float l9_3980=fast::clamp(l9_3975,l9_3976,l9_3977);
float l9_3981=step(abs(l9_3975-l9_3980),9.9999997e-06);
l9_3979*=(l9_3981+((1.0-float(l9_3978))*(1.0-l9_3981)));
l9_3975=l9_3980;
l9_3943.y=l9_3975;
l9_3953=l9_3979;
}
float2 l9_3982=l9_3943;
bool l9_3983=l9_3944;
float3x3 l9_3984=l9_3945;
if (l9_3983)
{
l9_3982=float2((l9_3984*float3(l9_3982,1.0)).xy);
}
float2 l9_3985=l9_3982;
float2 l9_3986=l9_3985;
float2 l9_3987=l9_3986;
l9_3943=l9_3987;
float l9_3988=l9_3943.x;
int l9_3989=l9_3946.x;
bool l9_3990=l9_3952;
float l9_3991=l9_3953;
if ((l9_3989==0)||(l9_3989==3))
{
float l9_3992=l9_3988;
float l9_3993=0.0;
float l9_3994=1.0;
bool l9_3995=l9_3990;
float l9_3996=l9_3991;
float l9_3997=fast::clamp(l9_3992,l9_3993,l9_3994);
float l9_3998=step(abs(l9_3992-l9_3997),9.9999997e-06);
l9_3996*=(l9_3998+((1.0-float(l9_3995))*(1.0-l9_3998)));
l9_3992=l9_3997;
l9_3988=l9_3992;
l9_3991=l9_3996;
}
l9_3943.x=l9_3988;
l9_3953=l9_3991;
float l9_3999=l9_3943.y;
int l9_4000=l9_3946.y;
bool l9_4001=l9_3952;
float l9_4002=l9_3953;
if ((l9_4000==0)||(l9_4000==3))
{
float l9_4003=l9_3999;
float l9_4004=0.0;
float l9_4005=1.0;
bool l9_4006=l9_4001;
float l9_4007=l9_4002;
float l9_4008=fast::clamp(l9_4003,l9_4004,l9_4005);
float l9_4009=step(abs(l9_4003-l9_4008),9.9999997e-06);
l9_4007*=(l9_4009+((1.0-float(l9_4006))*(1.0-l9_4009)));
l9_4003=l9_4008;
l9_3999=l9_4003;
l9_4002=l9_4007;
}
l9_3943.y=l9_3999;
l9_3953=l9_4002;
float2 l9_4010=l9_3943;
int l9_4011=l9_3941;
int l9_4012=l9_3942;
float l9_4013=l9_3951;
float2 l9_4014=l9_4010;
int l9_4015=l9_4011;
int l9_4016=l9_4012;
float3 l9_4017=float3(0.0);
if (l9_4015==0)
{
l9_4017=float3(l9_4014,0.0);
}
else
{
if (l9_4015==1)
{
l9_4017=float3(l9_4014.x,(l9_4014.y*0.5)+(0.5-(float(l9_4016)*0.5)),0.0);
}
else
{
l9_4017=float3(l9_4014,float(l9_4016));
}
}
float3 l9_4018=l9_4017;
float3 l9_4019=l9_4018;
float2 l9_4020=l9_4019.xy;
float l9_4021=l9_4013;
float4 l9_4022=sc_set0.reflectionTex.sample(sc_set0.reflectionTexSmpSC,l9_4020,bias(l9_4021));
float4 l9_4023=l9_4022;
float4 l9_4024=l9_4023;
if (l9_3949)
{
l9_4024=mix(l9_3950,l9_4024,float4(l9_3953));
}
float4 l9_4025=l9_4024;
l9_3934=l9_4025;
float3 l9_4026=float3(0.0);
float3 l9_4027=float3(0.0);
float3 l9_4028=(*sc_set0.UserUniforms).Port_Default_N041;
ssGlobals l9_4029=param_28;
float3 l9_4030;
if ((int(ENABLE_REFLECTION_MODULATION_TEX_tmp)!=0))
{
float2 l9_4031=float2(0.0);
float2 l9_4032=float2(0.0);
float2 l9_4033=float2(0.0);
float2 l9_4034=float2(0.0);
float2 l9_4035=float2(0.0);
float2 l9_4036=float2(0.0);
ssGlobals l9_4037=l9_4029;
float2 l9_4038;
if (NODE_228_DROPLIST_ITEM_tmp==0)
{
float2 l9_4039=float2(0.0);
l9_4039=l9_4037.Surface_UVCoord0;
l9_4032=l9_4039;
l9_4038=l9_4032;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==1)
{
float2 l9_4040=float2(0.0);
l9_4040=l9_4037.Surface_UVCoord1;
l9_4033=l9_4040;
l9_4038=l9_4033;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==2)
{
float2 l9_4041=float2(0.0);
float2 l9_4042=float2(0.0);
float2 l9_4043=float2(0.0);
ssGlobals l9_4044=l9_4037;
float2 l9_4045;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4046=float2(0.0);
float2 l9_4047=float2(0.0);
float2 l9_4048=float2(0.0);
ssGlobals l9_4049=l9_4044;
float2 l9_4050;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4051=float2(0.0);
float2 l9_4052=float2(0.0);
float2 l9_4053=float2(0.0);
float2 l9_4054=float2(0.0);
float2 l9_4055=float2(0.0);
ssGlobals l9_4056=l9_4049;
float2 l9_4057;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4058=float2(0.0);
l9_4058=l9_4056.Surface_UVCoord0;
l9_4052=l9_4058;
l9_4057=l9_4052;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4059=float2(0.0);
l9_4059=l9_4056.Surface_UVCoord1;
l9_4053=l9_4059;
l9_4057=l9_4053;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4060=float2(0.0);
l9_4060=l9_4056.gScreenCoord;
l9_4054=l9_4060;
l9_4057=l9_4054;
}
else
{
float2 l9_4061=float2(0.0);
l9_4061=l9_4056.Surface_UVCoord0;
l9_4055=l9_4061;
l9_4057=l9_4055;
}
}
}
l9_4051=l9_4057;
float2 l9_4062=float2(0.0);
float2 l9_4063=(*sc_set0.UserUniforms).uv2Scale;
l9_4062=l9_4063;
float2 l9_4064=float2(0.0);
l9_4064=l9_4062;
float2 l9_4065=float2(0.0);
float2 l9_4066=(*sc_set0.UserUniforms).uv2Offset;
l9_4065=l9_4066;
float2 l9_4067=float2(0.0);
l9_4067=l9_4065;
float2 l9_4068=float2(0.0);
l9_4068=(l9_4051*l9_4064)+l9_4067;
float2 l9_4069=float2(0.0);
l9_4069=l9_4068+(l9_4067*(l9_4049.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4047=l9_4069;
l9_4050=l9_4047;
}
else
{
float2 l9_4070=float2(0.0);
float2 l9_4071=float2(0.0);
float2 l9_4072=float2(0.0);
float2 l9_4073=float2(0.0);
float2 l9_4074=float2(0.0);
ssGlobals l9_4075=l9_4049;
float2 l9_4076;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4077=float2(0.0);
l9_4077=l9_4075.Surface_UVCoord0;
l9_4071=l9_4077;
l9_4076=l9_4071;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4078=float2(0.0);
l9_4078=l9_4075.Surface_UVCoord1;
l9_4072=l9_4078;
l9_4076=l9_4072;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4079=float2(0.0);
l9_4079=l9_4075.gScreenCoord;
l9_4073=l9_4079;
l9_4076=l9_4073;
}
else
{
float2 l9_4080=float2(0.0);
l9_4080=l9_4075.Surface_UVCoord0;
l9_4074=l9_4080;
l9_4076=l9_4074;
}
}
}
l9_4070=l9_4076;
float2 l9_4081=float2(0.0);
float2 l9_4082=(*sc_set0.UserUniforms).uv2Scale;
l9_4081=l9_4082;
float2 l9_4083=float2(0.0);
l9_4083=l9_4081;
float2 l9_4084=float2(0.0);
float2 l9_4085=(*sc_set0.UserUniforms).uv2Offset;
l9_4084=l9_4085;
float2 l9_4086=float2(0.0);
l9_4086=l9_4084;
float2 l9_4087=float2(0.0);
l9_4087=(l9_4070*l9_4083)+l9_4086;
l9_4048=l9_4087;
l9_4050=l9_4048;
}
l9_4046=l9_4050;
l9_4042=l9_4046;
l9_4045=l9_4042;
}
else
{
float2 l9_4088=float2(0.0);
l9_4088=l9_4044.Surface_UVCoord0;
l9_4043=l9_4088;
l9_4045=l9_4043;
}
l9_4041=l9_4045;
float2 l9_4089=float2(0.0);
l9_4089=l9_4041;
float2 l9_4090=float2(0.0);
l9_4090=l9_4089;
l9_4034=l9_4090;
l9_4038=l9_4034;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==3)
{
float2 l9_4091=float2(0.0);
float2 l9_4092=float2(0.0);
float2 l9_4093=float2(0.0);
ssGlobals l9_4094=l9_4037;
float2 l9_4095;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_4096=float2(0.0);
float2 l9_4097=float2(0.0);
float2 l9_4098=float2(0.0);
ssGlobals l9_4099=l9_4094;
float2 l9_4100;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_4101=float2(0.0);
float2 l9_4102=float2(0.0);
float2 l9_4103=float2(0.0);
float2 l9_4104=float2(0.0);
float2 l9_4105=float2(0.0);
float2 l9_4106=float2(0.0);
ssGlobals l9_4107=l9_4099;
float2 l9_4108;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4109=float2(0.0);
l9_4109=l9_4107.Surface_UVCoord0;
l9_4102=l9_4109;
l9_4108=l9_4102;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4110=float2(0.0);
l9_4110=l9_4107.Surface_UVCoord1;
l9_4103=l9_4110;
l9_4108=l9_4103;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4111=float2(0.0);
l9_4111=l9_4107.gScreenCoord;
l9_4104=l9_4111;
l9_4108=l9_4104;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4112=float2(0.0);
float2 l9_4113=float2(0.0);
float2 l9_4114=float2(0.0);
ssGlobals l9_4115=l9_4107;
float2 l9_4116;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4117=float2(0.0);
float2 l9_4118=float2(0.0);
float2 l9_4119=float2(0.0);
ssGlobals l9_4120=l9_4115;
float2 l9_4121;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4122=float2(0.0);
float2 l9_4123=float2(0.0);
float2 l9_4124=float2(0.0);
float2 l9_4125=float2(0.0);
float2 l9_4126=float2(0.0);
ssGlobals l9_4127=l9_4120;
float2 l9_4128;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4129=float2(0.0);
l9_4129=l9_4127.Surface_UVCoord0;
l9_4123=l9_4129;
l9_4128=l9_4123;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4130=float2(0.0);
l9_4130=l9_4127.Surface_UVCoord1;
l9_4124=l9_4130;
l9_4128=l9_4124;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4131=float2(0.0);
l9_4131=l9_4127.gScreenCoord;
l9_4125=l9_4131;
l9_4128=l9_4125;
}
else
{
float2 l9_4132=float2(0.0);
l9_4132=l9_4127.Surface_UVCoord0;
l9_4126=l9_4132;
l9_4128=l9_4126;
}
}
}
l9_4122=l9_4128;
float2 l9_4133=float2(0.0);
float2 l9_4134=(*sc_set0.UserUniforms).uv2Scale;
l9_4133=l9_4134;
float2 l9_4135=float2(0.0);
l9_4135=l9_4133;
float2 l9_4136=float2(0.0);
float2 l9_4137=(*sc_set0.UserUniforms).uv2Offset;
l9_4136=l9_4137;
float2 l9_4138=float2(0.0);
l9_4138=l9_4136;
float2 l9_4139=float2(0.0);
l9_4139=(l9_4122*l9_4135)+l9_4138;
float2 l9_4140=float2(0.0);
l9_4140=l9_4139+(l9_4138*(l9_4120.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4118=l9_4140;
l9_4121=l9_4118;
}
else
{
float2 l9_4141=float2(0.0);
float2 l9_4142=float2(0.0);
float2 l9_4143=float2(0.0);
float2 l9_4144=float2(0.0);
float2 l9_4145=float2(0.0);
ssGlobals l9_4146=l9_4120;
float2 l9_4147;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4148=float2(0.0);
l9_4148=l9_4146.Surface_UVCoord0;
l9_4142=l9_4148;
l9_4147=l9_4142;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4149=float2(0.0);
l9_4149=l9_4146.Surface_UVCoord1;
l9_4143=l9_4149;
l9_4147=l9_4143;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4150=float2(0.0);
l9_4150=l9_4146.gScreenCoord;
l9_4144=l9_4150;
l9_4147=l9_4144;
}
else
{
float2 l9_4151=float2(0.0);
l9_4151=l9_4146.Surface_UVCoord0;
l9_4145=l9_4151;
l9_4147=l9_4145;
}
}
}
l9_4141=l9_4147;
float2 l9_4152=float2(0.0);
float2 l9_4153=(*sc_set0.UserUniforms).uv2Scale;
l9_4152=l9_4153;
float2 l9_4154=float2(0.0);
l9_4154=l9_4152;
float2 l9_4155=float2(0.0);
float2 l9_4156=(*sc_set0.UserUniforms).uv2Offset;
l9_4155=l9_4156;
float2 l9_4157=float2(0.0);
l9_4157=l9_4155;
float2 l9_4158=float2(0.0);
l9_4158=(l9_4141*l9_4154)+l9_4157;
l9_4119=l9_4158;
l9_4121=l9_4119;
}
l9_4117=l9_4121;
l9_4113=l9_4117;
l9_4116=l9_4113;
}
else
{
float2 l9_4159=float2(0.0);
l9_4159=l9_4115.Surface_UVCoord0;
l9_4114=l9_4159;
l9_4116=l9_4114;
}
l9_4112=l9_4116;
float2 l9_4160=float2(0.0);
l9_4160=l9_4112;
float2 l9_4161=float2(0.0);
l9_4161=l9_4160;
l9_4105=l9_4161;
l9_4108=l9_4105;
}
else
{
float2 l9_4162=float2(0.0);
l9_4162=l9_4107.Surface_UVCoord0;
l9_4106=l9_4162;
l9_4108=l9_4106;
}
}
}
}
l9_4101=l9_4108;
float2 l9_4163=float2(0.0);
float2 l9_4164=(*sc_set0.UserUniforms).uv3Scale;
l9_4163=l9_4164;
float2 l9_4165=float2(0.0);
l9_4165=l9_4163;
float2 l9_4166=float2(0.0);
float2 l9_4167=(*sc_set0.UserUniforms).uv3Offset;
l9_4166=l9_4167;
float2 l9_4168=float2(0.0);
l9_4168=l9_4166;
float2 l9_4169=float2(0.0);
l9_4169=(l9_4101*l9_4165)+l9_4168;
float2 l9_4170=float2(0.0);
l9_4170=l9_4169+(l9_4168*(l9_4099.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4097=l9_4170;
l9_4100=l9_4097;
}
else
{
float2 l9_4171=float2(0.0);
float2 l9_4172=float2(0.0);
float2 l9_4173=float2(0.0);
float2 l9_4174=float2(0.0);
float2 l9_4175=float2(0.0);
float2 l9_4176=float2(0.0);
ssGlobals l9_4177=l9_4099;
float2 l9_4178;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4179=float2(0.0);
l9_4179=l9_4177.Surface_UVCoord0;
l9_4172=l9_4179;
l9_4178=l9_4172;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4180=float2(0.0);
l9_4180=l9_4177.Surface_UVCoord1;
l9_4173=l9_4180;
l9_4178=l9_4173;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4181=float2(0.0);
l9_4181=l9_4177.gScreenCoord;
l9_4174=l9_4181;
l9_4178=l9_4174;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4182=float2(0.0);
float2 l9_4183=float2(0.0);
float2 l9_4184=float2(0.0);
ssGlobals l9_4185=l9_4177;
float2 l9_4186;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4187=float2(0.0);
float2 l9_4188=float2(0.0);
float2 l9_4189=float2(0.0);
ssGlobals l9_4190=l9_4185;
float2 l9_4191;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4192=float2(0.0);
float2 l9_4193=float2(0.0);
float2 l9_4194=float2(0.0);
float2 l9_4195=float2(0.0);
float2 l9_4196=float2(0.0);
ssGlobals l9_4197=l9_4190;
float2 l9_4198;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4199=float2(0.0);
l9_4199=l9_4197.Surface_UVCoord0;
l9_4193=l9_4199;
l9_4198=l9_4193;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4200=float2(0.0);
l9_4200=l9_4197.Surface_UVCoord1;
l9_4194=l9_4200;
l9_4198=l9_4194;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4201=float2(0.0);
l9_4201=l9_4197.gScreenCoord;
l9_4195=l9_4201;
l9_4198=l9_4195;
}
else
{
float2 l9_4202=float2(0.0);
l9_4202=l9_4197.Surface_UVCoord0;
l9_4196=l9_4202;
l9_4198=l9_4196;
}
}
}
l9_4192=l9_4198;
float2 l9_4203=float2(0.0);
float2 l9_4204=(*sc_set0.UserUniforms).uv2Scale;
l9_4203=l9_4204;
float2 l9_4205=float2(0.0);
l9_4205=l9_4203;
float2 l9_4206=float2(0.0);
float2 l9_4207=(*sc_set0.UserUniforms).uv2Offset;
l9_4206=l9_4207;
float2 l9_4208=float2(0.0);
l9_4208=l9_4206;
float2 l9_4209=float2(0.0);
l9_4209=(l9_4192*l9_4205)+l9_4208;
float2 l9_4210=float2(0.0);
l9_4210=l9_4209+(l9_4208*(l9_4190.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4188=l9_4210;
l9_4191=l9_4188;
}
else
{
float2 l9_4211=float2(0.0);
float2 l9_4212=float2(0.0);
float2 l9_4213=float2(0.0);
float2 l9_4214=float2(0.0);
float2 l9_4215=float2(0.0);
ssGlobals l9_4216=l9_4190;
float2 l9_4217;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4218=float2(0.0);
l9_4218=l9_4216.Surface_UVCoord0;
l9_4212=l9_4218;
l9_4217=l9_4212;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4219=float2(0.0);
l9_4219=l9_4216.Surface_UVCoord1;
l9_4213=l9_4219;
l9_4217=l9_4213;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4220=float2(0.0);
l9_4220=l9_4216.gScreenCoord;
l9_4214=l9_4220;
l9_4217=l9_4214;
}
else
{
float2 l9_4221=float2(0.0);
l9_4221=l9_4216.Surface_UVCoord0;
l9_4215=l9_4221;
l9_4217=l9_4215;
}
}
}
l9_4211=l9_4217;
float2 l9_4222=float2(0.0);
float2 l9_4223=(*sc_set0.UserUniforms).uv2Scale;
l9_4222=l9_4223;
float2 l9_4224=float2(0.0);
l9_4224=l9_4222;
float2 l9_4225=float2(0.0);
float2 l9_4226=(*sc_set0.UserUniforms).uv2Offset;
l9_4225=l9_4226;
float2 l9_4227=float2(0.0);
l9_4227=l9_4225;
float2 l9_4228=float2(0.0);
l9_4228=(l9_4211*l9_4224)+l9_4227;
l9_4189=l9_4228;
l9_4191=l9_4189;
}
l9_4187=l9_4191;
l9_4183=l9_4187;
l9_4186=l9_4183;
}
else
{
float2 l9_4229=float2(0.0);
l9_4229=l9_4185.Surface_UVCoord0;
l9_4184=l9_4229;
l9_4186=l9_4184;
}
l9_4182=l9_4186;
float2 l9_4230=float2(0.0);
l9_4230=l9_4182;
float2 l9_4231=float2(0.0);
l9_4231=l9_4230;
l9_4175=l9_4231;
l9_4178=l9_4175;
}
else
{
float2 l9_4232=float2(0.0);
l9_4232=l9_4177.Surface_UVCoord0;
l9_4176=l9_4232;
l9_4178=l9_4176;
}
}
}
}
l9_4171=l9_4178;
float2 l9_4233=float2(0.0);
float2 l9_4234=(*sc_set0.UserUniforms).uv3Scale;
l9_4233=l9_4234;
float2 l9_4235=float2(0.0);
l9_4235=l9_4233;
float2 l9_4236=float2(0.0);
float2 l9_4237=(*sc_set0.UserUniforms).uv3Offset;
l9_4236=l9_4237;
float2 l9_4238=float2(0.0);
l9_4238=l9_4236;
float2 l9_4239=float2(0.0);
l9_4239=(l9_4171*l9_4235)+l9_4238;
l9_4098=l9_4239;
l9_4100=l9_4098;
}
l9_4096=l9_4100;
l9_4092=l9_4096;
l9_4095=l9_4092;
}
else
{
float2 l9_4240=float2(0.0);
l9_4240=l9_4094.Surface_UVCoord0;
l9_4093=l9_4240;
l9_4095=l9_4093;
}
l9_4091=l9_4095;
float2 l9_4241=float2(0.0);
l9_4241=l9_4091;
float2 l9_4242=float2(0.0);
l9_4242=l9_4241;
l9_4035=l9_4242;
l9_4038=l9_4035;
}
else
{
float2 l9_4243=float2(0.0);
l9_4243=l9_4037.Surface_UVCoord0;
l9_4036=l9_4243;
l9_4038=l9_4036;
}
}
}
}
l9_4031=l9_4038;
float4 l9_4244=float4(0.0);
int l9_4245=0;
if ((int(reflectionModulationTexHasSwappedViews_tmp)!=0))
{
int l9_4246=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4246=0;
}
else
{
l9_4246=in.varStereoViewID;
}
int l9_4247=l9_4246;
l9_4245=1-l9_4247;
}
else
{
int l9_4248=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4248=0;
}
else
{
l9_4248=in.varStereoViewID;
}
int l9_4249=l9_4248;
l9_4245=l9_4249;
}
int l9_4250=l9_4245;
int l9_4251=reflectionModulationTexLayout_tmp;
int l9_4252=l9_4250;
float2 l9_4253=l9_4031;
bool l9_4254=(int(SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp)!=0);
float3x3 l9_4255=(*sc_set0.UserUniforms).reflectionModulationTexTransform;
int2 l9_4256=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp);
bool l9_4257=(int(SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp)!=0);
float4 l9_4258=(*sc_set0.UserUniforms).reflectionModulationTexUvMinMax;
bool l9_4259=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp)!=0);
float4 l9_4260=(*sc_set0.UserUniforms).reflectionModulationTexBorderColor;
float l9_4261=0.0;
bool l9_4262=l9_4259&&(!l9_4257);
float l9_4263=1.0;
float l9_4264=l9_4253.x;
int l9_4265=l9_4256.x;
if (l9_4265==1)
{
l9_4264=fract(l9_4264);
}
else
{
if (l9_4265==2)
{
float l9_4266=fract(l9_4264);
float l9_4267=l9_4264-l9_4266;
float l9_4268=step(0.25,fract(l9_4267*0.5));
l9_4264=mix(l9_4266,1.0-l9_4266,fast::clamp(l9_4268,0.0,1.0));
}
}
l9_4253.x=l9_4264;
float l9_4269=l9_4253.y;
int l9_4270=l9_4256.y;
if (l9_4270==1)
{
l9_4269=fract(l9_4269);
}
else
{
if (l9_4270==2)
{
float l9_4271=fract(l9_4269);
float l9_4272=l9_4269-l9_4271;
float l9_4273=step(0.25,fract(l9_4272*0.5));
l9_4269=mix(l9_4271,1.0-l9_4271,fast::clamp(l9_4273,0.0,1.0));
}
}
l9_4253.y=l9_4269;
if (l9_4257)
{
bool l9_4274=l9_4259;
bool l9_4275;
if (l9_4274)
{
l9_4275=l9_4256.x==3;
}
else
{
l9_4275=l9_4274;
}
float l9_4276=l9_4253.x;
float l9_4277=l9_4258.x;
float l9_4278=l9_4258.z;
bool l9_4279=l9_4275;
float l9_4280=l9_4263;
float l9_4281=fast::clamp(l9_4276,l9_4277,l9_4278);
float l9_4282=step(abs(l9_4276-l9_4281),9.9999997e-06);
l9_4280*=(l9_4282+((1.0-float(l9_4279))*(1.0-l9_4282)));
l9_4276=l9_4281;
l9_4253.x=l9_4276;
l9_4263=l9_4280;
bool l9_4283=l9_4259;
bool l9_4284;
if (l9_4283)
{
l9_4284=l9_4256.y==3;
}
else
{
l9_4284=l9_4283;
}
float l9_4285=l9_4253.y;
float l9_4286=l9_4258.y;
float l9_4287=l9_4258.w;
bool l9_4288=l9_4284;
float l9_4289=l9_4263;
float l9_4290=fast::clamp(l9_4285,l9_4286,l9_4287);
float l9_4291=step(abs(l9_4285-l9_4290),9.9999997e-06);
l9_4289*=(l9_4291+((1.0-float(l9_4288))*(1.0-l9_4291)));
l9_4285=l9_4290;
l9_4253.y=l9_4285;
l9_4263=l9_4289;
}
float2 l9_4292=l9_4253;
bool l9_4293=l9_4254;
float3x3 l9_4294=l9_4255;
if (l9_4293)
{
l9_4292=float2((l9_4294*float3(l9_4292,1.0)).xy);
}
float2 l9_4295=l9_4292;
float2 l9_4296=l9_4295;
float2 l9_4297=l9_4296;
l9_4253=l9_4297;
float l9_4298=l9_4253.x;
int l9_4299=l9_4256.x;
bool l9_4300=l9_4262;
float l9_4301=l9_4263;
if ((l9_4299==0)||(l9_4299==3))
{
float l9_4302=l9_4298;
float l9_4303=0.0;
float l9_4304=1.0;
bool l9_4305=l9_4300;
float l9_4306=l9_4301;
float l9_4307=fast::clamp(l9_4302,l9_4303,l9_4304);
float l9_4308=step(abs(l9_4302-l9_4307),9.9999997e-06);
l9_4306*=(l9_4308+((1.0-float(l9_4305))*(1.0-l9_4308)));
l9_4302=l9_4307;
l9_4298=l9_4302;
l9_4301=l9_4306;
}
l9_4253.x=l9_4298;
l9_4263=l9_4301;
float l9_4309=l9_4253.y;
int l9_4310=l9_4256.y;
bool l9_4311=l9_4262;
float l9_4312=l9_4263;
if ((l9_4310==0)||(l9_4310==3))
{
float l9_4313=l9_4309;
float l9_4314=0.0;
float l9_4315=1.0;
bool l9_4316=l9_4311;
float l9_4317=l9_4312;
float l9_4318=fast::clamp(l9_4313,l9_4314,l9_4315);
float l9_4319=step(abs(l9_4313-l9_4318),9.9999997e-06);
l9_4317*=(l9_4319+((1.0-float(l9_4316))*(1.0-l9_4319)));
l9_4313=l9_4318;
l9_4309=l9_4313;
l9_4312=l9_4317;
}
l9_4253.y=l9_4309;
l9_4263=l9_4312;
float2 l9_4320=l9_4253;
int l9_4321=l9_4251;
int l9_4322=l9_4252;
float l9_4323=l9_4261;
float2 l9_4324=l9_4320;
int l9_4325=l9_4321;
int l9_4326=l9_4322;
float3 l9_4327=float3(0.0);
if (l9_4325==0)
{
l9_4327=float3(l9_4324,0.0);
}
else
{
if (l9_4325==1)
{
l9_4327=float3(l9_4324.x,(l9_4324.y*0.5)+(0.5-(float(l9_4326)*0.5)),0.0);
}
else
{
l9_4327=float3(l9_4324,float(l9_4326));
}
}
float3 l9_4328=l9_4327;
float3 l9_4329=l9_4328;
float2 l9_4330=l9_4329.xy;
float l9_4331=l9_4323;
float4 l9_4332=sc_set0.reflectionModulationTex.sample(sc_set0.reflectionModulationTexSmpSC,l9_4330,bias(l9_4331));
float4 l9_4333=l9_4332;
float4 l9_4334=l9_4333;
if (l9_4259)
{
l9_4334=mix(l9_4260,l9_4334,float4(l9_4263));
}
float4 l9_4335=l9_4334;
l9_4244=l9_4335;
l9_4027=l9_4244.xyz;
l9_4030=l9_4027;
}
else
{
l9_4030=l9_4028;
}
l9_4026=l9_4030;
float3 l9_4336=float3(0.0);
l9_4336=l9_3934.xyz*l9_4026;
float3 l9_4337=float3(0.0);
float3 l9_4338=l9_4336;
float3 l9_4339;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4339=float3(pow(l9_4338.x,2.2),pow(l9_4338.y,2.2),pow(l9_4338.z,2.2));
}
else
{
l9_4339=l9_4338*l9_4338;
}
float3 l9_4340=l9_4339;
l9_4337=l9_4340;
float3 l9_4341=float3(0.0);
l9_4341=float3(l9_3250)*l9_4337;
param_25=l9_4341;
param_27=param_25;
}
else
{
param_27=param_26;
}
Result_N134=param_27;
float3 Export_N303=float3(0.0);
Export_N303=Result_N134;
float3 Value_N298=float3(0.0);
Value_N298=Export_N303;
float3 Result_N173=float3(0.0);
float3 param_29=float3(0.0);
float3 param_30=(*sc_set0.UserUniforms).Port_Default_N173;
ssGlobals param_32=Globals;
float3 param_31;
if ((int(ENABLE_RIM_HIGHLIGHT_tmp)!=0))
{
float3 l9_4342=float3(0.0);
float3 l9_4343=(*sc_set0.UserUniforms).rimColor;
l9_4342=l9_4343;
float3 l9_4344=float3(0.0);
l9_4344=l9_4342;
float l9_4345=0.0;
float l9_4346=(*sc_set0.UserUniforms).rimIntensity;
l9_4345=l9_4346;
float l9_4347=0.0;
l9_4347=l9_4345;
float3 l9_4348=float3(0.0);
float3 l9_4349=float3(0.0);
float3 l9_4350=(*sc_set0.UserUniforms).Port_Default_N170;
ssGlobals l9_4351=param_32;
float3 l9_4352;
if ((int(ENABLE_RIM_COLOR_TEX_tmp)!=0))
{
float2 l9_4353=float2(0.0);
float2 l9_4354=float2(0.0);
float2 l9_4355=float2(0.0);
float2 l9_4356=float2(0.0);
float2 l9_4357=float2(0.0);
float2 l9_4358=float2(0.0);
ssGlobals l9_4359=l9_4351;
float2 l9_4360;
if (NODE_315_DROPLIST_ITEM_tmp==0)
{
float2 l9_4361=float2(0.0);
l9_4361=l9_4359.Surface_UVCoord0;
l9_4354=l9_4361;
l9_4360=l9_4354;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==1)
{
float2 l9_4362=float2(0.0);
l9_4362=l9_4359.Surface_UVCoord1;
l9_4355=l9_4362;
l9_4360=l9_4355;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==2)
{
float2 l9_4363=float2(0.0);
float2 l9_4364=float2(0.0);
float2 l9_4365=float2(0.0);
ssGlobals l9_4366=l9_4359;
float2 l9_4367;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4368=float2(0.0);
float2 l9_4369=float2(0.0);
float2 l9_4370=float2(0.0);
ssGlobals l9_4371=l9_4366;
float2 l9_4372;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4373=float2(0.0);
float2 l9_4374=float2(0.0);
float2 l9_4375=float2(0.0);
float2 l9_4376=float2(0.0);
float2 l9_4377=float2(0.0);
ssGlobals l9_4378=l9_4371;
float2 l9_4379;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4380=float2(0.0);
l9_4380=l9_4378.Surface_UVCoord0;
l9_4374=l9_4380;
l9_4379=l9_4374;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4381=float2(0.0);
l9_4381=l9_4378.Surface_UVCoord1;
l9_4375=l9_4381;
l9_4379=l9_4375;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4382=float2(0.0);
l9_4382=l9_4378.gScreenCoord;
l9_4376=l9_4382;
l9_4379=l9_4376;
}
else
{
float2 l9_4383=float2(0.0);
l9_4383=l9_4378.Surface_UVCoord0;
l9_4377=l9_4383;
l9_4379=l9_4377;
}
}
}
l9_4373=l9_4379;
float2 l9_4384=float2(0.0);
float2 l9_4385=(*sc_set0.UserUniforms).uv2Scale;
l9_4384=l9_4385;
float2 l9_4386=float2(0.0);
l9_4386=l9_4384;
float2 l9_4387=float2(0.0);
float2 l9_4388=(*sc_set0.UserUniforms).uv2Offset;
l9_4387=l9_4388;
float2 l9_4389=float2(0.0);
l9_4389=l9_4387;
float2 l9_4390=float2(0.0);
l9_4390=(l9_4373*l9_4386)+l9_4389;
float2 l9_4391=float2(0.0);
l9_4391=l9_4390+(l9_4389*(l9_4371.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4369=l9_4391;
l9_4372=l9_4369;
}
else
{
float2 l9_4392=float2(0.0);
float2 l9_4393=float2(0.0);
float2 l9_4394=float2(0.0);
float2 l9_4395=float2(0.0);
float2 l9_4396=float2(0.0);
ssGlobals l9_4397=l9_4371;
float2 l9_4398;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4399=float2(0.0);
l9_4399=l9_4397.Surface_UVCoord0;
l9_4393=l9_4399;
l9_4398=l9_4393;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4400=float2(0.0);
l9_4400=l9_4397.Surface_UVCoord1;
l9_4394=l9_4400;
l9_4398=l9_4394;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4401=float2(0.0);
l9_4401=l9_4397.gScreenCoord;
l9_4395=l9_4401;
l9_4398=l9_4395;
}
else
{
float2 l9_4402=float2(0.0);
l9_4402=l9_4397.Surface_UVCoord0;
l9_4396=l9_4402;
l9_4398=l9_4396;
}
}
}
l9_4392=l9_4398;
float2 l9_4403=float2(0.0);
float2 l9_4404=(*sc_set0.UserUniforms).uv2Scale;
l9_4403=l9_4404;
float2 l9_4405=float2(0.0);
l9_4405=l9_4403;
float2 l9_4406=float2(0.0);
float2 l9_4407=(*sc_set0.UserUniforms).uv2Offset;
l9_4406=l9_4407;
float2 l9_4408=float2(0.0);
l9_4408=l9_4406;
float2 l9_4409=float2(0.0);
l9_4409=(l9_4392*l9_4405)+l9_4408;
l9_4370=l9_4409;
l9_4372=l9_4370;
}
l9_4368=l9_4372;
l9_4364=l9_4368;
l9_4367=l9_4364;
}
else
{
float2 l9_4410=float2(0.0);
l9_4410=l9_4366.Surface_UVCoord0;
l9_4365=l9_4410;
l9_4367=l9_4365;
}
l9_4363=l9_4367;
float2 l9_4411=float2(0.0);
l9_4411=l9_4363;
float2 l9_4412=float2(0.0);
l9_4412=l9_4411;
l9_4356=l9_4412;
l9_4360=l9_4356;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==3)
{
float2 l9_4413=float2(0.0);
float2 l9_4414=float2(0.0);
float2 l9_4415=float2(0.0);
ssGlobals l9_4416=l9_4359;
float2 l9_4417;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_4418=float2(0.0);
float2 l9_4419=float2(0.0);
float2 l9_4420=float2(0.0);
ssGlobals l9_4421=l9_4416;
float2 l9_4422;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_4423=float2(0.0);
float2 l9_4424=float2(0.0);
float2 l9_4425=float2(0.0);
float2 l9_4426=float2(0.0);
float2 l9_4427=float2(0.0);
float2 l9_4428=float2(0.0);
ssGlobals l9_4429=l9_4421;
float2 l9_4430;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4431=float2(0.0);
l9_4431=l9_4429.Surface_UVCoord0;
l9_4424=l9_4431;
l9_4430=l9_4424;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4432=float2(0.0);
l9_4432=l9_4429.Surface_UVCoord1;
l9_4425=l9_4432;
l9_4430=l9_4425;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4433=float2(0.0);
l9_4433=l9_4429.gScreenCoord;
l9_4426=l9_4433;
l9_4430=l9_4426;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4434=float2(0.0);
float2 l9_4435=float2(0.0);
float2 l9_4436=float2(0.0);
ssGlobals l9_4437=l9_4429;
float2 l9_4438;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4439=float2(0.0);
float2 l9_4440=float2(0.0);
float2 l9_4441=float2(0.0);
ssGlobals l9_4442=l9_4437;
float2 l9_4443;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4444=float2(0.0);
float2 l9_4445=float2(0.0);
float2 l9_4446=float2(0.0);
float2 l9_4447=float2(0.0);
float2 l9_4448=float2(0.0);
ssGlobals l9_4449=l9_4442;
float2 l9_4450;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4451=float2(0.0);
l9_4451=l9_4449.Surface_UVCoord0;
l9_4445=l9_4451;
l9_4450=l9_4445;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4452=float2(0.0);
l9_4452=l9_4449.Surface_UVCoord1;
l9_4446=l9_4452;
l9_4450=l9_4446;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4453=float2(0.0);
l9_4453=l9_4449.gScreenCoord;
l9_4447=l9_4453;
l9_4450=l9_4447;
}
else
{
float2 l9_4454=float2(0.0);
l9_4454=l9_4449.Surface_UVCoord0;
l9_4448=l9_4454;
l9_4450=l9_4448;
}
}
}
l9_4444=l9_4450;
float2 l9_4455=float2(0.0);
float2 l9_4456=(*sc_set0.UserUniforms).uv2Scale;
l9_4455=l9_4456;
float2 l9_4457=float2(0.0);
l9_4457=l9_4455;
float2 l9_4458=float2(0.0);
float2 l9_4459=(*sc_set0.UserUniforms).uv2Offset;
l9_4458=l9_4459;
float2 l9_4460=float2(0.0);
l9_4460=l9_4458;
float2 l9_4461=float2(0.0);
l9_4461=(l9_4444*l9_4457)+l9_4460;
float2 l9_4462=float2(0.0);
l9_4462=l9_4461+(l9_4460*(l9_4442.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4440=l9_4462;
l9_4443=l9_4440;
}
else
{
float2 l9_4463=float2(0.0);
float2 l9_4464=float2(0.0);
float2 l9_4465=float2(0.0);
float2 l9_4466=float2(0.0);
float2 l9_4467=float2(0.0);
ssGlobals l9_4468=l9_4442;
float2 l9_4469;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4470=float2(0.0);
l9_4470=l9_4468.Surface_UVCoord0;
l9_4464=l9_4470;
l9_4469=l9_4464;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4471=float2(0.0);
l9_4471=l9_4468.Surface_UVCoord1;
l9_4465=l9_4471;
l9_4469=l9_4465;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4472=float2(0.0);
l9_4472=l9_4468.gScreenCoord;
l9_4466=l9_4472;
l9_4469=l9_4466;
}
else
{
float2 l9_4473=float2(0.0);
l9_4473=l9_4468.Surface_UVCoord0;
l9_4467=l9_4473;
l9_4469=l9_4467;
}
}
}
l9_4463=l9_4469;
float2 l9_4474=float2(0.0);
float2 l9_4475=(*sc_set0.UserUniforms).uv2Scale;
l9_4474=l9_4475;
float2 l9_4476=float2(0.0);
l9_4476=l9_4474;
float2 l9_4477=float2(0.0);
float2 l9_4478=(*sc_set0.UserUniforms).uv2Offset;
l9_4477=l9_4478;
float2 l9_4479=float2(0.0);
l9_4479=l9_4477;
float2 l9_4480=float2(0.0);
l9_4480=(l9_4463*l9_4476)+l9_4479;
l9_4441=l9_4480;
l9_4443=l9_4441;
}
l9_4439=l9_4443;
l9_4435=l9_4439;
l9_4438=l9_4435;
}
else
{
float2 l9_4481=float2(0.0);
l9_4481=l9_4437.Surface_UVCoord0;
l9_4436=l9_4481;
l9_4438=l9_4436;
}
l9_4434=l9_4438;
float2 l9_4482=float2(0.0);
l9_4482=l9_4434;
float2 l9_4483=float2(0.0);
l9_4483=l9_4482;
l9_4427=l9_4483;
l9_4430=l9_4427;
}
else
{
float2 l9_4484=float2(0.0);
l9_4484=l9_4429.Surface_UVCoord0;
l9_4428=l9_4484;
l9_4430=l9_4428;
}
}
}
}
l9_4423=l9_4430;
float2 l9_4485=float2(0.0);
float2 l9_4486=(*sc_set0.UserUniforms).uv3Scale;
l9_4485=l9_4486;
float2 l9_4487=float2(0.0);
l9_4487=l9_4485;
float2 l9_4488=float2(0.0);
float2 l9_4489=(*sc_set0.UserUniforms).uv3Offset;
l9_4488=l9_4489;
float2 l9_4490=float2(0.0);
l9_4490=l9_4488;
float2 l9_4491=float2(0.0);
l9_4491=(l9_4423*l9_4487)+l9_4490;
float2 l9_4492=float2(0.0);
l9_4492=l9_4491+(l9_4490*(l9_4421.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4419=l9_4492;
l9_4422=l9_4419;
}
else
{
float2 l9_4493=float2(0.0);
float2 l9_4494=float2(0.0);
float2 l9_4495=float2(0.0);
float2 l9_4496=float2(0.0);
float2 l9_4497=float2(0.0);
float2 l9_4498=float2(0.0);
ssGlobals l9_4499=l9_4421;
float2 l9_4500;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4501=float2(0.0);
l9_4501=l9_4499.Surface_UVCoord0;
l9_4494=l9_4501;
l9_4500=l9_4494;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4502=float2(0.0);
l9_4502=l9_4499.Surface_UVCoord1;
l9_4495=l9_4502;
l9_4500=l9_4495;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4503=float2(0.0);
l9_4503=l9_4499.gScreenCoord;
l9_4496=l9_4503;
l9_4500=l9_4496;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4504=float2(0.0);
float2 l9_4505=float2(0.0);
float2 l9_4506=float2(0.0);
ssGlobals l9_4507=l9_4499;
float2 l9_4508;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4509=float2(0.0);
float2 l9_4510=float2(0.0);
float2 l9_4511=float2(0.0);
ssGlobals l9_4512=l9_4507;
float2 l9_4513;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4514=float2(0.0);
float2 l9_4515=float2(0.0);
float2 l9_4516=float2(0.0);
float2 l9_4517=float2(0.0);
float2 l9_4518=float2(0.0);
ssGlobals l9_4519=l9_4512;
float2 l9_4520;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4521=float2(0.0);
l9_4521=l9_4519.Surface_UVCoord0;
l9_4515=l9_4521;
l9_4520=l9_4515;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4522=float2(0.0);
l9_4522=l9_4519.Surface_UVCoord1;
l9_4516=l9_4522;
l9_4520=l9_4516;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4523=float2(0.0);
l9_4523=l9_4519.gScreenCoord;
l9_4517=l9_4523;
l9_4520=l9_4517;
}
else
{
float2 l9_4524=float2(0.0);
l9_4524=l9_4519.Surface_UVCoord0;
l9_4518=l9_4524;
l9_4520=l9_4518;
}
}
}
l9_4514=l9_4520;
float2 l9_4525=float2(0.0);
float2 l9_4526=(*sc_set0.UserUniforms).uv2Scale;
l9_4525=l9_4526;
float2 l9_4527=float2(0.0);
l9_4527=l9_4525;
float2 l9_4528=float2(0.0);
float2 l9_4529=(*sc_set0.UserUniforms).uv2Offset;
l9_4528=l9_4529;
float2 l9_4530=float2(0.0);
l9_4530=l9_4528;
float2 l9_4531=float2(0.0);
l9_4531=(l9_4514*l9_4527)+l9_4530;
float2 l9_4532=float2(0.0);
l9_4532=l9_4531+(l9_4530*(l9_4512.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4510=l9_4532;
l9_4513=l9_4510;
}
else
{
float2 l9_4533=float2(0.0);
float2 l9_4534=float2(0.0);
float2 l9_4535=float2(0.0);
float2 l9_4536=float2(0.0);
float2 l9_4537=float2(0.0);
ssGlobals l9_4538=l9_4512;
float2 l9_4539;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4540=float2(0.0);
l9_4540=l9_4538.Surface_UVCoord0;
l9_4534=l9_4540;
l9_4539=l9_4534;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4541=float2(0.0);
l9_4541=l9_4538.Surface_UVCoord1;
l9_4535=l9_4541;
l9_4539=l9_4535;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4542=float2(0.0);
l9_4542=l9_4538.gScreenCoord;
l9_4536=l9_4542;
l9_4539=l9_4536;
}
else
{
float2 l9_4543=float2(0.0);
l9_4543=l9_4538.Surface_UVCoord0;
l9_4537=l9_4543;
l9_4539=l9_4537;
}
}
}
l9_4533=l9_4539;
float2 l9_4544=float2(0.0);
float2 l9_4545=(*sc_set0.UserUniforms).uv2Scale;
l9_4544=l9_4545;
float2 l9_4546=float2(0.0);
l9_4546=l9_4544;
float2 l9_4547=float2(0.0);
float2 l9_4548=(*sc_set0.UserUniforms).uv2Offset;
l9_4547=l9_4548;
float2 l9_4549=float2(0.0);
l9_4549=l9_4547;
float2 l9_4550=float2(0.0);
l9_4550=(l9_4533*l9_4546)+l9_4549;
l9_4511=l9_4550;
l9_4513=l9_4511;
}
l9_4509=l9_4513;
l9_4505=l9_4509;
l9_4508=l9_4505;
}
else
{
float2 l9_4551=float2(0.0);
l9_4551=l9_4507.Surface_UVCoord0;
l9_4506=l9_4551;
l9_4508=l9_4506;
}
l9_4504=l9_4508;
float2 l9_4552=float2(0.0);
l9_4552=l9_4504;
float2 l9_4553=float2(0.0);
l9_4553=l9_4552;
l9_4497=l9_4553;
l9_4500=l9_4497;
}
else
{
float2 l9_4554=float2(0.0);
l9_4554=l9_4499.Surface_UVCoord0;
l9_4498=l9_4554;
l9_4500=l9_4498;
}
}
}
}
l9_4493=l9_4500;
float2 l9_4555=float2(0.0);
float2 l9_4556=(*sc_set0.UserUniforms).uv3Scale;
l9_4555=l9_4556;
float2 l9_4557=float2(0.0);
l9_4557=l9_4555;
float2 l9_4558=float2(0.0);
float2 l9_4559=(*sc_set0.UserUniforms).uv3Offset;
l9_4558=l9_4559;
float2 l9_4560=float2(0.0);
l9_4560=l9_4558;
float2 l9_4561=float2(0.0);
l9_4561=(l9_4493*l9_4557)+l9_4560;
l9_4420=l9_4561;
l9_4422=l9_4420;
}
l9_4418=l9_4422;
l9_4414=l9_4418;
l9_4417=l9_4414;
}
else
{
float2 l9_4562=float2(0.0);
l9_4562=l9_4416.Surface_UVCoord0;
l9_4415=l9_4562;
l9_4417=l9_4415;
}
l9_4413=l9_4417;
float2 l9_4563=float2(0.0);
l9_4563=l9_4413;
float2 l9_4564=float2(0.0);
l9_4564=l9_4563;
l9_4357=l9_4564;
l9_4360=l9_4357;
}
else
{
float2 l9_4565=float2(0.0);
l9_4565=l9_4359.Surface_UVCoord0;
l9_4358=l9_4565;
l9_4360=l9_4358;
}
}
}
}
l9_4353=l9_4360;
float4 l9_4566=float4(0.0);
int l9_4567=0;
if ((int(rimColorTexHasSwappedViews_tmp)!=0))
{
int l9_4568=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4568=0;
}
else
{
l9_4568=in.varStereoViewID;
}
int l9_4569=l9_4568;
l9_4567=1-l9_4569;
}
else
{
int l9_4570=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4570=0;
}
else
{
l9_4570=in.varStereoViewID;
}
int l9_4571=l9_4570;
l9_4567=l9_4571;
}
int l9_4572=l9_4567;
int l9_4573=rimColorTexLayout_tmp;
int l9_4574=l9_4572;
float2 l9_4575=l9_4353;
bool l9_4576=(int(SC_USE_UV_TRANSFORM_rimColorTex_tmp)!=0);
float3x3 l9_4577=(*sc_set0.UserUniforms).rimColorTexTransform;
int2 l9_4578=int2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp,SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp);
bool l9_4579=(int(SC_USE_UV_MIN_MAX_rimColorTex_tmp)!=0);
float4 l9_4580=(*sc_set0.UserUniforms).rimColorTexUvMinMax;
bool l9_4581=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp)!=0);
float4 l9_4582=(*sc_set0.UserUniforms).rimColorTexBorderColor;
float l9_4583=0.0;
bool l9_4584=l9_4581&&(!l9_4579);
float l9_4585=1.0;
float l9_4586=l9_4575.x;
int l9_4587=l9_4578.x;
if (l9_4587==1)
{
l9_4586=fract(l9_4586);
}
else
{
if (l9_4587==2)
{
float l9_4588=fract(l9_4586);
float l9_4589=l9_4586-l9_4588;
float l9_4590=step(0.25,fract(l9_4589*0.5));
l9_4586=mix(l9_4588,1.0-l9_4588,fast::clamp(l9_4590,0.0,1.0));
}
}
l9_4575.x=l9_4586;
float l9_4591=l9_4575.y;
int l9_4592=l9_4578.y;
if (l9_4592==1)
{
l9_4591=fract(l9_4591);
}
else
{
if (l9_4592==2)
{
float l9_4593=fract(l9_4591);
float l9_4594=l9_4591-l9_4593;
float l9_4595=step(0.25,fract(l9_4594*0.5));
l9_4591=mix(l9_4593,1.0-l9_4593,fast::clamp(l9_4595,0.0,1.0));
}
}
l9_4575.y=l9_4591;
if (l9_4579)
{
bool l9_4596=l9_4581;
bool l9_4597;
if (l9_4596)
{
l9_4597=l9_4578.x==3;
}
else
{
l9_4597=l9_4596;
}
float l9_4598=l9_4575.x;
float l9_4599=l9_4580.x;
float l9_4600=l9_4580.z;
bool l9_4601=l9_4597;
float l9_4602=l9_4585;
float l9_4603=fast::clamp(l9_4598,l9_4599,l9_4600);
float l9_4604=step(abs(l9_4598-l9_4603),9.9999997e-06);
l9_4602*=(l9_4604+((1.0-float(l9_4601))*(1.0-l9_4604)));
l9_4598=l9_4603;
l9_4575.x=l9_4598;
l9_4585=l9_4602;
bool l9_4605=l9_4581;
bool l9_4606;
if (l9_4605)
{
l9_4606=l9_4578.y==3;
}
else
{
l9_4606=l9_4605;
}
float l9_4607=l9_4575.y;
float l9_4608=l9_4580.y;
float l9_4609=l9_4580.w;
bool l9_4610=l9_4606;
float l9_4611=l9_4585;
float l9_4612=fast::clamp(l9_4607,l9_4608,l9_4609);
float l9_4613=step(abs(l9_4607-l9_4612),9.9999997e-06);
l9_4611*=(l9_4613+((1.0-float(l9_4610))*(1.0-l9_4613)));
l9_4607=l9_4612;
l9_4575.y=l9_4607;
l9_4585=l9_4611;
}
float2 l9_4614=l9_4575;
bool l9_4615=l9_4576;
float3x3 l9_4616=l9_4577;
if (l9_4615)
{
l9_4614=float2((l9_4616*float3(l9_4614,1.0)).xy);
}
float2 l9_4617=l9_4614;
float2 l9_4618=l9_4617;
float2 l9_4619=l9_4618;
l9_4575=l9_4619;
float l9_4620=l9_4575.x;
int l9_4621=l9_4578.x;
bool l9_4622=l9_4584;
float l9_4623=l9_4585;
if ((l9_4621==0)||(l9_4621==3))
{
float l9_4624=l9_4620;
float l9_4625=0.0;
float l9_4626=1.0;
bool l9_4627=l9_4622;
float l9_4628=l9_4623;
float l9_4629=fast::clamp(l9_4624,l9_4625,l9_4626);
float l9_4630=step(abs(l9_4624-l9_4629),9.9999997e-06);
l9_4628*=(l9_4630+((1.0-float(l9_4627))*(1.0-l9_4630)));
l9_4624=l9_4629;
l9_4620=l9_4624;
l9_4623=l9_4628;
}
l9_4575.x=l9_4620;
l9_4585=l9_4623;
float l9_4631=l9_4575.y;
int l9_4632=l9_4578.y;
bool l9_4633=l9_4584;
float l9_4634=l9_4585;
if ((l9_4632==0)||(l9_4632==3))
{
float l9_4635=l9_4631;
float l9_4636=0.0;
float l9_4637=1.0;
bool l9_4638=l9_4633;
float l9_4639=l9_4634;
float l9_4640=fast::clamp(l9_4635,l9_4636,l9_4637);
float l9_4641=step(abs(l9_4635-l9_4640),9.9999997e-06);
l9_4639*=(l9_4641+((1.0-float(l9_4638))*(1.0-l9_4641)));
l9_4635=l9_4640;
l9_4631=l9_4635;
l9_4634=l9_4639;
}
l9_4575.y=l9_4631;
l9_4585=l9_4634;
float2 l9_4642=l9_4575;
int l9_4643=l9_4573;
int l9_4644=l9_4574;
float l9_4645=l9_4583;
float2 l9_4646=l9_4642;
int l9_4647=l9_4643;
int l9_4648=l9_4644;
float3 l9_4649=float3(0.0);
if (l9_4647==0)
{
l9_4649=float3(l9_4646,0.0);
}
else
{
if (l9_4647==1)
{
l9_4649=float3(l9_4646.x,(l9_4646.y*0.5)+(0.5-(float(l9_4648)*0.5)),0.0);
}
else
{
l9_4649=float3(l9_4646,float(l9_4648));
}
}
float3 l9_4650=l9_4649;
float3 l9_4651=l9_4650;
float2 l9_4652=l9_4651.xy;
float l9_4653=l9_4645;
float4 l9_4654=sc_set0.rimColorTex.sample(sc_set0.rimColorTexSmpSC,l9_4652,bias(l9_4653));
float4 l9_4655=l9_4654;
float4 l9_4656=l9_4655;
if (l9_4581)
{
l9_4656=mix(l9_4582,l9_4656,float4(l9_4585));
}
float4 l9_4657=l9_4656;
l9_4566=l9_4657;
l9_4349=l9_4566.xyz;
l9_4352=l9_4349;
}
else
{
l9_4352=l9_4350;
}
l9_4348=l9_4352;
float3 l9_4658=float3(0.0);
l9_4658=(l9_4344*float3(l9_4347))*l9_4348;
float3 l9_4659=float3(0.0);
float3 l9_4660=l9_4658;
float3 l9_4661;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4661=float3(pow(l9_4660.x,2.2),pow(l9_4660.y,2.2),pow(l9_4660.z,2.2));
}
else
{
l9_4661=l9_4660*l9_4660;
}
float3 l9_4662=l9_4661;
l9_4659=l9_4662;
float l9_4663=0.0;
float l9_4664=0.0;
float l9_4665=0.0;
ssGlobals l9_4666=param_32;
float l9_4667;
if ((int(ENABLE_RIM_INVERT_tmp)!=0))
{
float3 l9_4668=float3(0.0);
float3 l9_4669=float3(0.0);
float3 l9_4670=float3(0.0);
ssGlobals l9_4671=l9_4666;
float3 l9_4672;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_4673=float3(0.0);
l9_4673=l9_4671.VertexTangent_WorldSpace;
float3 l9_4674=float3(0.0);
l9_4674=l9_4671.VertexBinormal_WorldSpace;
float3 l9_4675=float3(0.0);
l9_4675=l9_4671.VertexNormal_WorldSpace;
float3x3 l9_4676=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_4676=float3x3(float3(l9_4673),float3(l9_4674),float3(l9_4675));
float2 l9_4677=float2(0.0);
float2 l9_4678=float2(0.0);
float2 l9_4679=float2(0.0);
float2 l9_4680=float2(0.0);
float2 l9_4681=float2(0.0);
float2 l9_4682=float2(0.0);
ssGlobals l9_4683=l9_4671;
float2 l9_4684;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_4685=float2(0.0);
l9_4685=l9_4683.Surface_UVCoord0;
l9_4678=l9_4685;
l9_4684=l9_4678;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_4686=float2(0.0);
l9_4686=l9_4683.Surface_UVCoord1;
l9_4679=l9_4686;
l9_4684=l9_4679;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_4687=float2(0.0);
float2 l9_4688=float2(0.0);
float2 l9_4689=float2(0.0);
ssGlobals l9_4690=l9_4683;
float2 l9_4691;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4692=float2(0.0);
float2 l9_4693=float2(0.0);
float2 l9_4694=float2(0.0);
ssGlobals l9_4695=l9_4690;
float2 l9_4696;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4697=float2(0.0);
float2 l9_4698=float2(0.0);
float2 l9_4699=float2(0.0);
float2 l9_4700=float2(0.0);
float2 l9_4701=float2(0.0);
ssGlobals l9_4702=l9_4695;
float2 l9_4703;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4704=float2(0.0);
l9_4704=l9_4702.Surface_UVCoord0;
l9_4698=l9_4704;
l9_4703=l9_4698;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4705=float2(0.0);
l9_4705=l9_4702.Surface_UVCoord1;
l9_4699=l9_4705;
l9_4703=l9_4699;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4706=float2(0.0);
l9_4706=l9_4702.gScreenCoord;
l9_4700=l9_4706;
l9_4703=l9_4700;
}
else
{
float2 l9_4707=float2(0.0);
l9_4707=l9_4702.Surface_UVCoord0;
l9_4701=l9_4707;
l9_4703=l9_4701;
}
}
}
l9_4697=l9_4703;
float2 l9_4708=float2(0.0);
float2 l9_4709=(*sc_set0.UserUniforms).uv2Scale;
l9_4708=l9_4709;
float2 l9_4710=float2(0.0);
l9_4710=l9_4708;
float2 l9_4711=float2(0.0);
float2 l9_4712=(*sc_set0.UserUniforms).uv2Offset;
l9_4711=l9_4712;
float2 l9_4713=float2(0.0);
l9_4713=l9_4711;
float2 l9_4714=float2(0.0);
l9_4714=(l9_4697*l9_4710)+l9_4713;
float2 l9_4715=float2(0.0);
l9_4715=l9_4714+(l9_4713*(l9_4695.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4693=l9_4715;
l9_4696=l9_4693;
}
else
{
float2 l9_4716=float2(0.0);
float2 l9_4717=float2(0.0);
float2 l9_4718=float2(0.0);
float2 l9_4719=float2(0.0);
float2 l9_4720=float2(0.0);
ssGlobals l9_4721=l9_4695;
float2 l9_4722;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4723=float2(0.0);
l9_4723=l9_4721.Surface_UVCoord0;
l9_4717=l9_4723;
l9_4722=l9_4717;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4724=float2(0.0);
l9_4724=l9_4721.Surface_UVCoord1;
l9_4718=l9_4724;
l9_4722=l9_4718;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4725=float2(0.0);
l9_4725=l9_4721.gScreenCoord;
l9_4719=l9_4725;
l9_4722=l9_4719;
}
else
{
float2 l9_4726=float2(0.0);
l9_4726=l9_4721.Surface_UVCoord0;
l9_4720=l9_4726;
l9_4722=l9_4720;
}
}
}
l9_4716=l9_4722;
float2 l9_4727=float2(0.0);
float2 l9_4728=(*sc_set0.UserUniforms).uv2Scale;
l9_4727=l9_4728;
float2 l9_4729=float2(0.0);
l9_4729=l9_4727;
float2 l9_4730=float2(0.0);
float2 l9_4731=(*sc_set0.UserUniforms).uv2Offset;
l9_4730=l9_4731;
float2 l9_4732=float2(0.0);
l9_4732=l9_4730;
float2 l9_4733=float2(0.0);
l9_4733=(l9_4716*l9_4729)+l9_4732;
l9_4694=l9_4733;
l9_4696=l9_4694;
}
l9_4692=l9_4696;
l9_4688=l9_4692;
l9_4691=l9_4688;
}
else
{
float2 l9_4734=float2(0.0);
l9_4734=l9_4690.Surface_UVCoord0;
l9_4689=l9_4734;
l9_4691=l9_4689;
}
l9_4687=l9_4691;
float2 l9_4735=float2(0.0);
l9_4735=l9_4687;
float2 l9_4736=float2(0.0);
l9_4736=l9_4735;
l9_4680=l9_4736;
l9_4684=l9_4680;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_4737=float2(0.0);
float2 l9_4738=float2(0.0);
float2 l9_4739=float2(0.0);
ssGlobals l9_4740=l9_4683;
float2 l9_4741;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_4742=float2(0.0);
float2 l9_4743=float2(0.0);
float2 l9_4744=float2(0.0);
ssGlobals l9_4745=l9_4740;
float2 l9_4746;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_4747=float2(0.0);
float2 l9_4748=float2(0.0);
float2 l9_4749=float2(0.0);
float2 l9_4750=float2(0.0);
float2 l9_4751=float2(0.0);
float2 l9_4752=float2(0.0);
ssGlobals l9_4753=l9_4745;
float2 l9_4754;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4755=float2(0.0);
l9_4755=l9_4753.Surface_UVCoord0;
l9_4748=l9_4755;
l9_4754=l9_4748;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4756=float2(0.0);
l9_4756=l9_4753.Surface_UVCoord1;
l9_4749=l9_4756;
l9_4754=l9_4749;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4757=float2(0.0);
l9_4757=l9_4753.gScreenCoord;
l9_4750=l9_4757;
l9_4754=l9_4750;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4758=float2(0.0);
float2 l9_4759=float2(0.0);
float2 l9_4760=float2(0.0);
ssGlobals l9_4761=l9_4753;
float2 l9_4762;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4763=float2(0.0);
float2 l9_4764=float2(0.0);
float2 l9_4765=float2(0.0);
ssGlobals l9_4766=l9_4761;
float2 l9_4767;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4768=float2(0.0);
float2 l9_4769=float2(0.0);
float2 l9_4770=float2(0.0);
float2 l9_4771=float2(0.0);
float2 l9_4772=float2(0.0);
ssGlobals l9_4773=l9_4766;
float2 l9_4774;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4775=float2(0.0);
l9_4775=l9_4773.Surface_UVCoord0;
l9_4769=l9_4775;
l9_4774=l9_4769;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4776=float2(0.0);
l9_4776=l9_4773.Surface_UVCoord1;
l9_4770=l9_4776;
l9_4774=l9_4770;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4777=float2(0.0);
l9_4777=l9_4773.gScreenCoord;
l9_4771=l9_4777;
l9_4774=l9_4771;
}
else
{
float2 l9_4778=float2(0.0);
l9_4778=l9_4773.Surface_UVCoord0;
l9_4772=l9_4778;
l9_4774=l9_4772;
}
}
}
l9_4768=l9_4774;
float2 l9_4779=float2(0.0);
float2 l9_4780=(*sc_set0.UserUniforms).uv2Scale;
l9_4779=l9_4780;
float2 l9_4781=float2(0.0);
l9_4781=l9_4779;
float2 l9_4782=float2(0.0);
float2 l9_4783=(*sc_set0.UserUniforms).uv2Offset;
l9_4782=l9_4783;
float2 l9_4784=float2(0.0);
l9_4784=l9_4782;
float2 l9_4785=float2(0.0);
l9_4785=(l9_4768*l9_4781)+l9_4784;
float2 l9_4786=float2(0.0);
l9_4786=l9_4785+(l9_4784*(l9_4766.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4764=l9_4786;
l9_4767=l9_4764;
}
else
{
float2 l9_4787=float2(0.0);
float2 l9_4788=float2(0.0);
float2 l9_4789=float2(0.0);
float2 l9_4790=float2(0.0);
float2 l9_4791=float2(0.0);
ssGlobals l9_4792=l9_4766;
float2 l9_4793;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4794=float2(0.0);
l9_4794=l9_4792.Surface_UVCoord0;
l9_4788=l9_4794;
l9_4793=l9_4788;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4795=float2(0.0);
l9_4795=l9_4792.Surface_UVCoord1;
l9_4789=l9_4795;
l9_4793=l9_4789;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4796=float2(0.0);
l9_4796=l9_4792.gScreenCoord;
l9_4790=l9_4796;
l9_4793=l9_4790;
}
else
{
float2 l9_4797=float2(0.0);
l9_4797=l9_4792.Surface_UVCoord0;
l9_4791=l9_4797;
l9_4793=l9_4791;
}
}
}
l9_4787=l9_4793;
float2 l9_4798=float2(0.0);
float2 l9_4799=(*sc_set0.UserUniforms).uv2Scale;
l9_4798=l9_4799;
float2 l9_4800=float2(0.0);
l9_4800=l9_4798;
float2 l9_4801=float2(0.0);
float2 l9_4802=(*sc_set0.UserUniforms).uv2Offset;
l9_4801=l9_4802;
float2 l9_4803=float2(0.0);
l9_4803=l9_4801;
float2 l9_4804=float2(0.0);
l9_4804=(l9_4787*l9_4800)+l9_4803;
l9_4765=l9_4804;
l9_4767=l9_4765;
}
l9_4763=l9_4767;
l9_4759=l9_4763;
l9_4762=l9_4759;
}
else
{
float2 l9_4805=float2(0.0);
l9_4805=l9_4761.Surface_UVCoord0;
l9_4760=l9_4805;
l9_4762=l9_4760;
}
l9_4758=l9_4762;
float2 l9_4806=float2(0.0);
l9_4806=l9_4758;
float2 l9_4807=float2(0.0);
l9_4807=l9_4806;
l9_4751=l9_4807;
l9_4754=l9_4751;
}
else
{
float2 l9_4808=float2(0.0);
l9_4808=l9_4753.Surface_UVCoord0;
l9_4752=l9_4808;
l9_4754=l9_4752;
}
}
}
}
l9_4747=l9_4754;
float2 l9_4809=float2(0.0);
float2 l9_4810=(*sc_set0.UserUniforms).uv3Scale;
l9_4809=l9_4810;
float2 l9_4811=float2(0.0);
l9_4811=l9_4809;
float2 l9_4812=float2(0.0);
float2 l9_4813=(*sc_set0.UserUniforms).uv3Offset;
l9_4812=l9_4813;
float2 l9_4814=float2(0.0);
l9_4814=l9_4812;
float2 l9_4815=float2(0.0);
l9_4815=(l9_4747*l9_4811)+l9_4814;
float2 l9_4816=float2(0.0);
l9_4816=l9_4815+(l9_4814*(l9_4745.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4743=l9_4816;
l9_4746=l9_4743;
}
else
{
float2 l9_4817=float2(0.0);
float2 l9_4818=float2(0.0);
float2 l9_4819=float2(0.0);
float2 l9_4820=float2(0.0);
float2 l9_4821=float2(0.0);
float2 l9_4822=float2(0.0);
ssGlobals l9_4823=l9_4745;
float2 l9_4824;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4825=float2(0.0);
l9_4825=l9_4823.Surface_UVCoord0;
l9_4818=l9_4825;
l9_4824=l9_4818;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4826=float2(0.0);
l9_4826=l9_4823.Surface_UVCoord1;
l9_4819=l9_4826;
l9_4824=l9_4819;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4827=float2(0.0);
l9_4827=l9_4823.gScreenCoord;
l9_4820=l9_4827;
l9_4824=l9_4820;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4828=float2(0.0);
float2 l9_4829=float2(0.0);
float2 l9_4830=float2(0.0);
ssGlobals l9_4831=l9_4823;
float2 l9_4832;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_4833=float2(0.0);
float2 l9_4834=float2(0.0);
float2 l9_4835=float2(0.0);
ssGlobals l9_4836=l9_4831;
float2 l9_4837;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_4838=float2(0.0);
float2 l9_4839=float2(0.0);
float2 l9_4840=float2(0.0);
float2 l9_4841=float2(0.0);
float2 l9_4842=float2(0.0);
ssGlobals l9_4843=l9_4836;
float2 l9_4844;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4845=float2(0.0);
l9_4845=l9_4843.Surface_UVCoord0;
l9_4839=l9_4845;
l9_4844=l9_4839;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4846=float2(0.0);
l9_4846=l9_4843.Surface_UVCoord1;
l9_4840=l9_4846;
l9_4844=l9_4840;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4847=float2(0.0);
l9_4847=l9_4843.gScreenCoord;
l9_4841=l9_4847;
l9_4844=l9_4841;
}
else
{
float2 l9_4848=float2(0.0);
l9_4848=l9_4843.Surface_UVCoord0;
l9_4842=l9_4848;
l9_4844=l9_4842;
}
}
}
l9_4838=l9_4844;
float2 l9_4849=float2(0.0);
float2 l9_4850=(*sc_set0.UserUniforms).uv2Scale;
l9_4849=l9_4850;
float2 l9_4851=float2(0.0);
l9_4851=l9_4849;
float2 l9_4852=float2(0.0);
float2 l9_4853=(*sc_set0.UserUniforms).uv2Offset;
l9_4852=l9_4853;
float2 l9_4854=float2(0.0);
l9_4854=l9_4852;
float2 l9_4855=float2(0.0);
l9_4855=(l9_4838*l9_4851)+l9_4854;
float2 l9_4856=float2(0.0);
l9_4856=l9_4855+(l9_4854*(l9_4836.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4834=l9_4856;
l9_4837=l9_4834;
}
else
{
float2 l9_4857=float2(0.0);
float2 l9_4858=float2(0.0);
float2 l9_4859=float2(0.0);
float2 l9_4860=float2(0.0);
float2 l9_4861=float2(0.0);
ssGlobals l9_4862=l9_4836;
float2 l9_4863;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4864=float2(0.0);
l9_4864=l9_4862.Surface_UVCoord0;
l9_4858=l9_4864;
l9_4863=l9_4858;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4865=float2(0.0);
l9_4865=l9_4862.Surface_UVCoord1;
l9_4859=l9_4865;
l9_4863=l9_4859;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4866=float2(0.0);
l9_4866=l9_4862.gScreenCoord;
l9_4860=l9_4866;
l9_4863=l9_4860;
}
else
{
float2 l9_4867=float2(0.0);
l9_4867=l9_4862.Surface_UVCoord0;
l9_4861=l9_4867;
l9_4863=l9_4861;
}
}
}
l9_4857=l9_4863;
float2 l9_4868=float2(0.0);
float2 l9_4869=(*sc_set0.UserUniforms).uv2Scale;
l9_4868=l9_4869;
float2 l9_4870=float2(0.0);
l9_4870=l9_4868;
float2 l9_4871=float2(0.0);
float2 l9_4872=(*sc_set0.UserUniforms).uv2Offset;
l9_4871=l9_4872;
float2 l9_4873=float2(0.0);
l9_4873=l9_4871;
float2 l9_4874=float2(0.0);
l9_4874=(l9_4857*l9_4870)+l9_4873;
l9_4835=l9_4874;
l9_4837=l9_4835;
}
l9_4833=l9_4837;
l9_4829=l9_4833;
l9_4832=l9_4829;
}
else
{
float2 l9_4875=float2(0.0);
l9_4875=l9_4831.Surface_UVCoord0;
l9_4830=l9_4875;
l9_4832=l9_4830;
}
l9_4828=l9_4832;
float2 l9_4876=float2(0.0);
l9_4876=l9_4828;
float2 l9_4877=float2(0.0);
l9_4877=l9_4876;
l9_4821=l9_4877;
l9_4824=l9_4821;
}
else
{
float2 l9_4878=float2(0.0);
l9_4878=l9_4823.Surface_UVCoord0;
l9_4822=l9_4878;
l9_4824=l9_4822;
}
}
}
}
l9_4817=l9_4824;
float2 l9_4879=float2(0.0);
float2 l9_4880=(*sc_set0.UserUniforms).uv3Scale;
l9_4879=l9_4880;
float2 l9_4881=float2(0.0);
l9_4881=l9_4879;
float2 l9_4882=float2(0.0);
float2 l9_4883=(*sc_set0.UserUniforms).uv3Offset;
l9_4882=l9_4883;
float2 l9_4884=float2(0.0);
l9_4884=l9_4882;
float2 l9_4885=float2(0.0);
l9_4885=(l9_4817*l9_4881)+l9_4884;
l9_4744=l9_4885;
l9_4746=l9_4744;
}
l9_4742=l9_4746;
l9_4738=l9_4742;
l9_4741=l9_4738;
}
else
{
float2 l9_4886=float2(0.0);
l9_4886=l9_4740.Surface_UVCoord0;
l9_4739=l9_4886;
l9_4741=l9_4739;
}
l9_4737=l9_4741;
float2 l9_4887=float2(0.0);
l9_4887=l9_4737;
float2 l9_4888=float2(0.0);
l9_4888=l9_4887;
l9_4681=l9_4888;
l9_4684=l9_4681;
}
else
{
float2 l9_4889=float2(0.0);
l9_4889=l9_4683.Surface_UVCoord0;
l9_4682=l9_4889;
l9_4684=l9_4682;
}
}
}
}
l9_4677=l9_4684;
float4 l9_4890=float4(0.0);
float2 l9_4891=l9_4677;
int l9_4892=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_4893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4893=0;
}
else
{
l9_4893=in.varStereoViewID;
}
int l9_4894=l9_4893;
l9_4892=1-l9_4894;
}
else
{
int l9_4895=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4895=0;
}
else
{
l9_4895=in.varStereoViewID;
}
int l9_4896=l9_4895;
l9_4892=l9_4896;
}
int l9_4897=l9_4892;
int l9_4898=normalTexLayout_tmp;
int l9_4899=l9_4897;
float2 l9_4900=l9_4891;
bool l9_4901=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_4902=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_4903=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_4904=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_4905=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_4906=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_4907=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_4908=0.0;
bool l9_4909=l9_4906&&(!l9_4904);
float l9_4910=1.0;
float l9_4911=l9_4900.x;
int l9_4912=l9_4903.x;
if (l9_4912==1)
{
l9_4911=fract(l9_4911);
}
else
{
if (l9_4912==2)
{
float l9_4913=fract(l9_4911);
float l9_4914=l9_4911-l9_4913;
float l9_4915=step(0.25,fract(l9_4914*0.5));
l9_4911=mix(l9_4913,1.0-l9_4913,fast::clamp(l9_4915,0.0,1.0));
}
}
l9_4900.x=l9_4911;
float l9_4916=l9_4900.y;
int l9_4917=l9_4903.y;
if (l9_4917==1)
{
l9_4916=fract(l9_4916);
}
else
{
if (l9_4917==2)
{
float l9_4918=fract(l9_4916);
float l9_4919=l9_4916-l9_4918;
float l9_4920=step(0.25,fract(l9_4919*0.5));
l9_4916=mix(l9_4918,1.0-l9_4918,fast::clamp(l9_4920,0.0,1.0));
}
}
l9_4900.y=l9_4916;
if (l9_4904)
{
bool l9_4921=l9_4906;
bool l9_4922;
if (l9_4921)
{
l9_4922=l9_4903.x==3;
}
else
{
l9_4922=l9_4921;
}
float l9_4923=l9_4900.x;
float l9_4924=l9_4905.x;
float l9_4925=l9_4905.z;
bool l9_4926=l9_4922;
float l9_4927=l9_4910;
float l9_4928=fast::clamp(l9_4923,l9_4924,l9_4925);
float l9_4929=step(abs(l9_4923-l9_4928),9.9999997e-06);
l9_4927*=(l9_4929+((1.0-float(l9_4926))*(1.0-l9_4929)));
l9_4923=l9_4928;
l9_4900.x=l9_4923;
l9_4910=l9_4927;
bool l9_4930=l9_4906;
bool l9_4931;
if (l9_4930)
{
l9_4931=l9_4903.y==3;
}
else
{
l9_4931=l9_4930;
}
float l9_4932=l9_4900.y;
float l9_4933=l9_4905.y;
float l9_4934=l9_4905.w;
bool l9_4935=l9_4931;
float l9_4936=l9_4910;
float l9_4937=fast::clamp(l9_4932,l9_4933,l9_4934);
float l9_4938=step(abs(l9_4932-l9_4937),9.9999997e-06);
l9_4936*=(l9_4938+((1.0-float(l9_4935))*(1.0-l9_4938)));
l9_4932=l9_4937;
l9_4900.y=l9_4932;
l9_4910=l9_4936;
}
float2 l9_4939=l9_4900;
bool l9_4940=l9_4901;
float3x3 l9_4941=l9_4902;
if (l9_4940)
{
l9_4939=float2((l9_4941*float3(l9_4939,1.0)).xy);
}
float2 l9_4942=l9_4939;
float2 l9_4943=l9_4942;
float2 l9_4944=l9_4943;
l9_4900=l9_4944;
float l9_4945=l9_4900.x;
int l9_4946=l9_4903.x;
bool l9_4947=l9_4909;
float l9_4948=l9_4910;
if ((l9_4946==0)||(l9_4946==3))
{
float l9_4949=l9_4945;
float l9_4950=0.0;
float l9_4951=1.0;
bool l9_4952=l9_4947;
float l9_4953=l9_4948;
float l9_4954=fast::clamp(l9_4949,l9_4950,l9_4951);
float l9_4955=step(abs(l9_4949-l9_4954),9.9999997e-06);
l9_4953*=(l9_4955+((1.0-float(l9_4952))*(1.0-l9_4955)));
l9_4949=l9_4954;
l9_4945=l9_4949;
l9_4948=l9_4953;
}
l9_4900.x=l9_4945;
l9_4910=l9_4948;
float l9_4956=l9_4900.y;
int l9_4957=l9_4903.y;
bool l9_4958=l9_4909;
float l9_4959=l9_4910;
if ((l9_4957==0)||(l9_4957==3))
{
float l9_4960=l9_4956;
float l9_4961=0.0;
float l9_4962=1.0;
bool l9_4963=l9_4958;
float l9_4964=l9_4959;
float l9_4965=fast::clamp(l9_4960,l9_4961,l9_4962);
float l9_4966=step(abs(l9_4960-l9_4965),9.9999997e-06);
l9_4964*=(l9_4966+((1.0-float(l9_4963))*(1.0-l9_4966)));
l9_4960=l9_4965;
l9_4956=l9_4960;
l9_4959=l9_4964;
}
l9_4900.y=l9_4956;
l9_4910=l9_4959;
float2 l9_4967=l9_4900;
int l9_4968=l9_4898;
int l9_4969=l9_4899;
float l9_4970=l9_4908;
float2 l9_4971=l9_4967;
int l9_4972=l9_4968;
int l9_4973=l9_4969;
float3 l9_4974=float3(0.0);
if (l9_4972==0)
{
l9_4974=float3(l9_4971,0.0);
}
else
{
if (l9_4972==1)
{
l9_4974=float3(l9_4971.x,(l9_4971.y*0.5)+(0.5-(float(l9_4973)*0.5)),0.0);
}
else
{
l9_4974=float3(l9_4971,float(l9_4973));
}
}
float3 l9_4975=l9_4974;
float3 l9_4976=l9_4975;
float2 l9_4977=l9_4976.xy;
float l9_4978=l9_4970;
float4 l9_4979=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_4977,bias(l9_4978));
float4 l9_4980=l9_4979;
float4 l9_4981=l9_4980;
if (l9_4906)
{
l9_4981=mix(l9_4907,l9_4981,float4(l9_4910));
}
float4 l9_4982=l9_4981;
float4 l9_4983=l9_4982;
float3 l9_4984=(l9_4983.xyz*1.9921875)-float3(1.0);
l9_4983=float4(l9_4984.x,l9_4984.y,l9_4984.z,l9_4983.w);
l9_4890=l9_4983;
float3 l9_4985=float3(0.0);
float3 l9_4986=float3(0.0);
float3 l9_4987=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_4988=l9_4671;
float3 l9_4989;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_4990=float2(0.0);
float2 l9_4991=float2(0.0);
float2 l9_4992=float2(0.0);
float2 l9_4993=float2(0.0);
float2 l9_4994=float2(0.0);
float2 l9_4995=float2(0.0);
ssGlobals l9_4996=l9_4988;
float2 l9_4997;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_4998=float2(0.0);
l9_4998=l9_4996.Surface_UVCoord0;
l9_4991=l9_4998;
l9_4997=l9_4991;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_4999=float2(0.0);
l9_4999=l9_4996.Surface_UVCoord1;
l9_4992=l9_4999;
l9_4997=l9_4992;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_5000=float2(0.0);
float2 l9_5001=float2(0.0);
float2 l9_5002=float2(0.0);
ssGlobals l9_5003=l9_4996;
float2 l9_5004;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5005=float2(0.0);
float2 l9_5006=float2(0.0);
float2 l9_5007=float2(0.0);
ssGlobals l9_5008=l9_5003;
float2 l9_5009;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5010=float2(0.0);
float2 l9_5011=float2(0.0);
float2 l9_5012=float2(0.0);
float2 l9_5013=float2(0.0);
float2 l9_5014=float2(0.0);
ssGlobals l9_5015=l9_5008;
float2 l9_5016;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5017=float2(0.0);
l9_5017=l9_5015.Surface_UVCoord0;
l9_5011=l9_5017;
l9_5016=l9_5011;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5018=float2(0.0);
l9_5018=l9_5015.Surface_UVCoord1;
l9_5012=l9_5018;
l9_5016=l9_5012;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5019=float2(0.0);
l9_5019=l9_5015.gScreenCoord;
l9_5013=l9_5019;
l9_5016=l9_5013;
}
else
{
float2 l9_5020=float2(0.0);
l9_5020=l9_5015.Surface_UVCoord0;
l9_5014=l9_5020;
l9_5016=l9_5014;
}
}
}
l9_5010=l9_5016;
float2 l9_5021=float2(0.0);
float2 l9_5022=(*sc_set0.UserUniforms).uv2Scale;
l9_5021=l9_5022;
float2 l9_5023=float2(0.0);
l9_5023=l9_5021;
float2 l9_5024=float2(0.0);
float2 l9_5025=(*sc_set0.UserUniforms).uv2Offset;
l9_5024=l9_5025;
float2 l9_5026=float2(0.0);
l9_5026=l9_5024;
float2 l9_5027=float2(0.0);
l9_5027=(l9_5010*l9_5023)+l9_5026;
float2 l9_5028=float2(0.0);
l9_5028=l9_5027+(l9_5026*(l9_5008.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5006=l9_5028;
l9_5009=l9_5006;
}
else
{
float2 l9_5029=float2(0.0);
float2 l9_5030=float2(0.0);
float2 l9_5031=float2(0.0);
float2 l9_5032=float2(0.0);
float2 l9_5033=float2(0.0);
ssGlobals l9_5034=l9_5008;
float2 l9_5035;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5036=float2(0.0);
l9_5036=l9_5034.Surface_UVCoord0;
l9_5030=l9_5036;
l9_5035=l9_5030;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5037=float2(0.0);
l9_5037=l9_5034.Surface_UVCoord1;
l9_5031=l9_5037;
l9_5035=l9_5031;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5038=float2(0.0);
l9_5038=l9_5034.gScreenCoord;
l9_5032=l9_5038;
l9_5035=l9_5032;
}
else
{
float2 l9_5039=float2(0.0);
l9_5039=l9_5034.Surface_UVCoord0;
l9_5033=l9_5039;
l9_5035=l9_5033;
}
}
}
l9_5029=l9_5035;
float2 l9_5040=float2(0.0);
float2 l9_5041=(*sc_set0.UserUniforms).uv2Scale;
l9_5040=l9_5041;
float2 l9_5042=float2(0.0);
l9_5042=l9_5040;
float2 l9_5043=float2(0.0);
float2 l9_5044=(*sc_set0.UserUniforms).uv2Offset;
l9_5043=l9_5044;
float2 l9_5045=float2(0.0);
l9_5045=l9_5043;
float2 l9_5046=float2(0.0);
l9_5046=(l9_5029*l9_5042)+l9_5045;
l9_5007=l9_5046;
l9_5009=l9_5007;
}
l9_5005=l9_5009;
l9_5001=l9_5005;
l9_5004=l9_5001;
}
else
{
float2 l9_5047=float2(0.0);
l9_5047=l9_5003.Surface_UVCoord0;
l9_5002=l9_5047;
l9_5004=l9_5002;
}
l9_5000=l9_5004;
float2 l9_5048=float2(0.0);
l9_5048=l9_5000;
float2 l9_5049=float2(0.0);
l9_5049=l9_5048;
l9_4993=l9_5049;
l9_4997=l9_4993;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_5050=float2(0.0);
float2 l9_5051=float2(0.0);
float2 l9_5052=float2(0.0);
ssGlobals l9_5053=l9_4996;
float2 l9_5054;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_5055=float2(0.0);
float2 l9_5056=float2(0.0);
float2 l9_5057=float2(0.0);
ssGlobals l9_5058=l9_5053;
float2 l9_5059;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_5060=float2(0.0);
float2 l9_5061=float2(0.0);
float2 l9_5062=float2(0.0);
float2 l9_5063=float2(0.0);
float2 l9_5064=float2(0.0);
float2 l9_5065=float2(0.0);
ssGlobals l9_5066=l9_5058;
float2 l9_5067;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5068=float2(0.0);
l9_5068=l9_5066.Surface_UVCoord0;
l9_5061=l9_5068;
l9_5067=l9_5061;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5069=float2(0.0);
l9_5069=l9_5066.Surface_UVCoord1;
l9_5062=l9_5069;
l9_5067=l9_5062;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5070=float2(0.0);
l9_5070=l9_5066.gScreenCoord;
l9_5063=l9_5070;
l9_5067=l9_5063;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5071=float2(0.0);
float2 l9_5072=float2(0.0);
float2 l9_5073=float2(0.0);
ssGlobals l9_5074=l9_5066;
float2 l9_5075;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5076=float2(0.0);
float2 l9_5077=float2(0.0);
float2 l9_5078=float2(0.0);
ssGlobals l9_5079=l9_5074;
float2 l9_5080;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5081=float2(0.0);
float2 l9_5082=float2(0.0);
float2 l9_5083=float2(0.0);
float2 l9_5084=float2(0.0);
float2 l9_5085=float2(0.0);
ssGlobals l9_5086=l9_5079;
float2 l9_5087;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5088=float2(0.0);
l9_5088=l9_5086.Surface_UVCoord0;
l9_5082=l9_5088;
l9_5087=l9_5082;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5089=float2(0.0);
l9_5089=l9_5086.Surface_UVCoord1;
l9_5083=l9_5089;
l9_5087=l9_5083;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5090=float2(0.0);
l9_5090=l9_5086.gScreenCoord;
l9_5084=l9_5090;
l9_5087=l9_5084;
}
else
{
float2 l9_5091=float2(0.0);
l9_5091=l9_5086.Surface_UVCoord0;
l9_5085=l9_5091;
l9_5087=l9_5085;
}
}
}
l9_5081=l9_5087;
float2 l9_5092=float2(0.0);
float2 l9_5093=(*sc_set0.UserUniforms).uv2Scale;
l9_5092=l9_5093;
float2 l9_5094=float2(0.0);
l9_5094=l9_5092;
float2 l9_5095=float2(0.0);
float2 l9_5096=(*sc_set0.UserUniforms).uv2Offset;
l9_5095=l9_5096;
float2 l9_5097=float2(0.0);
l9_5097=l9_5095;
float2 l9_5098=float2(0.0);
l9_5098=(l9_5081*l9_5094)+l9_5097;
float2 l9_5099=float2(0.0);
l9_5099=l9_5098+(l9_5097*(l9_5079.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5077=l9_5099;
l9_5080=l9_5077;
}
else
{
float2 l9_5100=float2(0.0);
float2 l9_5101=float2(0.0);
float2 l9_5102=float2(0.0);
float2 l9_5103=float2(0.0);
float2 l9_5104=float2(0.0);
ssGlobals l9_5105=l9_5079;
float2 l9_5106;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5107=float2(0.0);
l9_5107=l9_5105.Surface_UVCoord0;
l9_5101=l9_5107;
l9_5106=l9_5101;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5108=float2(0.0);
l9_5108=l9_5105.Surface_UVCoord1;
l9_5102=l9_5108;
l9_5106=l9_5102;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5109=float2(0.0);
l9_5109=l9_5105.gScreenCoord;
l9_5103=l9_5109;
l9_5106=l9_5103;
}
else
{
float2 l9_5110=float2(0.0);
l9_5110=l9_5105.Surface_UVCoord0;
l9_5104=l9_5110;
l9_5106=l9_5104;
}
}
}
l9_5100=l9_5106;
float2 l9_5111=float2(0.0);
float2 l9_5112=(*sc_set0.UserUniforms).uv2Scale;
l9_5111=l9_5112;
float2 l9_5113=float2(0.0);
l9_5113=l9_5111;
float2 l9_5114=float2(0.0);
float2 l9_5115=(*sc_set0.UserUniforms).uv2Offset;
l9_5114=l9_5115;
float2 l9_5116=float2(0.0);
l9_5116=l9_5114;
float2 l9_5117=float2(0.0);
l9_5117=(l9_5100*l9_5113)+l9_5116;
l9_5078=l9_5117;
l9_5080=l9_5078;
}
l9_5076=l9_5080;
l9_5072=l9_5076;
l9_5075=l9_5072;
}
else
{
float2 l9_5118=float2(0.0);
l9_5118=l9_5074.Surface_UVCoord0;
l9_5073=l9_5118;
l9_5075=l9_5073;
}
l9_5071=l9_5075;
float2 l9_5119=float2(0.0);
l9_5119=l9_5071;
float2 l9_5120=float2(0.0);
l9_5120=l9_5119;
l9_5064=l9_5120;
l9_5067=l9_5064;
}
else
{
float2 l9_5121=float2(0.0);
l9_5121=l9_5066.Surface_UVCoord0;
l9_5065=l9_5121;
l9_5067=l9_5065;
}
}
}
}
l9_5060=l9_5067;
float2 l9_5122=float2(0.0);
float2 l9_5123=(*sc_set0.UserUniforms).uv3Scale;
l9_5122=l9_5123;
float2 l9_5124=float2(0.0);
l9_5124=l9_5122;
float2 l9_5125=float2(0.0);
float2 l9_5126=(*sc_set0.UserUniforms).uv3Offset;
l9_5125=l9_5126;
float2 l9_5127=float2(0.0);
l9_5127=l9_5125;
float2 l9_5128=float2(0.0);
l9_5128=(l9_5060*l9_5124)+l9_5127;
float2 l9_5129=float2(0.0);
l9_5129=l9_5128+(l9_5127*(l9_5058.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5056=l9_5129;
l9_5059=l9_5056;
}
else
{
float2 l9_5130=float2(0.0);
float2 l9_5131=float2(0.0);
float2 l9_5132=float2(0.0);
float2 l9_5133=float2(0.0);
float2 l9_5134=float2(0.0);
float2 l9_5135=float2(0.0);
ssGlobals l9_5136=l9_5058;
float2 l9_5137;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5138=float2(0.0);
l9_5138=l9_5136.Surface_UVCoord0;
l9_5131=l9_5138;
l9_5137=l9_5131;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5139=float2(0.0);
l9_5139=l9_5136.Surface_UVCoord1;
l9_5132=l9_5139;
l9_5137=l9_5132;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5140=float2(0.0);
l9_5140=l9_5136.gScreenCoord;
l9_5133=l9_5140;
l9_5137=l9_5133;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5141=float2(0.0);
float2 l9_5142=float2(0.0);
float2 l9_5143=float2(0.0);
ssGlobals l9_5144=l9_5136;
float2 l9_5145;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5146=float2(0.0);
float2 l9_5147=float2(0.0);
float2 l9_5148=float2(0.0);
ssGlobals l9_5149=l9_5144;
float2 l9_5150;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5151=float2(0.0);
float2 l9_5152=float2(0.0);
float2 l9_5153=float2(0.0);
float2 l9_5154=float2(0.0);
float2 l9_5155=float2(0.0);
ssGlobals l9_5156=l9_5149;
float2 l9_5157;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5158=float2(0.0);
l9_5158=l9_5156.Surface_UVCoord0;
l9_5152=l9_5158;
l9_5157=l9_5152;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5159=float2(0.0);
l9_5159=l9_5156.Surface_UVCoord1;
l9_5153=l9_5159;
l9_5157=l9_5153;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5160=float2(0.0);
l9_5160=l9_5156.gScreenCoord;
l9_5154=l9_5160;
l9_5157=l9_5154;
}
else
{
float2 l9_5161=float2(0.0);
l9_5161=l9_5156.Surface_UVCoord0;
l9_5155=l9_5161;
l9_5157=l9_5155;
}
}
}
l9_5151=l9_5157;
float2 l9_5162=float2(0.0);
float2 l9_5163=(*sc_set0.UserUniforms).uv2Scale;
l9_5162=l9_5163;
float2 l9_5164=float2(0.0);
l9_5164=l9_5162;
float2 l9_5165=float2(0.0);
float2 l9_5166=(*sc_set0.UserUniforms).uv2Offset;
l9_5165=l9_5166;
float2 l9_5167=float2(0.0);
l9_5167=l9_5165;
float2 l9_5168=float2(0.0);
l9_5168=(l9_5151*l9_5164)+l9_5167;
float2 l9_5169=float2(0.0);
l9_5169=l9_5168+(l9_5167*(l9_5149.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5147=l9_5169;
l9_5150=l9_5147;
}
else
{
float2 l9_5170=float2(0.0);
float2 l9_5171=float2(0.0);
float2 l9_5172=float2(0.0);
float2 l9_5173=float2(0.0);
float2 l9_5174=float2(0.0);
ssGlobals l9_5175=l9_5149;
float2 l9_5176;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5177=float2(0.0);
l9_5177=l9_5175.Surface_UVCoord0;
l9_5171=l9_5177;
l9_5176=l9_5171;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5178=float2(0.0);
l9_5178=l9_5175.Surface_UVCoord1;
l9_5172=l9_5178;
l9_5176=l9_5172;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5179=float2(0.0);
l9_5179=l9_5175.gScreenCoord;
l9_5173=l9_5179;
l9_5176=l9_5173;
}
else
{
float2 l9_5180=float2(0.0);
l9_5180=l9_5175.Surface_UVCoord0;
l9_5174=l9_5180;
l9_5176=l9_5174;
}
}
}
l9_5170=l9_5176;
float2 l9_5181=float2(0.0);
float2 l9_5182=(*sc_set0.UserUniforms).uv2Scale;
l9_5181=l9_5182;
float2 l9_5183=float2(0.0);
l9_5183=l9_5181;
float2 l9_5184=float2(0.0);
float2 l9_5185=(*sc_set0.UserUniforms).uv2Offset;
l9_5184=l9_5185;
float2 l9_5186=float2(0.0);
l9_5186=l9_5184;
float2 l9_5187=float2(0.0);
l9_5187=(l9_5170*l9_5183)+l9_5186;
l9_5148=l9_5187;
l9_5150=l9_5148;
}
l9_5146=l9_5150;
l9_5142=l9_5146;
l9_5145=l9_5142;
}
else
{
float2 l9_5188=float2(0.0);
l9_5188=l9_5144.Surface_UVCoord0;
l9_5143=l9_5188;
l9_5145=l9_5143;
}
l9_5141=l9_5145;
float2 l9_5189=float2(0.0);
l9_5189=l9_5141;
float2 l9_5190=float2(0.0);
l9_5190=l9_5189;
l9_5134=l9_5190;
l9_5137=l9_5134;
}
else
{
float2 l9_5191=float2(0.0);
l9_5191=l9_5136.Surface_UVCoord0;
l9_5135=l9_5191;
l9_5137=l9_5135;
}
}
}
}
l9_5130=l9_5137;
float2 l9_5192=float2(0.0);
float2 l9_5193=(*sc_set0.UserUniforms).uv3Scale;
l9_5192=l9_5193;
float2 l9_5194=float2(0.0);
l9_5194=l9_5192;
float2 l9_5195=float2(0.0);
float2 l9_5196=(*sc_set0.UserUniforms).uv3Offset;
l9_5195=l9_5196;
float2 l9_5197=float2(0.0);
l9_5197=l9_5195;
float2 l9_5198=float2(0.0);
l9_5198=(l9_5130*l9_5194)+l9_5197;
l9_5057=l9_5198;
l9_5059=l9_5057;
}
l9_5055=l9_5059;
l9_5051=l9_5055;
l9_5054=l9_5051;
}
else
{
float2 l9_5199=float2(0.0);
l9_5199=l9_5053.Surface_UVCoord0;
l9_5052=l9_5199;
l9_5054=l9_5052;
}
l9_5050=l9_5054;
float2 l9_5200=float2(0.0);
l9_5200=l9_5050;
float2 l9_5201=float2(0.0);
l9_5201=l9_5200;
l9_4994=l9_5201;
l9_4997=l9_4994;
}
else
{
float2 l9_5202=float2(0.0);
l9_5202=l9_4996.Surface_UVCoord0;
l9_4995=l9_5202;
l9_4997=l9_4995;
}
}
}
}
l9_4990=l9_4997;
float4 l9_5203=float4(0.0);
float2 l9_5204=l9_4990;
int l9_5205=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_5206=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5206=0;
}
else
{
l9_5206=in.varStereoViewID;
}
int l9_5207=l9_5206;
l9_5205=1-l9_5207;
}
else
{
int l9_5208=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5208=0;
}
else
{
l9_5208=in.varStereoViewID;
}
int l9_5209=l9_5208;
l9_5205=l9_5209;
}
int l9_5210=l9_5205;
int l9_5211=detailNormalTexLayout_tmp;
int l9_5212=l9_5210;
float2 l9_5213=l9_5204;
bool l9_5214=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_5215=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_5216=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_5217=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_5218=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_5219=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_5220=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_5221=0.0;
bool l9_5222=l9_5219&&(!l9_5217);
float l9_5223=1.0;
float l9_5224=l9_5213.x;
int l9_5225=l9_5216.x;
if (l9_5225==1)
{
l9_5224=fract(l9_5224);
}
else
{
if (l9_5225==2)
{
float l9_5226=fract(l9_5224);
float l9_5227=l9_5224-l9_5226;
float l9_5228=step(0.25,fract(l9_5227*0.5));
l9_5224=mix(l9_5226,1.0-l9_5226,fast::clamp(l9_5228,0.0,1.0));
}
}
l9_5213.x=l9_5224;
float l9_5229=l9_5213.y;
int l9_5230=l9_5216.y;
if (l9_5230==1)
{
l9_5229=fract(l9_5229);
}
else
{
if (l9_5230==2)
{
float l9_5231=fract(l9_5229);
float l9_5232=l9_5229-l9_5231;
float l9_5233=step(0.25,fract(l9_5232*0.5));
l9_5229=mix(l9_5231,1.0-l9_5231,fast::clamp(l9_5233,0.0,1.0));
}
}
l9_5213.y=l9_5229;
if (l9_5217)
{
bool l9_5234=l9_5219;
bool l9_5235;
if (l9_5234)
{
l9_5235=l9_5216.x==3;
}
else
{
l9_5235=l9_5234;
}
float l9_5236=l9_5213.x;
float l9_5237=l9_5218.x;
float l9_5238=l9_5218.z;
bool l9_5239=l9_5235;
float l9_5240=l9_5223;
float l9_5241=fast::clamp(l9_5236,l9_5237,l9_5238);
float l9_5242=step(abs(l9_5236-l9_5241),9.9999997e-06);
l9_5240*=(l9_5242+((1.0-float(l9_5239))*(1.0-l9_5242)));
l9_5236=l9_5241;
l9_5213.x=l9_5236;
l9_5223=l9_5240;
bool l9_5243=l9_5219;
bool l9_5244;
if (l9_5243)
{
l9_5244=l9_5216.y==3;
}
else
{
l9_5244=l9_5243;
}
float l9_5245=l9_5213.y;
float l9_5246=l9_5218.y;
float l9_5247=l9_5218.w;
bool l9_5248=l9_5244;
float l9_5249=l9_5223;
float l9_5250=fast::clamp(l9_5245,l9_5246,l9_5247);
float l9_5251=step(abs(l9_5245-l9_5250),9.9999997e-06);
l9_5249*=(l9_5251+((1.0-float(l9_5248))*(1.0-l9_5251)));
l9_5245=l9_5250;
l9_5213.y=l9_5245;
l9_5223=l9_5249;
}
float2 l9_5252=l9_5213;
bool l9_5253=l9_5214;
float3x3 l9_5254=l9_5215;
if (l9_5253)
{
l9_5252=float2((l9_5254*float3(l9_5252,1.0)).xy);
}
float2 l9_5255=l9_5252;
float2 l9_5256=l9_5255;
float2 l9_5257=l9_5256;
l9_5213=l9_5257;
float l9_5258=l9_5213.x;
int l9_5259=l9_5216.x;
bool l9_5260=l9_5222;
float l9_5261=l9_5223;
if ((l9_5259==0)||(l9_5259==3))
{
float l9_5262=l9_5258;
float l9_5263=0.0;
float l9_5264=1.0;
bool l9_5265=l9_5260;
float l9_5266=l9_5261;
float l9_5267=fast::clamp(l9_5262,l9_5263,l9_5264);
float l9_5268=step(abs(l9_5262-l9_5267),9.9999997e-06);
l9_5266*=(l9_5268+((1.0-float(l9_5265))*(1.0-l9_5268)));
l9_5262=l9_5267;
l9_5258=l9_5262;
l9_5261=l9_5266;
}
l9_5213.x=l9_5258;
l9_5223=l9_5261;
float l9_5269=l9_5213.y;
int l9_5270=l9_5216.y;
bool l9_5271=l9_5222;
float l9_5272=l9_5223;
if ((l9_5270==0)||(l9_5270==3))
{
float l9_5273=l9_5269;
float l9_5274=0.0;
float l9_5275=1.0;
bool l9_5276=l9_5271;
float l9_5277=l9_5272;
float l9_5278=fast::clamp(l9_5273,l9_5274,l9_5275);
float l9_5279=step(abs(l9_5273-l9_5278),9.9999997e-06);
l9_5277*=(l9_5279+((1.0-float(l9_5276))*(1.0-l9_5279)));
l9_5273=l9_5278;
l9_5269=l9_5273;
l9_5272=l9_5277;
}
l9_5213.y=l9_5269;
l9_5223=l9_5272;
float2 l9_5280=l9_5213;
int l9_5281=l9_5211;
int l9_5282=l9_5212;
float l9_5283=l9_5221;
float2 l9_5284=l9_5280;
int l9_5285=l9_5281;
int l9_5286=l9_5282;
float3 l9_5287=float3(0.0);
if (l9_5285==0)
{
l9_5287=float3(l9_5284,0.0);
}
else
{
if (l9_5285==1)
{
l9_5287=float3(l9_5284.x,(l9_5284.y*0.5)+(0.5-(float(l9_5286)*0.5)),0.0);
}
else
{
l9_5287=float3(l9_5284,float(l9_5286));
}
}
float3 l9_5288=l9_5287;
float3 l9_5289=l9_5288;
float2 l9_5290=l9_5289.xy;
float l9_5291=l9_5283;
float4 l9_5292=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_5290,bias(l9_5291));
float4 l9_5293=l9_5292;
float4 l9_5294=l9_5293;
if (l9_5219)
{
l9_5294=mix(l9_5220,l9_5294,float4(l9_5223));
}
float4 l9_5295=l9_5294;
float4 l9_5296=l9_5295;
float3 l9_5297=(l9_5296.xyz*1.9921875)-float3(1.0);
l9_5296=float4(l9_5297.x,l9_5297.y,l9_5297.z,l9_5296.w);
l9_5203=l9_5296;
l9_4986=l9_5203.xyz;
l9_4989=l9_4986;
}
else
{
l9_4989=l9_4987;
}
l9_4985=l9_4989;
float3 l9_5298=float3(0.0);
float3 l9_5299=l9_4890.xyz;
float l9_5300=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_5301=l9_4985;
float l9_5302=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_5303=l9_5299;
float l9_5304=l9_5300;
float3 l9_5305=l9_5301;
float l9_5306=l9_5302;
float3 l9_5307=mix(float3(0.0,0.0,1.0),l9_5303,float3(l9_5304))+float3(0.0,0.0,1.0);
float3 l9_5308=mix(float3(0.0,0.0,1.0),l9_5305,float3(l9_5306))*float3(-1.0,-1.0,1.0);
float3 l9_5309=normalize((l9_5307*dot(l9_5307,l9_5308))-(l9_5308*l9_5307.z));
l9_5301=l9_5309;
float3 l9_5310=l9_5301;
l9_5298=l9_5310;
float3 l9_5311=float3(0.0);
l9_5311=l9_4676*l9_5298;
float3 l9_5312=float3(0.0);
float3 l9_5313=l9_5311;
float l9_5314=dot(l9_5313,l9_5313);
float l9_5315;
if (l9_5314>0.0)
{
l9_5315=1.0/sqrt(l9_5314);
}
else
{
l9_5315=0.0;
}
float l9_5316=l9_5315;
float3 l9_5317=l9_5313*l9_5316;
l9_5312=l9_5317;
l9_4669=l9_5312;
l9_4672=l9_4669;
}
else
{
float3 l9_5318=float3(0.0);
l9_5318=l9_4671.VertexNormal_WorldSpace;
float3 l9_5319=float3(0.0);
float3 l9_5320=l9_5318;
float l9_5321=dot(l9_5320,l9_5320);
float l9_5322;
if (l9_5321>0.0)
{
l9_5322=1.0/sqrt(l9_5321);
}
else
{
l9_5322=0.0;
}
float l9_5323=l9_5322;
float3 l9_5324=l9_5320*l9_5323;
l9_5319=l9_5324;
l9_4670=l9_5319;
l9_4672=l9_4670;
}
l9_4668=l9_4672;
float3 l9_5325=float3(0.0);
l9_5325=l9_4668;
float3 l9_5326=float3(0.0);
l9_5326=l9_5325;
float3 l9_5327=float3(0.0);
l9_5327=-l9_4666.ViewDirWS;
float l9_5328=0.0;
l9_5328=dot(l9_5326,l9_5327);
float l9_5329=0.0;
l9_5329=abs(l9_5328);
l9_4664=l9_5329;
l9_4667=l9_4664;
}
else
{
float3 l9_5330=float3(0.0);
float3 l9_5331=float3(0.0);
float3 l9_5332=float3(0.0);
ssGlobals l9_5333=l9_4666;
float3 l9_5334;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_5335=float3(0.0);
l9_5335=l9_5333.VertexTangent_WorldSpace;
float3 l9_5336=float3(0.0);
l9_5336=l9_5333.VertexBinormal_WorldSpace;
float3 l9_5337=float3(0.0);
l9_5337=l9_5333.VertexNormal_WorldSpace;
float3x3 l9_5338=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_5338=float3x3(float3(l9_5335),float3(l9_5336),float3(l9_5337));
float2 l9_5339=float2(0.0);
float2 l9_5340=float2(0.0);
float2 l9_5341=float2(0.0);
float2 l9_5342=float2(0.0);
float2 l9_5343=float2(0.0);
float2 l9_5344=float2(0.0);
ssGlobals l9_5345=l9_5333;
float2 l9_5346;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_5347=float2(0.0);
l9_5347=l9_5345.Surface_UVCoord0;
l9_5340=l9_5347;
l9_5346=l9_5340;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_5348=float2(0.0);
l9_5348=l9_5345.Surface_UVCoord1;
l9_5341=l9_5348;
l9_5346=l9_5341;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_5349=float2(0.0);
float2 l9_5350=float2(0.0);
float2 l9_5351=float2(0.0);
ssGlobals l9_5352=l9_5345;
float2 l9_5353;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5354=float2(0.0);
float2 l9_5355=float2(0.0);
float2 l9_5356=float2(0.0);
ssGlobals l9_5357=l9_5352;
float2 l9_5358;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5359=float2(0.0);
float2 l9_5360=float2(0.0);
float2 l9_5361=float2(0.0);
float2 l9_5362=float2(0.0);
float2 l9_5363=float2(0.0);
ssGlobals l9_5364=l9_5357;
float2 l9_5365;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5366=float2(0.0);
l9_5366=l9_5364.Surface_UVCoord0;
l9_5360=l9_5366;
l9_5365=l9_5360;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5367=float2(0.0);
l9_5367=l9_5364.Surface_UVCoord1;
l9_5361=l9_5367;
l9_5365=l9_5361;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5368=float2(0.0);
l9_5368=l9_5364.gScreenCoord;
l9_5362=l9_5368;
l9_5365=l9_5362;
}
else
{
float2 l9_5369=float2(0.0);
l9_5369=l9_5364.Surface_UVCoord0;
l9_5363=l9_5369;
l9_5365=l9_5363;
}
}
}
l9_5359=l9_5365;
float2 l9_5370=float2(0.0);
float2 l9_5371=(*sc_set0.UserUniforms).uv2Scale;
l9_5370=l9_5371;
float2 l9_5372=float2(0.0);
l9_5372=l9_5370;
float2 l9_5373=float2(0.0);
float2 l9_5374=(*sc_set0.UserUniforms).uv2Offset;
l9_5373=l9_5374;
float2 l9_5375=float2(0.0);
l9_5375=l9_5373;
float2 l9_5376=float2(0.0);
l9_5376=(l9_5359*l9_5372)+l9_5375;
float2 l9_5377=float2(0.0);
l9_5377=l9_5376+(l9_5375*(l9_5357.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5355=l9_5377;
l9_5358=l9_5355;
}
else
{
float2 l9_5378=float2(0.0);
float2 l9_5379=float2(0.0);
float2 l9_5380=float2(0.0);
float2 l9_5381=float2(0.0);
float2 l9_5382=float2(0.0);
ssGlobals l9_5383=l9_5357;
float2 l9_5384;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5385=float2(0.0);
l9_5385=l9_5383.Surface_UVCoord0;
l9_5379=l9_5385;
l9_5384=l9_5379;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5386=float2(0.0);
l9_5386=l9_5383.Surface_UVCoord1;
l9_5380=l9_5386;
l9_5384=l9_5380;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5387=float2(0.0);
l9_5387=l9_5383.gScreenCoord;
l9_5381=l9_5387;
l9_5384=l9_5381;
}
else
{
float2 l9_5388=float2(0.0);
l9_5388=l9_5383.Surface_UVCoord0;
l9_5382=l9_5388;
l9_5384=l9_5382;
}
}
}
l9_5378=l9_5384;
float2 l9_5389=float2(0.0);
float2 l9_5390=(*sc_set0.UserUniforms).uv2Scale;
l9_5389=l9_5390;
float2 l9_5391=float2(0.0);
l9_5391=l9_5389;
float2 l9_5392=float2(0.0);
float2 l9_5393=(*sc_set0.UserUniforms).uv2Offset;
l9_5392=l9_5393;
float2 l9_5394=float2(0.0);
l9_5394=l9_5392;
float2 l9_5395=float2(0.0);
l9_5395=(l9_5378*l9_5391)+l9_5394;
l9_5356=l9_5395;
l9_5358=l9_5356;
}
l9_5354=l9_5358;
l9_5350=l9_5354;
l9_5353=l9_5350;
}
else
{
float2 l9_5396=float2(0.0);
l9_5396=l9_5352.Surface_UVCoord0;
l9_5351=l9_5396;
l9_5353=l9_5351;
}
l9_5349=l9_5353;
float2 l9_5397=float2(0.0);
l9_5397=l9_5349;
float2 l9_5398=float2(0.0);
l9_5398=l9_5397;
l9_5342=l9_5398;
l9_5346=l9_5342;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_5399=float2(0.0);
float2 l9_5400=float2(0.0);
float2 l9_5401=float2(0.0);
ssGlobals l9_5402=l9_5345;
float2 l9_5403;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_5404=float2(0.0);
float2 l9_5405=float2(0.0);
float2 l9_5406=float2(0.0);
ssGlobals l9_5407=l9_5402;
float2 l9_5408;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_5409=float2(0.0);
float2 l9_5410=float2(0.0);
float2 l9_5411=float2(0.0);
float2 l9_5412=float2(0.0);
float2 l9_5413=float2(0.0);
float2 l9_5414=float2(0.0);
ssGlobals l9_5415=l9_5407;
float2 l9_5416;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5417=float2(0.0);
l9_5417=l9_5415.Surface_UVCoord0;
l9_5410=l9_5417;
l9_5416=l9_5410;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5418=float2(0.0);
l9_5418=l9_5415.Surface_UVCoord1;
l9_5411=l9_5418;
l9_5416=l9_5411;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5419=float2(0.0);
l9_5419=l9_5415.gScreenCoord;
l9_5412=l9_5419;
l9_5416=l9_5412;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5420=float2(0.0);
float2 l9_5421=float2(0.0);
float2 l9_5422=float2(0.0);
ssGlobals l9_5423=l9_5415;
float2 l9_5424;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5425=float2(0.0);
float2 l9_5426=float2(0.0);
float2 l9_5427=float2(0.0);
ssGlobals l9_5428=l9_5423;
float2 l9_5429;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5430=float2(0.0);
float2 l9_5431=float2(0.0);
float2 l9_5432=float2(0.0);
float2 l9_5433=float2(0.0);
float2 l9_5434=float2(0.0);
ssGlobals l9_5435=l9_5428;
float2 l9_5436;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5437=float2(0.0);
l9_5437=l9_5435.Surface_UVCoord0;
l9_5431=l9_5437;
l9_5436=l9_5431;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5438=float2(0.0);
l9_5438=l9_5435.Surface_UVCoord1;
l9_5432=l9_5438;
l9_5436=l9_5432;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5439=float2(0.0);
l9_5439=l9_5435.gScreenCoord;
l9_5433=l9_5439;
l9_5436=l9_5433;
}
else
{
float2 l9_5440=float2(0.0);
l9_5440=l9_5435.Surface_UVCoord0;
l9_5434=l9_5440;
l9_5436=l9_5434;
}
}
}
l9_5430=l9_5436;
float2 l9_5441=float2(0.0);
float2 l9_5442=(*sc_set0.UserUniforms).uv2Scale;
l9_5441=l9_5442;
float2 l9_5443=float2(0.0);
l9_5443=l9_5441;
float2 l9_5444=float2(0.0);
float2 l9_5445=(*sc_set0.UserUniforms).uv2Offset;
l9_5444=l9_5445;
float2 l9_5446=float2(0.0);
l9_5446=l9_5444;
float2 l9_5447=float2(0.0);
l9_5447=(l9_5430*l9_5443)+l9_5446;
float2 l9_5448=float2(0.0);
l9_5448=l9_5447+(l9_5446*(l9_5428.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5426=l9_5448;
l9_5429=l9_5426;
}
else
{
float2 l9_5449=float2(0.0);
float2 l9_5450=float2(0.0);
float2 l9_5451=float2(0.0);
float2 l9_5452=float2(0.0);
float2 l9_5453=float2(0.0);
ssGlobals l9_5454=l9_5428;
float2 l9_5455;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5456=float2(0.0);
l9_5456=l9_5454.Surface_UVCoord0;
l9_5450=l9_5456;
l9_5455=l9_5450;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5457=float2(0.0);
l9_5457=l9_5454.Surface_UVCoord1;
l9_5451=l9_5457;
l9_5455=l9_5451;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5458=float2(0.0);
l9_5458=l9_5454.gScreenCoord;
l9_5452=l9_5458;
l9_5455=l9_5452;
}
else
{
float2 l9_5459=float2(0.0);
l9_5459=l9_5454.Surface_UVCoord0;
l9_5453=l9_5459;
l9_5455=l9_5453;
}
}
}
l9_5449=l9_5455;
float2 l9_5460=float2(0.0);
float2 l9_5461=(*sc_set0.UserUniforms).uv2Scale;
l9_5460=l9_5461;
float2 l9_5462=float2(0.0);
l9_5462=l9_5460;
float2 l9_5463=float2(0.0);
float2 l9_5464=(*sc_set0.UserUniforms).uv2Offset;
l9_5463=l9_5464;
float2 l9_5465=float2(0.0);
l9_5465=l9_5463;
float2 l9_5466=float2(0.0);
l9_5466=(l9_5449*l9_5462)+l9_5465;
l9_5427=l9_5466;
l9_5429=l9_5427;
}
l9_5425=l9_5429;
l9_5421=l9_5425;
l9_5424=l9_5421;
}
else
{
float2 l9_5467=float2(0.0);
l9_5467=l9_5423.Surface_UVCoord0;
l9_5422=l9_5467;
l9_5424=l9_5422;
}
l9_5420=l9_5424;
float2 l9_5468=float2(0.0);
l9_5468=l9_5420;
float2 l9_5469=float2(0.0);
l9_5469=l9_5468;
l9_5413=l9_5469;
l9_5416=l9_5413;
}
else
{
float2 l9_5470=float2(0.0);
l9_5470=l9_5415.Surface_UVCoord0;
l9_5414=l9_5470;
l9_5416=l9_5414;
}
}
}
}
l9_5409=l9_5416;
float2 l9_5471=float2(0.0);
float2 l9_5472=(*sc_set0.UserUniforms).uv3Scale;
l9_5471=l9_5472;
float2 l9_5473=float2(0.0);
l9_5473=l9_5471;
float2 l9_5474=float2(0.0);
float2 l9_5475=(*sc_set0.UserUniforms).uv3Offset;
l9_5474=l9_5475;
float2 l9_5476=float2(0.0);
l9_5476=l9_5474;
float2 l9_5477=float2(0.0);
l9_5477=(l9_5409*l9_5473)+l9_5476;
float2 l9_5478=float2(0.0);
l9_5478=l9_5477+(l9_5476*(l9_5407.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5405=l9_5478;
l9_5408=l9_5405;
}
else
{
float2 l9_5479=float2(0.0);
float2 l9_5480=float2(0.0);
float2 l9_5481=float2(0.0);
float2 l9_5482=float2(0.0);
float2 l9_5483=float2(0.0);
float2 l9_5484=float2(0.0);
ssGlobals l9_5485=l9_5407;
float2 l9_5486;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5487=float2(0.0);
l9_5487=l9_5485.Surface_UVCoord0;
l9_5480=l9_5487;
l9_5486=l9_5480;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5488=float2(0.0);
l9_5488=l9_5485.Surface_UVCoord1;
l9_5481=l9_5488;
l9_5486=l9_5481;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5489=float2(0.0);
l9_5489=l9_5485.gScreenCoord;
l9_5482=l9_5489;
l9_5486=l9_5482;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5490=float2(0.0);
float2 l9_5491=float2(0.0);
float2 l9_5492=float2(0.0);
ssGlobals l9_5493=l9_5485;
float2 l9_5494;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5495=float2(0.0);
float2 l9_5496=float2(0.0);
float2 l9_5497=float2(0.0);
ssGlobals l9_5498=l9_5493;
float2 l9_5499;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5500=float2(0.0);
float2 l9_5501=float2(0.0);
float2 l9_5502=float2(0.0);
float2 l9_5503=float2(0.0);
float2 l9_5504=float2(0.0);
ssGlobals l9_5505=l9_5498;
float2 l9_5506;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5507=float2(0.0);
l9_5507=l9_5505.Surface_UVCoord0;
l9_5501=l9_5507;
l9_5506=l9_5501;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5508=float2(0.0);
l9_5508=l9_5505.Surface_UVCoord1;
l9_5502=l9_5508;
l9_5506=l9_5502;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5509=float2(0.0);
l9_5509=l9_5505.gScreenCoord;
l9_5503=l9_5509;
l9_5506=l9_5503;
}
else
{
float2 l9_5510=float2(0.0);
l9_5510=l9_5505.Surface_UVCoord0;
l9_5504=l9_5510;
l9_5506=l9_5504;
}
}
}
l9_5500=l9_5506;
float2 l9_5511=float2(0.0);
float2 l9_5512=(*sc_set0.UserUniforms).uv2Scale;
l9_5511=l9_5512;
float2 l9_5513=float2(0.0);
l9_5513=l9_5511;
float2 l9_5514=float2(0.0);
float2 l9_5515=(*sc_set0.UserUniforms).uv2Offset;
l9_5514=l9_5515;
float2 l9_5516=float2(0.0);
l9_5516=l9_5514;
float2 l9_5517=float2(0.0);
l9_5517=(l9_5500*l9_5513)+l9_5516;
float2 l9_5518=float2(0.0);
l9_5518=l9_5517+(l9_5516*(l9_5498.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5496=l9_5518;
l9_5499=l9_5496;
}
else
{
float2 l9_5519=float2(0.0);
float2 l9_5520=float2(0.0);
float2 l9_5521=float2(0.0);
float2 l9_5522=float2(0.0);
float2 l9_5523=float2(0.0);
ssGlobals l9_5524=l9_5498;
float2 l9_5525;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5526=float2(0.0);
l9_5526=l9_5524.Surface_UVCoord0;
l9_5520=l9_5526;
l9_5525=l9_5520;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5527=float2(0.0);
l9_5527=l9_5524.Surface_UVCoord1;
l9_5521=l9_5527;
l9_5525=l9_5521;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5528=float2(0.0);
l9_5528=l9_5524.gScreenCoord;
l9_5522=l9_5528;
l9_5525=l9_5522;
}
else
{
float2 l9_5529=float2(0.0);
l9_5529=l9_5524.Surface_UVCoord0;
l9_5523=l9_5529;
l9_5525=l9_5523;
}
}
}
l9_5519=l9_5525;
float2 l9_5530=float2(0.0);
float2 l9_5531=(*sc_set0.UserUniforms).uv2Scale;
l9_5530=l9_5531;
float2 l9_5532=float2(0.0);
l9_5532=l9_5530;
float2 l9_5533=float2(0.0);
float2 l9_5534=(*sc_set0.UserUniforms).uv2Offset;
l9_5533=l9_5534;
float2 l9_5535=float2(0.0);
l9_5535=l9_5533;
float2 l9_5536=float2(0.0);
l9_5536=(l9_5519*l9_5532)+l9_5535;
l9_5497=l9_5536;
l9_5499=l9_5497;
}
l9_5495=l9_5499;
l9_5491=l9_5495;
l9_5494=l9_5491;
}
else
{
float2 l9_5537=float2(0.0);
l9_5537=l9_5493.Surface_UVCoord0;
l9_5492=l9_5537;
l9_5494=l9_5492;
}
l9_5490=l9_5494;
float2 l9_5538=float2(0.0);
l9_5538=l9_5490;
float2 l9_5539=float2(0.0);
l9_5539=l9_5538;
l9_5483=l9_5539;
l9_5486=l9_5483;
}
else
{
float2 l9_5540=float2(0.0);
l9_5540=l9_5485.Surface_UVCoord0;
l9_5484=l9_5540;
l9_5486=l9_5484;
}
}
}
}
l9_5479=l9_5486;
float2 l9_5541=float2(0.0);
float2 l9_5542=(*sc_set0.UserUniforms).uv3Scale;
l9_5541=l9_5542;
float2 l9_5543=float2(0.0);
l9_5543=l9_5541;
float2 l9_5544=float2(0.0);
float2 l9_5545=(*sc_set0.UserUniforms).uv3Offset;
l9_5544=l9_5545;
float2 l9_5546=float2(0.0);
l9_5546=l9_5544;
float2 l9_5547=float2(0.0);
l9_5547=(l9_5479*l9_5543)+l9_5546;
l9_5406=l9_5547;
l9_5408=l9_5406;
}
l9_5404=l9_5408;
l9_5400=l9_5404;
l9_5403=l9_5400;
}
else
{
float2 l9_5548=float2(0.0);
l9_5548=l9_5402.Surface_UVCoord0;
l9_5401=l9_5548;
l9_5403=l9_5401;
}
l9_5399=l9_5403;
float2 l9_5549=float2(0.0);
l9_5549=l9_5399;
float2 l9_5550=float2(0.0);
l9_5550=l9_5549;
l9_5343=l9_5550;
l9_5346=l9_5343;
}
else
{
float2 l9_5551=float2(0.0);
l9_5551=l9_5345.Surface_UVCoord0;
l9_5344=l9_5551;
l9_5346=l9_5344;
}
}
}
}
l9_5339=l9_5346;
float4 l9_5552=float4(0.0);
float2 l9_5553=l9_5339;
int l9_5554=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_5555=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5555=0;
}
else
{
l9_5555=in.varStereoViewID;
}
int l9_5556=l9_5555;
l9_5554=1-l9_5556;
}
else
{
int l9_5557=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5557=0;
}
else
{
l9_5557=in.varStereoViewID;
}
int l9_5558=l9_5557;
l9_5554=l9_5558;
}
int l9_5559=l9_5554;
int l9_5560=normalTexLayout_tmp;
int l9_5561=l9_5559;
float2 l9_5562=l9_5553;
bool l9_5563=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_5564=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_5565=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_5566=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_5567=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_5568=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_5569=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_5570=0.0;
bool l9_5571=l9_5568&&(!l9_5566);
float l9_5572=1.0;
float l9_5573=l9_5562.x;
int l9_5574=l9_5565.x;
if (l9_5574==1)
{
l9_5573=fract(l9_5573);
}
else
{
if (l9_5574==2)
{
float l9_5575=fract(l9_5573);
float l9_5576=l9_5573-l9_5575;
float l9_5577=step(0.25,fract(l9_5576*0.5));
l9_5573=mix(l9_5575,1.0-l9_5575,fast::clamp(l9_5577,0.0,1.0));
}
}
l9_5562.x=l9_5573;
float l9_5578=l9_5562.y;
int l9_5579=l9_5565.y;
if (l9_5579==1)
{
l9_5578=fract(l9_5578);
}
else
{
if (l9_5579==2)
{
float l9_5580=fract(l9_5578);
float l9_5581=l9_5578-l9_5580;
float l9_5582=step(0.25,fract(l9_5581*0.5));
l9_5578=mix(l9_5580,1.0-l9_5580,fast::clamp(l9_5582,0.0,1.0));
}
}
l9_5562.y=l9_5578;
if (l9_5566)
{
bool l9_5583=l9_5568;
bool l9_5584;
if (l9_5583)
{
l9_5584=l9_5565.x==3;
}
else
{
l9_5584=l9_5583;
}
float l9_5585=l9_5562.x;
float l9_5586=l9_5567.x;
float l9_5587=l9_5567.z;
bool l9_5588=l9_5584;
float l9_5589=l9_5572;
float l9_5590=fast::clamp(l9_5585,l9_5586,l9_5587);
float l9_5591=step(abs(l9_5585-l9_5590),9.9999997e-06);
l9_5589*=(l9_5591+((1.0-float(l9_5588))*(1.0-l9_5591)));
l9_5585=l9_5590;
l9_5562.x=l9_5585;
l9_5572=l9_5589;
bool l9_5592=l9_5568;
bool l9_5593;
if (l9_5592)
{
l9_5593=l9_5565.y==3;
}
else
{
l9_5593=l9_5592;
}
float l9_5594=l9_5562.y;
float l9_5595=l9_5567.y;
float l9_5596=l9_5567.w;
bool l9_5597=l9_5593;
float l9_5598=l9_5572;
float l9_5599=fast::clamp(l9_5594,l9_5595,l9_5596);
float l9_5600=step(abs(l9_5594-l9_5599),9.9999997e-06);
l9_5598*=(l9_5600+((1.0-float(l9_5597))*(1.0-l9_5600)));
l9_5594=l9_5599;
l9_5562.y=l9_5594;
l9_5572=l9_5598;
}
float2 l9_5601=l9_5562;
bool l9_5602=l9_5563;
float3x3 l9_5603=l9_5564;
if (l9_5602)
{
l9_5601=float2((l9_5603*float3(l9_5601,1.0)).xy);
}
float2 l9_5604=l9_5601;
float2 l9_5605=l9_5604;
float2 l9_5606=l9_5605;
l9_5562=l9_5606;
float l9_5607=l9_5562.x;
int l9_5608=l9_5565.x;
bool l9_5609=l9_5571;
float l9_5610=l9_5572;
if ((l9_5608==0)||(l9_5608==3))
{
float l9_5611=l9_5607;
float l9_5612=0.0;
float l9_5613=1.0;
bool l9_5614=l9_5609;
float l9_5615=l9_5610;
float l9_5616=fast::clamp(l9_5611,l9_5612,l9_5613);
float l9_5617=step(abs(l9_5611-l9_5616),9.9999997e-06);
l9_5615*=(l9_5617+((1.0-float(l9_5614))*(1.0-l9_5617)));
l9_5611=l9_5616;
l9_5607=l9_5611;
l9_5610=l9_5615;
}
l9_5562.x=l9_5607;
l9_5572=l9_5610;
float l9_5618=l9_5562.y;
int l9_5619=l9_5565.y;
bool l9_5620=l9_5571;
float l9_5621=l9_5572;
if ((l9_5619==0)||(l9_5619==3))
{
float l9_5622=l9_5618;
float l9_5623=0.0;
float l9_5624=1.0;
bool l9_5625=l9_5620;
float l9_5626=l9_5621;
float l9_5627=fast::clamp(l9_5622,l9_5623,l9_5624);
float l9_5628=step(abs(l9_5622-l9_5627),9.9999997e-06);
l9_5626*=(l9_5628+((1.0-float(l9_5625))*(1.0-l9_5628)));
l9_5622=l9_5627;
l9_5618=l9_5622;
l9_5621=l9_5626;
}
l9_5562.y=l9_5618;
l9_5572=l9_5621;
float2 l9_5629=l9_5562;
int l9_5630=l9_5560;
int l9_5631=l9_5561;
float l9_5632=l9_5570;
float2 l9_5633=l9_5629;
int l9_5634=l9_5630;
int l9_5635=l9_5631;
float3 l9_5636=float3(0.0);
if (l9_5634==0)
{
l9_5636=float3(l9_5633,0.0);
}
else
{
if (l9_5634==1)
{
l9_5636=float3(l9_5633.x,(l9_5633.y*0.5)+(0.5-(float(l9_5635)*0.5)),0.0);
}
else
{
l9_5636=float3(l9_5633,float(l9_5635));
}
}
float3 l9_5637=l9_5636;
float3 l9_5638=l9_5637;
float2 l9_5639=l9_5638.xy;
float l9_5640=l9_5632;
float4 l9_5641=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_5639,bias(l9_5640));
float4 l9_5642=l9_5641;
float4 l9_5643=l9_5642;
if (l9_5568)
{
l9_5643=mix(l9_5569,l9_5643,float4(l9_5572));
}
float4 l9_5644=l9_5643;
float4 l9_5645=l9_5644;
float3 l9_5646=(l9_5645.xyz*1.9921875)-float3(1.0);
l9_5645=float4(l9_5646.x,l9_5646.y,l9_5646.z,l9_5645.w);
l9_5552=l9_5645;
float3 l9_5647=float3(0.0);
float3 l9_5648=float3(0.0);
float3 l9_5649=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_5650=l9_5333;
float3 l9_5651;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_5652=float2(0.0);
float2 l9_5653=float2(0.0);
float2 l9_5654=float2(0.0);
float2 l9_5655=float2(0.0);
float2 l9_5656=float2(0.0);
float2 l9_5657=float2(0.0);
ssGlobals l9_5658=l9_5650;
float2 l9_5659;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_5660=float2(0.0);
l9_5660=l9_5658.Surface_UVCoord0;
l9_5653=l9_5660;
l9_5659=l9_5653;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_5661=float2(0.0);
l9_5661=l9_5658.Surface_UVCoord1;
l9_5654=l9_5661;
l9_5659=l9_5654;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_5662=float2(0.0);
float2 l9_5663=float2(0.0);
float2 l9_5664=float2(0.0);
ssGlobals l9_5665=l9_5658;
float2 l9_5666;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5667=float2(0.0);
float2 l9_5668=float2(0.0);
float2 l9_5669=float2(0.0);
ssGlobals l9_5670=l9_5665;
float2 l9_5671;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5672=float2(0.0);
float2 l9_5673=float2(0.0);
float2 l9_5674=float2(0.0);
float2 l9_5675=float2(0.0);
float2 l9_5676=float2(0.0);
ssGlobals l9_5677=l9_5670;
float2 l9_5678;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5679=float2(0.0);
l9_5679=l9_5677.Surface_UVCoord0;
l9_5673=l9_5679;
l9_5678=l9_5673;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5680=float2(0.0);
l9_5680=l9_5677.Surface_UVCoord1;
l9_5674=l9_5680;
l9_5678=l9_5674;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5681=float2(0.0);
l9_5681=l9_5677.gScreenCoord;
l9_5675=l9_5681;
l9_5678=l9_5675;
}
else
{
float2 l9_5682=float2(0.0);
l9_5682=l9_5677.Surface_UVCoord0;
l9_5676=l9_5682;
l9_5678=l9_5676;
}
}
}
l9_5672=l9_5678;
float2 l9_5683=float2(0.0);
float2 l9_5684=(*sc_set0.UserUniforms).uv2Scale;
l9_5683=l9_5684;
float2 l9_5685=float2(0.0);
l9_5685=l9_5683;
float2 l9_5686=float2(0.0);
float2 l9_5687=(*sc_set0.UserUniforms).uv2Offset;
l9_5686=l9_5687;
float2 l9_5688=float2(0.0);
l9_5688=l9_5686;
float2 l9_5689=float2(0.0);
l9_5689=(l9_5672*l9_5685)+l9_5688;
float2 l9_5690=float2(0.0);
l9_5690=l9_5689+(l9_5688*(l9_5670.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5668=l9_5690;
l9_5671=l9_5668;
}
else
{
float2 l9_5691=float2(0.0);
float2 l9_5692=float2(0.0);
float2 l9_5693=float2(0.0);
float2 l9_5694=float2(0.0);
float2 l9_5695=float2(0.0);
ssGlobals l9_5696=l9_5670;
float2 l9_5697;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5698=float2(0.0);
l9_5698=l9_5696.Surface_UVCoord0;
l9_5692=l9_5698;
l9_5697=l9_5692;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5699=float2(0.0);
l9_5699=l9_5696.Surface_UVCoord1;
l9_5693=l9_5699;
l9_5697=l9_5693;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5700=float2(0.0);
l9_5700=l9_5696.gScreenCoord;
l9_5694=l9_5700;
l9_5697=l9_5694;
}
else
{
float2 l9_5701=float2(0.0);
l9_5701=l9_5696.Surface_UVCoord0;
l9_5695=l9_5701;
l9_5697=l9_5695;
}
}
}
l9_5691=l9_5697;
float2 l9_5702=float2(0.0);
float2 l9_5703=(*sc_set0.UserUniforms).uv2Scale;
l9_5702=l9_5703;
float2 l9_5704=float2(0.0);
l9_5704=l9_5702;
float2 l9_5705=float2(0.0);
float2 l9_5706=(*sc_set0.UserUniforms).uv2Offset;
l9_5705=l9_5706;
float2 l9_5707=float2(0.0);
l9_5707=l9_5705;
float2 l9_5708=float2(0.0);
l9_5708=(l9_5691*l9_5704)+l9_5707;
l9_5669=l9_5708;
l9_5671=l9_5669;
}
l9_5667=l9_5671;
l9_5663=l9_5667;
l9_5666=l9_5663;
}
else
{
float2 l9_5709=float2(0.0);
l9_5709=l9_5665.Surface_UVCoord0;
l9_5664=l9_5709;
l9_5666=l9_5664;
}
l9_5662=l9_5666;
float2 l9_5710=float2(0.0);
l9_5710=l9_5662;
float2 l9_5711=float2(0.0);
l9_5711=l9_5710;
l9_5655=l9_5711;
l9_5659=l9_5655;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_5712=float2(0.0);
float2 l9_5713=float2(0.0);
float2 l9_5714=float2(0.0);
ssGlobals l9_5715=l9_5658;
float2 l9_5716;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_5717=float2(0.0);
float2 l9_5718=float2(0.0);
float2 l9_5719=float2(0.0);
ssGlobals l9_5720=l9_5715;
float2 l9_5721;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_5722=float2(0.0);
float2 l9_5723=float2(0.0);
float2 l9_5724=float2(0.0);
float2 l9_5725=float2(0.0);
float2 l9_5726=float2(0.0);
float2 l9_5727=float2(0.0);
ssGlobals l9_5728=l9_5720;
float2 l9_5729;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5730=float2(0.0);
l9_5730=l9_5728.Surface_UVCoord0;
l9_5723=l9_5730;
l9_5729=l9_5723;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5731=float2(0.0);
l9_5731=l9_5728.Surface_UVCoord1;
l9_5724=l9_5731;
l9_5729=l9_5724;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5732=float2(0.0);
l9_5732=l9_5728.gScreenCoord;
l9_5725=l9_5732;
l9_5729=l9_5725;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5733=float2(0.0);
float2 l9_5734=float2(0.0);
float2 l9_5735=float2(0.0);
ssGlobals l9_5736=l9_5728;
float2 l9_5737;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5738=float2(0.0);
float2 l9_5739=float2(0.0);
float2 l9_5740=float2(0.0);
ssGlobals l9_5741=l9_5736;
float2 l9_5742;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5743=float2(0.0);
float2 l9_5744=float2(0.0);
float2 l9_5745=float2(0.0);
float2 l9_5746=float2(0.0);
float2 l9_5747=float2(0.0);
ssGlobals l9_5748=l9_5741;
float2 l9_5749;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5750=float2(0.0);
l9_5750=l9_5748.Surface_UVCoord0;
l9_5744=l9_5750;
l9_5749=l9_5744;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5751=float2(0.0);
l9_5751=l9_5748.Surface_UVCoord1;
l9_5745=l9_5751;
l9_5749=l9_5745;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5752=float2(0.0);
l9_5752=l9_5748.gScreenCoord;
l9_5746=l9_5752;
l9_5749=l9_5746;
}
else
{
float2 l9_5753=float2(0.0);
l9_5753=l9_5748.Surface_UVCoord0;
l9_5747=l9_5753;
l9_5749=l9_5747;
}
}
}
l9_5743=l9_5749;
float2 l9_5754=float2(0.0);
float2 l9_5755=(*sc_set0.UserUniforms).uv2Scale;
l9_5754=l9_5755;
float2 l9_5756=float2(0.0);
l9_5756=l9_5754;
float2 l9_5757=float2(0.0);
float2 l9_5758=(*sc_set0.UserUniforms).uv2Offset;
l9_5757=l9_5758;
float2 l9_5759=float2(0.0);
l9_5759=l9_5757;
float2 l9_5760=float2(0.0);
l9_5760=(l9_5743*l9_5756)+l9_5759;
float2 l9_5761=float2(0.0);
l9_5761=l9_5760+(l9_5759*(l9_5741.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5739=l9_5761;
l9_5742=l9_5739;
}
else
{
float2 l9_5762=float2(0.0);
float2 l9_5763=float2(0.0);
float2 l9_5764=float2(0.0);
float2 l9_5765=float2(0.0);
float2 l9_5766=float2(0.0);
ssGlobals l9_5767=l9_5741;
float2 l9_5768;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5769=float2(0.0);
l9_5769=l9_5767.Surface_UVCoord0;
l9_5763=l9_5769;
l9_5768=l9_5763;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5770=float2(0.0);
l9_5770=l9_5767.Surface_UVCoord1;
l9_5764=l9_5770;
l9_5768=l9_5764;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5771=float2(0.0);
l9_5771=l9_5767.gScreenCoord;
l9_5765=l9_5771;
l9_5768=l9_5765;
}
else
{
float2 l9_5772=float2(0.0);
l9_5772=l9_5767.Surface_UVCoord0;
l9_5766=l9_5772;
l9_5768=l9_5766;
}
}
}
l9_5762=l9_5768;
float2 l9_5773=float2(0.0);
float2 l9_5774=(*sc_set0.UserUniforms).uv2Scale;
l9_5773=l9_5774;
float2 l9_5775=float2(0.0);
l9_5775=l9_5773;
float2 l9_5776=float2(0.0);
float2 l9_5777=(*sc_set0.UserUniforms).uv2Offset;
l9_5776=l9_5777;
float2 l9_5778=float2(0.0);
l9_5778=l9_5776;
float2 l9_5779=float2(0.0);
l9_5779=(l9_5762*l9_5775)+l9_5778;
l9_5740=l9_5779;
l9_5742=l9_5740;
}
l9_5738=l9_5742;
l9_5734=l9_5738;
l9_5737=l9_5734;
}
else
{
float2 l9_5780=float2(0.0);
l9_5780=l9_5736.Surface_UVCoord0;
l9_5735=l9_5780;
l9_5737=l9_5735;
}
l9_5733=l9_5737;
float2 l9_5781=float2(0.0);
l9_5781=l9_5733;
float2 l9_5782=float2(0.0);
l9_5782=l9_5781;
l9_5726=l9_5782;
l9_5729=l9_5726;
}
else
{
float2 l9_5783=float2(0.0);
l9_5783=l9_5728.Surface_UVCoord0;
l9_5727=l9_5783;
l9_5729=l9_5727;
}
}
}
}
l9_5722=l9_5729;
float2 l9_5784=float2(0.0);
float2 l9_5785=(*sc_set0.UserUniforms).uv3Scale;
l9_5784=l9_5785;
float2 l9_5786=float2(0.0);
l9_5786=l9_5784;
float2 l9_5787=float2(0.0);
float2 l9_5788=(*sc_set0.UserUniforms).uv3Offset;
l9_5787=l9_5788;
float2 l9_5789=float2(0.0);
l9_5789=l9_5787;
float2 l9_5790=float2(0.0);
l9_5790=(l9_5722*l9_5786)+l9_5789;
float2 l9_5791=float2(0.0);
l9_5791=l9_5790+(l9_5789*(l9_5720.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5718=l9_5791;
l9_5721=l9_5718;
}
else
{
float2 l9_5792=float2(0.0);
float2 l9_5793=float2(0.0);
float2 l9_5794=float2(0.0);
float2 l9_5795=float2(0.0);
float2 l9_5796=float2(0.0);
float2 l9_5797=float2(0.0);
ssGlobals l9_5798=l9_5720;
float2 l9_5799;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5800=float2(0.0);
l9_5800=l9_5798.Surface_UVCoord0;
l9_5793=l9_5800;
l9_5799=l9_5793;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5801=float2(0.0);
l9_5801=l9_5798.Surface_UVCoord1;
l9_5794=l9_5801;
l9_5799=l9_5794;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5802=float2(0.0);
l9_5802=l9_5798.gScreenCoord;
l9_5795=l9_5802;
l9_5799=l9_5795;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5803=float2(0.0);
float2 l9_5804=float2(0.0);
float2 l9_5805=float2(0.0);
ssGlobals l9_5806=l9_5798;
float2 l9_5807;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_5808=float2(0.0);
float2 l9_5809=float2(0.0);
float2 l9_5810=float2(0.0);
ssGlobals l9_5811=l9_5806;
float2 l9_5812;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_5813=float2(0.0);
float2 l9_5814=float2(0.0);
float2 l9_5815=float2(0.0);
float2 l9_5816=float2(0.0);
float2 l9_5817=float2(0.0);
ssGlobals l9_5818=l9_5811;
float2 l9_5819;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5820=float2(0.0);
l9_5820=l9_5818.Surface_UVCoord0;
l9_5814=l9_5820;
l9_5819=l9_5814;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5821=float2(0.0);
l9_5821=l9_5818.Surface_UVCoord1;
l9_5815=l9_5821;
l9_5819=l9_5815;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5822=float2(0.0);
l9_5822=l9_5818.gScreenCoord;
l9_5816=l9_5822;
l9_5819=l9_5816;
}
else
{
float2 l9_5823=float2(0.0);
l9_5823=l9_5818.Surface_UVCoord0;
l9_5817=l9_5823;
l9_5819=l9_5817;
}
}
}
l9_5813=l9_5819;
float2 l9_5824=float2(0.0);
float2 l9_5825=(*sc_set0.UserUniforms).uv2Scale;
l9_5824=l9_5825;
float2 l9_5826=float2(0.0);
l9_5826=l9_5824;
float2 l9_5827=float2(0.0);
float2 l9_5828=(*sc_set0.UserUniforms).uv2Offset;
l9_5827=l9_5828;
float2 l9_5829=float2(0.0);
l9_5829=l9_5827;
float2 l9_5830=float2(0.0);
l9_5830=(l9_5813*l9_5826)+l9_5829;
float2 l9_5831=float2(0.0);
l9_5831=l9_5830+(l9_5829*(l9_5811.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5809=l9_5831;
l9_5812=l9_5809;
}
else
{
float2 l9_5832=float2(0.0);
float2 l9_5833=float2(0.0);
float2 l9_5834=float2(0.0);
float2 l9_5835=float2(0.0);
float2 l9_5836=float2(0.0);
ssGlobals l9_5837=l9_5811;
float2 l9_5838;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5839=float2(0.0);
l9_5839=l9_5837.Surface_UVCoord0;
l9_5833=l9_5839;
l9_5838=l9_5833;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5840=float2(0.0);
l9_5840=l9_5837.Surface_UVCoord1;
l9_5834=l9_5840;
l9_5838=l9_5834;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5841=float2(0.0);
l9_5841=l9_5837.gScreenCoord;
l9_5835=l9_5841;
l9_5838=l9_5835;
}
else
{
float2 l9_5842=float2(0.0);
l9_5842=l9_5837.Surface_UVCoord0;
l9_5836=l9_5842;
l9_5838=l9_5836;
}
}
}
l9_5832=l9_5838;
float2 l9_5843=float2(0.0);
float2 l9_5844=(*sc_set0.UserUniforms).uv2Scale;
l9_5843=l9_5844;
float2 l9_5845=float2(0.0);
l9_5845=l9_5843;
float2 l9_5846=float2(0.0);
float2 l9_5847=(*sc_set0.UserUniforms).uv2Offset;
l9_5846=l9_5847;
float2 l9_5848=float2(0.0);
l9_5848=l9_5846;
float2 l9_5849=float2(0.0);
l9_5849=(l9_5832*l9_5845)+l9_5848;
l9_5810=l9_5849;
l9_5812=l9_5810;
}
l9_5808=l9_5812;
l9_5804=l9_5808;
l9_5807=l9_5804;
}
else
{
float2 l9_5850=float2(0.0);
l9_5850=l9_5806.Surface_UVCoord0;
l9_5805=l9_5850;
l9_5807=l9_5805;
}
l9_5803=l9_5807;
float2 l9_5851=float2(0.0);
l9_5851=l9_5803;
float2 l9_5852=float2(0.0);
l9_5852=l9_5851;
l9_5796=l9_5852;
l9_5799=l9_5796;
}
else
{
float2 l9_5853=float2(0.0);
l9_5853=l9_5798.Surface_UVCoord0;
l9_5797=l9_5853;
l9_5799=l9_5797;
}
}
}
}
l9_5792=l9_5799;
float2 l9_5854=float2(0.0);
float2 l9_5855=(*sc_set0.UserUniforms).uv3Scale;
l9_5854=l9_5855;
float2 l9_5856=float2(0.0);
l9_5856=l9_5854;
float2 l9_5857=float2(0.0);
float2 l9_5858=(*sc_set0.UserUniforms).uv3Offset;
l9_5857=l9_5858;
float2 l9_5859=float2(0.0);
l9_5859=l9_5857;
float2 l9_5860=float2(0.0);
l9_5860=(l9_5792*l9_5856)+l9_5859;
l9_5719=l9_5860;
l9_5721=l9_5719;
}
l9_5717=l9_5721;
l9_5713=l9_5717;
l9_5716=l9_5713;
}
else
{
float2 l9_5861=float2(0.0);
l9_5861=l9_5715.Surface_UVCoord0;
l9_5714=l9_5861;
l9_5716=l9_5714;
}
l9_5712=l9_5716;
float2 l9_5862=float2(0.0);
l9_5862=l9_5712;
float2 l9_5863=float2(0.0);
l9_5863=l9_5862;
l9_5656=l9_5863;
l9_5659=l9_5656;
}
else
{
float2 l9_5864=float2(0.0);
l9_5864=l9_5658.Surface_UVCoord0;
l9_5657=l9_5864;
l9_5659=l9_5657;
}
}
}
}
l9_5652=l9_5659;
float4 l9_5865=float4(0.0);
float2 l9_5866=l9_5652;
int l9_5867=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_5868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5868=0;
}
else
{
l9_5868=in.varStereoViewID;
}
int l9_5869=l9_5868;
l9_5867=1-l9_5869;
}
else
{
int l9_5870=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5870=0;
}
else
{
l9_5870=in.varStereoViewID;
}
int l9_5871=l9_5870;
l9_5867=l9_5871;
}
int l9_5872=l9_5867;
int l9_5873=detailNormalTexLayout_tmp;
int l9_5874=l9_5872;
float2 l9_5875=l9_5866;
bool l9_5876=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_5877=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_5878=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_5879=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_5880=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_5881=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_5882=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_5883=0.0;
bool l9_5884=l9_5881&&(!l9_5879);
float l9_5885=1.0;
float l9_5886=l9_5875.x;
int l9_5887=l9_5878.x;
if (l9_5887==1)
{
l9_5886=fract(l9_5886);
}
else
{
if (l9_5887==2)
{
float l9_5888=fract(l9_5886);
float l9_5889=l9_5886-l9_5888;
float l9_5890=step(0.25,fract(l9_5889*0.5));
l9_5886=mix(l9_5888,1.0-l9_5888,fast::clamp(l9_5890,0.0,1.0));
}
}
l9_5875.x=l9_5886;
float l9_5891=l9_5875.y;
int l9_5892=l9_5878.y;
if (l9_5892==1)
{
l9_5891=fract(l9_5891);
}
else
{
if (l9_5892==2)
{
float l9_5893=fract(l9_5891);
float l9_5894=l9_5891-l9_5893;
float l9_5895=step(0.25,fract(l9_5894*0.5));
l9_5891=mix(l9_5893,1.0-l9_5893,fast::clamp(l9_5895,0.0,1.0));
}
}
l9_5875.y=l9_5891;
if (l9_5879)
{
bool l9_5896=l9_5881;
bool l9_5897;
if (l9_5896)
{
l9_5897=l9_5878.x==3;
}
else
{
l9_5897=l9_5896;
}
float l9_5898=l9_5875.x;
float l9_5899=l9_5880.x;
float l9_5900=l9_5880.z;
bool l9_5901=l9_5897;
float l9_5902=l9_5885;
float l9_5903=fast::clamp(l9_5898,l9_5899,l9_5900);
float l9_5904=step(abs(l9_5898-l9_5903),9.9999997e-06);
l9_5902*=(l9_5904+((1.0-float(l9_5901))*(1.0-l9_5904)));
l9_5898=l9_5903;
l9_5875.x=l9_5898;
l9_5885=l9_5902;
bool l9_5905=l9_5881;
bool l9_5906;
if (l9_5905)
{
l9_5906=l9_5878.y==3;
}
else
{
l9_5906=l9_5905;
}
float l9_5907=l9_5875.y;
float l9_5908=l9_5880.y;
float l9_5909=l9_5880.w;
bool l9_5910=l9_5906;
float l9_5911=l9_5885;
float l9_5912=fast::clamp(l9_5907,l9_5908,l9_5909);
float l9_5913=step(abs(l9_5907-l9_5912),9.9999997e-06);
l9_5911*=(l9_5913+((1.0-float(l9_5910))*(1.0-l9_5913)));
l9_5907=l9_5912;
l9_5875.y=l9_5907;
l9_5885=l9_5911;
}
float2 l9_5914=l9_5875;
bool l9_5915=l9_5876;
float3x3 l9_5916=l9_5877;
if (l9_5915)
{
l9_5914=float2((l9_5916*float3(l9_5914,1.0)).xy);
}
float2 l9_5917=l9_5914;
float2 l9_5918=l9_5917;
float2 l9_5919=l9_5918;
l9_5875=l9_5919;
float l9_5920=l9_5875.x;
int l9_5921=l9_5878.x;
bool l9_5922=l9_5884;
float l9_5923=l9_5885;
if ((l9_5921==0)||(l9_5921==3))
{
float l9_5924=l9_5920;
float l9_5925=0.0;
float l9_5926=1.0;
bool l9_5927=l9_5922;
float l9_5928=l9_5923;
float l9_5929=fast::clamp(l9_5924,l9_5925,l9_5926);
float l9_5930=step(abs(l9_5924-l9_5929),9.9999997e-06);
l9_5928*=(l9_5930+((1.0-float(l9_5927))*(1.0-l9_5930)));
l9_5924=l9_5929;
l9_5920=l9_5924;
l9_5923=l9_5928;
}
l9_5875.x=l9_5920;
l9_5885=l9_5923;
float l9_5931=l9_5875.y;
int l9_5932=l9_5878.y;
bool l9_5933=l9_5884;
float l9_5934=l9_5885;
if ((l9_5932==0)||(l9_5932==3))
{
float l9_5935=l9_5931;
float l9_5936=0.0;
float l9_5937=1.0;
bool l9_5938=l9_5933;
float l9_5939=l9_5934;
float l9_5940=fast::clamp(l9_5935,l9_5936,l9_5937);
float l9_5941=step(abs(l9_5935-l9_5940),9.9999997e-06);
l9_5939*=(l9_5941+((1.0-float(l9_5938))*(1.0-l9_5941)));
l9_5935=l9_5940;
l9_5931=l9_5935;
l9_5934=l9_5939;
}
l9_5875.y=l9_5931;
l9_5885=l9_5934;
float2 l9_5942=l9_5875;
int l9_5943=l9_5873;
int l9_5944=l9_5874;
float l9_5945=l9_5883;
float2 l9_5946=l9_5942;
int l9_5947=l9_5943;
int l9_5948=l9_5944;
float3 l9_5949=float3(0.0);
if (l9_5947==0)
{
l9_5949=float3(l9_5946,0.0);
}
else
{
if (l9_5947==1)
{
l9_5949=float3(l9_5946.x,(l9_5946.y*0.5)+(0.5-(float(l9_5948)*0.5)),0.0);
}
else
{
l9_5949=float3(l9_5946,float(l9_5948));
}
}
float3 l9_5950=l9_5949;
float3 l9_5951=l9_5950;
float2 l9_5952=l9_5951.xy;
float l9_5953=l9_5945;
float4 l9_5954=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_5952,bias(l9_5953));
float4 l9_5955=l9_5954;
float4 l9_5956=l9_5955;
if (l9_5881)
{
l9_5956=mix(l9_5882,l9_5956,float4(l9_5885));
}
float4 l9_5957=l9_5956;
float4 l9_5958=l9_5957;
float3 l9_5959=(l9_5958.xyz*1.9921875)-float3(1.0);
l9_5958=float4(l9_5959.x,l9_5959.y,l9_5959.z,l9_5958.w);
l9_5865=l9_5958;
l9_5648=l9_5865.xyz;
l9_5651=l9_5648;
}
else
{
l9_5651=l9_5649;
}
l9_5647=l9_5651;
float3 l9_5960=float3(0.0);
float3 l9_5961=l9_5552.xyz;
float l9_5962=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_5963=l9_5647;
float l9_5964=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_5965=l9_5961;
float l9_5966=l9_5962;
float3 l9_5967=l9_5963;
float l9_5968=l9_5964;
float3 l9_5969=mix(float3(0.0,0.0,1.0),l9_5965,float3(l9_5966))+float3(0.0,0.0,1.0);
float3 l9_5970=mix(float3(0.0,0.0,1.0),l9_5967,float3(l9_5968))*float3(-1.0,-1.0,1.0);
float3 l9_5971=normalize((l9_5969*dot(l9_5969,l9_5970))-(l9_5970*l9_5969.z));
l9_5963=l9_5971;
float3 l9_5972=l9_5963;
l9_5960=l9_5972;
float3 l9_5973=float3(0.0);
l9_5973=l9_5338*l9_5960;
float3 l9_5974=float3(0.0);
float3 l9_5975=l9_5973;
float l9_5976=dot(l9_5975,l9_5975);
float l9_5977;
if (l9_5976>0.0)
{
l9_5977=1.0/sqrt(l9_5976);
}
else
{
l9_5977=0.0;
}
float l9_5978=l9_5977;
float3 l9_5979=l9_5975*l9_5978;
l9_5974=l9_5979;
l9_5331=l9_5974;
l9_5334=l9_5331;
}
else
{
float3 l9_5980=float3(0.0);
l9_5980=l9_5333.VertexNormal_WorldSpace;
float3 l9_5981=float3(0.0);
float3 l9_5982=l9_5980;
float l9_5983=dot(l9_5982,l9_5982);
float l9_5984;
if (l9_5983>0.0)
{
l9_5984=1.0/sqrt(l9_5983);
}
else
{
l9_5984=0.0;
}
float l9_5985=l9_5984;
float3 l9_5986=l9_5982*l9_5985;
l9_5981=l9_5986;
l9_5332=l9_5981;
l9_5334=l9_5332;
}
l9_5330=l9_5334;
float3 l9_5987=float3(0.0);
l9_5987=l9_5330;
float3 l9_5988=float3(0.0);
l9_5988=l9_5987;
float3 l9_5989=float3(0.0);
l9_5989=-l9_4666.ViewDirWS;
float l9_5990=0.0;
l9_5990=dot(l9_5988,l9_5989);
float l9_5991=0.0;
l9_5991=abs(l9_5990);
float l9_5992=0.0;
l9_5992=1.0-l9_5991;
l9_4665=l9_5992;
l9_4667=l9_4665;
}
l9_4663=l9_4667;
float l9_5993=0.0;
float l9_5994=(*sc_set0.UserUniforms).rimExponent;
l9_5993=l9_5994;
float l9_5995=0.0;
l9_5995=l9_5993;
float l9_5996=0.0;
float l9_5997;
if (l9_4663<=0.0)
{
l9_5997=0.0;
}
else
{
l9_5997=pow(l9_4663,l9_5995);
}
l9_5996=l9_5997;
float3 l9_5998=float3(0.0);
l9_5998=l9_4659*float3(l9_5996);
param_29=l9_5998;
param_31=param_29;
}
else
{
param_31=param_30;
}
Result_N173=param_31;
float3 Export_N347=float3(0.0);
Export_N347=Result_N173;
float3 Value_N306=float3(0.0);
Value_N306=Export_N347;
float3 Output_N299=float3(0.0);
Output_N299=(Result_N103+Value_N298)+Value_N306;
float3 Output_N251=float3(0.0);
float3 param_33=Output_N299;
float3 l9_5999;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_5999=float3(pow(param_33.x,0.45454544),pow(param_33.y,0.45454544),pow(param_33.z,0.45454544));
}
else
{
l9_5999=sqrt(param_33);
}
float3 l9_6000=l9_5999;
Output_N251=l9_6000;
float3 Export_N300=float3(0.0);
Export_N300=Output_N251;
float Output_N242=0.0;
float param_34=(*sc_set0.UserUniforms).metallic;
Output_N242=param_34;
float Value_N277=0.0;
Value_N277=Output_N242;
float2 Result_N176=float2(0.0);
float2 param_35=float2(0.0);
float2 param_36=float2(0.0);
float2 param_37=float2(0.0);
float2 param_38=float2(0.0);
float2 param_39=float2(0.0);
ssGlobals param_41=Globals;
float2 param_40;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6001=float2(0.0);
l9_6001=param_41.Surface_UVCoord0;
param_35=l9_6001;
param_40=param_35;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6002=float2(0.0);
l9_6002=param_41.Surface_UVCoord1;
param_36=l9_6002;
param_40=param_36;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6003=float2(0.0);
float2 l9_6004=float2(0.0);
float2 l9_6005=float2(0.0);
ssGlobals l9_6006=param_41;
float2 l9_6007;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6008=float2(0.0);
float2 l9_6009=float2(0.0);
float2 l9_6010=float2(0.0);
ssGlobals l9_6011=l9_6006;
float2 l9_6012;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6013=float2(0.0);
float2 l9_6014=float2(0.0);
float2 l9_6015=float2(0.0);
float2 l9_6016=float2(0.0);
float2 l9_6017=float2(0.0);
ssGlobals l9_6018=l9_6011;
float2 l9_6019;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6020=float2(0.0);
l9_6020=l9_6018.Surface_UVCoord0;
l9_6014=l9_6020;
l9_6019=l9_6014;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6021=float2(0.0);
l9_6021=l9_6018.Surface_UVCoord1;
l9_6015=l9_6021;
l9_6019=l9_6015;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6022=float2(0.0);
l9_6022=l9_6018.gScreenCoord;
l9_6016=l9_6022;
l9_6019=l9_6016;
}
else
{
float2 l9_6023=float2(0.0);
l9_6023=l9_6018.Surface_UVCoord0;
l9_6017=l9_6023;
l9_6019=l9_6017;
}
}
}
l9_6013=l9_6019;
float2 l9_6024=float2(0.0);
float2 l9_6025=(*sc_set0.UserUniforms).uv2Scale;
l9_6024=l9_6025;
float2 l9_6026=float2(0.0);
l9_6026=l9_6024;
float2 l9_6027=float2(0.0);
float2 l9_6028=(*sc_set0.UserUniforms).uv2Offset;
l9_6027=l9_6028;
float2 l9_6029=float2(0.0);
l9_6029=l9_6027;
float2 l9_6030=float2(0.0);
l9_6030=(l9_6013*l9_6026)+l9_6029;
float2 l9_6031=float2(0.0);
l9_6031=l9_6030+(l9_6029*(l9_6011.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6009=l9_6031;
l9_6012=l9_6009;
}
else
{
float2 l9_6032=float2(0.0);
float2 l9_6033=float2(0.0);
float2 l9_6034=float2(0.0);
float2 l9_6035=float2(0.0);
float2 l9_6036=float2(0.0);
ssGlobals l9_6037=l9_6011;
float2 l9_6038;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6039=float2(0.0);
l9_6039=l9_6037.Surface_UVCoord0;
l9_6033=l9_6039;
l9_6038=l9_6033;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6040=float2(0.0);
l9_6040=l9_6037.Surface_UVCoord1;
l9_6034=l9_6040;
l9_6038=l9_6034;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6041=float2(0.0);
l9_6041=l9_6037.gScreenCoord;
l9_6035=l9_6041;
l9_6038=l9_6035;
}
else
{
float2 l9_6042=float2(0.0);
l9_6042=l9_6037.Surface_UVCoord0;
l9_6036=l9_6042;
l9_6038=l9_6036;
}
}
}
l9_6032=l9_6038;
float2 l9_6043=float2(0.0);
float2 l9_6044=(*sc_set0.UserUniforms).uv2Scale;
l9_6043=l9_6044;
float2 l9_6045=float2(0.0);
l9_6045=l9_6043;
float2 l9_6046=float2(0.0);
float2 l9_6047=(*sc_set0.UserUniforms).uv2Offset;
l9_6046=l9_6047;
float2 l9_6048=float2(0.0);
l9_6048=l9_6046;
float2 l9_6049=float2(0.0);
l9_6049=(l9_6032*l9_6045)+l9_6048;
l9_6010=l9_6049;
l9_6012=l9_6010;
}
l9_6008=l9_6012;
l9_6004=l9_6008;
l9_6007=l9_6004;
}
else
{
float2 l9_6050=float2(0.0);
l9_6050=l9_6006.Surface_UVCoord0;
l9_6005=l9_6050;
l9_6007=l9_6005;
}
l9_6003=l9_6007;
float2 l9_6051=float2(0.0);
l9_6051=l9_6003;
float2 l9_6052=float2(0.0);
l9_6052=l9_6051;
param_37=l9_6052;
param_40=param_37;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6053=float2(0.0);
float2 l9_6054=float2(0.0);
float2 l9_6055=float2(0.0);
ssGlobals l9_6056=param_41;
float2 l9_6057;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_6058=float2(0.0);
float2 l9_6059=float2(0.0);
float2 l9_6060=float2(0.0);
ssGlobals l9_6061=l9_6056;
float2 l9_6062;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_6063=float2(0.0);
float2 l9_6064=float2(0.0);
float2 l9_6065=float2(0.0);
float2 l9_6066=float2(0.0);
float2 l9_6067=float2(0.0);
float2 l9_6068=float2(0.0);
ssGlobals l9_6069=l9_6061;
float2 l9_6070;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6071=float2(0.0);
l9_6071=l9_6069.Surface_UVCoord0;
l9_6064=l9_6071;
l9_6070=l9_6064;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6072=float2(0.0);
l9_6072=l9_6069.Surface_UVCoord1;
l9_6065=l9_6072;
l9_6070=l9_6065;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6073=float2(0.0);
l9_6073=l9_6069.gScreenCoord;
l9_6066=l9_6073;
l9_6070=l9_6066;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6074=float2(0.0);
float2 l9_6075=float2(0.0);
float2 l9_6076=float2(0.0);
ssGlobals l9_6077=l9_6069;
float2 l9_6078;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6079=float2(0.0);
float2 l9_6080=float2(0.0);
float2 l9_6081=float2(0.0);
ssGlobals l9_6082=l9_6077;
float2 l9_6083;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6084=float2(0.0);
float2 l9_6085=float2(0.0);
float2 l9_6086=float2(0.0);
float2 l9_6087=float2(0.0);
float2 l9_6088=float2(0.0);
ssGlobals l9_6089=l9_6082;
float2 l9_6090;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6091=float2(0.0);
l9_6091=l9_6089.Surface_UVCoord0;
l9_6085=l9_6091;
l9_6090=l9_6085;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6092=float2(0.0);
l9_6092=l9_6089.Surface_UVCoord1;
l9_6086=l9_6092;
l9_6090=l9_6086;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6093=float2(0.0);
l9_6093=l9_6089.gScreenCoord;
l9_6087=l9_6093;
l9_6090=l9_6087;
}
else
{
float2 l9_6094=float2(0.0);
l9_6094=l9_6089.Surface_UVCoord0;
l9_6088=l9_6094;
l9_6090=l9_6088;
}
}
}
l9_6084=l9_6090;
float2 l9_6095=float2(0.0);
float2 l9_6096=(*sc_set0.UserUniforms).uv2Scale;
l9_6095=l9_6096;
float2 l9_6097=float2(0.0);
l9_6097=l9_6095;
float2 l9_6098=float2(0.0);
float2 l9_6099=(*sc_set0.UserUniforms).uv2Offset;
l9_6098=l9_6099;
float2 l9_6100=float2(0.0);
l9_6100=l9_6098;
float2 l9_6101=float2(0.0);
l9_6101=(l9_6084*l9_6097)+l9_6100;
float2 l9_6102=float2(0.0);
l9_6102=l9_6101+(l9_6100*(l9_6082.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6080=l9_6102;
l9_6083=l9_6080;
}
else
{
float2 l9_6103=float2(0.0);
float2 l9_6104=float2(0.0);
float2 l9_6105=float2(0.0);
float2 l9_6106=float2(0.0);
float2 l9_6107=float2(0.0);
ssGlobals l9_6108=l9_6082;
float2 l9_6109;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6110=float2(0.0);
l9_6110=l9_6108.Surface_UVCoord0;
l9_6104=l9_6110;
l9_6109=l9_6104;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6111=float2(0.0);
l9_6111=l9_6108.Surface_UVCoord1;
l9_6105=l9_6111;
l9_6109=l9_6105;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6112=float2(0.0);
l9_6112=l9_6108.gScreenCoord;
l9_6106=l9_6112;
l9_6109=l9_6106;
}
else
{
float2 l9_6113=float2(0.0);
l9_6113=l9_6108.Surface_UVCoord0;
l9_6107=l9_6113;
l9_6109=l9_6107;
}
}
}
l9_6103=l9_6109;
float2 l9_6114=float2(0.0);
float2 l9_6115=(*sc_set0.UserUniforms).uv2Scale;
l9_6114=l9_6115;
float2 l9_6116=float2(0.0);
l9_6116=l9_6114;
float2 l9_6117=float2(0.0);
float2 l9_6118=(*sc_set0.UserUniforms).uv2Offset;
l9_6117=l9_6118;
float2 l9_6119=float2(0.0);
l9_6119=l9_6117;
float2 l9_6120=float2(0.0);
l9_6120=(l9_6103*l9_6116)+l9_6119;
l9_6081=l9_6120;
l9_6083=l9_6081;
}
l9_6079=l9_6083;
l9_6075=l9_6079;
l9_6078=l9_6075;
}
else
{
float2 l9_6121=float2(0.0);
l9_6121=l9_6077.Surface_UVCoord0;
l9_6076=l9_6121;
l9_6078=l9_6076;
}
l9_6074=l9_6078;
float2 l9_6122=float2(0.0);
l9_6122=l9_6074;
float2 l9_6123=float2(0.0);
l9_6123=l9_6122;
l9_6067=l9_6123;
l9_6070=l9_6067;
}
else
{
float2 l9_6124=float2(0.0);
l9_6124=l9_6069.Surface_UVCoord0;
l9_6068=l9_6124;
l9_6070=l9_6068;
}
}
}
}
l9_6063=l9_6070;
float2 l9_6125=float2(0.0);
float2 l9_6126=(*sc_set0.UserUniforms).uv3Scale;
l9_6125=l9_6126;
float2 l9_6127=float2(0.0);
l9_6127=l9_6125;
float2 l9_6128=float2(0.0);
float2 l9_6129=(*sc_set0.UserUniforms).uv3Offset;
l9_6128=l9_6129;
float2 l9_6130=float2(0.0);
l9_6130=l9_6128;
float2 l9_6131=float2(0.0);
l9_6131=(l9_6063*l9_6127)+l9_6130;
float2 l9_6132=float2(0.0);
l9_6132=l9_6131+(l9_6130*(l9_6061.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6059=l9_6132;
l9_6062=l9_6059;
}
else
{
float2 l9_6133=float2(0.0);
float2 l9_6134=float2(0.0);
float2 l9_6135=float2(0.0);
float2 l9_6136=float2(0.0);
float2 l9_6137=float2(0.0);
float2 l9_6138=float2(0.0);
ssGlobals l9_6139=l9_6061;
float2 l9_6140;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6141=float2(0.0);
l9_6141=l9_6139.Surface_UVCoord0;
l9_6134=l9_6141;
l9_6140=l9_6134;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6142=float2(0.0);
l9_6142=l9_6139.Surface_UVCoord1;
l9_6135=l9_6142;
l9_6140=l9_6135;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6143=float2(0.0);
l9_6143=l9_6139.gScreenCoord;
l9_6136=l9_6143;
l9_6140=l9_6136;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6144=float2(0.0);
float2 l9_6145=float2(0.0);
float2 l9_6146=float2(0.0);
ssGlobals l9_6147=l9_6139;
float2 l9_6148;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6149=float2(0.0);
float2 l9_6150=float2(0.0);
float2 l9_6151=float2(0.0);
ssGlobals l9_6152=l9_6147;
float2 l9_6153;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6154=float2(0.0);
float2 l9_6155=float2(0.0);
float2 l9_6156=float2(0.0);
float2 l9_6157=float2(0.0);
float2 l9_6158=float2(0.0);
ssGlobals l9_6159=l9_6152;
float2 l9_6160;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6161=float2(0.0);
l9_6161=l9_6159.Surface_UVCoord0;
l9_6155=l9_6161;
l9_6160=l9_6155;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6162=float2(0.0);
l9_6162=l9_6159.Surface_UVCoord1;
l9_6156=l9_6162;
l9_6160=l9_6156;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6163=float2(0.0);
l9_6163=l9_6159.gScreenCoord;
l9_6157=l9_6163;
l9_6160=l9_6157;
}
else
{
float2 l9_6164=float2(0.0);
l9_6164=l9_6159.Surface_UVCoord0;
l9_6158=l9_6164;
l9_6160=l9_6158;
}
}
}
l9_6154=l9_6160;
float2 l9_6165=float2(0.0);
float2 l9_6166=(*sc_set0.UserUniforms).uv2Scale;
l9_6165=l9_6166;
float2 l9_6167=float2(0.0);
l9_6167=l9_6165;
float2 l9_6168=float2(0.0);
float2 l9_6169=(*sc_set0.UserUniforms).uv2Offset;
l9_6168=l9_6169;
float2 l9_6170=float2(0.0);
l9_6170=l9_6168;
float2 l9_6171=float2(0.0);
l9_6171=(l9_6154*l9_6167)+l9_6170;
float2 l9_6172=float2(0.0);
l9_6172=l9_6171+(l9_6170*(l9_6152.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6150=l9_6172;
l9_6153=l9_6150;
}
else
{
float2 l9_6173=float2(0.0);
float2 l9_6174=float2(0.0);
float2 l9_6175=float2(0.0);
float2 l9_6176=float2(0.0);
float2 l9_6177=float2(0.0);
ssGlobals l9_6178=l9_6152;
float2 l9_6179;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6180=float2(0.0);
l9_6180=l9_6178.Surface_UVCoord0;
l9_6174=l9_6180;
l9_6179=l9_6174;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6181=float2(0.0);
l9_6181=l9_6178.Surface_UVCoord1;
l9_6175=l9_6181;
l9_6179=l9_6175;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6182=float2(0.0);
l9_6182=l9_6178.gScreenCoord;
l9_6176=l9_6182;
l9_6179=l9_6176;
}
else
{
float2 l9_6183=float2(0.0);
l9_6183=l9_6178.Surface_UVCoord0;
l9_6177=l9_6183;
l9_6179=l9_6177;
}
}
}
l9_6173=l9_6179;
float2 l9_6184=float2(0.0);
float2 l9_6185=(*sc_set0.UserUniforms).uv2Scale;
l9_6184=l9_6185;
float2 l9_6186=float2(0.0);
l9_6186=l9_6184;
float2 l9_6187=float2(0.0);
float2 l9_6188=(*sc_set0.UserUniforms).uv2Offset;
l9_6187=l9_6188;
float2 l9_6189=float2(0.0);
l9_6189=l9_6187;
float2 l9_6190=float2(0.0);
l9_6190=(l9_6173*l9_6186)+l9_6189;
l9_6151=l9_6190;
l9_6153=l9_6151;
}
l9_6149=l9_6153;
l9_6145=l9_6149;
l9_6148=l9_6145;
}
else
{
float2 l9_6191=float2(0.0);
l9_6191=l9_6147.Surface_UVCoord0;
l9_6146=l9_6191;
l9_6148=l9_6146;
}
l9_6144=l9_6148;
float2 l9_6192=float2(0.0);
l9_6192=l9_6144;
float2 l9_6193=float2(0.0);
l9_6193=l9_6192;
l9_6137=l9_6193;
l9_6140=l9_6137;
}
else
{
float2 l9_6194=float2(0.0);
l9_6194=l9_6139.Surface_UVCoord0;
l9_6138=l9_6194;
l9_6140=l9_6138;
}
}
}
}
l9_6133=l9_6140;
float2 l9_6195=float2(0.0);
float2 l9_6196=(*sc_set0.UserUniforms).uv3Scale;
l9_6195=l9_6196;
float2 l9_6197=float2(0.0);
l9_6197=l9_6195;
float2 l9_6198=float2(0.0);
float2 l9_6199=(*sc_set0.UserUniforms).uv3Offset;
l9_6198=l9_6199;
float2 l9_6200=float2(0.0);
l9_6200=l9_6198;
float2 l9_6201=float2(0.0);
l9_6201=(l9_6133*l9_6197)+l9_6200;
l9_6060=l9_6201;
l9_6062=l9_6060;
}
l9_6058=l9_6062;
l9_6054=l9_6058;
l9_6057=l9_6054;
}
else
{
float2 l9_6202=float2(0.0);
l9_6202=l9_6056.Surface_UVCoord0;
l9_6055=l9_6202;
l9_6057=l9_6055;
}
l9_6053=l9_6057;
float2 l9_6203=float2(0.0);
l9_6203=l9_6053;
float2 l9_6204=float2(0.0);
l9_6204=l9_6203;
param_38=l9_6204;
param_40=param_38;
}
else
{
float2 l9_6205=float2(0.0);
l9_6205=param_41.Surface_UVCoord0;
param_39=l9_6205;
param_40=param_39;
}
}
}
}
Result_N176=param_40;
float4 Color_N66=float4(0.0);
int l9_6206=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6207=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6207=0;
}
else
{
l9_6207=in.varStereoViewID;
}
int l9_6208=l9_6207;
l9_6206=1-l9_6208;
}
else
{
int l9_6209=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6209=0;
}
else
{
l9_6209=in.varStereoViewID;
}
int l9_6210=l9_6209;
l9_6206=l9_6210;
}
int l9_6211=l9_6206;
int param_42=materialParamsTexLayout_tmp;
int param_43=l9_6211;
float2 param_44=Result_N176;
bool param_45=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_46=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_47=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_48=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_49=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_50=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_51=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_52=0.0;
bool l9_6212=param_50&&(!param_48);
float l9_6213=1.0;
float l9_6214=param_44.x;
int l9_6215=param_47.x;
if (l9_6215==1)
{
l9_6214=fract(l9_6214);
}
else
{
if (l9_6215==2)
{
float l9_6216=fract(l9_6214);
float l9_6217=l9_6214-l9_6216;
float l9_6218=step(0.25,fract(l9_6217*0.5));
l9_6214=mix(l9_6216,1.0-l9_6216,fast::clamp(l9_6218,0.0,1.0));
}
}
param_44.x=l9_6214;
float l9_6219=param_44.y;
int l9_6220=param_47.y;
if (l9_6220==1)
{
l9_6219=fract(l9_6219);
}
else
{
if (l9_6220==2)
{
float l9_6221=fract(l9_6219);
float l9_6222=l9_6219-l9_6221;
float l9_6223=step(0.25,fract(l9_6222*0.5));
l9_6219=mix(l9_6221,1.0-l9_6221,fast::clamp(l9_6223,0.0,1.0));
}
}
param_44.y=l9_6219;
if (param_48)
{
bool l9_6224=param_50;
bool l9_6225;
if (l9_6224)
{
l9_6225=param_47.x==3;
}
else
{
l9_6225=l9_6224;
}
float l9_6226=param_44.x;
float l9_6227=param_49.x;
float l9_6228=param_49.z;
bool l9_6229=l9_6225;
float l9_6230=l9_6213;
float l9_6231=fast::clamp(l9_6226,l9_6227,l9_6228);
float l9_6232=step(abs(l9_6226-l9_6231),9.9999997e-06);
l9_6230*=(l9_6232+((1.0-float(l9_6229))*(1.0-l9_6232)));
l9_6226=l9_6231;
param_44.x=l9_6226;
l9_6213=l9_6230;
bool l9_6233=param_50;
bool l9_6234;
if (l9_6233)
{
l9_6234=param_47.y==3;
}
else
{
l9_6234=l9_6233;
}
float l9_6235=param_44.y;
float l9_6236=param_49.y;
float l9_6237=param_49.w;
bool l9_6238=l9_6234;
float l9_6239=l9_6213;
float l9_6240=fast::clamp(l9_6235,l9_6236,l9_6237);
float l9_6241=step(abs(l9_6235-l9_6240),9.9999997e-06);
l9_6239*=(l9_6241+((1.0-float(l9_6238))*(1.0-l9_6241)));
l9_6235=l9_6240;
param_44.y=l9_6235;
l9_6213=l9_6239;
}
float2 l9_6242=param_44;
bool l9_6243=param_45;
float3x3 l9_6244=param_46;
if (l9_6243)
{
l9_6242=float2((l9_6244*float3(l9_6242,1.0)).xy);
}
float2 l9_6245=l9_6242;
float2 l9_6246=l9_6245;
float2 l9_6247=l9_6246;
param_44=l9_6247;
float l9_6248=param_44.x;
int l9_6249=param_47.x;
bool l9_6250=l9_6212;
float l9_6251=l9_6213;
if ((l9_6249==0)||(l9_6249==3))
{
float l9_6252=l9_6248;
float l9_6253=0.0;
float l9_6254=1.0;
bool l9_6255=l9_6250;
float l9_6256=l9_6251;
float l9_6257=fast::clamp(l9_6252,l9_6253,l9_6254);
float l9_6258=step(abs(l9_6252-l9_6257),9.9999997e-06);
l9_6256*=(l9_6258+((1.0-float(l9_6255))*(1.0-l9_6258)));
l9_6252=l9_6257;
l9_6248=l9_6252;
l9_6251=l9_6256;
}
param_44.x=l9_6248;
l9_6213=l9_6251;
float l9_6259=param_44.y;
int l9_6260=param_47.y;
bool l9_6261=l9_6212;
float l9_6262=l9_6213;
if ((l9_6260==0)||(l9_6260==3))
{
float l9_6263=l9_6259;
float l9_6264=0.0;
float l9_6265=1.0;
bool l9_6266=l9_6261;
float l9_6267=l9_6262;
float l9_6268=fast::clamp(l9_6263,l9_6264,l9_6265);
float l9_6269=step(abs(l9_6263-l9_6268),9.9999997e-06);
l9_6267*=(l9_6269+((1.0-float(l9_6266))*(1.0-l9_6269)));
l9_6263=l9_6268;
l9_6259=l9_6263;
l9_6262=l9_6267;
}
param_44.y=l9_6259;
l9_6213=l9_6262;
float2 l9_6270=param_44;
int l9_6271=param_42;
int l9_6272=param_43;
float l9_6273=param_52;
float2 l9_6274=l9_6270;
int l9_6275=l9_6271;
int l9_6276=l9_6272;
float3 l9_6277=float3(0.0);
if (l9_6275==0)
{
l9_6277=float3(l9_6274,0.0);
}
else
{
if (l9_6275==1)
{
l9_6277=float3(l9_6274.x,(l9_6274.y*0.5)+(0.5-(float(l9_6276)*0.5)),0.0);
}
else
{
l9_6277=float3(l9_6274,float(l9_6276));
}
}
float3 l9_6278=l9_6277;
float3 l9_6279=l9_6278;
float2 l9_6280=l9_6279.xy;
float l9_6281=l9_6273;
float4 l9_6282=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6280,bias(l9_6281));
float4 l9_6283=l9_6282;
float4 l9_6284=l9_6283;
if (param_50)
{
l9_6284=mix(param_51,l9_6284,float4(l9_6213));
}
float4 l9_6285=l9_6284;
Color_N66=l9_6285;
float Value1_N304=0.0;
float Value2_N304=0.0;
float2 param_53=Color_N66.xy;
float param_54=param_53.x;
float param_55=param_53.y;
Value1_N304=param_54;
Value2_N304=param_55;
float Output_N317=0.0;
Output_N317=Value_N277*Value1_N304;
float Export_N222=0.0;
Export_N222=Output_N317;
float Output_N243=0.0;
float param_56=(*sc_set0.UserUniforms).roughness;
Output_N243=param_56;
float Value_N278=0.0;
Value_N278=Output_N243;
float Output_N313=0.0;
Output_N313=Value_N278*Value2_N304;
float Export_N224=0.0;
Export_N224=Output_N313;
float3 Result_N188=float3(0.0);
float3 param_57=float3(0.0);
float3 param_58=float3(0.0);
ssGlobals param_60=Globals;
float3 param_59;
if (NODE_38_DROPLIST_ITEM_tmp==3)
{
float4 l9_6286=float4(0.0);
l9_6286=param_60.VertexColor;
float2 l9_6287=float2(0.0);
float2 l9_6288=float2(0.0);
float2 l9_6289=float2(0.0);
float2 l9_6290=float2(0.0);
float2 l9_6291=float2(0.0);
float2 l9_6292=float2(0.0);
ssGlobals l9_6293=param_60;
float2 l9_6294;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6295=float2(0.0);
l9_6295=l9_6293.Surface_UVCoord0;
l9_6288=l9_6295;
l9_6294=l9_6288;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6296=float2(0.0);
l9_6296=l9_6293.Surface_UVCoord1;
l9_6289=l9_6296;
l9_6294=l9_6289;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6297=float2(0.0);
float2 l9_6298=float2(0.0);
float2 l9_6299=float2(0.0);
ssGlobals l9_6300=l9_6293;
float2 l9_6301;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6302=float2(0.0);
float2 l9_6303=float2(0.0);
float2 l9_6304=float2(0.0);
ssGlobals l9_6305=l9_6300;
float2 l9_6306;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6307=float2(0.0);
float2 l9_6308=float2(0.0);
float2 l9_6309=float2(0.0);
float2 l9_6310=float2(0.0);
float2 l9_6311=float2(0.0);
ssGlobals l9_6312=l9_6305;
float2 l9_6313;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6314=float2(0.0);
l9_6314=l9_6312.Surface_UVCoord0;
l9_6308=l9_6314;
l9_6313=l9_6308;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6315=float2(0.0);
l9_6315=l9_6312.Surface_UVCoord1;
l9_6309=l9_6315;
l9_6313=l9_6309;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6316=float2(0.0);
l9_6316=l9_6312.gScreenCoord;
l9_6310=l9_6316;
l9_6313=l9_6310;
}
else
{
float2 l9_6317=float2(0.0);
l9_6317=l9_6312.Surface_UVCoord0;
l9_6311=l9_6317;
l9_6313=l9_6311;
}
}
}
l9_6307=l9_6313;
float2 l9_6318=float2(0.0);
float2 l9_6319=(*sc_set0.UserUniforms).uv2Scale;
l9_6318=l9_6319;
float2 l9_6320=float2(0.0);
l9_6320=l9_6318;
float2 l9_6321=float2(0.0);
float2 l9_6322=(*sc_set0.UserUniforms).uv2Offset;
l9_6321=l9_6322;
float2 l9_6323=float2(0.0);
l9_6323=l9_6321;
float2 l9_6324=float2(0.0);
l9_6324=(l9_6307*l9_6320)+l9_6323;
float2 l9_6325=float2(0.0);
l9_6325=l9_6324+(l9_6323*(l9_6305.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6303=l9_6325;
l9_6306=l9_6303;
}
else
{
float2 l9_6326=float2(0.0);
float2 l9_6327=float2(0.0);
float2 l9_6328=float2(0.0);
float2 l9_6329=float2(0.0);
float2 l9_6330=float2(0.0);
ssGlobals l9_6331=l9_6305;
float2 l9_6332;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6333=float2(0.0);
l9_6333=l9_6331.Surface_UVCoord0;
l9_6327=l9_6333;
l9_6332=l9_6327;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6334=float2(0.0);
l9_6334=l9_6331.Surface_UVCoord1;
l9_6328=l9_6334;
l9_6332=l9_6328;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6335=float2(0.0);
l9_6335=l9_6331.gScreenCoord;
l9_6329=l9_6335;
l9_6332=l9_6329;
}
else
{
float2 l9_6336=float2(0.0);
l9_6336=l9_6331.Surface_UVCoord0;
l9_6330=l9_6336;
l9_6332=l9_6330;
}
}
}
l9_6326=l9_6332;
float2 l9_6337=float2(0.0);
float2 l9_6338=(*sc_set0.UserUniforms).uv2Scale;
l9_6337=l9_6338;
float2 l9_6339=float2(0.0);
l9_6339=l9_6337;
float2 l9_6340=float2(0.0);
float2 l9_6341=(*sc_set0.UserUniforms).uv2Offset;
l9_6340=l9_6341;
float2 l9_6342=float2(0.0);
l9_6342=l9_6340;
float2 l9_6343=float2(0.0);
l9_6343=(l9_6326*l9_6339)+l9_6342;
l9_6304=l9_6343;
l9_6306=l9_6304;
}
l9_6302=l9_6306;
l9_6298=l9_6302;
l9_6301=l9_6298;
}
else
{
float2 l9_6344=float2(0.0);
l9_6344=l9_6300.Surface_UVCoord0;
l9_6299=l9_6344;
l9_6301=l9_6299;
}
l9_6297=l9_6301;
float2 l9_6345=float2(0.0);
l9_6345=l9_6297;
float2 l9_6346=float2(0.0);
l9_6346=l9_6345;
l9_6290=l9_6346;
l9_6294=l9_6290;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6347=float2(0.0);
float2 l9_6348=float2(0.0);
float2 l9_6349=float2(0.0);
ssGlobals l9_6350=l9_6293;
float2 l9_6351;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_6352=float2(0.0);
float2 l9_6353=float2(0.0);
float2 l9_6354=float2(0.0);
ssGlobals l9_6355=l9_6350;
float2 l9_6356;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_6357=float2(0.0);
float2 l9_6358=float2(0.0);
float2 l9_6359=float2(0.0);
float2 l9_6360=float2(0.0);
float2 l9_6361=float2(0.0);
float2 l9_6362=float2(0.0);
ssGlobals l9_6363=l9_6355;
float2 l9_6364;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6365=float2(0.0);
l9_6365=l9_6363.Surface_UVCoord0;
l9_6358=l9_6365;
l9_6364=l9_6358;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6366=float2(0.0);
l9_6366=l9_6363.Surface_UVCoord1;
l9_6359=l9_6366;
l9_6364=l9_6359;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6367=float2(0.0);
l9_6367=l9_6363.gScreenCoord;
l9_6360=l9_6367;
l9_6364=l9_6360;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6368=float2(0.0);
float2 l9_6369=float2(0.0);
float2 l9_6370=float2(0.0);
ssGlobals l9_6371=l9_6363;
float2 l9_6372;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6373=float2(0.0);
float2 l9_6374=float2(0.0);
float2 l9_6375=float2(0.0);
ssGlobals l9_6376=l9_6371;
float2 l9_6377;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6378=float2(0.0);
float2 l9_6379=float2(0.0);
float2 l9_6380=float2(0.0);
float2 l9_6381=float2(0.0);
float2 l9_6382=float2(0.0);
ssGlobals l9_6383=l9_6376;
float2 l9_6384;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6385=float2(0.0);
l9_6385=l9_6383.Surface_UVCoord0;
l9_6379=l9_6385;
l9_6384=l9_6379;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6386=float2(0.0);
l9_6386=l9_6383.Surface_UVCoord1;
l9_6380=l9_6386;
l9_6384=l9_6380;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6387=float2(0.0);
l9_6387=l9_6383.gScreenCoord;
l9_6381=l9_6387;
l9_6384=l9_6381;
}
else
{
float2 l9_6388=float2(0.0);
l9_6388=l9_6383.Surface_UVCoord0;
l9_6382=l9_6388;
l9_6384=l9_6382;
}
}
}
l9_6378=l9_6384;
float2 l9_6389=float2(0.0);
float2 l9_6390=(*sc_set0.UserUniforms).uv2Scale;
l9_6389=l9_6390;
float2 l9_6391=float2(0.0);
l9_6391=l9_6389;
float2 l9_6392=float2(0.0);
float2 l9_6393=(*sc_set0.UserUniforms).uv2Offset;
l9_6392=l9_6393;
float2 l9_6394=float2(0.0);
l9_6394=l9_6392;
float2 l9_6395=float2(0.0);
l9_6395=(l9_6378*l9_6391)+l9_6394;
float2 l9_6396=float2(0.0);
l9_6396=l9_6395+(l9_6394*(l9_6376.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6374=l9_6396;
l9_6377=l9_6374;
}
else
{
float2 l9_6397=float2(0.0);
float2 l9_6398=float2(0.0);
float2 l9_6399=float2(0.0);
float2 l9_6400=float2(0.0);
float2 l9_6401=float2(0.0);
ssGlobals l9_6402=l9_6376;
float2 l9_6403;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6404=float2(0.0);
l9_6404=l9_6402.Surface_UVCoord0;
l9_6398=l9_6404;
l9_6403=l9_6398;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6405=float2(0.0);
l9_6405=l9_6402.Surface_UVCoord1;
l9_6399=l9_6405;
l9_6403=l9_6399;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6406=float2(0.0);
l9_6406=l9_6402.gScreenCoord;
l9_6400=l9_6406;
l9_6403=l9_6400;
}
else
{
float2 l9_6407=float2(0.0);
l9_6407=l9_6402.Surface_UVCoord0;
l9_6401=l9_6407;
l9_6403=l9_6401;
}
}
}
l9_6397=l9_6403;
float2 l9_6408=float2(0.0);
float2 l9_6409=(*sc_set0.UserUniforms).uv2Scale;
l9_6408=l9_6409;
float2 l9_6410=float2(0.0);
l9_6410=l9_6408;
float2 l9_6411=float2(0.0);
float2 l9_6412=(*sc_set0.UserUniforms).uv2Offset;
l9_6411=l9_6412;
float2 l9_6413=float2(0.0);
l9_6413=l9_6411;
float2 l9_6414=float2(0.0);
l9_6414=(l9_6397*l9_6410)+l9_6413;
l9_6375=l9_6414;
l9_6377=l9_6375;
}
l9_6373=l9_6377;
l9_6369=l9_6373;
l9_6372=l9_6369;
}
else
{
float2 l9_6415=float2(0.0);
l9_6415=l9_6371.Surface_UVCoord0;
l9_6370=l9_6415;
l9_6372=l9_6370;
}
l9_6368=l9_6372;
float2 l9_6416=float2(0.0);
l9_6416=l9_6368;
float2 l9_6417=float2(0.0);
l9_6417=l9_6416;
l9_6361=l9_6417;
l9_6364=l9_6361;
}
else
{
float2 l9_6418=float2(0.0);
l9_6418=l9_6363.Surface_UVCoord0;
l9_6362=l9_6418;
l9_6364=l9_6362;
}
}
}
}
l9_6357=l9_6364;
float2 l9_6419=float2(0.0);
float2 l9_6420=(*sc_set0.UserUniforms).uv3Scale;
l9_6419=l9_6420;
float2 l9_6421=float2(0.0);
l9_6421=l9_6419;
float2 l9_6422=float2(0.0);
float2 l9_6423=(*sc_set0.UserUniforms).uv3Offset;
l9_6422=l9_6423;
float2 l9_6424=float2(0.0);
l9_6424=l9_6422;
float2 l9_6425=float2(0.0);
l9_6425=(l9_6357*l9_6421)+l9_6424;
float2 l9_6426=float2(0.0);
l9_6426=l9_6425+(l9_6424*(l9_6355.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6353=l9_6426;
l9_6356=l9_6353;
}
else
{
float2 l9_6427=float2(0.0);
float2 l9_6428=float2(0.0);
float2 l9_6429=float2(0.0);
float2 l9_6430=float2(0.0);
float2 l9_6431=float2(0.0);
float2 l9_6432=float2(0.0);
ssGlobals l9_6433=l9_6355;
float2 l9_6434;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6435=float2(0.0);
l9_6435=l9_6433.Surface_UVCoord0;
l9_6428=l9_6435;
l9_6434=l9_6428;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6436=float2(0.0);
l9_6436=l9_6433.Surface_UVCoord1;
l9_6429=l9_6436;
l9_6434=l9_6429;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6437=float2(0.0);
l9_6437=l9_6433.gScreenCoord;
l9_6430=l9_6437;
l9_6434=l9_6430;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6438=float2(0.0);
float2 l9_6439=float2(0.0);
float2 l9_6440=float2(0.0);
ssGlobals l9_6441=l9_6433;
float2 l9_6442;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6443=float2(0.0);
float2 l9_6444=float2(0.0);
float2 l9_6445=float2(0.0);
ssGlobals l9_6446=l9_6441;
float2 l9_6447;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6448=float2(0.0);
float2 l9_6449=float2(0.0);
float2 l9_6450=float2(0.0);
float2 l9_6451=float2(0.0);
float2 l9_6452=float2(0.0);
ssGlobals l9_6453=l9_6446;
float2 l9_6454;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6455=float2(0.0);
l9_6455=l9_6453.Surface_UVCoord0;
l9_6449=l9_6455;
l9_6454=l9_6449;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6456=float2(0.0);
l9_6456=l9_6453.Surface_UVCoord1;
l9_6450=l9_6456;
l9_6454=l9_6450;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6457=float2(0.0);
l9_6457=l9_6453.gScreenCoord;
l9_6451=l9_6457;
l9_6454=l9_6451;
}
else
{
float2 l9_6458=float2(0.0);
l9_6458=l9_6453.Surface_UVCoord0;
l9_6452=l9_6458;
l9_6454=l9_6452;
}
}
}
l9_6448=l9_6454;
float2 l9_6459=float2(0.0);
float2 l9_6460=(*sc_set0.UserUniforms).uv2Scale;
l9_6459=l9_6460;
float2 l9_6461=float2(0.0);
l9_6461=l9_6459;
float2 l9_6462=float2(0.0);
float2 l9_6463=(*sc_set0.UserUniforms).uv2Offset;
l9_6462=l9_6463;
float2 l9_6464=float2(0.0);
l9_6464=l9_6462;
float2 l9_6465=float2(0.0);
l9_6465=(l9_6448*l9_6461)+l9_6464;
float2 l9_6466=float2(0.0);
l9_6466=l9_6465+(l9_6464*(l9_6446.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6444=l9_6466;
l9_6447=l9_6444;
}
else
{
float2 l9_6467=float2(0.0);
float2 l9_6468=float2(0.0);
float2 l9_6469=float2(0.0);
float2 l9_6470=float2(0.0);
float2 l9_6471=float2(0.0);
ssGlobals l9_6472=l9_6446;
float2 l9_6473;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6474=float2(0.0);
l9_6474=l9_6472.Surface_UVCoord0;
l9_6468=l9_6474;
l9_6473=l9_6468;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6475=float2(0.0);
l9_6475=l9_6472.Surface_UVCoord1;
l9_6469=l9_6475;
l9_6473=l9_6469;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6476=float2(0.0);
l9_6476=l9_6472.gScreenCoord;
l9_6470=l9_6476;
l9_6473=l9_6470;
}
else
{
float2 l9_6477=float2(0.0);
l9_6477=l9_6472.Surface_UVCoord0;
l9_6471=l9_6477;
l9_6473=l9_6471;
}
}
}
l9_6467=l9_6473;
float2 l9_6478=float2(0.0);
float2 l9_6479=(*sc_set0.UserUniforms).uv2Scale;
l9_6478=l9_6479;
float2 l9_6480=float2(0.0);
l9_6480=l9_6478;
float2 l9_6481=float2(0.0);
float2 l9_6482=(*sc_set0.UserUniforms).uv2Offset;
l9_6481=l9_6482;
float2 l9_6483=float2(0.0);
l9_6483=l9_6481;
float2 l9_6484=float2(0.0);
l9_6484=(l9_6467*l9_6480)+l9_6483;
l9_6445=l9_6484;
l9_6447=l9_6445;
}
l9_6443=l9_6447;
l9_6439=l9_6443;
l9_6442=l9_6439;
}
else
{
float2 l9_6485=float2(0.0);
l9_6485=l9_6441.Surface_UVCoord0;
l9_6440=l9_6485;
l9_6442=l9_6440;
}
l9_6438=l9_6442;
float2 l9_6486=float2(0.0);
l9_6486=l9_6438;
float2 l9_6487=float2(0.0);
l9_6487=l9_6486;
l9_6431=l9_6487;
l9_6434=l9_6431;
}
else
{
float2 l9_6488=float2(0.0);
l9_6488=l9_6433.Surface_UVCoord0;
l9_6432=l9_6488;
l9_6434=l9_6432;
}
}
}
}
l9_6427=l9_6434;
float2 l9_6489=float2(0.0);
float2 l9_6490=(*sc_set0.UserUniforms).uv3Scale;
l9_6489=l9_6490;
float2 l9_6491=float2(0.0);
l9_6491=l9_6489;
float2 l9_6492=float2(0.0);
float2 l9_6493=(*sc_set0.UserUniforms).uv3Offset;
l9_6492=l9_6493;
float2 l9_6494=float2(0.0);
l9_6494=l9_6492;
float2 l9_6495=float2(0.0);
l9_6495=(l9_6427*l9_6491)+l9_6494;
l9_6354=l9_6495;
l9_6356=l9_6354;
}
l9_6352=l9_6356;
l9_6348=l9_6352;
l9_6351=l9_6348;
}
else
{
float2 l9_6496=float2(0.0);
l9_6496=l9_6350.Surface_UVCoord0;
l9_6349=l9_6496;
l9_6351=l9_6349;
}
l9_6347=l9_6351;
float2 l9_6497=float2(0.0);
l9_6497=l9_6347;
float2 l9_6498=float2(0.0);
l9_6498=l9_6497;
l9_6291=l9_6498;
l9_6294=l9_6291;
}
else
{
float2 l9_6499=float2(0.0);
l9_6499=l9_6293.Surface_UVCoord0;
l9_6292=l9_6499;
l9_6294=l9_6292;
}
}
}
}
l9_6287=l9_6294;
float4 l9_6500=float4(0.0);
int l9_6501=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6502=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6502=0;
}
else
{
l9_6502=in.varStereoViewID;
}
int l9_6503=l9_6502;
l9_6501=1-l9_6503;
}
else
{
int l9_6504=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6504=0;
}
else
{
l9_6504=in.varStereoViewID;
}
int l9_6505=l9_6504;
l9_6501=l9_6505;
}
int l9_6506=l9_6501;
int l9_6507=materialParamsTexLayout_tmp;
int l9_6508=l9_6506;
float2 l9_6509=l9_6287;
bool l9_6510=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_6511=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_6512=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_6513=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_6514=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_6515=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_6516=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_6517=0.0;
bool l9_6518=l9_6515&&(!l9_6513);
float l9_6519=1.0;
float l9_6520=l9_6509.x;
int l9_6521=l9_6512.x;
if (l9_6521==1)
{
l9_6520=fract(l9_6520);
}
else
{
if (l9_6521==2)
{
float l9_6522=fract(l9_6520);
float l9_6523=l9_6520-l9_6522;
float l9_6524=step(0.25,fract(l9_6523*0.5));
l9_6520=mix(l9_6522,1.0-l9_6522,fast::clamp(l9_6524,0.0,1.0));
}
}
l9_6509.x=l9_6520;
float l9_6525=l9_6509.y;
int l9_6526=l9_6512.y;
if (l9_6526==1)
{
l9_6525=fract(l9_6525);
}
else
{
if (l9_6526==2)
{
float l9_6527=fract(l9_6525);
float l9_6528=l9_6525-l9_6527;
float l9_6529=step(0.25,fract(l9_6528*0.5));
l9_6525=mix(l9_6527,1.0-l9_6527,fast::clamp(l9_6529,0.0,1.0));
}
}
l9_6509.y=l9_6525;
if (l9_6513)
{
bool l9_6530=l9_6515;
bool l9_6531;
if (l9_6530)
{
l9_6531=l9_6512.x==3;
}
else
{
l9_6531=l9_6530;
}
float l9_6532=l9_6509.x;
float l9_6533=l9_6514.x;
float l9_6534=l9_6514.z;
bool l9_6535=l9_6531;
float l9_6536=l9_6519;
float l9_6537=fast::clamp(l9_6532,l9_6533,l9_6534);
float l9_6538=step(abs(l9_6532-l9_6537),9.9999997e-06);
l9_6536*=(l9_6538+((1.0-float(l9_6535))*(1.0-l9_6538)));
l9_6532=l9_6537;
l9_6509.x=l9_6532;
l9_6519=l9_6536;
bool l9_6539=l9_6515;
bool l9_6540;
if (l9_6539)
{
l9_6540=l9_6512.y==3;
}
else
{
l9_6540=l9_6539;
}
float l9_6541=l9_6509.y;
float l9_6542=l9_6514.y;
float l9_6543=l9_6514.w;
bool l9_6544=l9_6540;
float l9_6545=l9_6519;
float l9_6546=fast::clamp(l9_6541,l9_6542,l9_6543);
float l9_6547=step(abs(l9_6541-l9_6546),9.9999997e-06);
l9_6545*=(l9_6547+((1.0-float(l9_6544))*(1.0-l9_6547)));
l9_6541=l9_6546;
l9_6509.y=l9_6541;
l9_6519=l9_6545;
}
float2 l9_6548=l9_6509;
bool l9_6549=l9_6510;
float3x3 l9_6550=l9_6511;
if (l9_6549)
{
l9_6548=float2((l9_6550*float3(l9_6548,1.0)).xy);
}
float2 l9_6551=l9_6548;
float2 l9_6552=l9_6551;
float2 l9_6553=l9_6552;
l9_6509=l9_6553;
float l9_6554=l9_6509.x;
int l9_6555=l9_6512.x;
bool l9_6556=l9_6518;
float l9_6557=l9_6519;
if ((l9_6555==0)||(l9_6555==3))
{
float l9_6558=l9_6554;
float l9_6559=0.0;
float l9_6560=1.0;
bool l9_6561=l9_6556;
float l9_6562=l9_6557;
float l9_6563=fast::clamp(l9_6558,l9_6559,l9_6560);
float l9_6564=step(abs(l9_6558-l9_6563),9.9999997e-06);
l9_6562*=(l9_6564+((1.0-float(l9_6561))*(1.0-l9_6564)));
l9_6558=l9_6563;
l9_6554=l9_6558;
l9_6557=l9_6562;
}
l9_6509.x=l9_6554;
l9_6519=l9_6557;
float l9_6565=l9_6509.y;
int l9_6566=l9_6512.y;
bool l9_6567=l9_6518;
float l9_6568=l9_6519;
if ((l9_6566==0)||(l9_6566==3))
{
float l9_6569=l9_6565;
float l9_6570=0.0;
float l9_6571=1.0;
bool l9_6572=l9_6567;
float l9_6573=l9_6568;
float l9_6574=fast::clamp(l9_6569,l9_6570,l9_6571);
float l9_6575=step(abs(l9_6569-l9_6574),9.9999997e-06);
l9_6573*=(l9_6575+((1.0-float(l9_6572))*(1.0-l9_6575)));
l9_6569=l9_6574;
l9_6565=l9_6569;
l9_6568=l9_6573;
}
l9_6509.y=l9_6565;
l9_6519=l9_6568;
float2 l9_6576=l9_6509;
int l9_6577=l9_6507;
int l9_6578=l9_6508;
float l9_6579=l9_6517;
float2 l9_6580=l9_6576;
int l9_6581=l9_6577;
int l9_6582=l9_6578;
float3 l9_6583=float3(0.0);
if (l9_6581==0)
{
l9_6583=float3(l9_6580,0.0);
}
else
{
if (l9_6581==1)
{
l9_6583=float3(l9_6580.x,(l9_6580.y*0.5)+(0.5-(float(l9_6582)*0.5)),0.0);
}
else
{
l9_6583=float3(l9_6580,float(l9_6582));
}
}
float3 l9_6584=l9_6583;
float3 l9_6585=l9_6584;
float2 l9_6586=l9_6585.xy;
float l9_6587=l9_6579;
float4 l9_6588=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6586,bias(l9_6587));
float4 l9_6589=l9_6588;
float4 l9_6590=l9_6589;
if (l9_6515)
{
l9_6590=mix(l9_6516,l9_6590,float4(l9_6519));
}
float4 l9_6591=l9_6590;
l9_6500=l9_6591;
float3 l9_6592=float3(0.0);
l9_6592=float3(l9_6500.z,l9_6500.z,l9_6500.z);
float3 l9_6593=float3(0.0);
l9_6593=l9_6286.xyz*l9_6592;
param_57=l9_6593;
param_59=param_57;
}
else
{
float2 l9_6594=float2(0.0);
float2 l9_6595=float2(0.0);
float2 l9_6596=float2(0.0);
float2 l9_6597=float2(0.0);
float2 l9_6598=float2(0.0);
float2 l9_6599=float2(0.0);
ssGlobals l9_6600=param_60;
float2 l9_6601;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6602=float2(0.0);
l9_6602=l9_6600.Surface_UVCoord0;
l9_6595=l9_6602;
l9_6601=l9_6595;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6603=float2(0.0);
l9_6603=l9_6600.Surface_UVCoord1;
l9_6596=l9_6603;
l9_6601=l9_6596;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6604=float2(0.0);
float2 l9_6605=float2(0.0);
float2 l9_6606=float2(0.0);
ssGlobals l9_6607=l9_6600;
float2 l9_6608;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6609=float2(0.0);
float2 l9_6610=float2(0.0);
float2 l9_6611=float2(0.0);
ssGlobals l9_6612=l9_6607;
float2 l9_6613;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6614=float2(0.0);
float2 l9_6615=float2(0.0);
float2 l9_6616=float2(0.0);
float2 l9_6617=float2(0.0);
float2 l9_6618=float2(0.0);
ssGlobals l9_6619=l9_6612;
float2 l9_6620;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6621=float2(0.0);
l9_6621=l9_6619.Surface_UVCoord0;
l9_6615=l9_6621;
l9_6620=l9_6615;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6622=float2(0.0);
l9_6622=l9_6619.Surface_UVCoord1;
l9_6616=l9_6622;
l9_6620=l9_6616;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6623=float2(0.0);
l9_6623=l9_6619.gScreenCoord;
l9_6617=l9_6623;
l9_6620=l9_6617;
}
else
{
float2 l9_6624=float2(0.0);
l9_6624=l9_6619.Surface_UVCoord0;
l9_6618=l9_6624;
l9_6620=l9_6618;
}
}
}
l9_6614=l9_6620;
float2 l9_6625=float2(0.0);
float2 l9_6626=(*sc_set0.UserUniforms).uv2Scale;
l9_6625=l9_6626;
float2 l9_6627=float2(0.0);
l9_6627=l9_6625;
float2 l9_6628=float2(0.0);
float2 l9_6629=(*sc_set0.UserUniforms).uv2Offset;
l9_6628=l9_6629;
float2 l9_6630=float2(0.0);
l9_6630=l9_6628;
float2 l9_6631=float2(0.0);
l9_6631=(l9_6614*l9_6627)+l9_6630;
float2 l9_6632=float2(0.0);
l9_6632=l9_6631+(l9_6630*(l9_6612.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6610=l9_6632;
l9_6613=l9_6610;
}
else
{
float2 l9_6633=float2(0.0);
float2 l9_6634=float2(0.0);
float2 l9_6635=float2(0.0);
float2 l9_6636=float2(0.0);
float2 l9_6637=float2(0.0);
ssGlobals l9_6638=l9_6612;
float2 l9_6639;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6640=float2(0.0);
l9_6640=l9_6638.Surface_UVCoord0;
l9_6634=l9_6640;
l9_6639=l9_6634;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6641=float2(0.0);
l9_6641=l9_6638.Surface_UVCoord1;
l9_6635=l9_6641;
l9_6639=l9_6635;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6642=float2(0.0);
l9_6642=l9_6638.gScreenCoord;
l9_6636=l9_6642;
l9_6639=l9_6636;
}
else
{
float2 l9_6643=float2(0.0);
l9_6643=l9_6638.Surface_UVCoord0;
l9_6637=l9_6643;
l9_6639=l9_6637;
}
}
}
l9_6633=l9_6639;
float2 l9_6644=float2(0.0);
float2 l9_6645=(*sc_set0.UserUniforms).uv2Scale;
l9_6644=l9_6645;
float2 l9_6646=float2(0.0);
l9_6646=l9_6644;
float2 l9_6647=float2(0.0);
float2 l9_6648=(*sc_set0.UserUniforms).uv2Offset;
l9_6647=l9_6648;
float2 l9_6649=float2(0.0);
l9_6649=l9_6647;
float2 l9_6650=float2(0.0);
l9_6650=(l9_6633*l9_6646)+l9_6649;
l9_6611=l9_6650;
l9_6613=l9_6611;
}
l9_6609=l9_6613;
l9_6605=l9_6609;
l9_6608=l9_6605;
}
else
{
float2 l9_6651=float2(0.0);
l9_6651=l9_6607.Surface_UVCoord0;
l9_6606=l9_6651;
l9_6608=l9_6606;
}
l9_6604=l9_6608;
float2 l9_6652=float2(0.0);
l9_6652=l9_6604;
float2 l9_6653=float2(0.0);
l9_6653=l9_6652;
l9_6597=l9_6653;
l9_6601=l9_6597;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6654=float2(0.0);
float2 l9_6655=float2(0.0);
float2 l9_6656=float2(0.0);
ssGlobals l9_6657=l9_6600;
float2 l9_6658;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_6659=float2(0.0);
float2 l9_6660=float2(0.0);
float2 l9_6661=float2(0.0);
ssGlobals l9_6662=l9_6657;
float2 l9_6663;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_6664=float2(0.0);
float2 l9_6665=float2(0.0);
float2 l9_6666=float2(0.0);
float2 l9_6667=float2(0.0);
float2 l9_6668=float2(0.0);
float2 l9_6669=float2(0.0);
ssGlobals l9_6670=l9_6662;
float2 l9_6671;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6672=float2(0.0);
l9_6672=l9_6670.Surface_UVCoord0;
l9_6665=l9_6672;
l9_6671=l9_6665;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6673=float2(0.0);
l9_6673=l9_6670.Surface_UVCoord1;
l9_6666=l9_6673;
l9_6671=l9_6666;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6674=float2(0.0);
l9_6674=l9_6670.gScreenCoord;
l9_6667=l9_6674;
l9_6671=l9_6667;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6675=float2(0.0);
float2 l9_6676=float2(0.0);
float2 l9_6677=float2(0.0);
ssGlobals l9_6678=l9_6670;
float2 l9_6679;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6680=float2(0.0);
float2 l9_6681=float2(0.0);
float2 l9_6682=float2(0.0);
ssGlobals l9_6683=l9_6678;
float2 l9_6684;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6685=float2(0.0);
float2 l9_6686=float2(0.0);
float2 l9_6687=float2(0.0);
float2 l9_6688=float2(0.0);
float2 l9_6689=float2(0.0);
ssGlobals l9_6690=l9_6683;
float2 l9_6691;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6692=float2(0.0);
l9_6692=l9_6690.Surface_UVCoord0;
l9_6686=l9_6692;
l9_6691=l9_6686;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6693=float2(0.0);
l9_6693=l9_6690.Surface_UVCoord1;
l9_6687=l9_6693;
l9_6691=l9_6687;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6694=float2(0.0);
l9_6694=l9_6690.gScreenCoord;
l9_6688=l9_6694;
l9_6691=l9_6688;
}
else
{
float2 l9_6695=float2(0.0);
l9_6695=l9_6690.Surface_UVCoord0;
l9_6689=l9_6695;
l9_6691=l9_6689;
}
}
}
l9_6685=l9_6691;
float2 l9_6696=float2(0.0);
float2 l9_6697=(*sc_set0.UserUniforms).uv2Scale;
l9_6696=l9_6697;
float2 l9_6698=float2(0.0);
l9_6698=l9_6696;
float2 l9_6699=float2(0.0);
float2 l9_6700=(*sc_set0.UserUniforms).uv2Offset;
l9_6699=l9_6700;
float2 l9_6701=float2(0.0);
l9_6701=l9_6699;
float2 l9_6702=float2(0.0);
l9_6702=(l9_6685*l9_6698)+l9_6701;
float2 l9_6703=float2(0.0);
l9_6703=l9_6702+(l9_6701*(l9_6683.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6681=l9_6703;
l9_6684=l9_6681;
}
else
{
float2 l9_6704=float2(0.0);
float2 l9_6705=float2(0.0);
float2 l9_6706=float2(0.0);
float2 l9_6707=float2(0.0);
float2 l9_6708=float2(0.0);
ssGlobals l9_6709=l9_6683;
float2 l9_6710;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6711=float2(0.0);
l9_6711=l9_6709.Surface_UVCoord0;
l9_6705=l9_6711;
l9_6710=l9_6705;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6712=float2(0.0);
l9_6712=l9_6709.Surface_UVCoord1;
l9_6706=l9_6712;
l9_6710=l9_6706;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6713=float2(0.0);
l9_6713=l9_6709.gScreenCoord;
l9_6707=l9_6713;
l9_6710=l9_6707;
}
else
{
float2 l9_6714=float2(0.0);
l9_6714=l9_6709.Surface_UVCoord0;
l9_6708=l9_6714;
l9_6710=l9_6708;
}
}
}
l9_6704=l9_6710;
float2 l9_6715=float2(0.0);
float2 l9_6716=(*sc_set0.UserUniforms).uv2Scale;
l9_6715=l9_6716;
float2 l9_6717=float2(0.0);
l9_6717=l9_6715;
float2 l9_6718=float2(0.0);
float2 l9_6719=(*sc_set0.UserUniforms).uv2Offset;
l9_6718=l9_6719;
float2 l9_6720=float2(0.0);
l9_6720=l9_6718;
float2 l9_6721=float2(0.0);
l9_6721=(l9_6704*l9_6717)+l9_6720;
l9_6682=l9_6721;
l9_6684=l9_6682;
}
l9_6680=l9_6684;
l9_6676=l9_6680;
l9_6679=l9_6676;
}
else
{
float2 l9_6722=float2(0.0);
l9_6722=l9_6678.Surface_UVCoord0;
l9_6677=l9_6722;
l9_6679=l9_6677;
}
l9_6675=l9_6679;
float2 l9_6723=float2(0.0);
l9_6723=l9_6675;
float2 l9_6724=float2(0.0);
l9_6724=l9_6723;
l9_6668=l9_6724;
l9_6671=l9_6668;
}
else
{
float2 l9_6725=float2(0.0);
l9_6725=l9_6670.Surface_UVCoord0;
l9_6669=l9_6725;
l9_6671=l9_6669;
}
}
}
}
l9_6664=l9_6671;
float2 l9_6726=float2(0.0);
float2 l9_6727=(*sc_set0.UserUniforms).uv3Scale;
l9_6726=l9_6727;
float2 l9_6728=float2(0.0);
l9_6728=l9_6726;
float2 l9_6729=float2(0.0);
float2 l9_6730=(*sc_set0.UserUniforms).uv3Offset;
l9_6729=l9_6730;
float2 l9_6731=float2(0.0);
l9_6731=l9_6729;
float2 l9_6732=float2(0.0);
l9_6732=(l9_6664*l9_6728)+l9_6731;
float2 l9_6733=float2(0.0);
l9_6733=l9_6732+(l9_6731*(l9_6662.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6660=l9_6733;
l9_6663=l9_6660;
}
else
{
float2 l9_6734=float2(0.0);
float2 l9_6735=float2(0.0);
float2 l9_6736=float2(0.0);
float2 l9_6737=float2(0.0);
float2 l9_6738=float2(0.0);
float2 l9_6739=float2(0.0);
ssGlobals l9_6740=l9_6662;
float2 l9_6741;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6742=float2(0.0);
l9_6742=l9_6740.Surface_UVCoord0;
l9_6735=l9_6742;
l9_6741=l9_6735;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6743=float2(0.0);
l9_6743=l9_6740.Surface_UVCoord1;
l9_6736=l9_6743;
l9_6741=l9_6736;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6744=float2(0.0);
l9_6744=l9_6740.gScreenCoord;
l9_6737=l9_6744;
l9_6741=l9_6737;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6745=float2(0.0);
float2 l9_6746=float2(0.0);
float2 l9_6747=float2(0.0);
ssGlobals l9_6748=l9_6740;
float2 l9_6749;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6750=float2(0.0);
float2 l9_6751=float2(0.0);
float2 l9_6752=float2(0.0);
ssGlobals l9_6753=l9_6748;
float2 l9_6754;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6755=float2(0.0);
float2 l9_6756=float2(0.0);
float2 l9_6757=float2(0.0);
float2 l9_6758=float2(0.0);
float2 l9_6759=float2(0.0);
ssGlobals l9_6760=l9_6753;
float2 l9_6761;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6762=float2(0.0);
l9_6762=l9_6760.Surface_UVCoord0;
l9_6756=l9_6762;
l9_6761=l9_6756;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6763=float2(0.0);
l9_6763=l9_6760.Surface_UVCoord1;
l9_6757=l9_6763;
l9_6761=l9_6757;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6764=float2(0.0);
l9_6764=l9_6760.gScreenCoord;
l9_6758=l9_6764;
l9_6761=l9_6758;
}
else
{
float2 l9_6765=float2(0.0);
l9_6765=l9_6760.Surface_UVCoord0;
l9_6759=l9_6765;
l9_6761=l9_6759;
}
}
}
l9_6755=l9_6761;
float2 l9_6766=float2(0.0);
float2 l9_6767=(*sc_set0.UserUniforms).uv2Scale;
l9_6766=l9_6767;
float2 l9_6768=float2(0.0);
l9_6768=l9_6766;
float2 l9_6769=float2(0.0);
float2 l9_6770=(*sc_set0.UserUniforms).uv2Offset;
l9_6769=l9_6770;
float2 l9_6771=float2(0.0);
l9_6771=l9_6769;
float2 l9_6772=float2(0.0);
l9_6772=(l9_6755*l9_6768)+l9_6771;
float2 l9_6773=float2(0.0);
l9_6773=l9_6772+(l9_6771*(l9_6753.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6751=l9_6773;
l9_6754=l9_6751;
}
else
{
float2 l9_6774=float2(0.0);
float2 l9_6775=float2(0.0);
float2 l9_6776=float2(0.0);
float2 l9_6777=float2(0.0);
float2 l9_6778=float2(0.0);
ssGlobals l9_6779=l9_6753;
float2 l9_6780;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6781=float2(0.0);
l9_6781=l9_6779.Surface_UVCoord0;
l9_6775=l9_6781;
l9_6780=l9_6775;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6782=float2(0.0);
l9_6782=l9_6779.Surface_UVCoord1;
l9_6776=l9_6782;
l9_6780=l9_6776;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6783=float2(0.0);
l9_6783=l9_6779.gScreenCoord;
l9_6777=l9_6783;
l9_6780=l9_6777;
}
else
{
float2 l9_6784=float2(0.0);
l9_6784=l9_6779.Surface_UVCoord0;
l9_6778=l9_6784;
l9_6780=l9_6778;
}
}
}
l9_6774=l9_6780;
float2 l9_6785=float2(0.0);
float2 l9_6786=(*sc_set0.UserUniforms).uv2Scale;
l9_6785=l9_6786;
float2 l9_6787=float2(0.0);
l9_6787=l9_6785;
float2 l9_6788=float2(0.0);
float2 l9_6789=(*sc_set0.UserUniforms).uv2Offset;
l9_6788=l9_6789;
float2 l9_6790=float2(0.0);
l9_6790=l9_6788;
float2 l9_6791=float2(0.0);
l9_6791=(l9_6774*l9_6787)+l9_6790;
l9_6752=l9_6791;
l9_6754=l9_6752;
}
l9_6750=l9_6754;
l9_6746=l9_6750;
l9_6749=l9_6746;
}
else
{
float2 l9_6792=float2(0.0);
l9_6792=l9_6748.Surface_UVCoord0;
l9_6747=l9_6792;
l9_6749=l9_6747;
}
l9_6745=l9_6749;
float2 l9_6793=float2(0.0);
l9_6793=l9_6745;
float2 l9_6794=float2(0.0);
l9_6794=l9_6793;
l9_6738=l9_6794;
l9_6741=l9_6738;
}
else
{
float2 l9_6795=float2(0.0);
l9_6795=l9_6740.Surface_UVCoord0;
l9_6739=l9_6795;
l9_6741=l9_6739;
}
}
}
}
l9_6734=l9_6741;
float2 l9_6796=float2(0.0);
float2 l9_6797=(*sc_set0.UserUniforms).uv3Scale;
l9_6796=l9_6797;
float2 l9_6798=float2(0.0);
l9_6798=l9_6796;
float2 l9_6799=float2(0.0);
float2 l9_6800=(*sc_set0.UserUniforms).uv3Offset;
l9_6799=l9_6800;
float2 l9_6801=float2(0.0);
l9_6801=l9_6799;
float2 l9_6802=float2(0.0);
l9_6802=(l9_6734*l9_6798)+l9_6801;
l9_6661=l9_6802;
l9_6663=l9_6661;
}
l9_6659=l9_6663;
l9_6655=l9_6659;
l9_6658=l9_6655;
}
else
{
float2 l9_6803=float2(0.0);
l9_6803=l9_6657.Surface_UVCoord0;
l9_6656=l9_6803;
l9_6658=l9_6656;
}
l9_6654=l9_6658;
float2 l9_6804=float2(0.0);
l9_6804=l9_6654;
float2 l9_6805=float2(0.0);
l9_6805=l9_6804;
l9_6598=l9_6805;
l9_6601=l9_6598;
}
else
{
float2 l9_6806=float2(0.0);
l9_6806=l9_6600.Surface_UVCoord0;
l9_6599=l9_6806;
l9_6601=l9_6599;
}
}
}
}
l9_6594=l9_6601;
float4 l9_6807=float4(0.0);
int l9_6808=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6809=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6809=0;
}
else
{
l9_6809=in.varStereoViewID;
}
int l9_6810=l9_6809;
l9_6808=1-l9_6810;
}
else
{
int l9_6811=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6811=0;
}
else
{
l9_6811=in.varStereoViewID;
}
int l9_6812=l9_6811;
l9_6808=l9_6812;
}
int l9_6813=l9_6808;
int l9_6814=materialParamsTexLayout_tmp;
int l9_6815=l9_6813;
float2 l9_6816=l9_6594;
bool l9_6817=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_6818=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_6819=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_6820=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_6821=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_6822=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_6823=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_6824=0.0;
bool l9_6825=l9_6822&&(!l9_6820);
float l9_6826=1.0;
float l9_6827=l9_6816.x;
int l9_6828=l9_6819.x;
if (l9_6828==1)
{
l9_6827=fract(l9_6827);
}
else
{
if (l9_6828==2)
{
float l9_6829=fract(l9_6827);
float l9_6830=l9_6827-l9_6829;
float l9_6831=step(0.25,fract(l9_6830*0.5));
l9_6827=mix(l9_6829,1.0-l9_6829,fast::clamp(l9_6831,0.0,1.0));
}
}
l9_6816.x=l9_6827;
float l9_6832=l9_6816.y;
int l9_6833=l9_6819.y;
if (l9_6833==1)
{
l9_6832=fract(l9_6832);
}
else
{
if (l9_6833==2)
{
float l9_6834=fract(l9_6832);
float l9_6835=l9_6832-l9_6834;
float l9_6836=step(0.25,fract(l9_6835*0.5));
l9_6832=mix(l9_6834,1.0-l9_6834,fast::clamp(l9_6836,0.0,1.0));
}
}
l9_6816.y=l9_6832;
if (l9_6820)
{
bool l9_6837=l9_6822;
bool l9_6838;
if (l9_6837)
{
l9_6838=l9_6819.x==3;
}
else
{
l9_6838=l9_6837;
}
float l9_6839=l9_6816.x;
float l9_6840=l9_6821.x;
float l9_6841=l9_6821.z;
bool l9_6842=l9_6838;
float l9_6843=l9_6826;
float l9_6844=fast::clamp(l9_6839,l9_6840,l9_6841);
float l9_6845=step(abs(l9_6839-l9_6844),9.9999997e-06);
l9_6843*=(l9_6845+((1.0-float(l9_6842))*(1.0-l9_6845)));
l9_6839=l9_6844;
l9_6816.x=l9_6839;
l9_6826=l9_6843;
bool l9_6846=l9_6822;
bool l9_6847;
if (l9_6846)
{
l9_6847=l9_6819.y==3;
}
else
{
l9_6847=l9_6846;
}
float l9_6848=l9_6816.y;
float l9_6849=l9_6821.y;
float l9_6850=l9_6821.w;
bool l9_6851=l9_6847;
float l9_6852=l9_6826;
float l9_6853=fast::clamp(l9_6848,l9_6849,l9_6850);
float l9_6854=step(abs(l9_6848-l9_6853),9.9999997e-06);
l9_6852*=(l9_6854+((1.0-float(l9_6851))*(1.0-l9_6854)));
l9_6848=l9_6853;
l9_6816.y=l9_6848;
l9_6826=l9_6852;
}
float2 l9_6855=l9_6816;
bool l9_6856=l9_6817;
float3x3 l9_6857=l9_6818;
if (l9_6856)
{
l9_6855=float2((l9_6857*float3(l9_6855,1.0)).xy);
}
float2 l9_6858=l9_6855;
float2 l9_6859=l9_6858;
float2 l9_6860=l9_6859;
l9_6816=l9_6860;
float l9_6861=l9_6816.x;
int l9_6862=l9_6819.x;
bool l9_6863=l9_6825;
float l9_6864=l9_6826;
if ((l9_6862==0)||(l9_6862==3))
{
float l9_6865=l9_6861;
float l9_6866=0.0;
float l9_6867=1.0;
bool l9_6868=l9_6863;
float l9_6869=l9_6864;
float l9_6870=fast::clamp(l9_6865,l9_6866,l9_6867);
float l9_6871=step(abs(l9_6865-l9_6870),9.9999997e-06);
l9_6869*=(l9_6871+((1.0-float(l9_6868))*(1.0-l9_6871)));
l9_6865=l9_6870;
l9_6861=l9_6865;
l9_6864=l9_6869;
}
l9_6816.x=l9_6861;
l9_6826=l9_6864;
float l9_6872=l9_6816.y;
int l9_6873=l9_6819.y;
bool l9_6874=l9_6825;
float l9_6875=l9_6826;
if ((l9_6873==0)||(l9_6873==3))
{
float l9_6876=l9_6872;
float l9_6877=0.0;
float l9_6878=1.0;
bool l9_6879=l9_6874;
float l9_6880=l9_6875;
float l9_6881=fast::clamp(l9_6876,l9_6877,l9_6878);
float l9_6882=step(abs(l9_6876-l9_6881),9.9999997e-06);
l9_6880*=(l9_6882+((1.0-float(l9_6879))*(1.0-l9_6882)));
l9_6876=l9_6881;
l9_6872=l9_6876;
l9_6875=l9_6880;
}
l9_6816.y=l9_6872;
l9_6826=l9_6875;
float2 l9_6883=l9_6816;
int l9_6884=l9_6814;
int l9_6885=l9_6815;
float l9_6886=l9_6824;
float2 l9_6887=l9_6883;
int l9_6888=l9_6884;
int l9_6889=l9_6885;
float3 l9_6890=float3(0.0);
if (l9_6888==0)
{
l9_6890=float3(l9_6887,0.0);
}
else
{
if (l9_6888==1)
{
l9_6890=float3(l9_6887.x,(l9_6887.y*0.5)+(0.5-(float(l9_6889)*0.5)),0.0);
}
else
{
l9_6890=float3(l9_6887,float(l9_6889));
}
}
float3 l9_6891=l9_6890;
float3 l9_6892=l9_6891;
float2 l9_6893=l9_6892.xy;
float l9_6894=l9_6886;
float4 l9_6895=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6893,bias(l9_6894));
float4 l9_6896=l9_6895;
float4 l9_6897=l9_6896;
if (l9_6822)
{
l9_6897=mix(l9_6823,l9_6897,float4(l9_6826));
}
float4 l9_6898=l9_6897;
l9_6807=l9_6898;
float3 l9_6899=float3(0.0);
l9_6899=float3(l9_6807.z,l9_6807.z,l9_6807.z);
param_58=l9_6899;
param_59=param_58;
}
Result_N188=param_59;
float3 Export_N230=float3(0.0);
Export_N230=Result_N188;
float3 Result_N79=float3(0.0);
float3 param_61=(*sc_set0.UserUniforms).Port_Value1_N079;
float3 param_62=float3(0.0);
ssGlobals param_64=Globals;
float3 param_63;
if ((int(Tweak_N179_tmp)!=0))
{
param_63=param_61;
}
else
{
float3 l9_6900=float3(0.0);
float3 l9_6901=float3(0.0);
float3 l9_6902=(*sc_set0.UserUniforms).Port_Default_N326;
ssGlobals l9_6903=param_64;
float3 l9_6904;
if ((int(ENABLE_SPECULAR_AO_tmp)!=0))
{
float l9_6905=0.0;
float l9_6906=(*sc_set0.UserUniforms).specularAoDarkening;
l9_6905=l9_6906;
float l9_6907=0.0;
l9_6907=l9_6905;
float l9_6908=0.0;
l9_6908=1.0-l9_6907;
float3 l9_6909=float3(0.0);
l9_6909=(*sc_set0.UserUniforms).Port_Import_N235;
float l9_6910=0.0;
float l9_6911=(*sc_set0.UserUniforms).metallic;
l9_6910=l9_6911;
float l9_6912=0.0;
l9_6912=l9_6910;
float2 l9_6913=float2(0.0);
float2 l9_6914=float2(0.0);
float2 l9_6915=float2(0.0);
float2 l9_6916=float2(0.0);
float2 l9_6917=float2(0.0);
float2 l9_6918=float2(0.0);
ssGlobals l9_6919=l9_6903;
float2 l9_6920;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6921=float2(0.0);
l9_6921=l9_6919.Surface_UVCoord0;
l9_6914=l9_6921;
l9_6920=l9_6914;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6922=float2(0.0);
l9_6922=l9_6919.Surface_UVCoord1;
l9_6915=l9_6922;
l9_6920=l9_6915;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6923=float2(0.0);
float2 l9_6924=float2(0.0);
float2 l9_6925=float2(0.0);
ssGlobals l9_6926=l9_6919;
float2 l9_6927;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6928=float2(0.0);
float2 l9_6929=float2(0.0);
float2 l9_6930=float2(0.0);
ssGlobals l9_6931=l9_6926;
float2 l9_6932;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_6933=float2(0.0);
float2 l9_6934=float2(0.0);
float2 l9_6935=float2(0.0);
float2 l9_6936=float2(0.0);
float2 l9_6937=float2(0.0);
ssGlobals l9_6938=l9_6931;
float2 l9_6939;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6940=float2(0.0);
l9_6940=l9_6938.Surface_UVCoord0;
l9_6934=l9_6940;
l9_6939=l9_6934;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6941=float2(0.0);
l9_6941=l9_6938.Surface_UVCoord1;
l9_6935=l9_6941;
l9_6939=l9_6935;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6942=float2(0.0);
l9_6942=l9_6938.gScreenCoord;
l9_6936=l9_6942;
l9_6939=l9_6936;
}
else
{
float2 l9_6943=float2(0.0);
l9_6943=l9_6938.Surface_UVCoord0;
l9_6937=l9_6943;
l9_6939=l9_6937;
}
}
}
l9_6933=l9_6939;
float2 l9_6944=float2(0.0);
float2 l9_6945=(*sc_set0.UserUniforms).uv2Scale;
l9_6944=l9_6945;
float2 l9_6946=float2(0.0);
l9_6946=l9_6944;
float2 l9_6947=float2(0.0);
float2 l9_6948=(*sc_set0.UserUniforms).uv2Offset;
l9_6947=l9_6948;
float2 l9_6949=float2(0.0);
l9_6949=l9_6947;
float2 l9_6950=float2(0.0);
l9_6950=(l9_6933*l9_6946)+l9_6949;
float2 l9_6951=float2(0.0);
l9_6951=l9_6950+(l9_6949*(l9_6931.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6929=l9_6951;
l9_6932=l9_6929;
}
else
{
float2 l9_6952=float2(0.0);
float2 l9_6953=float2(0.0);
float2 l9_6954=float2(0.0);
float2 l9_6955=float2(0.0);
float2 l9_6956=float2(0.0);
ssGlobals l9_6957=l9_6931;
float2 l9_6958;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6959=float2(0.0);
l9_6959=l9_6957.Surface_UVCoord0;
l9_6953=l9_6959;
l9_6958=l9_6953;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6960=float2(0.0);
l9_6960=l9_6957.Surface_UVCoord1;
l9_6954=l9_6960;
l9_6958=l9_6954;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6961=float2(0.0);
l9_6961=l9_6957.gScreenCoord;
l9_6955=l9_6961;
l9_6958=l9_6955;
}
else
{
float2 l9_6962=float2(0.0);
l9_6962=l9_6957.Surface_UVCoord0;
l9_6956=l9_6962;
l9_6958=l9_6956;
}
}
}
l9_6952=l9_6958;
float2 l9_6963=float2(0.0);
float2 l9_6964=(*sc_set0.UserUniforms).uv2Scale;
l9_6963=l9_6964;
float2 l9_6965=float2(0.0);
l9_6965=l9_6963;
float2 l9_6966=float2(0.0);
float2 l9_6967=(*sc_set0.UserUniforms).uv2Offset;
l9_6966=l9_6967;
float2 l9_6968=float2(0.0);
l9_6968=l9_6966;
float2 l9_6969=float2(0.0);
l9_6969=(l9_6952*l9_6965)+l9_6968;
l9_6930=l9_6969;
l9_6932=l9_6930;
}
l9_6928=l9_6932;
l9_6924=l9_6928;
l9_6927=l9_6924;
}
else
{
float2 l9_6970=float2(0.0);
l9_6970=l9_6926.Surface_UVCoord0;
l9_6925=l9_6970;
l9_6927=l9_6925;
}
l9_6923=l9_6927;
float2 l9_6971=float2(0.0);
l9_6971=l9_6923;
float2 l9_6972=float2(0.0);
l9_6972=l9_6971;
l9_6916=l9_6972;
l9_6920=l9_6916;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6973=float2(0.0);
float2 l9_6974=float2(0.0);
float2 l9_6975=float2(0.0);
ssGlobals l9_6976=l9_6919;
float2 l9_6977;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_6978=float2(0.0);
float2 l9_6979=float2(0.0);
float2 l9_6980=float2(0.0);
ssGlobals l9_6981=l9_6976;
float2 l9_6982;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_6983=float2(0.0);
float2 l9_6984=float2(0.0);
float2 l9_6985=float2(0.0);
float2 l9_6986=float2(0.0);
float2 l9_6987=float2(0.0);
float2 l9_6988=float2(0.0);
ssGlobals l9_6989=l9_6981;
float2 l9_6990;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6991=float2(0.0);
l9_6991=l9_6989.Surface_UVCoord0;
l9_6984=l9_6991;
l9_6990=l9_6984;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6992=float2(0.0);
l9_6992=l9_6989.Surface_UVCoord1;
l9_6985=l9_6992;
l9_6990=l9_6985;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6993=float2(0.0);
l9_6993=l9_6989.gScreenCoord;
l9_6986=l9_6993;
l9_6990=l9_6986;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6994=float2(0.0);
float2 l9_6995=float2(0.0);
float2 l9_6996=float2(0.0);
ssGlobals l9_6997=l9_6989;
float2 l9_6998;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_6999=float2(0.0);
float2 l9_7000=float2(0.0);
float2 l9_7001=float2(0.0);
ssGlobals l9_7002=l9_6997;
float2 l9_7003;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7004=float2(0.0);
float2 l9_7005=float2(0.0);
float2 l9_7006=float2(0.0);
float2 l9_7007=float2(0.0);
float2 l9_7008=float2(0.0);
ssGlobals l9_7009=l9_7002;
float2 l9_7010;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7011=float2(0.0);
l9_7011=l9_7009.Surface_UVCoord0;
l9_7005=l9_7011;
l9_7010=l9_7005;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7012=float2(0.0);
l9_7012=l9_7009.Surface_UVCoord1;
l9_7006=l9_7012;
l9_7010=l9_7006;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7013=float2(0.0);
l9_7013=l9_7009.gScreenCoord;
l9_7007=l9_7013;
l9_7010=l9_7007;
}
else
{
float2 l9_7014=float2(0.0);
l9_7014=l9_7009.Surface_UVCoord0;
l9_7008=l9_7014;
l9_7010=l9_7008;
}
}
}
l9_7004=l9_7010;
float2 l9_7015=float2(0.0);
float2 l9_7016=(*sc_set0.UserUniforms).uv2Scale;
l9_7015=l9_7016;
float2 l9_7017=float2(0.0);
l9_7017=l9_7015;
float2 l9_7018=float2(0.0);
float2 l9_7019=(*sc_set0.UserUniforms).uv2Offset;
l9_7018=l9_7019;
float2 l9_7020=float2(0.0);
l9_7020=l9_7018;
float2 l9_7021=float2(0.0);
l9_7021=(l9_7004*l9_7017)+l9_7020;
float2 l9_7022=float2(0.0);
l9_7022=l9_7021+(l9_7020*(l9_7002.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7000=l9_7022;
l9_7003=l9_7000;
}
else
{
float2 l9_7023=float2(0.0);
float2 l9_7024=float2(0.0);
float2 l9_7025=float2(0.0);
float2 l9_7026=float2(0.0);
float2 l9_7027=float2(0.0);
ssGlobals l9_7028=l9_7002;
float2 l9_7029;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7030=float2(0.0);
l9_7030=l9_7028.Surface_UVCoord0;
l9_7024=l9_7030;
l9_7029=l9_7024;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7031=float2(0.0);
l9_7031=l9_7028.Surface_UVCoord1;
l9_7025=l9_7031;
l9_7029=l9_7025;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7032=float2(0.0);
l9_7032=l9_7028.gScreenCoord;
l9_7026=l9_7032;
l9_7029=l9_7026;
}
else
{
float2 l9_7033=float2(0.0);
l9_7033=l9_7028.Surface_UVCoord0;
l9_7027=l9_7033;
l9_7029=l9_7027;
}
}
}
l9_7023=l9_7029;
float2 l9_7034=float2(0.0);
float2 l9_7035=(*sc_set0.UserUniforms).uv2Scale;
l9_7034=l9_7035;
float2 l9_7036=float2(0.0);
l9_7036=l9_7034;
float2 l9_7037=float2(0.0);
float2 l9_7038=(*sc_set0.UserUniforms).uv2Offset;
l9_7037=l9_7038;
float2 l9_7039=float2(0.0);
l9_7039=l9_7037;
float2 l9_7040=float2(0.0);
l9_7040=(l9_7023*l9_7036)+l9_7039;
l9_7001=l9_7040;
l9_7003=l9_7001;
}
l9_6999=l9_7003;
l9_6995=l9_6999;
l9_6998=l9_6995;
}
else
{
float2 l9_7041=float2(0.0);
l9_7041=l9_6997.Surface_UVCoord0;
l9_6996=l9_7041;
l9_6998=l9_6996;
}
l9_6994=l9_6998;
float2 l9_7042=float2(0.0);
l9_7042=l9_6994;
float2 l9_7043=float2(0.0);
l9_7043=l9_7042;
l9_6987=l9_7043;
l9_6990=l9_6987;
}
else
{
float2 l9_7044=float2(0.0);
l9_7044=l9_6989.Surface_UVCoord0;
l9_6988=l9_7044;
l9_6990=l9_6988;
}
}
}
}
l9_6983=l9_6990;
float2 l9_7045=float2(0.0);
float2 l9_7046=(*sc_set0.UserUniforms).uv3Scale;
l9_7045=l9_7046;
float2 l9_7047=float2(0.0);
l9_7047=l9_7045;
float2 l9_7048=float2(0.0);
float2 l9_7049=(*sc_set0.UserUniforms).uv3Offset;
l9_7048=l9_7049;
float2 l9_7050=float2(0.0);
l9_7050=l9_7048;
float2 l9_7051=float2(0.0);
l9_7051=(l9_6983*l9_7047)+l9_7050;
float2 l9_7052=float2(0.0);
l9_7052=l9_7051+(l9_7050*(l9_6981.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6979=l9_7052;
l9_6982=l9_6979;
}
else
{
float2 l9_7053=float2(0.0);
float2 l9_7054=float2(0.0);
float2 l9_7055=float2(0.0);
float2 l9_7056=float2(0.0);
float2 l9_7057=float2(0.0);
float2 l9_7058=float2(0.0);
ssGlobals l9_7059=l9_6981;
float2 l9_7060;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7061=float2(0.0);
l9_7061=l9_7059.Surface_UVCoord0;
l9_7054=l9_7061;
l9_7060=l9_7054;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7062=float2(0.0);
l9_7062=l9_7059.Surface_UVCoord1;
l9_7055=l9_7062;
l9_7060=l9_7055;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7063=float2(0.0);
l9_7063=l9_7059.gScreenCoord;
l9_7056=l9_7063;
l9_7060=l9_7056;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7064=float2(0.0);
float2 l9_7065=float2(0.0);
float2 l9_7066=float2(0.0);
ssGlobals l9_7067=l9_7059;
float2 l9_7068;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7069=float2(0.0);
float2 l9_7070=float2(0.0);
float2 l9_7071=float2(0.0);
ssGlobals l9_7072=l9_7067;
float2 l9_7073;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7074=float2(0.0);
float2 l9_7075=float2(0.0);
float2 l9_7076=float2(0.0);
float2 l9_7077=float2(0.0);
float2 l9_7078=float2(0.0);
ssGlobals l9_7079=l9_7072;
float2 l9_7080;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7081=float2(0.0);
l9_7081=l9_7079.Surface_UVCoord0;
l9_7075=l9_7081;
l9_7080=l9_7075;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7082=float2(0.0);
l9_7082=l9_7079.Surface_UVCoord1;
l9_7076=l9_7082;
l9_7080=l9_7076;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7083=float2(0.0);
l9_7083=l9_7079.gScreenCoord;
l9_7077=l9_7083;
l9_7080=l9_7077;
}
else
{
float2 l9_7084=float2(0.0);
l9_7084=l9_7079.Surface_UVCoord0;
l9_7078=l9_7084;
l9_7080=l9_7078;
}
}
}
l9_7074=l9_7080;
float2 l9_7085=float2(0.0);
float2 l9_7086=(*sc_set0.UserUniforms).uv2Scale;
l9_7085=l9_7086;
float2 l9_7087=float2(0.0);
l9_7087=l9_7085;
float2 l9_7088=float2(0.0);
float2 l9_7089=(*sc_set0.UserUniforms).uv2Offset;
l9_7088=l9_7089;
float2 l9_7090=float2(0.0);
l9_7090=l9_7088;
float2 l9_7091=float2(0.0);
l9_7091=(l9_7074*l9_7087)+l9_7090;
float2 l9_7092=float2(0.0);
l9_7092=l9_7091+(l9_7090*(l9_7072.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7070=l9_7092;
l9_7073=l9_7070;
}
else
{
float2 l9_7093=float2(0.0);
float2 l9_7094=float2(0.0);
float2 l9_7095=float2(0.0);
float2 l9_7096=float2(0.0);
float2 l9_7097=float2(0.0);
ssGlobals l9_7098=l9_7072;
float2 l9_7099;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7100=float2(0.0);
l9_7100=l9_7098.Surface_UVCoord0;
l9_7094=l9_7100;
l9_7099=l9_7094;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7101=float2(0.0);
l9_7101=l9_7098.Surface_UVCoord1;
l9_7095=l9_7101;
l9_7099=l9_7095;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7102=float2(0.0);
l9_7102=l9_7098.gScreenCoord;
l9_7096=l9_7102;
l9_7099=l9_7096;
}
else
{
float2 l9_7103=float2(0.0);
l9_7103=l9_7098.Surface_UVCoord0;
l9_7097=l9_7103;
l9_7099=l9_7097;
}
}
}
l9_7093=l9_7099;
float2 l9_7104=float2(0.0);
float2 l9_7105=(*sc_set0.UserUniforms).uv2Scale;
l9_7104=l9_7105;
float2 l9_7106=float2(0.0);
l9_7106=l9_7104;
float2 l9_7107=float2(0.0);
float2 l9_7108=(*sc_set0.UserUniforms).uv2Offset;
l9_7107=l9_7108;
float2 l9_7109=float2(0.0);
l9_7109=l9_7107;
float2 l9_7110=float2(0.0);
l9_7110=(l9_7093*l9_7106)+l9_7109;
l9_7071=l9_7110;
l9_7073=l9_7071;
}
l9_7069=l9_7073;
l9_7065=l9_7069;
l9_7068=l9_7065;
}
else
{
float2 l9_7111=float2(0.0);
l9_7111=l9_7067.Surface_UVCoord0;
l9_7066=l9_7111;
l9_7068=l9_7066;
}
l9_7064=l9_7068;
float2 l9_7112=float2(0.0);
l9_7112=l9_7064;
float2 l9_7113=float2(0.0);
l9_7113=l9_7112;
l9_7057=l9_7113;
l9_7060=l9_7057;
}
else
{
float2 l9_7114=float2(0.0);
l9_7114=l9_7059.Surface_UVCoord0;
l9_7058=l9_7114;
l9_7060=l9_7058;
}
}
}
}
l9_7053=l9_7060;
float2 l9_7115=float2(0.0);
float2 l9_7116=(*sc_set0.UserUniforms).uv3Scale;
l9_7115=l9_7116;
float2 l9_7117=float2(0.0);
l9_7117=l9_7115;
float2 l9_7118=float2(0.0);
float2 l9_7119=(*sc_set0.UserUniforms).uv3Offset;
l9_7118=l9_7119;
float2 l9_7120=float2(0.0);
l9_7120=l9_7118;
float2 l9_7121=float2(0.0);
l9_7121=(l9_7053*l9_7117)+l9_7120;
l9_6980=l9_7121;
l9_6982=l9_6980;
}
l9_6978=l9_6982;
l9_6974=l9_6978;
l9_6977=l9_6974;
}
else
{
float2 l9_7122=float2(0.0);
l9_7122=l9_6976.Surface_UVCoord0;
l9_6975=l9_7122;
l9_6977=l9_6975;
}
l9_6973=l9_6977;
float2 l9_7123=float2(0.0);
l9_7123=l9_6973;
float2 l9_7124=float2(0.0);
l9_7124=l9_7123;
l9_6917=l9_7124;
l9_6920=l9_6917;
}
else
{
float2 l9_7125=float2(0.0);
l9_7125=l9_6919.Surface_UVCoord0;
l9_6918=l9_7125;
l9_6920=l9_6918;
}
}
}
}
l9_6913=l9_6920;
float4 l9_7126=float4(0.0);
int l9_7127=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7128=0;
}
else
{
l9_7128=in.varStereoViewID;
}
int l9_7129=l9_7128;
l9_7127=1-l9_7129;
}
else
{
int l9_7130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7130=0;
}
else
{
l9_7130=in.varStereoViewID;
}
int l9_7131=l9_7130;
l9_7127=l9_7131;
}
int l9_7132=l9_7127;
int l9_7133=materialParamsTexLayout_tmp;
int l9_7134=l9_7132;
float2 l9_7135=l9_6913;
bool l9_7136=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7137=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7138=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7139=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7140=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7141=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7142=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7143=0.0;
bool l9_7144=l9_7141&&(!l9_7139);
float l9_7145=1.0;
float l9_7146=l9_7135.x;
int l9_7147=l9_7138.x;
if (l9_7147==1)
{
l9_7146=fract(l9_7146);
}
else
{
if (l9_7147==2)
{
float l9_7148=fract(l9_7146);
float l9_7149=l9_7146-l9_7148;
float l9_7150=step(0.25,fract(l9_7149*0.5));
l9_7146=mix(l9_7148,1.0-l9_7148,fast::clamp(l9_7150,0.0,1.0));
}
}
l9_7135.x=l9_7146;
float l9_7151=l9_7135.y;
int l9_7152=l9_7138.y;
if (l9_7152==1)
{
l9_7151=fract(l9_7151);
}
else
{
if (l9_7152==2)
{
float l9_7153=fract(l9_7151);
float l9_7154=l9_7151-l9_7153;
float l9_7155=step(0.25,fract(l9_7154*0.5));
l9_7151=mix(l9_7153,1.0-l9_7153,fast::clamp(l9_7155,0.0,1.0));
}
}
l9_7135.y=l9_7151;
if (l9_7139)
{
bool l9_7156=l9_7141;
bool l9_7157;
if (l9_7156)
{
l9_7157=l9_7138.x==3;
}
else
{
l9_7157=l9_7156;
}
float l9_7158=l9_7135.x;
float l9_7159=l9_7140.x;
float l9_7160=l9_7140.z;
bool l9_7161=l9_7157;
float l9_7162=l9_7145;
float l9_7163=fast::clamp(l9_7158,l9_7159,l9_7160);
float l9_7164=step(abs(l9_7158-l9_7163),9.9999997e-06);
l9_7162*=(l9_7164+((1.0-float(l9_7161))*(1.0-l9_7164)));
l9_7158=l9_7163;
l9_7135.x=l9_7158;
l9_7145=l9_7162;
bool l9_7165=l9_7141;
bool l9_7166;
if (l9_7165)
{
l9_7166=l9_7138.y==3;
}
else
{
l9_7166=l9_7165;
}
float l9_7167=l9_7135.y;
float l9_7168=l9_7140.y;
float l9_7169=l9_7140.w;
bool l9_7170=l9_7166;
float l9_7171=l9_7145;
float l9_7172=fast::clamp(l9_7167,l9_7168,l9_7169);
float l9_7173=step(abs(l9_7167-l9_7172),9.9999997e-06);
l9_7171*=(l9_7173+((1.0-float(l9_7170))*(1.0-l9_7173)));
l9_7167=l9_7172;
l9_7135.y=l9_7167;
l9_7145=l9_7171;
}
float2 l9_7174=l9_7135;
bool l9_7175=l9_7136;
float3x3 l9_7176=l9_7137;
if (l9_7175)
{
l9_7174=float2((l9_7176*float3(l9_7174,1.0)).xy);
}
float2 l9_7177=l9_7174;
float2 l9_7178=l9_7177;
float2 l9_7179=l9_7178;
l9_7135=l9_7179;
float l9_7180=l9_7135.x;
int l9_7181=l9_7138.x;
bool l9_7182=l9_7144;
float l9_7183=l9_7145;
if ((l9_7181==0)||(l9_7181==3))
{
float l9_7184=l9_7180;
float l9_7185=0.0;
float l9_7186=1.0;
bool l9_7187=l9_7182;
float l9_7188=l9_7183;
float l9_7189=fast::clamp(l9_7184,l9_7185,l9_7186);
float l9_7190=step(abs(l9_7184-l9_7189),9.9999997e-06);
l9_7188*=(l9_7190+((1.0-float(l9_7187))*(1.0-l9_7190)));
l9_7184=l9_7189;
l9_7180=l9_7184;
l9_7183=l9_7188;
}
l9_7135.x=l9_7180;
l9_7145=l9_7183;
float l9_7191=l9_7135.y;
int l9_7192=l9_7138.y;
bool l9_7193=l9_7144;
float l9_7194=l9_7145;
if ((l9_7192==0)||(l9_7192==3))
{
float l9_7195=l9_7191;
float l9_7196=0.0;
float l9_7197=1.0;
bool l9_7198=l9_7193;
float l9_7199=l9_7194;
float l9_7200=fast::clamp(l9_7195,l9_7196,l9_7197);
float l9_7201=step(abs(l9_7195-l9_7200),9.9999997e-06);
l9_7199*=(l9_7201+((1.0-float(l9_7198))*(1.0-l9_7201)));
l9_7195=l9_7200;
l9_7191=l9_7195;
l9_7194=l9_7199;
}
l9_7135.y=l9_7191;
l9_7145=l9_7194;
float2 l9_7202=l9_7135;
int l9_7203=l9_7133;
int l9_7204=l9_7134;
float l9_7205=l9_7143;
float2 l9_7206=l9_7202;
int l9_7207=l9_7203;
int l9_7208=l9_7204;
float3 l9_7209=float3(0.0);
if (l9_7207==0)
{
l9_7209=float3(l9_7206,0.0);
}
else
{
if (l9_7207==1)
{
l9_7209=float3(l9_7206.x,(l9_7206.y*0.5)+(0.5-(float(l9_7208)*0.5)),0.0);
}
else
{
l9_7209=float3(l9_7206,float(l9_7208));
}
}
float3 l9_7210=l9_7209;
float3 l9_7211=l9_7210;
float2 l9_7212=l9_7211.xy;
float l9_7213=l9_7205;
float4 l9_7214=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7212,bias(l9_7213));
float4 l9_7215=l9_7214;
float4 l9_7216=l9_7215;
if (l9_7141)
{
l9_7216=mix(l9_7142,l9_7216,float4(l9_7145));
}
float4 l9_7217=l9_7216;
l9_7126=l9_7217;
float l9_7218=0.0;
float2 l9_7219=l9_7126.xy;
float l9_7220=l9_7219.x;
l9_7218=l9_7220;
float l9_7221=0.0;
l9_7221=l9_6912*l9_7218;
float3 l9_7222=float3(0.0);
l9_7222=l9_6909*float3(l9_7221);
float3 l9_7223=float3(0.0);
l9_7223=mix((*sc_set0.UserUniforms).Port_Input0_N239,l9_7222,float3(l9_7221));
float3 l9_7224=float3(0.0);
l9_7224=(float3(l9_6908)*l9_7223)*l9_7223;
float3 l9_7225=float3(0.0);
float3 l9_7226=float3(0.0);
float3 l9_7227=float3(0.0);
ssGlobals l9_7228=l9_6903;
float3 l9_7229;
if (NODE_38_DROPLIST_ITEM_tmp==3)
{
float4 l9_7230=float4(0.0);
l9_7230=l9_7228.VertexColor;
float2 l9_7231=float2(0.0);
float2 l9_7232=float2(0.0);
float2 l9_7233=float2(0.0);
float2 l9_7234=float2(0.0);
float2 l9_7235=float2(0.0);
float2 l9_7236=float2(0.0);
ssGlobals l9_7237=l9_7228;
float2 l9_7238;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_7239=float2(0.0);
l9_7239=l9_7237.Surface_UVCoord0;
l9_7232=l9_7239;
l9_7238=l9_7232;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_7240=float2(0.0);
l9_7240=l9_7237.Surface_UVCoord1;
l9_7233=l9_7240;
l9_7238=l9_7233;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_7241=float2(0.0);
float2 l9_7242=float2(0.0);
float2 l9_7243=float2(0.0);
ssGlobals l9_7244=l9_7237;
float2 l9_7245;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7246=float2(0.0);
float2 l9_7247=float2(0.0);
float2 l9_7248=float2(0.0);
ssGlobals l9_7249=l9_7244;
float2 l9_7250;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7251=float2(0.0);
float2 l9_7252=float2(0.0);
float2 l9_7253=float2(0.0);
float2 l9_7254=float2(0.0);
float2 l9_7255=float2(0.0);
ssGlobals l9_7256=l9_7249;
float2 l9_7257;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7258=float2(0.0);
l9_7258=l9_7256.Surface_UVCoord0;
l9_7252=l9_7258;
l9_7257=l9_7252;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7259=float2(0.0);
l9_7259=l9_7256.Surface_UVCoord1;
l9_7253=l9_7259;
l9_7257=l9_7253;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7260=float2(0.0);
l9_7260=l9_7256.gScreenCoord;
l9_7254=l9_7260;
l9_7257=l9_7254;
}
else
{
float2 l9_7261=float2(0.0);
l9_7261=l9_7256.Surface_UVCoord0;
l9_7255=l9_7261;
l9_7257=l9_7255;
}
}
}
l9_7251=l9_7257;
float2 l9_7262=float2(0.0);
float2 l9_7263=(*sc_set0.UserUniforms).uv2Scale;
l9_7262=l9_7263;
float2 l9_7264=float2(0.0);
l9_7264=l9_7262;
float2 l9_7265=float2(0.0);
float2 l9_7266=(*sc_set0.UserUniforms).uv2Offset;
l9_7265=l9_7266;
float2 l9_7267=float2(0.0);
l9_7267=l9_7265;
float2 l9_7268=float2(0.0);
l9_7268=(l9_7251*l9_7264)+l9_7267;
float2 l9_7269=float2(0.0);
l9_7269=l9_7268+(l9_7267*(l9_7249.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7247=l9_7269;
l9_7250=l9_7247;
}
else
{
float2 l9_7270=float2(0.0);
float2 l9_7271=float2(0.0);
float2 l9_7272=float2(0.0);
float2 l9_7273=float2(0.0);
float2 l9_7274=float2(0.0);
ssGlobals l9_7275=l9_7249;
float2 l9_7276;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7277=float2(0.0);
l9_7277=l9_7275.Surface_UVCoord0;
l9_7271=l9_7277;
l9_7276=l9_7271;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7278=float2(0.0);
l9_7278=l9_7275.Surface_UVCoord1;
l9_7272=l9_7278;
l9_7276=l9_7272;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7279=float2(0.0);
l9_7279=l9_7275.gScreenCoord;
l9_7273=l9_7279;
l9_7276=l9_7273;
}
else
{
float2 l9_7280=float2(0.0);
l9_7280=l9_7275.Surface_UVCoord0;
l9_7274=l9_7280;
l9_7276=l9_7274;
}
}
}
l9_7270=l9_7276;
float2 l9_7281=float2(0.0);
float2 l9_7282=(*sc_set0.UserUniforms).uv2Scale;
l9_7281=l9_7282;
float2 l9_7283=float2(0.0);
l9_7283=l9_7281;
float2 l9_7284=float2(0.0);
float2 l9_7285=(*sc_set0.UserUniforms).uv2Offset;
l9_7284=l9_7285;
float2 l9_7286=float2(0.0);
l9_7286=l9_7284;
float2 l9_7287=float2(0.0);
l9_7287=(l9_7270*l9_7283)+l9_7286;
l9_7248=l9_7287;
l9_7250=l9_7248;
}
l9_7246=l9_7250;
l9_7242=l9_7246;
l9_7245=l9_7242;
}
else
{
float2 l9_7288=float2(0.0);
l9_7288=l9_7244.Surface_UVCoord0;
l9_7243=l9_7288;
l9_7245=l9_7243;
}
l9_7241=l9_7245;
float2 l9_7289=float2(0.0);
l9_7289=l9_7241;
float2 l9_7290=float2(0.0);
l9_7290=l9_7289;
l9_7234=l9_7290;
l9_7238=l9_7234;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_7291=float2(0.0);
float2 l9_7292=float2(0.0);
float2 l9_7293=float2(0.0);
ssGlobals l9_7294=l9_7237;
float2 l9_7295;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_7296=float2(0.0);
float2 l9_7297=float2(0.0);
float2 l9_7298=float2(0.0);
ssGlobals l9_7299=l9_7294;
float2 l9_7300;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_7301=float2(0.0);
float2 l9_7302=float2(0.0);
float2 l9_7303=float2(0.0);
float2 l9_7304=float2(0.0);
float2 l9_7305=float2(0.0);
float2 l9_7306=float2(0.0);
ssGlobals l9_7307=l9_7299;
float2 l9_7308;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7309=float2(0.0);
l9_7309=l9_7307.Surface_UVCoord0;
l9_7302=l9_7309;
l9_7308=l9_7302;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7310=float2(0.0);
l9_7310=l9_7307.Surface_UVCoord1;
l9_7303=l9_7310;
l9_7308=l9_7303;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7311=float2(0.0);
l9_7311=l9_7307.gScreenCoord;
l9_7304=l9_7311;
l9_7308=l9_7304;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7312=float2(0.0);
float2 l9_7313=float2(0.0);
float2 l9_7314=float2(0.0);
ssGlobals l9_7315=l9_7307;
float2 l9_7316;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7317=float2(0.0);
float2 l9_7318=float2(0.0);
float2 l9_7319=float2(0.0);
ssGlobals l9_7320=l9_7315;
float2 l9_7321;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7322=float2(0.0);
float2 l9_7323=float2(0.0);
float2 l9_7324=float2(0.0);
float2 l9_7325=float2(0.0);
float2 l9_7326=float2(0.0);
ssGlobals l9_7327=l9_7320;
float2 l9_7328;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7329=float2(0.0);
l9_7329=l9_7327.Surface_UVCoord0;
l9_7323=l9_7329;
l9_7328=l9_7323;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7330=float2(0.0);
l9_7330=l9_7327.Surface_UVCoord1;
l9_7324=l9_7330;
l9_7328=l9_7324;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7331=float2(0.0);
l9_7331=l9_7327.gScreenCoord;
l9_7325=l9_7331;
l9_7328=l9_7325;
}
else
{
float2 l9_7332=float2(0.0);
l9_7332=l9_7327.Surface_UVCoord0;
l9_7326=l9_7332;
l9_7328=l9_7326;
}
}
}
l9_7322=l9_7328;
float2 l9_7333=float2(0.0);
float2 l9_7334=(*sc_set0.UserUniforms).uv2Scale;
l9_7333=l9_7334;
float2 l9_7335=float2(0.0);
l9_7335=l9_7333;
float2 l9_7336=float2(0.0);
float2 l9_7337=(*sc_set0.UserUniforms).uv2Offset;
l9_7336=l9_7337;
float2 l9_7338=float2(0.0);
l9_7338=l9_7336;
float2 l9_7339=float2(0.0);
l9_7339=(l9_7322*l9_7335)+l9_7338;
float2 l9_7340=float2(0.0);
l9_7340=l9_7339+(l9_7338*(l9_7320.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7318=l9_7340;
l9_7321=l9_7318;
}
else
{
float2 l9_7341=float2(0.0);
float2 l9_7342=float2(0.0);
float2 l9_7343=float2(0.0);
float2 l9_7344=float2(0.0);
float2 l9_7345=float2(0.0);
ssGlobals l9_7346=l9_7320;
float2 l9_7347;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7348=float2(0.0);
l9_7348=l9_7346.Surface_UVCoord0;
l9_7342=l9_7348;
l9_7347=l9_7342;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7349=float2(0.0);
l9_7349=l9_7346.Surface_UVCoord1;
l9_7343=l9_7349;
l9_7347=l9_7343;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7350=float2(0.0);
l9_7350=l9_7346.gScreenCoord;
l9_7344=l9_7350;
l9_7347=l9_7344;
}
else
{
float2 l9_7351=float2(0.0);
l9_7351=l9_7346.Surface_UVCoord0;
l9_7345=l9_7351;
l9_7347=l9_7345;
}
}
}
l9_7341=l9_7347;
float2 l9_7352=float2(0.0);
float2 l9_7353=(*sc_set0.UserUniforms).uv2Scale;
l9_7352=l9_7353;
float2 l9_7354=float2(0.0);
l9_7354=l9_7352;
float2 l9_7355=float2(0.0);
float2 l9_7356=(*sc_set0.UserUniforms).uv2Offset;
l9_7355=l9_7356;
float2 l9_7357=float2(0.0);
l9_7357=l9_7355;
float2 l9_7358=float2(0.0);
l9_7358=(l9_7341*l9_7354)+l9_7357;
l9_7319=l9_7358;
l9_7321=l9_7319;
}
l9_7317=l9_7321;
l9_7313=l9_7317;
l9_7316=l9_7313;
}
else
{
float2 l9_7359=float2(0.0);
l9_7359=l9_7315.Surface_UVCoord0;
l9_7314=l9_7359;
l9_7316=l9_7314;
}
l9_7312=l9_7316;
float2 l9_7360=float2(0.0);
l9_7360=l9_7312;
float2 l9_7361=float2(0.0);
l9_7361=l9_7360;
l9_7305=l9_7361;
l9_7308=l9_7305;
}
else
{
float2 l9_7362=float2(0.0);
l9_7362=l9_7307.Surface_UVCoord0;
l9_7306=l9_7362;
l9_7308=l9_7306;
}
}
}
}
l9_7301=l9_7308;
float2 l9_7363=float2(0.0);
float2 l9_7364=(*sc_set0.UserUniforms).uv3Scale;
l9_7363=l9_7364;
float2 l9_7365=float2(0.0);
l9_7365=l9_7363;
float2 l9_7366=float2(0.0);
float2 l9_7367=(*sc_set0.UserUniforms).uv3Offset;
l9_7366=l9_7367;
float2 l9_7368=float2(0.0);
l9_7368=l9_7366;
float2 l9_7369=float2(0.0);
l9_7369=(l9_7301*l9_7365)+l9_7368;
float2 l9_7370=float2(0.0);
l9_7370=l9_7369+(l9_7368*(l9_7299.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_7297=l9_7370;
l9_7300=l9_7297;
}
else
{
float2 l9_7371=float2(0.0);
float2 l9_7372=float2(0.0);
float2 l9_7373=float2(0.0);
float2 l9_7374=float2(0.0);
float2 l9_7375=float2(0.0);
float2 l9_7376=float2(0.0);
ssGlobals l9_7377=l9_7299;
float2 l9_7378;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7379=float2(0.0);
l9_7379=l9_7377.Surface_UVCoord0;
l9_7372=l9_7379;
l9_7378=l9_7372;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7380=float2(0.0);
l9_7380=l9_7377.Surface_UVCoord1;
l9_7373=l9_7380;
l9_7378=l9_7373;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7381=float2(0.0);
l9_7381=l9_7377.gScreenCoord;
l9_7374=l9_7381;
l9_7378=l9_7374;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7382=float2(0.0);
float2 l9_7383=float2(0.0);
float2 l9_7384=float2(0.0);
ssGlobals l9_7385=l9_7377;
float2 l9_7386;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7387=float2(0.0);
float2 l9_7388=float2(0.0);
float2 l9_7389=float2(0.0);
ssGlobals l9_7390=l9_7385;
float2 l9_7391;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7392=float2(0.0);
float2 l9_7393=float2(0.0);
float2 l9_7394=float2(0.0);
float2 l9_7395=float2(0.0);
float2 l9_7396=float2(0.0);
ssGlobals l9_7397=l9_7390;
float2 l9_7398;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7399=float2(0.0);
l9_7399=l9_7397.Surface_UVCoord0;
l9_7393=l9_7399;
l9_7398=l9_7393;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7400=float2(0.0);
l9_7400=l9_7397.Surface_UVCoord1;
l9_7394=l9_7400;
l9_7398=l9_7394;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7401=float2(0.0);
l9_7401=l9_7397.gScreenCoord;
l9_7395=l9_7401;
l9_7398=l9_7395;
}
else
{
float2 l9_7402=float2(0.0);
l9_7402=l9_7397.Surface_UVCoord0;
l9_7396=l9_7402;
l9_7398=l9_7396;
}
}
}
l9_7392=l9_7398;
float2 l9_7403=float2(0.0);
float2 l9_7404=(*sc_set0.UserUniforms).uv2Scale;
l9_7403=l9_7404;
float2 l9_7405=float2(0.0);
l9_7405=l9_7403;
float2 l9_7406=float2(0.0);
float2 l9_7407=(*sc_set0.UserUniforms).uv2Offset;
l9_7406=l9_7407;
float2 l9_7408=float2(0.0);
l9_7408=l9_7406;
float2 l9_7409=float2(0.0);
l9_7409=(l9_7392*l9_7405)+l9_7408;
float2 l9_7410=float2(0.0);
l9_7410=l9_7409+(l9_7408*(l9_7390.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7388=l9_7410;
l9_7391=l9_7388;
}
else
{
float2 l9_7411=float2(0.0);
float2 l9_7412=float2(0.0);
float2 l9_7413=float2(0.0);
float2 l9_7414=float2(0.0);
float2 l9_7415=float2(0.0);
ssGlobals l9_7416=l9_7390;
float2 l9_7417;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7418=float2(0.0);
l9_7418=l9_7416.Surface_UVCoord0;
l9_7412=l9_7418;
l9_7417=l9_7412;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7419=float2(0.0);
l9_7419=l9_7416.Surface_UVCoord1;
l9_7413=l9_7419;
l9_7417=l9_7413;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7420=float2(0.0);
l9_7420=l9_7416.gScreenCoord;
l9_7414=l9_7420;
l9_7417=l9_7414;
}
else
{
float2 l9_7421=float2(0.0);
l9_7421=l9_7416.Surface_UVCoord0;
l9_7415=l9_7421;
l9_7417=l9_7415;
}
}
}
l9_7411=l9_7417;
float2 l9_7422=float2(0.0);
float2 l9_7423=(*sc_set0.UserUniforms).uv2Scale;
l9_7422=l9_7423;
float2 l9_7424=float2(0.0);
l9_7424=l9_7422;
float2 l9_7425=float2(0.0);
float2 l9_7426=(*sc_set0.UserUniforms).uv2Offset;
l9_7425=l9_7426;
float2 l9_7427=float2(0.0);
l9_7427=l9_7425;
float2 l9_7428=float2(0.0);
l9_7428=(l9_7411*l9_7424)+l9_7427;
l9_7389=l9_7428;
l9_7391=l9_7389;
}
l9_7387=l9_7391;
l9_7383=l9_7387;
l9_7386=l9_7383;
}
else
{
float2 l9_7429=float2(0.0);
l9_7429=l9_7385.Surface_UVCoord0;
l9_7384=l9_7429;
l9_7386=l9_7384;
}
l9_7382=l9_7386;
float2 l9_7430=float2(0.0);
l9_7430=l9_7382;
float2 l9_7431=float2(0.0);
l9_7431=l9_7430;
l9_7375=l9_7431;
l9_7378=l9_7375;
}
else
{
float2 l9_7432=float2(0.0);
l9_7432=l9_7377.Surface_UVCoord0;
l9_7376=l9_7432;
l9_7378=l9_7376;
}
}
}
}
l9_7371=l9_7378;
float2 l9_7433=float2(0.0);
float2 l9_7434=(*sc_set0.UserUniforms).uv3Scale;
l9_7433=l9_7434;
float2 l9_7435=float2(0.0);
l9_7435=l9_7433;
float2 l9_7436=float2(0.0);
float2 l9_7437=(*sc_set0.UserUniforms).uv3Offset;
l9_7436=l9_7437;
float2 l9_7438=float2(0.0);
l9_7438=l9_7436;
float2 l9_7439=float2(0.0);
l9_7439=(l9_7371*l9_7435)+l9_7438;
l9_7298=l9_7439;
l9_7300=l9_7298;
}
l9_7296=l9_7300;
l9_7292=l9_7296;
l9_7295=l9_7292;
}
else
{
float2 l9_7440=float2(0.0);
l9_7440=l9_7294.Surface_UVCoord0;
l9_7293=l9_7440;
l9_7295=l9_7293;
}
l9_7291=l9_7295;
float2 l9_7441=float2(0.0);
l9_7441=l9_7291;
float2 l9_7442=float2(0.0);
l9_7442=l9_7441;
l9_7235=l9_7442;
l9_7238=l9_7235;
}
else
{
float2 l9_7443=float2(0.0);
l9_7443=l9_7237.Surface_UVCoord0;
l9_7236=l9_7443;
l9_7238=l9_7236;
}
}
}
}
l9_7231=l9_7238;
float4 l9_7444=float4(0.0);
int l9_7445=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7446=0;
}
else
{
l9_7446=in.varStereoViewID;
}
int l9_7447=l9_7446;
l9_7445=1-l9_7447;
}
else
{
int l9_7448=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7448=0;
}
else
{
l9_7448=in.varStereoViewID;
}
int l9_7449=l9_7448;
l9_7445=l9_7449;
}
int l9_7450=l9_7445;
int l9_7451=materialParamsTexLayout_tmp;
int l9_7452=l9_7450;
float2 l9_7453=l9_7231;
bool l9_7454=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7455=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7456=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7457=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7458=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7459=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7460=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7461=0.0;
bool l9_7462=l9_7459&&(!l9_7457);
float l9_7463=1.0;
float l9_7464=l9_7453.x;
int l9_7465=l9_7456.x;
if (l9_7465==1)
{
l9_7464=fract(l9_7464);
}
else
{
if (l9_7465==2)
{
float l9_7466=fract(l9_7464);
float l9_7467=l9_7464-l9_7466;
float l9_7468=step(0.25,fract(l9_7467*0.5));
l9_7464=mix(l9_7466,1.0-l9_7466,fast::clamp(l9_7468,0.0,1.0));
}
}
l9_7453.x=l9_7464;
float l9_7469=l9_7453.y;
int l9_7470=l9_7456.y;
if (l9_7470==1)
{
l9_7469=fract(l9_7469);
}
else
{
if (l9_7470==2)
{
float l9_7471=fract(l9_7469);
float l9_7472=l9_7469-l9_7471;
float l9_7473=step(0.25,fract(l9_7472*0.5));
l9_7469=mix(l9_7471,1.0-l9_7471,fast::clamp(l9_7473,0.0,1.0));
}
}
l9_7453.y=l9_7469;
if (l9_7457)
{
bool l9_7474=l9_7459;
bool l9_7475;
if (l9_7474)
{
l9_7475=l9_7456.x==3;
}
else
{
l9_7475=l9_7474;
}
float l9_7476=l9_7453.x;
float l9_7477=l9_7458.x;
float l9_7478=l9_7458.z;
bool l9_7479=l9_7475;
float l9_7480=l9_7463;
float l9_7481=fast::clamp(l9_7476,l9_7477,l9_7478);
float l9_7482=step(abs(l9_7476-l9_7481),9.9999997e-06);
l9_7480*=(l9_7482+((1.0-float(l9_7479))*(1.0-l9_7482)));
l9_7476=l9_7481;
l9_7453.x=l9_7476;
l9_7463=l9_7480;
bool l9_7483=l9_7459;
bool l9_7484;
if (l9_7483)
{
l9_7484=l9_7456.y==3;
}
else
{
l9_7484=l9_7483;
}
float l9_7485=l9_7453.y;
float l9_7486=l9_7458.y;
float l9_7487=l9_7458.w;
bool l9_7488=l9_7484;
float l9_7489=l9_7463;
float l9_7490=fast::clamp(l9_7485,l9_7486,l9_7487);
float l9_7491=step(abs(l9_7485-l9_7490),9.9999997e-06);
l9_7489*=(l9_7491+((1.0-float(l9_7488))*(1.0-l9_7491)));
l9_7485=l9_7490;
l9_7453.y=l9_7485;
l9_7463=l9_7489;
}
float2 l9_7492=l9_7453;
bool l9_7493=l9_7454;
float3x3 l9_7494=l9_7455;
if (l9_7493)
{
l9_7492=float2((l9_7494*float3(l9_7492,1.0)).xy);
}
float2 l9_7495=l9_7492;
float2 l9_7496=l9_7495;
float2 l9_7497=l9_7496;
l9_7453=l9_7497;
float l9_7498=l9_7453.x;
int l9_7499=l9_7456.x;
bool l9_7500=l9_7462;
float l9_7501=l9_7463;
if ((l9_7499==0)||(l9_7499==3))
{
float l9_7502=l9_7498;
float l9_7503=0.0;
float l9_7504=1.0;
bool l9_7505=l9_7500;
float l9_7506=l9_7501;
float l9_7507=fast::clamp(l9_7502,l9_7503,l9_7504);
float l9_7508=step(abs(l9_7502-l9_7507),9.9999997e-06);
l9_7506*=(l9_7508+((1.0-float(l9_7505))*(1.0-l9_7508)));
l9_7502=l9_7507;
l9_7498=l9_7502;
l9_7501=l9_7506;
}
l9_7453.x=l9_7498;
l9_7463=l9_7501;
float l9_7509=l9_7453.y;
int l9_7510=l9_7456.y;
bool l9_7511=l9_7462;
float l9_7512=l9_7463;
if ((l9_7510==0)||(l9_7510==3))
{
float l9_7513=l9_7509;
float l9_7514=0.0;
float l9_7515=1.0;
bool l9_7516=l9_7511;
float l9_7517=l9_7512;
float l9_7518=fast::clamp(l9_7513,l9_7514,l9_7515);
float l9_7519=step(abs(l9_7513-l9_7518),9.9999997e-06);
l9_7517*=(l9_7519+((1.0-float(l9_7516))*(1.0-l9_7519)));
l9_7513=l9_7518;
l9_7509=l9_7513;
l9_7512=l9_7517;
}
l9_7453.y=l9_7509;
l9_7463=l9_7512;
float2 l9_7520=l9_7453;
int l9_7521=l9_7451;
int l9_7522=l9_7452;
float l9_7523=l9_7461;
float2 l9_7524=l9_7520;
int l9_7525=l9_7521;
int l9_7526=l9_7522;
float3 l9_7527=float3(0.0);
if (l9_7525==0)
{
l9_7527=float3(l9_7524,0.0);
}
else
{
if (l9_7525==1)
{
l9_7527=float3(l9_7524.x,(l9_7524.y*0.5)+(0.5-(float(l9_7526)*0.5)),0.0);
}
else
{
l9_7527=float3(l9_7524,float(l9_7526));
}
}
float3 l9_7528=l9_7527;
float3 l9_7529=l9_7528;
float2 l9_7530=l9_7529.xy;
float l9_7531=l9_7523;
float4 l9_7532=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7530,bias(l9_7531));
float4 l9_7533=l9_7532;
float4 l9_7534=l9_7533;
if (l9_7459)
{
l9_7534=mix(l9_7460,l9_7534,float4(l9_7463));
}
float4 l9_7535=l9_7534;
l9_7444=l9_7535;
float3 l9_7536=float3(0.0);
l9_7536=float3(l9_7444.z,l9_7444.z,l9_7444.z);
float3 l9_7537=float3(0.0);
l9_7537=l9_7230.xyz*l9_7536;
l9_7226=l9_7537;
l9_7229=l9_7226;
}
else
{
float2 l9_7538=float2(0.0);
float2 l9_7539=float2(0.0);
float2 l9_7540=float2(0.0);
float2 l9_7541=float2(0.0);
float2 l9_7542=float2(0.0);
float2 l9_7543=float2(0.0);
ssGlobals l9_7544=l9_7228;
float2 l9_7545;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_7546=float2(0.0);
l9_7546=l9_7544.Surface_UVCoord0;
l9_7539=l9_7546;
l9_7545=l9_7539;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_7547=float2(0.0);
l9_7547=l9_7544.Surface_UVCoord1;
l9_7540=l9_7547;
l9_7545=l9_7540;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_7548=float2(0.0);
float2 l9_7549=float2(0.0);
float2 l9_7550=float2(0.0);
ssGlobals l9_7551=l9_7544;
float2 l9_7552;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7553=float2(0.0);
float2 l9_7554=float2(0.0);
float2 l9_7555=float2(0.0);
ssGlobals l9_7556=l9_7551;
float2 l9_7557;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7558=float2(0.0);
float2 l9_7559=float2(0.0);
float2 l9_7560=float2(0.0);
float2 l9_7561=float2(0.0);
float2 l9_7562=float2(0.0);
ssGlobals l9_7563=l9_7556;
float2 l9_7564;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7565=float2(0.0);
l9_7565=l9_7563.Surface_UVCoord0;
l9_7559=l9_7565;
l9_7564=l9_7559;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7566=float2(0.0);
l9_7566=l9_7563.Surface_UVCoord1;
l9_7560=l9_7566;
l9_7564=l9_7560;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7567=float2(0.0);
l9_7567=l9_7563.gScreenCoord;
l9_7561=l9_7567;
l9_7564=l9_7561;
}
else
{
float2 l9_7568=float2(0.0);
l9_7568=l9_7563.Surface_UVCoord0;
l9_7562=l9_7568;
l9_7564=l9_7562;
}
}
}
l9_7558=l9_7564;
float2 l9_7569=float2(0.0);
float2 l9_7570=(*sc_set0.UserUniforms).uv2Scale;
l9_7569=l9_7570;
float2 l9_7571=float2(0.0);
l9_7571=l9_7569;
float2 l9_7572=float2(0.0);
float2 l9_7573=(*sc_set0.UserUniforms).uv2Offset;
l9_7572=l9_7573;
float2 l9_7574=float2(0.0);
l9_7574=l9_7572;
float2 l9_7575=float2(0.0);
l9_7575=(l9_7558*l9_7571)+l9_7574;
float2 l9_7576=float2(0.0);
l9_7576=l9_7575+(l9_7574*(l9_7556.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7554=l9_7576;
l9_7557=l9_7554;
}
else
{
float2 l9_7577=float2(0.0);
float2 l9_7578=float2(0.0);
float2 l9_7579=float2(0.0);
float2 l9_7580=float2(0.0);
float2 l9_7581=float2(0.0);
ssGlobals l9_7582=l9_7556;
float2 l9_7583;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7584=float2(0.0);
l9_7584=l9_7582.Surface_UVCoord0;
l9_7578=l9_7584;
l9_7583=l9_7578;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7585=float2(0.0);
l9_7585=l9_7582.Surface_UVCoord1;
l9_7579=l9_7585;
l9_7583=l9_7579;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7586=float2(0.0);
l9_7586=l9_7582.gScreenCoord;
l9_7580=l9_7586;
l9_7583=l9_7580;
}
else
{
float2 l9_7587=float2(0.0);
l9_7587=l9_7582.Surface_UVCoord0;
l9_7581=l9_7587;
l9_7583=l9_7581;
}
}
}
l9_7577=l9_7583;
float2 l9_7588=float2(0.0);
float2 l9_7589=(*sc_set0.UserUniforms).uv2Scale;
l9_7588=l9_7589;
float2 l9_7590=float2(0.0);
l9_7590=l9_7588;
float2 l9_7591=float2(0.0);
float2 l9_7592=(*sc_set0.UserUniforms).uv2Offset;
l9_7591=l9_7592;
float2 l9_7593=float2(0.0);
l9_7593=l9_7591;
float2 l9_7594=float2(0.0);
l9_7594=(l9_7577*l9_7590)+l9_7593;
l9_7555=l9_7594;
l9_7557=l9_7555;
}
l9_7553=l9_7557;
l9_7549=l9_7553;
l9_7552=l9_7549;
}
else
{
float2 l9_7595=float2(0.0);
l9_7595=l9_7551.Surface_UVCoord0;
l9_7550=l9_7595;
l9_7552=l9_7550;
}
l9_7548=l9_7552;
float2 l9_7596=float2(0.0);
l9_7596=l9_7548;
float2 l9_7597=float2(0.0);
l9_7597=l9_7596;
l9_7541=l9_7597;
l9_7545=l9_7541;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_7598=float2(0.0);
float2 l9_7599=float2(0.0);
float2 l9_7600=float2(0.0);
ssGlobals l9_7601=l9_7544;
float2 l9_7602;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_7603=float2(0.0);
float2 l9_7604=float2(0.0);
float2 l9_7605=float2(0.0);
ssGlobals l9_7606=l9_7601;
float2 l9_7607;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_7608=float2(0.0);
float2 l9_7609=float2(0.0);
float2 l9_7610=float2(0.0);
float2 l9_7611=float2(0.0);
float2 l9_7612=float2(0.0);
float2 l9_7613=float2(0.0);
ssGlobals l9_7614=l9_7606;
float2 l9_7615;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7616=float2(0.0);
l9_7616=l9_7614.Surface_UVCoord0;
l9_7609=l9_7616;
l9_7615=l9_7609;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7617=float2(0.0);
l9_7617=l9_7614.Surface_UVCoord1;
l9_7610=l9_7617;
l9_7615=l9_7610;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7618=float2(0.0);
l9_7618=l9_7614.gScreenCoord;
l9_7611=l9_7618;
l9_7615=l9_7611;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7619=float2(0.0);
float2 l9_7620=float2(0.0);
float2 l9_7621=float2(0.0);
ssGlobals l9_7622=l9_7614;
float2 l9_7623;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7624=float2(0.0);
float2 l9_7625=float2(0.0);
float2 l9_7626=float2(0.0);
ssGlobals l9_7627=l9_7622;
float2 l9_7628;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7629=float2(0.0);
float2 l9_7630=float2(0.0);
float2 l9_7631=float2(0.0);
float2 l9_7632=float2(0.0);
float2 l9_7633=float2(0.0);
ssGlobals l9_7634=l9_7627;
float2 l9_7635;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7636=float2(0.0);
l9_7636=l9_7634.Surface_UVCoord0;
l9_7630=l9_7636;
l9_7635=l9_7630;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7637=float2(0.0);
l9_7637=l9_7634.Surface_UVCoord1;
l9_7631=l9_7637;
l9_7635=l9_7631;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7638=float2(0.0);
l9_7638=l9_7634.gScreenCoord;
l9_7632=l9_7638;
l9_7635=l9_7632;
}
else
{
float2 l9_7639=float2(0.0);
l9_7639=l9_7634.Surface_UVCoord0;
l9_7633=l9_7639;
l9_7635=l9_7633;
}
}
}
l9_7629=l9_7635;
float2 l9_7640=float2(0.0);
float2 l9_7641=(*sc_set0.UserUniforms).uv2Scale;
l9_7640=l9_7641;
float2 l9_7642=float2(0.0);
l9_7642=l9_7640;
float2 l9_7643=float2(0.0);
float2 l9_7644=(*sc_set0.UserUniforms).uv2Offset;
l9_7643=l9_7644;
float2 l9_7645=float2(0.0);
l9_7645=l9_7643;
float2 l9_7646=float2(0.0);
l9_7646=(l9_7629*l9_7642)+l9_7645;
float2 l9_7647=float2(0.0);
l9_7647=l9_7646+(l9_7645*(l9_7627.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7625=l9_7647;
l9_7628=l9_7625;
}
else
{
float2 l9_7648=float2(0.0);
float2 l9_7649=float2(0.0);
float2 l9_7650=float2(0.0);
float2 l9_7651=float2(0.0);
float2 l9_7652=float2(0.0);
ssGlobals l9_7653=l9_7627;
float2 l9_7654;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7655=float2(0.0);
l9_7655=l9_7653.Surface_UVCoord0;
l9_7649=l9_7655;
l9_7654=l9_7649;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7656=float2(0.0);
l9_7656=l9_7653.Surface_UVCoord1;
l9_7650=l9_7656;
l9_7654=l9_7650;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7657=float2(0.0);
l9_7657=l9_7653.gScreenCoord;
l9_7651=l9_7657;
l9_7654=l9_7651;
}
else
{
float2 l9_7658=float2(0.0);
l9_7658=l9_7653.Surface_UVCoord0;
l9_7652=l9_7658;
l9_7654=l9_7652;
}
}
}
l9_7648=l9_7654;
float2 l9_7659=float2(0.0);
float2 l9_7660=(*sc_set0.UserUniforms).uv2Scale;
l9_7659=l9_7660;
float2 l9_7661=float2(0.0);
l9_7661=l9_7659;
float2 l9_7662=float2(0.0);
float2 l9_7663=(*sc_set0.UserUniforms).uv2Offset;
l9_7662=l9_7663;
float2 l9_7664=float2(0.0);
l9_7664=l9_7662;
float2 l9_7665=float2(0.0);
l9_7665=(l9_7648*l9_7661)+l9_7664;
l9_7626=l9_7665;
l9_7628=l9_7626;
}
l9_7624=l9_7628;
l9_7620=l9_7624;
l9_7623=l9_7620;
}
else
{
float2 l9_7666=float2(0.0);
l9_7666=l9_7622.Surface_UVCoord0;
l9_7621=l9_7666;
l9_7623=l9_7621;
}
l9_7619=l9_7623;
float2 l9_7667=float2(0.0);
l9_7667=l9_7619;
float2 l9_7668=float2(0.0);
l9_7668=l9_7667;
l9_7612=l9_7668;
l9_7615=l9_7612;
}
else
{
float2 l9_7669=float2(0.0);
l9_7669=l9_7614.Surface_UVCoord0;
l9_7613=l9_7669;
l9_7615=l9_7613;
}
}
}
}
l9_7608=l9_7615;
float2 l9_7670=float2(0.0);
float2 l9_7671=(*sc_set0.UserUniforms).uv3Scale;
l9_7670=l9_7671;
float2 l9_7672=float2(0.0);
l9_7672=l9_7670;
float2 l9_7673=float2(0.0);
float2 l9_7674=(*sc_set0.UserUniforms).uv3Offset;
l9_7673=l9_7674;
float2 l9_7675=float2(0.0);
l9_7675=l9_7673;
float2 l9_7676=float2(0.0);
l9_7676=(l9_7608*l9_7672)+l9_7675;
float2 l9_7677=float2(0.0);
l9_7677=l9_7676+(l9_7675*(l9_7606.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_7604=l9_7677;
l9_7607=l9_7604;
}
else
{
float2 l9_7678=float2(0.0);
float2 l9_7679=float2(0.0);
float2 l9_7680=float2(0.0);
float2 l9_7681=float2(0.0);
float2 l9_7682=float2(0.0);
float2 l9_7683=float2(0.0);
ssGlobals l9_7684=l9_7606;
float2 l9_7685;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7686=float2(0.0);
l9_7686=l9_7684.Surface_UVCoord0;
l9_7679=l9_7686;
l9_7685=l9_7679;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7687=float2(0.0);
l9_7687=l9_7684.Surface_UVCoord1;
l9_7680=l9_7687;
l9_7685=l9_7680;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7688=float2(0.0);
l9_7688=l9_7684.gScreenCoord;
l9_7681=l9_7688;
l9_7685=l9_7681;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7689=float2(0.0);
float2 l9_7690=float2(0.0);
float2 l9_7691=float2(0.0);
ssGlobals l9_7692=l9_7684;
float2 l9_7693;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_7694=float2(0.0);
float2 l9_7695=float2(0.0);
float2 l9_7696=float2(0.0);
ssGlobals l9_7697=l9_7692;
float2 l9_7698;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_7699=float2(0.0);
float2 l9_7700=float2(0.0);
float2 l9_7701=float2(0.0);
float2 l9_7702=float2(0.0);
float2 l9_7703=float2(0.0);
ssGlobals l9_7704=l9_7697;
float2 l9_7705;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7706=float2(0.0);
l9_7706=l9_7704.Surface_UVCoord0;
l9_7700=l9_7706;
l9_7705=l9_7700;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7707=float2(0.0);
l9_7707=l9_7704.Surface_UVCoord1;
l9_7701=l9_7707;
l9_7705=l9_7701;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7708=float2(0.0);
l9_7708=l9_7704.gScreenCoord;
l9_7702=l9_7708;
l9_7705=l9_7702;
}
else
{
float2 l9_7709=float2(0.0);
l9_7709=l9_7704.Surface_UVCoord0;
l9_7703=l9_7709;
l9_7705=l9_7703;
}
}
}
l9_7699=l9_7705;
float2 l9_7710=float2(0.0);
float2 l9_7711=(*sc_set0.UserUniforms).uv2Scale;
l9_7710=l9_7711;
float2 l9_7712=float2(0.0);
l9_7712=l9_7710;
float2 l9_7713=float2(0.0);
float2 l9_7714=(*sc_set0.UserUniforms).uv2Offset;
l9_7713=l9_7714;
float2 l9_7715=float2(0.0);
l9_7715=l9_7713;
float2 l9_7716=float2(0.0);
l9_7716=(l9_7699*l9_7712)+l9_7715;
float2 l9_7717=float2(0.0);
l9_7717=l9_7716+(l9_7715*(l9_7697.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7695=l9_7717;
l9_7698=l9_7695;
}
else
{
float2 l9_7718=float2(0.0);
float2 l9_7719=float2(0.0);
float2 l9_7720=float2(0.0);
float2 l9_7721=float2(0.0);
float2 l9_7722=float2(0.0);
ssGlobals l9_7723=l9_7697;
float2 l9_7724;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7725=float2(0.0);
l9_7725=l9_7723.Surface_UVCoord0;
l9_7719=l9_7725;
l9_7724=l9_7719;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7726=float2(0.0);
l9_7726=l9_7723.Surface_UVCoord1;
l9_7720=l9_7726;
l9_7724=l9_7720;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7727=float2(0.0);
l9_7727=l9_7723.gScreenCoord;
l9_7721=l9_7727;
l9_7724=l9_7721;
}
else
{
float2 l9_7728=float2(0.0);
l9_7728=l9_7723.Surface_UVCoord0;
l9_7722=l9_7728;
l9_7724=l9_7722;
}
}
}
l9_7718=l9_7724;
float2 l9_7729=float2(0.0);
float2 l9_7730=(*sc_set0.UserUniforms).uv2Scale;
l9_7729=l9_7730;
float2 l9_7731=float2(0.0);
l9_7731=l9_7729;
float2 l9_7732=float2(0.0);
float2 l9_7733=(*sc_set0.UserUniforms).uv2Offset;
l9_7732=l9_7733;
float2 l9_7734=float2(0.0);
l9_7734=l9_7732;
float2 l9_7735=float2(0.0);
l9_7735=(l9_7718*l9_7731)+l9_7734;
l9_7696=l9_7735;
l9_7698=l9_7696;
}
l9_7694=l9_7698;
l9_7690=l9_7694;
l9_7693=l9_7690;
}
else
{
float2 l9_7736=float2(0.0);
l9_7736=l9_7692.Surface_UVCoord0;
l9_7691=l9_7736;
l9_7693=l9_7691;
}
l9_7689=l9_7693;
float2 l9_7737=float2(0.0);
l9_7737=l9_7689;
float2 l9_7738=float2(0.0);
l9_7738=l9_7737;
l9_7682=l9_7738;
l9_7685=l9_7682;
}
else
{
float2 l9_7739=float2(0.0);
l9_7739=l9_7684.Surface_UVCoord0;
l9_7683=l9_7739;
l9_7685=l9_7683;
}
}
}
}
l9_7678=l9_7685;
float2 l9_7740=float2(0.0);
float2 l9_7741=(*sc_set0.UserUniforms).uv3Scale;
l9_7740=l9_7741;
float2 l9_7742=float2(0.0);
l9_7742=l9_7740;
float2 l9_7743=float2(0.0);
float2 l9_7744=(*sc_set0.UserUniforms).uv3Offset;
l9_7743=l9_7744;
float2 l9_7745=float2(0.0);
l9_7745=l9_7743;
float2 l9_7746=float2(0.0);
l9_7746=(l9_7678*l9_7742)+l9_7745;
l9_7605=l9_7746;
l9_7607=l9_7605;
}
l9_7603=l9_7607;
l9_7599=l9_7603;
l9_7602=l9_7599;
}
else
{
float2 l9_7747=float2(0.0);
l9_7747=l9_7601.Surface_UVCoord0;
l9_7600=l9_7747;
l9_7602=l9_7600;
}
l9_7598=l9_7602;
float2 l9_7748=float2(0.0);
l9_7748=l9_7598;
float2 l9_7749=float2(0.0);
l9_7749=l9_7748;
l9_7542=l9_7749;
l9_7545=l9_7542;
}
else
{
float2 l9_7750=float2(0.0);
l9_7750=l9_7544.Surface_UVCoord0;
l9_7543=l9_7750;
l9_7545=l9_7543;
}
}
}
}
l9_7538=l9_7545;
float4 l9_7751=float4(0.0);
int l9_7752=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7753=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7753=0;
}
else
{
l9_7753=in.varStereoViewID;
}
int l9_7754=l9_7753;
l9_7752=1-l9_7754;
}
else
{
int l9_7755=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7755=0;
}
else
{
l9_7755=in.varStereoViewID;
}
int l9_7756=l9_7755;
l9_7752=l9_7756;
}
int l9_7757=l9_7752;
int l9_7758=materialParamsTexLayout_tmp;
int l9_7759=l9_7757;
float2 l9_7760=l9_7538;
bool l9_7761=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7762=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7763=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7764=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7765=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7766=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7767=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7768=0.0;
bool l9_7769=l9_7766&&(!l9_7764);
float l9_7770=1.0;
float l9_7771=l9_7760.x;
int l9_7772=l9_7763.x;
if (l9_7772==1)
{
l9_7771=fract(l9_7771);
}
else
{
if (l9_7772==2)
{
float l9_7773=fract(l9_7771);
float l9_7774=l9_7771-l9_7773;
float l9_7775=step(0.25,fract(l9_7774*0.5));
l9_7771=mix(l9_7773,1.0-l9_7773,fast::clamp(l9_7775,0.0,1.0));
}
}
l9_7760.x=l9_7771;
float l9_7776=l9_7760.y;
int l9_7777=l9_7763.y;
if (l9_7777==1)
{
l9_7776=fract(l9_7776);
}
else
{
if (l9_7777==2)
{
float l9_7778=fract(l9_7776);
float l9_7779=l9_7776-l9_7778;
float l9_7780=step(0.25,fract(l9_7779*0.5));
l9_7776=mix(l9_7778,1.0-l9_7778,fast::clamp(l9_7780,0.0,1.0));
}
}
l9_7760.y=l9_7776;
if (l9_7764)
{
bool l9_7781=l9_7766;
bool l9_7782;
if (l9_7781)
{
l9_7782=l9_7763.x==3;
}
else
{
l9_7782=l9_7781;
}
float l9_7783=l9_7760.x;
float l9_7784=l9_7765.x;
float l9_7785=l9_7765.z;
bool l9_7786=l9_7782;
float l9_7787=l9_7770;
float l9_7788=fast::clamp(l9_7783,l9_7784,l9_7785);
float l9_7789=step(abs(l9_7783-l9_7788),9.9999997e-06);
l9_7787*=(l9_7789+((1.0-float(l9_7786))*(1.0-l9_7789)));
l9_7783=l9_7788;
l9_7760.x=l9_7783;
l9_7770=l9_7787;
bool l9_7790=l9_7766;
bool l9_7791;
if (l9_7790)
{
l9_7791=l9_7763.y==3;
}
else
{
l9_7791=l9_7790;
}
float l9_7792=l9_7760.y;
float l9_7793=l9_7765.y;
float l9_7794=l9_7765.w;
bool l9_7795=l9_7791;
float l9_7796=l9_7770;
float l9_7797=fast::clamp(l9_7792,l9_7793,l9_7794);
float l9_7798=step(abs(l9_7792-l9_7797),9.9999997e-06);
l9_7796*=(l9_7798+((1.0-float(l9_7795))*(1.0-l9_7798)));
l9_7792=l9_7797;
l9_7760.y=l9_7792;
l9_7770=l9_7796;
}
float2 l9_7799=l9_7760;
bool l9_7800=l9_7761;
float3x3 l9_7801=l9_7762;
if (l9_7800)
{
l9_7799=float2((l9_7801*float3(l9_7799,1.0)).xy);
}
float2 l9_7802=l9_7799;
float2 l9_7803=l9_7802;
float2 l9_7804=l9_7803;
l9_7760=l9_7804;
float l9_7805=l9_7760.x;
int l9_7806=l9_7763.x;
bool l9_7807=l9_7769;
float l9_7808=l9_7770;
if ((l9_7806==0)||(l9_7806==3))
{
float l9_7809=l9_7805;
float l9_7810=0.0;
float l9_7811=1.0;
bool l9_7812=l9_7807;
float l9_7813=l9_7808;
float l9_7814=fast::clamp(l9_7809,l9_7810,l9_7811);
float l9_7815=step(abs(l9_7809-l9_7814),9.9999997e-06);
l9_7813*=(l9_7815+((1.0-float(l9_7812))*(1.0-l9_7815)));
l9_7809=l9_7814;
l9_7805=l9_7809;
l9_7808=l9_7813;
}
l9_7760.x=l9_7805;
l9_7770=l9_7808;
float l9_7816=l9_7760.y;
int l9_7817=l9_7763.y;
bool l9_7818=l9_7769;
float l9_7819=l9_7770;
if ((l9_7817==0)||(l9_7817==3))
{
float l9_7820=l9_7816;
float l9_7821=0.0;
float l9_7822=1.0;
bool l9_7823=l9_7818;
float l9_7824=l9_7819;
float l9_7825=fast::clamp(l9_7820,l9_7821,l9_7822);
float l9_7826=step(abs(l9_7820-l9_7825),9.9999997e-06);
l9_7824*=(l9_7826+((1.0-float(l9_7823))*(1.0-l9_7826)));
l9_7820=l9_7825;
l9_7816=l9_7820;
l9_7819=l9_7824;
}
l9_7760.y=l9_7816;
l9_7770=l9_7819;
float2 l9_7827=l9_7760;
int l9_7828=l9_7758;
int l9_7829=l9_7759;
float l9_7830=l9_7768;
float2 l9_7831=l9_7827;
int l9_7832=l9_7828;
int l9_7833=l9_7829;
float3 l9_7834=float3(0.0);
if (l9_7832==0)
{
l9_7834=float3(l9_7831,0.0);
}
else
{
if (l9_7832==1)
{
l9_7834=float3(l9_7831.x,(l9_7831.y*0.5)+(0.5-(float(l9_7833)*0.5)),0.0);
}
else
{
l9_7834=float3(l9_7831,float(l9_7833));
}
}
float3 l9_7835=l9_7834;
float3 l9_7836=l9_7835;
float2 l9_7837=l9_7836.xy;
float l9_7838=l9_7830;
float4 l9_7839=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7837,bias(l9_7838));
float4 l9_7840=l9_7839;
float4 l9_7841=l9_7840;
if (l9_7766)
{
l9_7841=mix(l9_7767,l9_7841,float4(l9_7770));
}
float4 l9_7842=l9_7841;
l9_7751=l9_7842;
float3 l9_7843=float3(0.0);
l9_7843=float3(l9_7751.z,l9_7751.z,l9_7751.z);
l9_7227=l9_7843;
l9_7229=l9_7227;
}
l9_7225=l9_7229;
float3 l9_7844=float3(0.0);
l9_7844=mix(l9_7224,(*sc_set0.UserUniforms).Port_Input1_N322,l9_7225);
float l9_7845=0.0;
float l9_7846=(*sc_set0.UserUniforms).specularAoIntensity;
l9_7845=l9_7846;
float l9_7847=0.0;
l9_7847=l9_7845;
float3 l9_7848=float3(0.0);
l9_7848=mix((*sc_set0.UserUniforms).Port_Input0_N325,l9_7844,float3(l9_7847));
l9_6901=l9_7848;
l9_6904=l9_6901;
}
else
{
l9_6904=l9_6902;
}
l9_6900=l9_6904;
param_62=l9_6900;
param_63=param_62;
}
Result_N79=param_63;
float3 Export_N232=float3(0.0);
Export_N232=Result_N79;
float4 Output_N36=float4(0.0);
float3 param_65=Export_N364.xyz;
float param_66=Export_N158;
float3 param_67=Export_N334;
float3 param_68=Export_N300;
float param_69=Export_N222;
float param_70=Export_N224;
float3 param_71=Export_N230;
float3 param_72=Export_N232;
ssGlobals param_74=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_74.BumpedNormal=param_67;
}
param_66=fast::clamp(param_66,0.0,1.0);
float l9_7849=param_66;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_7849<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_7850=gl_FragCoord;
float2 l9_7851=floor(mod(l9_7850.xy,float2(4.0)));
float l9_7852=(mod(dot(l9_7851,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_7849<l9_7852)
{
discard_fragment();
}
}
param_65=fast::max(param_65,float3(0.0));
float4 param_73;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_73=float4(param_65,param_66);
}
else
{
param_68=fast::max(param_68,float3(0.0));
param_69=fast::clamp(param_69,0.0,1.0);
param_70=fast::clamp(param_70,0.0,1.0);
param_71=fast::clamp(param_71,float3(0.0),float3(1.0));
param_72=fast::clamp(param_72,float3(0.0),float3(1.0));
float3 l9_7853=param_65;
float l9_7854=param_66;
float3 l9_7855=param_74.BumpedNormal;
float3 l9_7856=param_74.PositionWS;
float3 l9_7857=param_74.ViewDirWS;
float3 l9_7858=param_68;
float l9_7859=param_69;
float l9_7860=param_70;
float3 l9_7861=param_71;
float3 l9_7862=param_72;
param_73=ngsCalculateLighting(l9_7853,l9_7854,l9_7855,l9_7856,l9_7857,l9_7858,l9_7859,l9_7860,l9_7861,l9_7862,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_73=fast::max(param_73,float4(0.0));
Output_N36=param_73;
FinalColor=Output_N36;
bool l9_7863=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_7863)
{
float4 param_75=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_75.w=1.0;
}
float4 l9_7864=fast::max(param_75,float4(0.0));
float4 param_76=l9_7864;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_76.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_76;
return out;
}
float4 param_77=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_7865=param_77;
float4 l9_7866=l9_7865;
float l9_7867=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_7867=l9_7866.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_7867=fast::clamp(l9_7866.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_7867=fast::clamp(dot(l9_7866.xyz,float3(l9_7866.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_7867=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_7867=(1.0-dot(l9_7866.xyz,float3(0.33333001)))*l9_7866.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_7867=(1.0-fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0))*l9_7866.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_7867=fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0)*l9_7866.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_7867=fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_7867=fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0)*l9_7866.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_7867=dot(l9_7866.xyz,float3(0.33333001))*l9_7866.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_7867=1.0-fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_7867=fast::clamp(dot(l9_7866.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_7868=l9_7867;
float l9_7869=l9_7868;
float l9_7870=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_7869;
float3 l9_7871=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_7865.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_7872=float4(l9_7871.x,l9_7871.y,l9_7871.z,l9_7870);
param_77=l9_7872;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_77=float4(param_77.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_7873=param_77;
float4 l9_7874=float4(0.0);
float4 l9_7875=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_7876=out.FragColor0;
float4 l9_7877=l9_7876;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_7877.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_7878=l9_7877;
l9_7875=l9_7878;
}
else
{
float4 l9_7879=gl_FragCoord;
float2 l9_7880=l9_7879.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_7881=l9_7880;
float2 l9_7882=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_7883=1;
int l9_7884=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7884=0;
}
else
{
l9_7884=in.varStereoViewID;
}
int l9_7885=l9_7884;
int l9_7886=l9_7885;
float3 l9_7887=float3(l9_7881,0.0);
int l9_7888=l9_7883;
int l9_7889=l9_7886;
if (l9_7888==1)
{
l9_7887.y=((2.0*l9_7887.y)+float(l9_7889))-1.0;
}
float2 l9_7890=l9_7887.xy;
l9_7882=l9_7890;
}
else
{
l9_7882=l9_7881;
}
float2 l9_7891=l9_7882;
float2 l9_7892=l9_7891;
float2 l9_7893=l9_7892;
int l9_7894=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_7895=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7895=0;
}
else
{
l9_7895=in.varStereoViewID;
}
int l9_7896=l9_7895;
l9_7894=1-l9_7896;
}
else
{
int l9_7897=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7897=0;
}
else
{
l9_7897=in.varStereoViewID;
}
int l9_7898=l9_7897;
l9_7894=l9_7898;
}
int l9_7899=l9_7894;
float2 l9_7900=l9_7893;
int l9_7901=l9_7899;
float2 l9_7902=l9_7900;
int l9_7903=l9_7901;
float l9_7904=0.0;
float4 l9_7905=float4(0.0);
float2 l9_7906=l9_7902;
int l9_7907=sc_ScreenTextureLayout_tmp;
int l9_7908=l9_7903;
float l9_7909=l9_7904;
float2 l9_7910=l9_7906;
int l9_7911=l9_7907;
int l9_7912=l9_7908;
float3 l9_7913=float3(0.0);
if (l9_7911==0)
{
l9_7913=float3(l9_7910,0.0);
}
else
{
if (l9_7911==1)
{
l9_7913=float3(l9_7910.x,(l9_7910.y*0.5)+(0.5-(float(l9_7912)*0.5)),0.0);
}
else
{
l9_7913=float3(l9_7910,float(l9_7912));
}
}
float3 l9_7914=l9_7913;
float3 l9_7915=l9_7914;
float2 l9_7916=l9_7915.xy;
float l9_7917=l9_7909;
float4 l9_7918=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_7916,bias(l9_7917));
float4 l9_7919=l9_7918;
l9_7905=l9_7919;
float4 l9_7920=l9_7905;
float4 l9_7921=l9_7920;
float4 l9_7922=l9_7921;
l9_7875=l9_7922;
}
float4 l9_7923=l9_7875;
float4 l9_7924=l9_7923;
float3 l9_7925=l9_7924.xyz;
float3 l9_7926=l9_7925;
float3 l9_7927=l9_7873.xyz;
float3 l9_7928=definedBlend(l9_7926,l9_7927,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_7874=float4(l9_7928.x,l9_7928.y,l9_7928.z,l9_7874.w);
float3 l9_7929=mix(l9_7925,l9_7874.xyz,float3(l9_7873.w));
l9_7874=float4(l9_7929.x,l9_7929.y,l9_7929.z,l9_7874.w);
l9_7874.w=1.0;
float4 l9_7930=l9_7874;
param_77=l9_7930;
}
else
{
float4 l9_7931=param_77;
float4 l9_7932=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_7932=float4(mix(float3(1.0),l9_7931.xyz,float3(l9_7931.w)),l9_7931.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_7933=l9_7931.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_7933=fast::clamp(l9_7933,0.0,1.0);
}
l9_7932=float4(l9_7931.xyz*l9_7933,l9_7933);
}
else
{
l9_7932=l9_7931;
}
}
float4 l9_7934=l9_7932;
param_77=l9_7934;
}
}
}
float4 l9_7935=param_77;
FinalColor=l9_7935;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_7936=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_7936=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_7936=float4(0.0);
}
float4 l9_7937=l9_7936;
float4 Cost=l9_7937;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_78=in.varPos;
float4 param_79=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_78,param_79,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_80=FinalColor;
float4 l9_7938=param_80;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_7938.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_7938;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
float l9_0;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_2=gl_FragCoord;
float2 l9_3=l9_2.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4=l9_3;
float2 l9_5=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_6=1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
int l9_9=l9_8;
float3 l9_10=float3(l9_4,0.0);
int l9_11=l9_6;
int l9_12=l9_9;
if (l9_11==1)
{
l9_10.y=((2.0*l9_10.y)+float(l9_12))-1.0;
}
float2 l9_13=l9_10.xy;
l9_5=l9_13;
}
else
{
l9_5=l9_4;
}
float2 l9_14=l9_5;
float2 l9_15=l9_14;
Globals.gScreenCoord=l9_15;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float4 Output_N5=float4(0.0);
float4 param=(*sc_set0.UserUniforms).baseColor;
Output_N5=param;
float4 Value_N384=float4(0.0);
Value_N384=Output_N5;
float4 Result_N369=float4(0.0);
float4 param_1=float4(0.0);
float4 param_2=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals param_4=Globals;
float4 param_3;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_16=float2(0.0);
float2 l9_17=float2(0.0);
float2 l9_18=float2(0.0);
float2 l9_19=float2(0.0);
float2 l9_20=float2(0.0);
float2 l9_21=float2(0.0);
ssGlobals l9_22=param_4;
float2 l9_23;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_24=float2(0.0);
l9_24=l9_22.Surface_UVCoord0;
l9_17=l9_24;
l9_23=l9_17;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_25=float2(0.0);
l9_25=l9_22.Surface_UVCoord1;
l9_18=l9_25;
l9_23=l9_18;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_26=float2(0.0);
float2 l9_27=float2(0.0);
float2 l9_28=float2(0.0);
ssGlobals l9_29=l9_22;
float2 l9_30;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_31=float2(0.0);
float2 l9_32=float2(0.0);
float2 l9_33=float2(0.0);
ssGlobals l9_34=l9_29;
float2 l9_35;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_36=float2(0.0);
float2 l9_37=float2(0.0);
float2 l9_38=float2(0.0);
float2 l9_39=float2(0.0);
float2 l9_40=float2(0.0);
ssGlobals l9_41=l9_34;
float2 l9_42;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_43=float2(0.0);
l9_43=l9_41.Surface_UVCoord0;
l9_37=l9_43;
l9_42=l9_37;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_44=float2(0.0);
l9_44=l9_41.Surface_UVCoord1;
l9_38=l9_44;
l9_42=l9_38;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_45=float2(0.0);
l9_45=l9_41.gScreenCoord;
l9_39=l9_45;
l9_42=l9_39;
}
else
{
float2 l9_46=float2(0.0);
l9_46=l9_41.Surface_UVCoord0;
l9_40=l9_46;
l9_42=l9_40;
}
}
}
l9_36=l9_42;
float2 l9_47=float2(0.0);
float2 l9_48=(*sc_set0.UserUniforms).uv2Scale;
l9_47=l9_48;
float2 l9_49=float2(0.0);
l9_49=l9_47;
float2 l9_50=float2(0.0);
float2 l9_51=(*sc_set0.UserUniforms).uv2Offset;
l9_50=l9_51;
float2 l9_52=float2(0.0);
l9_52=l9_50;
float2 l9_53=float2(0.0);
l9_53=(l9_36*l9_49)+l9_52;
float2 l9_54=float2(0.0);
l9_54=l9_53+(l9_52*(l9_34.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_32=l9_54;
l9_35=l9_32;
}
else
{
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
ssGlobals l9_60=l9_34;
float2 l9_61;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_62=float2(0.0);
l9_62=l9_60.Surface_UVCoord0;
l9_56=l9_62;
l9_61=l9_56;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_63=float2(0.0);
l9_63=l9_60.Surface_UVCoord1;
l9_57=l9_63;
l9_61=l9_57;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_64=float2(0.0);
l9_64=l9_60.gScreenCoord;
l9_58=l9_64;
l9_61=l9_58;
}
else
{
float2 l9_65=float2(0.0);
l9_65=l9_60.Surface_UVCoord0;
l9_59=l9_65;
l9_61=l9_59;
}
}
}
l9_55=l9_61;
float2 l9_66=float2(0.0);
float2 l9_67=(*sc_set0.UserUniforms).uv2Scale;
l9_66=l9_67;
float2 l9_68=float2(0.0);
l9_68=l9_66;
float2 l9_69=float2(0.0);
float2 l9_70=(*sc_set0.UserUniforms).uv2Offset;
l9_69=l9_70;
float2 l9_71=float2(0.0);
l9_71=l9_69;
float2 l9_72=float2(0.0);
l9_72=(l9_55*l9_68)+l9_71;
l9_33=l9_72;
l9_35=l9_33;
}
l9_31=l9_35;
l9_27=l9_31;
l9_30=l9_27;
}
else
{
float2 l9_73=float2(0.0);
l9_73=l9_29.Surface_UVCoord0;
l9_28=l9_73;
l9_30=l9_28;
}
l9_26=l9_30;
float2 l9_74=float2(0.0);
l9_74=l9_26;
float2 l9_75=float2(0.0);
l9_75=l9_74;
l9_19=l9_75;
l9_23=l9_19;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_76=float2(0.0);
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
ssGlobals l9_79=l9_22;
float2 l9_80;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_81=float2(0.0);
float2 l9_82=float2(0.0);
float2 l9_83=float2(0.0);
ssGlobals l9_84=l9_79;
float2 l9_85;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_86=float2(0.0);
float2 l9_87=float2(0.0);
float2 l9_88=float2(0.0);
float2 l9_89=float2(0.0);
float2 l9_90=float2(0.0);
float2 l9_91=float2(0.0);
ssGlobals l9_92=l9_84;
float2 l9_93;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_94=float2(0.0);
l9_94=l9_92.Surface_UVCoord0;
l9_87=l9_94;
l9_93=l9_87;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_95=float2(0.0);
l9_95=l9_92.Surface_UVCoord1;
l9_88=l9_95;
l9_93=l9_88;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_96=float2(0.0);
l9_96=l9_92.gScreenCoord;
l9_89=l9_96;
l9_93=l9_89;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_97=float2(0.0);
float2 l9_98=float2(0.0);
float2 l9_99=float2(0.0);
ssGlobals l9_100=l9_92;
float2 l9_101;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_102=float2(0.0);
float2 l9_103=float2(0.0);
float2 l9_104=float2(0.0);
ssGlobals l9_105=l9_100;
float2 l9_106;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_107=float2(0.0);
float2 l9_108=float2(0.0);
float2 l9_109=float2(0.0);
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
ssGlobals l9_112=l9_105;
float2 l9_113;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_114=float2(0.0);
l9_114=l9_112.Surface_UVCoord0;
l9_108=l9_114;
l9_113=l9_108;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_115=float2(0.0);
l9_115=l9_112.Surface_UVCoord1;
l9_109=l9_115;
l9_113=l9_109;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_116=float2(0.0);
l9_116=l9_112.gScreenCoord;
l9_110=l9_116;
l9_113=l9_110;
}
else
{
float2 l9_117=float2(0.0);
l9_117=l9_112.Surface_UVCoord0;
l9_111=l9_117;
l9_113=l9_111;
}
}
}
l9_107=l9_113;
float2 l9_118=float2(0.0);
float2 l9_119=(*sc_set0.UserUniforms).uv2Scale;
l9_118=l9_119;
float2 l9_120=float2(0.0);
l9_120=l9_118;
float2 l9_121=float2(0.0);
float2 l9_122=(*sc_set0.UserUniforms).uv2Offset;
l9_121=l9_122;
float2 l9_123=float2(0.0);
l9_123=l9_121;
float2 l9_124=float2(0.0);
l9_124=(l9_107*l9_120)+l9_123;
float2 l9_125=float2(0.0);
l9_125=l9_124+(l9_123*(l9_105.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_103=l9_125;
l9_106=l9_103;
}
else
{
float2 l9_126=float2(0.0);
float2 l9_127=float2(0.0);
float2 l9_128=float2(0.0);
float2 l9_129=float2(0.0);
float2 l9_130=float2(0.0);
ssGlobals l9_131=l9_105;
float2 l9_132;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_133=float2(0.0);
l9_133=l9_131.Surface_UVCoord0;
l9_127=l9_133;
l9_132=l9_127;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_134=float2(0.0);
l9_134=l9_131.Surface_UVCoord1;
l9_128=l9_134;
l9_132=l9_128;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_135=float2(0.0);
l9_135=l9_131.gScreenCoord;
l9_129=l9_135;
l9_132=l9_129;
}
else
{
float2 l9_136=float2(0.0);
l9_136=l9_131.Surface_UVCoord0;
l9_130=l9_136;
l9_132=l9_130;
}
}
}
l9_126=l9_132;
float2 l9_137=float2(0.0);
float2 l9_138=(*sc_set0.UserUniforms).uv2Scale;
l9_137=l9_138;
float2 l9_139=float2(0.0);
l9_139=l9_137;
float2 l9_140=float2(0.0);
float2 l9_141=(*sc_set0.UserUniforms).uv2Offset;
l9_140=l9_141;
float2 l9_142=float2(0.0);
l9_142=l9_140;
float2 l9_143=float2(0.0);
l9_143=(l9_126*l9_139)+l9_142;
l9_104=l9_143;
l9_106=l9_104;
}
l9_102=l9_106;
l9_98=l9_102;
l9_101=l9_98;
}
else
{
float2 l9_144=float2(0.0);
l9_144=l9_100.Surface_UVCoord0;
l9_99=l9_144;
l9_101=l9_99;
}
l9_97=l9_101;
float2 l9_145=float2(0.0);
l9_145=l9_97;
float2 l9_146=float2(0.0);
l9_146=l9_145;
l9_90=l9_146;
l9_93=l9_90;
}
else
{
float2 l9_147=float2(0.0);
l9_147=l9_92.Surface_UVCoord0;
l9_91=l9_147;
l9_93=l9_91;
}
}
}
}
l9_86=l9_93;
float2 l9_148=float2(0.0);
float2 l9_149=(*sc_set0.UserUniforms).uv3Scale;
l9_148=l9_149;
float2 l9_150=float2(0.0);
l9_150=l9_148;
float2 l9_151=float2(0.0);
float2 l9_152=(*sc_set0.UserUniforms).uv3Offset;
l9_151=l9_152;
float2 l9_153=float2(0.0);
l9_153=l9_151;
float2 l9_154=float2(0.0);
l9_154=(l9_86*l9_150)+l9_153;
float2 l9_155=float2(0.0);
l9_155=l9_154+(l9_153*(l9_84.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_82=l9_155;
l9_85=l9_82;
}
else
{
float2 l9_156=float2(0.0);
float2 l9_157=float2(0.0);
float2 l9_158=float2(0.0);
float2 l9_159=float2(0.0);
float2 l9_160=float2(0.0);
float2 l9_161=float2(0.0);
ssGlobals l9_162=l9_84;
float2 l9_163;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_164=float2(0.0);
l9_164=l9_162.Surface_UVCoord0;
l9_157=l9_164;
l9_163=l9_157;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_165=float2(0.0);
l9_165=l9_162.Surface_UVCoord1;
l9_158=l9_165;
l9_163=l9_158;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_166=float2(0.0);
l9_166=l9_162.gScreenCoord;
l9_159=l9_166;
l9_163=l9_159;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_167=float2(0.0);
float2 l9_168=float2(0.0);
float2 l9_169=float2(0.0);
ssGlobals l9_170=l9_162;
float2 l9_171;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_172=float2(0.0);
float2 l9_173=float2(0.0);
float2 l9_174=float2(0.0);
ssGlobals l9_175=l9_170;
float2 l9_176;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_177=float2(0.0);
float2 l9_178=float2(0.0);
float2 l9_179=float2(0.0);
float2 l9_180=float2(0.0);
float2 l9_181=float2(0.0);
ssGlobals l9_182=l9_175;
float2 l9_183;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_184=float2(0.0);
l9_184=l9_182.Surface_UVCoord0;
l9_178=l9_184;
l9_183=l9_178;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_185=float2(0.0);
l9_185=l9_182.Surface_UVCoord1;
l9_179=l9_185;
l9_183=l9_179;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_186=float2(0.0);
l9_186=l9_182.gScreenCoord;
l9_180=l9_186;
l9_183=l9_180;
}
else
{
float2 l9_187=float2(0.0);
l9_187=l9_182.Surface_UVCoord0;
l9_181=l9_187;
l9_183=l9_181;
}
}
}
l9_177=l9_183;
float2 l9_188=float2(0.0);
float2 l9_189=(*sc_set0.UserUniforms).uv2Scale;
l9_188=l9_189;
float2 l9_190=float2(0.0);
l9_190=l9_188;
float2 l9_191=float2(0.0);
float2 l9_192=(*sc_set0.UserUniforms).uv2Offset;
l9_191=l9_192;
float2 l9_193=float2(0.0);
l9_193=l9_191;
float2 l9_194=float2(0.0);
l9_194=(l9_177*l9_190)+l9_193;
float2 l9_195=float2(0.0);
l9_195=l9_194+(l9_193*(l9_175.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_173=l9_195;
l9_176=l9_173;
}
else
{
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
float2 l9_198=float2(0.0);
float2 l9_199=float2(0.0);
float2 l9_200=float2(0.0);
ssGlobals l9_201=l9_175;
float2 l9_202;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_203=float2(0.0);
l9_203=l9_201.Surface_UVCoord0;
l9_197=l9_203;
l9_202=l9_197;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_204=float2(0.0);
l9_204=l9_201.Surface_UVCoord1;
l9_198=l9_204;
l9_202=l9_198;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_205=float2(0.0);
l9_205=l9_201.gScreenCoord;
l9_199=l9_205;
l9_202=l9_199;
}
else
{
float2 l9_206=float2(0.0);
l9_206=l9_201.Surface_UVCoord0;
l9_200=l9_206;
l9_202=l9_200;
}
}
}
l9_196=l9_202;
float2 l9_207=float2(0.0);
float2 l9_208=(*sc_set0.UserUniforms).uv2Scale;
l9_207=l9_208;
float2 l9_209=float2(0.0);
l9_209=l9_207;
float2 l9_210=float2(0.0);
float2 l9_211=(*sc_set0.UserUniforms).uv2Offset;
l9_210=l9_211;
float2 l9_212=float2(0.0);
l9_212=l9_210;
float2 l9_213=float2(0.0);
l9_213=(l9_196*l9_209)+l9_212;
l9_174=l9_213;
l9_176=l9_174;
}
l9_172=l9_176;
l9_168=l9_172;
l9_171=l9_168;
}
else
{
float2 l9_214=float2(0.0);
l9_214=l9_170.Surface_UVCoord0;
l9_169=l9_214;
l9_171=l9_169;
}
l9_167=l9_171;
float2 l9_215=float2(0.0);
l9_215=l9_167;
float2 l9_216=float2(0.0);
l9_216=l9_215;
l9_160=l9_216;
l9_163=l9_160;
}
else
{
float2 l9_217=float2(0.0);
l9_217=l9_162.Surface_UVCoord0;
l9_161=l9_217;
l9_163=l9_161;
}
}
}
}
l9_156=l9_163;
float2 l9_218=float2(0.0);
float2 l9_219=(*sc_set0.UserUniforms).uv3Scale;
l9_218=l9_219;
float2 l9_220=float2(0.0);
l9_220=l9_218;
float2 l9_221=float2(0.0);
float2 l9_222=(*sc_set0.UserUniforms).uv3Offset;
l9_221=l9_222;
float2 l9_223=float2(0.0);
l9_223=l9_221;
float2 l9_224=float2(0.0);
l9_224=(l9_156*l9_220)+l9_223;
l9_83=l9_224;
l9_85=l9_83;
}
l9_81=l9_85;
l9_77=l9_81;
l9_80=l9_77;
}
else
{
float2 l9_225=float2(0.0);
l9_225=l9_79.Surface_UVCoord0;
l9_78=l9_225;
l9_80=l9_78;
}
l9_76=l9_80;
float2 l9_226=float2(0.0);
l9_226=l9_76;
float2 l9_227=float2(0.0);
l9_227=l9_226;
l9_20=l9_227;
l9_23=l9_20;
}
else
{
float2 l9_228=float2(0.0);
l9_228=l9_22.Surface_UVCoord0;
l9_21=l9_228;
l9_23=l9_21;
}
}
}
}
l9_16=l9_23;
float4 l9_229=float4(0.0);
int l9_230=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=in.varStereoViewID;
}
int l9_232=l9_231;
l9_230=1-l9_232;
}
else
{
int l9_233=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=in.varStereoViewID;
}
int l9_234=l9_233;
l9_230=l9_234;
}
int l9_235=l9_230;
int l9_236=baseTexLayout_tmp;
int l9_237=l9_235;
float2 l9_238=l9_16;
bool l9_239=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_240=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_241=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_242=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_243=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_244=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_245=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_246=0.0;
bool l9_247=l9_244&&(!l9_242);
float l9_248=1.0;
float l9_249=l9_238.x;
int l9_250=l9_241.x;
if (l9_250==1)
{
l9_249=fract(l9_249);
}
else
{
if (l9_250==2)
{
float l9_251=fract(l9_249);
float l9_252=l9_249-l9_251;
float l9_253=step(0.25,fract(l9_252*0.5));
l9_249=mix(l9_251,1.0-l9_251,fast::clamp(l9_253,0.0,1.0));
}
}
l9_238.x=l9_249;
float l9_254=l9_238.y;
int l9_255=l9_241.y;
if (l9_255==1)
{
l9_254=fract(l9_254);
}
else
{
if (l9_255==2)
{
float l9_256=fract(l9_254);
float l9_257=l9_254-l9_256;
float l9_258=step(0.25,fract(l9_257*0.5));
l9_254=mix(l9_256,1.0-l9_256,fast::clamp(l9_258,0.0,1.0));
}
}
l9_238.y=l9_254;
if (l9_242)
{
bool l9_259=l9_244;
bool l9_260;
if (l9_259)
{
l9_260=l9_241.x==3;
}
else
{
l9_260=l9_259;
}
float l9_261=l9_238.x;
float l9_262=l9_243.x;
float l9_263=l9_243.z;
bool l9_264=l9_260;
float l9_265=l9_248;
float l9_266=fast::clamp(l9_261,l9_262,l9_263);
float l9_267=step(abs(l9_261-l9_266),9.9999997e-06);
l9_265*=(l9_267+((1.0-float(l9_264))*(1.0-l9_267)));
l9_261=l9_266;
l9_238.x=l9_261;
l9_248=l9_265;
bool l9_268=l9_244;
bool l9_269;
if (l9_268)
{
l9_269=l9_241.y==3;
}
else
{
l9_269=l9_268;
}
float l9_270=l9_238.y;
float l9_271=l9_243.y;
float l9_272=l9_243.w;
bool l9_273=l9_269;
float l9_274=l9_248;
float l9_275=fast::clamp(l9_270,l9_271,l9_272);
float l9_276=step(abs(l9_270-l9_275),9.9999997e-06);
l9_274*=(l9_276+((1.0-float(l9_273))*(1.0-l9_276)));
l9_270=l9_275;
l9_238.y=l9_270;
l9_248=l9_274;
}
float2 l9_277=l9_238;
bool l9_278=l9_239;
float3x3 l9_279=l9_240;
if (l9_278)
{
l9_277=float2((l9_279*float3(l9_277,1.0)).xy);
}
float2 l9_280=l9_277;
float2 l9_281=l9_280;
float2 l9_282=l9_281;
l9_238=l9_282;
float l9_283=l9_238.x;
int l9_284=l9_241.x;
bool l9_285=l9_247;
float l9_286=l9_248;
if ((l9_284==0)||(l9_284==3))
{
float l9_287=l9_283;
float l9_288=0.0;
float l9_289=1.0;
bool l9_290=l9_285;
float l9_291=l9_286;
float l9_292=fast::clamp(l9_287,l9_288,l9_289);
float l9_293=step(abs(l9_287-l9_292),9.9999997e-06);
l9_291*=(l9_293+((1.0-float(l9_290))*(1.0-l9_293)));
l9_287=l9_292;
l9_283=l9_287;
l9_286=l9_291;
}
l9_238.x=l9_283;
l9_248=l9_286;
float l9_294=l9_238.y;
int l9_295=l9_241.y;
bool l9_296=l9_247;
float l9_297=l9_248;
if ((l9_295==0)||(l9_295==3))
{
float l9_298=l9_294;
float l9_299=0.0;
float l9_300=1.0;
bool l9_301=l9_296;
float l9_302=l9_297;
float l9_303=fast::clamp(l9_298,l9_299,l9_300);
float l9_304=step(abs(l9_298-l9_303),9.9999997e-06);
l9_302*=(l9_304+((1.0-float(l9_301))*(1.0-l9_304)));
l9_298=l9_303;
l9_294=l9_298;
l9_297=l9_302;
}
l9_238.y=l9_294;
l9_248=l9_297;
float2 l9_305=l9_238;
int l9_306=l9_236;
int l9_307=l9_237;
float l9_308=l9_246;
float2 l9_309=l9_305;
int l9_310=l9_306;
int l9_311=l9_307;
float3 l9_312=float3(0.0);
if (l9_310==0)
{
l9_312=float3(l9_309,0.0);
}
else
{
if (l9_310==1)
{
l9_312=float3(l9_309.x,(l9_309.y*0.5)+(0.5-(float(l9_311)*0.5)),0.0);
}
else
{
l9_312=float3(l9_309,float(l9_311));
}
}
float3 l9_313=l9_312;
float3 l9_314=l9_313;
float2 l9_315=l9_314.xy;
float l9_316=l9_308;
float4 l9_317=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_315,bias(l9_316));
float4 l9_318=l9_317;
float4 l9_319=l9_318;
if (l9_244)
{
l9_319=mix(l9_245,l9_319,float4(l9_248));
}
float4 l9_320=l9_319;
l9_229=l9_320;
param_1=l9_229;
param_3=param_1;
}
else
{
param_3=param_2;
}
Result_N369=param_3;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_5=0.0;
float param_6=(*sc_set0.UserUniforms).Port_Default_N204;
ssGlobals param_8=Globals;
float param_7;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_321=float2(0.0);
float2 l9_322=float2(0.0);
float2 l9_323=float2(0.0);
float2 l9_324=float2(0.0);
float2 l9_325=float2(0.0);
float2 l9_326=float2(0.0);
ssGlobals l9_327=param_8;
float2 l9_328;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_329=float2(0.0);
l9_329=l9_327.Surface_UVCoord0;
l9_322=l9_329;
l9_328=l9_322;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_330=float2(0.0);
l9_330=l9_327.Surface_UVCoord1;
l9_323=l9_330;
l9_328=l9_323;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_331=float2(0.0);
float2 l9_332=float2(0.0);
float2 l9_333=float2(0.0);
ssGlobals l9_334=l9_327;
float2 l9_335;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_336=float2(0.0);
float2 l9_337=float2(0.0);
float2 l9_338=float2(0.0);
ssGlobals l9_339=l9_334;
float2 l9_340;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_341=float2(0.0);
float2 l9_342=float2(0.0);
float2 l9_343=float2(0.0);
float2 l9_344=float2(0.0);
float2 l9_345=float2(0.0);
ssGlobals l9_346=l9_339;
float2 l9_347;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_348=float2(0.0);
l9_348=l9_346.Surface_UVCoord0;
l9_342=l9_348;
l9_347=l9_342;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_349=float2(0.0);
l9_349=l9_346.Surface_UVCoord1;
l9_343=l9_349;
l9_347=l9_343;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_350=float2(0.0);
l9_350=l9_346.gScreenCoord;
l9_344=l9_350;
l9_347=l9_344;
}
else
{
float2 l9_351=float2(0.0);
l9_351=l9_346.Surface_UVCoord0;
l9_345=l9_351;
l9_347=l9_345;
}
}
}
l9_341=l9_347;
float2 l9_352=float2(0.0);
float2 l9_353=(*sc_set0.UserUniforms).uv2Scale;
l9_352=l9_353;
float2 l9_354=float2(0.0);
l9_354=l9_352;
float2 l9_355=float2(0.0);
float2 l9_356=(*sc_set0.UserUniforms).uv2Offset;
l9_355=l9_356;
float2 l9_357=float2(0.0);
l9_357=l9_355;
float2 l9_358=float2(0.0);
l9_358=(l9_341*l9_354)+l9_357;
float2 l9_359=float2(0.0);
l9_359=l9_358+(l9_357*(l9_339.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_337=l9_359;
l9_340=l9_337;
}
else
{
float2 l9_360=float2(0.0);
float2 l9_361=float2(0.0);
float2 l9_362=float2(0.0);
float2 l9_363=float2(0.0);
float2 l9_364=float2(0.0);
ssGlobals l9_365=l9_339;
float2 l9_366;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_367=float2(0.0);
l9_367=l9_365.Surface_UVCoord0;
l9_361=l9_367;
l9_366=l9_361;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_368=float2(0.0);
l9_368=l9_365.Surface_UVCoord1;
l9_362=l9_368;
l9_366=l9_362;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_369=float2(0.0);
l9_369=l9_365.gScreenCoord;
l9_363=l9_369;
l9_366=l9_363;
}
else
{
float2 l9_370=float2(0.0);
l9_370=l9_365.Surface_UVCoord0;
l9_364=l9_370;
l9_366=l9_364;
}
}
}
l9_360=l9_366;
float2 l9_371=float2(0.0);
float2 l9_372=(*sc_set0.UserUniforms).uv2Scale;
l9_371=l9_372;
float2 l9_373=float2(0.0);
l9_373=l9_371;
float2 l9_374=float2(0.0);
float2 l9_375=(*sc_set0.UserUniforms).uv2Offset;
l9_374=l9_375;
float2 l9_376=float2(0.0);
l9_376=l9_374;
float2 l9_377=float2(0.0);
l9_377=(l9_360*l9_373)+l9_376;
l9_338=l9_377;
l9_340=l9_338;
}
l9_336=l9_340;
l9_332=l9_336;
l9_335=l9_332;
}
else
{
float2 l9_378=float2(0.0);
l9_378=l9_334.Surface_UVCoord0;
l9_333=l9_378;
l9_335=l9_333;
}
l9_331=l9_335;
float2 l9_379=float2(0.0);
l9_379=l9_331;
float2 l9_380=float2(0.0);
l9_380=l9_379;
l9_324=l9_380;
l9_328=l9_324;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_381=float2(0.0);
float2 l9_382=float2(0.0);
float2 l9_383=float2(0.0);
ssGlobals l9_384=l9_327;
float2 l9_385;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_386=float2(0.0);
float2 l9_387=float2(0.0);
float2 l9_388=float2(0.0);
ssGlobals l9_389=l9_384;
float2 l9_390;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_391=float2(0.0);
float2 l9_392=float2(0.0);
float2 l9_393=float2(0.0);
float2 l9_394=float2(0.0);
float2 l9_395=float2(0.0);
float2 l9_396=float2(0.0);
ssGlobals l9_397=l9_389;
float2 l9_398;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_399=float2(0.0);
l9_399=l9_397.Surface_UVCoord0;
l9_392=l9_399;
l9_398=l9_392;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_400=float2(0.0);
l9_400=l9_397.Surface_UVCoord1;
l9_393=l9_400;
l9_398=l9_393;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_401=float2(0.0);
l9_401=l9_397.gScreenCoord;
l9_394=l9_401;
l9_398=l9_394;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_402=float2(0.0);
float2 l9_403=float2(0.0);
float2 l9_404=float2(0.0);
ssGlobals l9_405=l9_397;
float2 l9_406;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_407=float2(0.0);
float2 l9_408=float2(0.0);
float2 l9_409=float2(0.0);
ssGlobals l9_410=l9_405;
float2 l9_411;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_412=float2(0.0);
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
float2 l9_415=float2(0.0);
float2 l9_416=float2(0.0);
ssGlobals l9_417=l9_410;
float2 l9_418;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_419=float2(0.0);
l9_419=l9_417.Surface_UVCoord0;
l9_413=l9_419;
l9_418=l9_413;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_420=float2(0.0);
l9_420=l9_417.Surface_UVCoord1;
l9_414=l9_420;
l9_418=l9_414;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_421=float2(0.0);
l9_421=l9_417.gScreenCoord;
l9_415=l9_421;
l9_418=l9_415;
}
else
{
float2 l9_422=float2(0.0);
l9_422=l9_417.Surface_UVCoord0;
l9_416=l9_422;
l9_418=l9_416;
}
}
}
l9_412=l9_418;
float2 l9_423=float2(0.0);
float2 l9_424=(*sc_set0.UserUniforms).uv2Scale;
l9_423=l9_424;
float2 l9_425=float2(0.0);
l9_425=l9_423;
float2 l9_426=float2(0.0);
float2 l9_427=(*sc_set0.UserUniforms).uv2Offset;
l9_426=l9_427;
float2 l9_428=float2(0.0);
l9_428=l9_426;
float2 l9_429=float2(0.0);
l9_429=(l9_412*l9_425)+l9_428;
float2 l9_430=float2(0.0);
l9_430=l9_429+(l9_428*(l9_410.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_408=l9_430;
l9_411=l9_408;
}
else
{
float2 l9_431=float2(0.0);
float2 l9_432=float2(0.0);
float2 l9_433=float2(0.0);
float2 l9_434=float2(0.0);
float2 l9_435=float2(0.0);
ssGlobals l9_436=l9_410;
float2 l9_437;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_438=float2(0.0);
l9_438=l9_436.Surface_UVCoord0;
l9_432=l9_438;
l9_437=l9_432;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_439=float2(0.0);
l9_439=l9_436.Surface_UVCoord1;
l9_433=l9_439;
l9_437=l9_433;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_440=float2(0.0);
l9_440=l9_436.gScreenCoord;
l9_434=l9_440;
l9_437=l9_434;
}
else
{
float2 l9_441=float2(0.0);
l9_441=l9_436.Surface_UVCoord0;
l9_435=l9_441;
l9_437=l9_435;
}
}
}
l9_431=l9_437;
float2 l9_442=float2(0.0);
float2 l9_443=(*sc_set0.UserUniforms).uv2Scale;
l9_442=l9_443;
float2 l9_444=float2(0.0);
l9_444=l9_442;
float2 l9_445=float2(0.0);
float2 l9_446=(*sc_set0.UserUniforms).uv2Offset;
l9_445=l9_446;
float2 l9_447=float2(0.0);
l9_447=l9_445;
float2 l9_448=float2(0.0);
l9_448=(l9_431*l9_444)+l9_447;
l9_409=l9_448;
l9_411=l9_409;
}
l9_407=l9_411;
l9_403=l9_407;
l9_406=l9_403;
}
else
{
float2 l9_449=float2(0.0);
l9_449=l9_405.Surface_UVCoord0;
l9_404=l9_449;
l9_406=l9_404;
}
l9_402=l9_406;
float2 l9_450=float2(0.0);
l9_450=l9_402;
float2 l9_451=float2(0.0);
l9_451=l9_450;
l9_395=l9_451;
l9_398=l9_395;
}
else
{
float2 l9_452=float2(0.0);
l9_452=l9_397.Surface_UVCoord0;
l9_396=l9_452;
l9_398=l9_396;
}
}
}
}
l9_391=l9_398;
float2 l9_453=float2(0.0);
float2 l9_454=(*sc_set0.UserUniforms).uv3Scale;
l9_453=l9_454;
float2 l9_455=float2(0.0);
l9_455=l9_453;
float2 l9_456=float2(0.0);
float2 l9_457=(*sc_set0.UserUniforms).uv3Offset;
l9_456=l9_457;
float2 l9_458=float2(0.0);
l9_458=l9_456;
float2 l9_459=float2(0.0);
l9_459=(l9_391*l9_455)+l9_458;
float2 l9_460=float2(0.0);
l9_460=l9_459+(l9_458*(l9_389.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_387=l9_460;
l9_390=l9_387;
}
else
{
float2 l9_461=float2(0.0);
float2 l9_462=float2(0.0);
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
ssGlobals l9_467=l9_389;
float2 l9_468;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_469=float2(0.0);
l9_469=l9_467.Surface_UVCoord0;
l9_462=l9_469;
l9_468=l9_462;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_470=float2(0.0);
l9_470=l9_467.Surface_UVCoord1;
l9_463=l9_470;
l9_468=l9_463;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_471=float2(0.0);
l9_471=l9_467.gScreenCoord;
l9_464=l9_471;
l9_468=l9_464;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_472=float2(0.0);
float2 l9_473=float2(0.0);
float2 l9_474=float2(0.0);
ssGlobals l9_475=l9_467;
float2 l9_476;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_477=float2(0.0);
float2 l9_478=float2(0.0);
float2 l9_479=float2(0.0);
ssGlobals l9_480=l9_475;
float2 l9_481;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_482=float2(0.0);
float2 l9_483=float2(0.0);
float2 l9_484=float2(0.0);
float2 l9_485=float2(0.0);
float2 l9_486=float2(0.0);
ssGlobals l9_487=l9_480;
float2 l9_488;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_489=float2(0.0);
l9_489=l9_487.Surface_UVCoord0;
l9_483=l9_489;
l9_488=l9_483;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_490=float2(0.0);
l9_490=l9_487.Surface_UVCoord1;
l9_484=l9_490;
l9_488=l9_484;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_491=float2(0.0);
l9_491=l9_487.gScreenCoord;
l9_485=l9_491;
l9_488=l9_485;
}
else
{
float2 l9_492=float2(0.0);
l9_492=l9_487.Surface_UVCoord0;
l9_486=l9_492;
l9_488=l9_486;
}
}
}
l9_482=l9_488;
float2 l9_493=float2(0.0);
float2 l9_494=(*sc_set0.UserUniforms).uv2Scale;
l9_493=l9_494;
float2 l9_495=float2(0.0);
l9_495=l9_493;
float2 l9_496=float2(0.0);
float2 l9_497=(*sc_set0.UserUniforms).uv2Offset;
l9_496=l9_497;
float2 l9_498=float2(0.0);
l9_498=l9_496;
float2 l9_499=float2(0.0);
l9_499=(l9_482*l9_495)+l9_498;
float2 l9_500=float2(0.0);
l9_500=l9_499+(l9_498*(l9_480.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_478=l9_500;
l9_481=l9_478;
}
else
{
float2 l9_501=float2(0.0);
float2 l9_502=float2(0.0);
float2 l9_503=float2(0.0);
float2 l9_504=float2(0.0);
float2 l9_505=float2(0.0);
ssGlobals l9_506=l9_480;
float2 l9_507;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_508=float2(0.0);
l9_508=l9_506.Surface_UVCoord0;
l9_502=l9_508;
l9_507=l9_502;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_509=float2(0.0);
l9_509=l9_506.Surface_UVCoord1;
l9_503=l9_509;
l9_507=l9_503;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_510=float2(0.0);
l9_510=l9_506.gScreenCoord;
l9_504=l9_510;
l9_507=l9_504;
}
else
{
float2 l9_511=float2(0.0);
l9_511=l9_506.Surface_UVCoord0;
l9_505=l9_511;
l9_507=l9_505;
}
}
}
l9_501=l9_507;
float2 l9_512=float2(0.0);
float2 l9_513=(*sc_set0.UserUniforms).uv2Scale;
l9_512=l9_513;
float2 l9_514=float2(0.0);
l9_514=l9_512;
float2 l9_515=float2(0.0);
float2 l9_516=(*sc_set0.UserUniforms).uv2Offset;
l9_515=l9_516;
float2 l9_517=float2(0.0);
l9_517=l9_515;
float2 l9_518=float2(0.0);
l9_518=(l9_501*l9_514)+l9_517;
l9_479=l9_518;
l9_481=l9_479;
}
l9_477=l9_481;
l9_473=l9_477;
l9_476=l9_473;
}
else
{
float2 l9_519=float2(0.0);
l9_519=l9_475.Surface_UVCoord0;
l9_474=l9_519;
l9_476=l9_474;
}
l9_472=l9_476;
float2 l9_520=float2(0.0);
l9_520=l9_472;
float2 l9_521=float2(0.0);
l9_521=l9_520;
l9_465=l9_521;
l9_468=l9_465;
}
else
{
float2 l9_522=float2(0.0);
l9_522=l9_467.Surface_UVCoord0;
l9_466=l9_522;
l9_468=l9_466;
}
}
}
}
l9_461=l9_468;
float2 l9_523=float2(0.0);
float2 l9_524=(*sc_set0.UserUniforms).uv3Scale;
l9_523=l9_524;
float2 l9_525=float2(0.0);
l9_525=l9_523;
float2 l9_526=float2(0.0);
float2 l9_527=(*sc_set0.UserUniforms).uv3Offset;
l9_526=l9_527;
float2 l9_528=float2(0.0);
l9_528=l9_526;
float2 l9_529=float2(0.0);
l9_529=(l9_461*l9_525)+l9_528;
l9_388=l9_529;
l9_390=l9_388;
}
l9_386=l9_390;
l9_382=l9_386;
l9_385=l9_382;
}
else
{
float2 l9_530=float2(0.0);
l9_530=l9_384.Surface_UVCoord0;
l9_383=l9_530;
l9_385=l9_383;
}
l9_381=l9_385;
float2 l9_531=float2(0.0);
l9_531=l9_381;
float2 l9_532=float2(0.0);
l9_532=l9_531;
l9_325=l9_532;
l9_328=l9_325;
}
else
{
float2 l9_533=float2(0.0);
l9_533=l9_327.Surface_UVCoord0;
l9_326=l9_533;
l9_328=l9_326;
}
}
}
}
l9_321=l9_328;
float4 l9_534=float4(0.0);
int l9_535=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_536=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_536=0;
}
else
{
l9_536=in.varStereoViewID;
}
int l9_537=l9_536;
l9_535=1-l9_537;
}
else
{
int l9_538=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_538=0;
}
else
{
l9_538=in.varStereoViewID;
}
int l9_539=l9_538;
l9_535=l9_539;
}
int l9_540=l9_535;
int l9_541=opacityTexLayout_tmp;
int l9_542=l9_540;
float2 l9_543=l9_321;
bool l9_544=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_545=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_546=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_547=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_548=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_549=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_550=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_551=0.0;
bool l9_552=l9_549&&(!l9_547);
float l9_553=1.0;
float l9_554=l9_543.x;
int l9_555=l9_546.x;
if (l9_555==1)
{
l9_554=fract(l9_554);
}
else
{
if (l9_555==2)
{
float l9_556=fract(l9_554);
float l9_557=l9_554-l9_556;
float l9_558=step(0.25,fract(l9_557*0.5));
l9_554=mix(l9_556,1.0-l9_556,fast::clamp(l9_558,0.0,1.0));
}
}
l9_543.x=l9_554;
float l9_559=l9_543.y;
int l9_560=l9_546.y;
if (l9_560==1)
{
l9_559=fract(l9_559);
}
else
{
if (l9_560==2)
{
float l9_561=fract(l9_559);
float l9_562=l9_559-l9_561;
float l9_563=step(0.25,fract(l9_562*0.5));
l9_559=mix(l9_561,1.0-l9_561,fast::clamp(l9_563,0.0,1.0));
}
}
l9_543.y=l9_559;
if (l9_547)
{
bool l9_564=l9_549;
bool l9_565;
if (l9_564)
{
l9_565=l9_546.x==3;
}
else
{
l9_565=l9_564;
}
float l9_566=l9_543.x;
float l9_567=l9_548.x;
float l9_568=l9_548.z;
bool l9_569=l9_565;
float l9_570=l9_553;
float l9_571=fast::clamp(l9_566,l9_567,l9_568);
float l9_572=step(abs(l9_566-l9_571),9.9999997e-06);
l9_570*=(l9_572+((1.0-float(l9_569))*(1.0-l9_572)));
l9_566=l9_571;
l9_543.x=l9_566;
l9_553=l9_570;
bool l9_573=l9_549;
bool l9_574;
if (l9_573)
{
l9_574=l9_546.y==3;
}
else
{
l9_574=l9_573;
}
float l9_575=l9_543.y;
float l9_576=l9_548.y;
float l9_577=l9_548.w;
bool l9_578=l9_574;
float l9_579=l9_553;
float l9_580=fast::clamp(l9_575,l9_576,l9_577);
float l9_581=step(abs(l9_575-l9_580),9.9999997e-06);
l9_579*=(l9_581+((1.0-float(l9_578))*(1.0-l9_581)));
l9_575=l9_580;
l9_543.y=l9_575;
l9_553=l9_579;
}
float2 l9_582=l9_543;
bool l9_583=l9_544;
float3x3 l9_584=l9_545;
if (l9_583)
{
l9_582=float2((l9_584*float3(l9_582,1.0)).xy);
}
float2 l9_585=l9_582;
float2 l9_586=l9_585;
float2 l9_587=l9_586;
l9_543=l9_587;
float l9_588=l9_543.x;
int l9_589=l9_546.x;
bool l9_590=l9_552;
float l9_591=l9_553;
if ((l9_589==0)||(l9_589==3))
{
float l9_592=l9_588;
float l9_593=0.0;
float l9_594=1.0;
bool l9_595=l9_590;
float l9_596=l9_591;
float l9_597=fast::clamp(l9_592,l9_593,l9_594);
float l9_598=step(abs(l9_592-l9_597),9.9999997e-06);
l9_596*=(l9_598+((1.0-float(l9_595))*(1.0-l9_598)));
l9_592=l9_597;
l9_588=l9_592;
l9_591=l9_596;
}
l9_543.x=l9_588;
l9_553=l9_591;
float l9_599=l9_543.y;
int l9_600=l9_546.y;
bool l9_601=l9_552;
float l9_602=l9_553;
if ((l9_600==0)||(l9_600==3))
{
float l9_603=l9_599;
float l9_604=0.0;
float l9_605=1.0;
bool l9_606=l9_601;
float l9_607=l9_602;
float l9_608=fast::clamp(l9_603,l9_604,l9_605);
float l9_609=step(abs(l9_603-l9_608),9.9999997e-06);
l9_607*=(l9_609+((1.0-float(l9_606))*(1.0-l9_609)));
l9_603=l9_608;
l9_599=l9_603;
l9_602=l9_607;
}
l9_543.y=l9_599;
l9_553=l9_602;
float2 l9_610=l9_543;
int l9_611=l9_541;
int l9_612=l9_542;
float l9_613=l9_551;
float2 l9_614=l9_610;
int l9_615=l9_611;
int l9_616=l9_612;
float3 l9_617=float3(0.0);
if (l9_615==0)
{
l9_617=float3(l9_614,0.0);
}
else
{
if (l9_615==1)
{
l9_617=float3(l9_614.x,(l9_614.y*0.5)+(0.5-(float(l9_616)*0.5)),0.0);
}
else
{
l9_617=float3(l9_614,float(l9_616));
}
}
float3 l9_618=l9_617;
float3 l9_619=l9_618;
float2 l9_620=l9_619.xy;
float l9_621=l9_613;
float4 l9_622=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_620,bias(l9_621));
float4 l9_623=l9_622;
float4 l9_624=l9_623;
if (l9_549)
{
l9_624=mix(l9_550,l9_624,float4(l9_553));
}
float4 l9_625=l9_624;
l9_534=l9_625;
float l9_626=0.0;
l9_626=l9_534.x;
param_5=l9_626;
param_7=param_5;
}
else
{
param_7=param_6;
}
Result_N204=param_7;
float Output_N72=0.0;
float param_9=1.0;
float param_10=(*sc_set0.UserUniforms).Port_Input2_N072;
ssGlobals param_12=Globals;
float param_11;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_627=float4(0.0);
l9_627=param_12.VertexColor;
float l9_628=0.0;
l9_628=l9_627.w;
param_9=l9_628;
param_11=param_9;
}
else
{
param_11=param_10;
}
Output_N72=param_11;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float3 param_13=float3(0.0);
float3 param_14=float3(0.0);
ssGlobals param_16=Globals;
float3 param_15;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_629=float3(0.0);
l9_629=param_16.VertexTangent_WorldSpace;
float3 l9_630=float3(0.0);
l9_630=param_16.VertexBinormal_WorldSpace;
float3 l9_631=float3(0.0);
l9_631=param_16.VertexNormal_WorldSpace;
float3x3 l9_632=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_632=float3x3(float3(l9_629),float3(l9_630),float3(l9_631));
float2 l9_633=float2(0.0);
float2 l9_634=float2(0.0);
float2 l9_635=float2(0.0);
float2 l9_636=float2(0.0);
float2 l9_637=float2(0.0);
float2 l9_638=float2(0.0);
ssGlobals l9_639=param_16;
float2 l9_640;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_641=float2(0.0);
l9_641=l9_639.Surface_UVCoord0;
l9_634=l9_641;
l9_640=l9_634;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_642=float2(0.0);
l9_642=l9_639.Surface_UVCoord1;
l9_635=l9_642;
l9_640=l9_635;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_643=float2(0.0);
float2 l9_644=float2(0.0);
float2 l9_645=float2(0.0);
ssGlobals l9_646=l9_639;
float2 l9_647;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_648=float2(0.0);
float2 l9_649=float2(0.0);
float2 l9_650=float2(0.0);
ssGlobals l9_651=l9_646;
float2 l9_652;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_653=float2(0.0);
float2 l9_654=float2(0.0);
float2 l9_655=float2(0.0);
float2 l9_656=float2(0.0);
float2 l9_657=float2(0.0);
ssGlobals l9_658=l9_651;
float2 l9_659;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_660=float2(0.0);
l9_660=l9_658.Surface_UVCoord0;
l9_654=l9_660;
l9_659=l9_654;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_661=float2(0.0);
l9_661=l9_658.Surface_UVCoord1;
l9_655=l9_661;
l9_659=l9_655;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_662=float2(0.0);
l9_662=l9_658.gScreenCoord;
l9_656=l9_662;
l9_659=l9_656;
}
else
{
float2 l9_663=float2(0.0);
l9_663=l9_658.Surface_UVCoord0;
l9_657=l9_663;
l9_659=l9_657;
}
}
}
l9_653=l9_659;
float2 l9_664=float2(0.0);
float2 l9_665=(*sc_set0.UserUniforms).uv2Scale;
l9_664=l9_665;
float2 l9_666=float2(0.0);
l9_666=l9_664;
float2 l9_667=float2(0.0);
float2 l9_668=(*sc_set0.UserUniforms).uv2Offset;
l9_667=l9_668;
float2 l9_669=float2(0.0);
l9_669=l9_667;
float2 l9_670=float2(0.0);
l9_670=(l9_653*l9_666)+l9_669;
float2 l9_671=float2(0.0);
l9_671=l9_670+(l9_669*(l9_651.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_649=l9_671;
l9_652=l9_649;
}
else
{
float2 l9_672=float2(0.0);
float2 l9_673=float2(0.0);
float2 l9_674=float2(0.0);
float2 l9_675=float2(0.0);
float2 l9_676=float2(0.0);
ssGlobals l9_677=l9_651;
float2 l9_678;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_679=float2(0.0);
l9_679=l9_677.Surface_UVCoord0;
l9_673=l9_679;
l9_678=l9_673;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_680=float2(0.0);
l9_680=l9_677.Surface_UVCoord1;
l9_674=l9_680;
l9_678=l9_674;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_681=float2(0.0);
l9_681=l9_677.gScreenCoord;
l9_675=l9_681;
l9_678=l9_675;
}
else
{
float2 l9_682=float2(0.0);
l9_682=l9_677.Surface_UVCoord0;
l9_676=l9_682;
l9_678=l9_676;
}
}
}
l9_672=l9_678;
float2 l9_683=float2(0.0);
float2 l9_684=(*sc_set0.UserUniforms).uv2Scale;
l9_683=l9_684;
float2 l9_685=float2(0.0);
l9_685=l9_683;
float2 l9_686=float2(0.0);
float2 l9_687=(*sc_set0.UserUniforms).uv2Offset;
l9_686=l9_687;
float2 l9_688=float2(0.0);
l9_688=l9_686;
float2 l9_689=float2(0.0);
l9_689=(l9_672*l9_685)+l9_688;
l9_650=l9_689;
l9_652=l9_650;
}
l9_648=l9_652;
l9_644=l9_648;
l9_647=l9_644;
}
else
{
float2 l9_690=float2(0.0);
l9_690=l9_646.Surface_UVCoord0;
l9_645=l9_690;
l9_647=l9_645;
}
l9_643=l9_647;
float2 l9_691=float2(0.0);
l9_691=l9_643;
float2 l9_692=float2(0.0);
l9_692=l9_691;
l9_636=l9_692;
l9_640=l9_636;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_693=float2(0.0);
float2 l9_694=float2(0.0);
float2 l9_695=float2(0.0);
ssGlobals l9_696=l9_639;
float2 l9_697;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_698=float2(0.0);
float2 l9_699=float2(0.0);
float2 l9_700=float2(0.0);
ssGlobals l9_701=l9_696;
float2 l9_702;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_703=float2(0.0);
float2 l9_704=float2(0.0);
float2 l9_705=float2(0.0);
float2 l9_706=float2(0.0);
float2 l9_707=float2(0.0);
float2 l9_708=float2(0.0);
ssGlobals l9_709=l9_701;
float2 l9_710;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_711=float2(0.0);
l9_711=l9_709.Surface_UVCoord0;
l9_704=l9_711;
l9_710=l9_704;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_712=float2(0.0);
l9_712=l9_709.Surface_UVCoord1;
l9_705=l9_712;
l9_710=l9_705;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_713=float2(0.0);
l9_713=l9_709.gScreenCoord;
l9_706=l9_713;
l9_710=l9_706;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_714=float2(0.0);
float2 l9_715=float2(0.0);
float2 l9_716=float2(0.0);
ssGlobals l9_717=l9_709;
float2 l9_718;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_719=float2(0.0);
float2 l9_720=float2(0.0);
float2 l9_721=float2(0.0);
ssGlobals l9_722=l9_717;
float2 l9_723;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_724=float2(0.0);
float2 l9_725=float2(0.0);
float2 l9_726=float2(0.0);
float2 l9_727=float2(0.0);
float2 l9_728=float2(0.0);
ssGlobals l9_729=l9_722;
float2 l9_730;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_731=float2(0.0);
l9_731=l9_729.Surface_UVCoord0;
l9_725=l9_731;
l9_730=l9_725;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_732=float2(0.0);
l9_732=l9_729.Surface_UVCoord1;
l9_726=l9_732;
l9_730=l9_726;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_733=float2(0.0);
l9_733=l9_729.gScreenCoord;
l9_727=l9_733;
l9_730=l9_727;
}
else
{
float2 l9_734=float2(0.0);
l9_734=l9_729.Surface_UVCoord0;
l9_728=l9_734;
l9_730=l9_728;
}
}
}
l9_724=l9_730;
float2 l9_735=float2(0.0);
float2 l9_736=(*sc_set0.UserUniforms).uv2Scale;
l9_735=l9_736;
float2 l9_737=float2(0.0);
l9_737=l9_735;
float2 l9_738=float2(0.0);
float2 l9_739=(*sc_set0.UserUniforms).uv2Offset;
l9_738=l9_739;
float2 l9_740=float2(0.0);
l9_740=l9_738;
float2 l9_741=float2(0.0);
l9_741=(l9_724*l9_737)+l9_740;
float2 l9_742=float2(0.0);
l9_742=l9_741+(l9_740*(l9_722.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_720=l9_742;
l9_723=l9_720;
}
else
{
float2 l9_743=float2(0.0);
float2 l9_744=float2(0.0);
float2 l9_745=float2(0.0);
float2 l9_746=float2(0.0);
float2 l9_747=float2(0.0);
ssGlobals l9_748=l9_722;
float2 l9_749;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_750=float2(0.0);
l9_750=l9_748.Surface_UVCoord0;
l9_744=l9_750;
l9_749=l9_744;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_751=float2(0.0);
l9_751=l9_748.Surface_UVCoord1;
l9_745=l9_751;
l9_749=l9_745;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_752=float2(0.0);
l9_752=l9_748.gScreenCoord;
l9_746=l9_752;
l9_749=l9_746;
}
else
{
float2 l9_753=float2(0.0);
l9_753=l9_748.Surface_UVCoord0;
l9_747=l9_753;
l9_749=l9_747;
}
}
}
l9_743=l9_749;
float2 l9_754=float2(0.0);
float2 l9_755=(*sc_set0.UserUniforms).uv2Scale;
l9_754=l9_755;
float2 l9_756=float2(0.0);
l9_756=l9_754;
float2 l9_757=float2(0.0);
float2 l9_758=(*sc_set0.UserUniforms).uv2Offset;
l9_757=l9_758;
float2 l9_759=float2(0.0);
l9_759=l9_757;
float2 l9_760=float2(0.0);
l9_760=(l9_743*l9_756)+l9_759;
l9_721=l9_760;
l9_723=l9_721;
}
l9_719=l9_723;
l9_715=l9_719;
l9_718=l9_715;
}
else
{
float2 l9_761=float2(0.0);
l9_761=l9_717.Surface_UVCoord0;
l9_716=l9_761;
l9_718=l9_716;
}
l9_714=l9_718;
float2 l9_762=float2(0.0);
l9_762=l9_714;
float2 l9_763=float2(0.0);
l9_763=l9_762;
l9_707=l9_763;
l9_710=l9_707;
}
else
{
float2 l9_764=float2(0.0);
l9_764=l9_709.Surface_UVCoord0;
l9_708=l9_764;
l9_710=l9_708;
}
}
}
}
l9_703=l9_710;
float2 l9_765=float2(0.0);
float2 l9_766=(*sc_set0.UserUniforms).uv3Scale;
l9_765=l9_766;
float2 l9_767=float2(0.0);
l9_767=l9_765;
float2 l9_768=float2(0.0);
float2 l9_769=(*sc_set0.UserUniforms).uv3Offset;
l9_768=l9_769;
float2 l9_770=float2(0.0);
l9_770=l9_768;
float2 l9_771=float2(0.0);
l9_771=(l9_703*l9_767)+l9_770;
float2 l9_772=float2(0.0);
l9_772=l9_771+(l9_770*(l9_701.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_699=l9_772;
l9_702=l9_699;
}
else
{
float2 l9_773=float2(0.0);
float2 l9_774=float2(0.0);
float2 l9_775=float2(0.0);
float2 l9_776=float2(0.0);
float2 l9_777=float2(0.0);
float2 l9_778=float2(0.0);
ssGlobals l9_779=l9_701;
float2 l9_780;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_781=float2(0.0);
l9_781=l9_779.Surface_UVCoord0;
l9_774=l9_781;
l9_780=l9_774;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_782=float2(0.0);
l9_782=l9_779.Surface_UVCoord1;
l9_775=l9_782;
l9_780=l9_775;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_783=float2(0.0);
l9_783=l9_779.gScreenCoord;
l9_776=l9_783;
l9_780=l9_776;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_784=float2(0.0);
float2 l9_785=float2(0.0);
float2 l9_786=float2(0.0);
ssGlobals l9_787=l9_779;
float2 l9_788;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_789=float2(0.0);
float2 l9_790=float2(0.0);
float2 l9_791=float2(0.0);
ssGlobals l9_792=l9_787;
float2 l9_793;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_794=float2(0.0);
float2 l9_795=float2(0.0);
float2 l9_796=float2(0.0);
float2 l9_797=float2(0.0);
float2 l9_798=float2(0.0);
ssGlobals l9_799=l9_792;
float2 l9_800;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_801=float2(0.0);
l9_801=l9_799.Surface_UVCoord0;
l9_795=l9_801;
l9_800=l9_795;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_802=float2(0.0);
l9_802=l9_799.Surface_UVCoord1;
l9_796=l9_802;
l9_800=l9_796;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_803=float2(0.0);
l9_803=l9_799.gScreenCoord;
l9_797=l9_803;
l9_800=l9_797;
}
else
{
float2 l9_804=float2(0.0);
l9_804=l9_799.Surface_UVCoord0;
l9_798=l9_804;
l9_800=l9_798;
}
}
}
l9_794=l9_800;
float2 l9_805=float2(0.0);
float2 l9_806=(*sc_set0.UserUniforms).uv2Scale;
l9_805=l9_806;
float2 l9_807=float2(0.0);
l9_807=l9_805;
float2 l9_808=float2(0.0);
float2 l9_809=(*sc_set0.UserUniforms).uv2Offset;
l9_808=l9_809;
float2 l9_810=float2(0.0);
l9_810=l9_808;
float2 l9_811=float2(0.0);
l9_811=(l9_794*l9_807)+l9_810;
float2 l9_812=float2(0.0);
l9_812=l9_811+(l9_810*(l9_792.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_790=l9_812;
l9_793=l9_790;
}
else
{
float2 l9_813=float2(0.0);
float2 l9_814=float2(0.0);
float2 l9_815=float2(0.0);
float2 l9_816=float2(0.0);
float2 l9_817=float2(0.0);
ssGlobals l9_818=l9_792;
float2 l9_819;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_820=float2(0.0);
l9_820=l9_818.Surface_UVCoord0;
l9_814=l9_820;
l9_819=l9_814;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_821=float2(0.0);
l9_821=l9_818.Surface_UVCoord1;
l9_815=l9_821;
l9_819=l9_815;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_822=float2(0.0);
l9_822=l9_818.gScreenCoord;
l9_816=l9_822;
l9_819=l9_816;
}
else
{
float2 l9_823=float2(0.0);
l9_823=l9_818.Surface_UVCoord0;
l9_817=l9_823;
l9_819=l9_817;
}
}
}
l9_813=l9_819;
float2 l9_824=float2(0.0);
float2 l9_825=(*sc_set0.UserUniforms).uv2Scale;
l9_824=l9_825;
float2 l9_826=float2(0.0);
l9_826=l9_824;
float2 l9_827=float2(0.0);
float2 l9_828=(*sc_set0.UserUniforms).uv2Offset;
l9_827=l9_828;
float2 l9_829=float2(0.0);
l9_829=l9_827;
float2 l9_830=float2(0.0);
l9_830=(l9_813*l9_826)+l9_829;
l9_791=l9_830;
l9_793=l9_791;
}
l9_789=l9_793;
l9_785=l9_789;
l9_788=l9_785;
}
else
{
float2 l9_831=float2(0.0);
l9_831=l9_787.Surface_UVCoord0;
l9_786=l9_831;
l9_788=l9_786;
}
l9_784=l9_788;
float2 l9_832=float2(0.0);
l9_832=l9_784;
float2 l9_833=float2(0.0);
l9_833=l9_832;
l9_777=l9_833;
l9_780=l9_777;
}
else
{
float2 l9_834=float2(0.0);
l9_834=l9_779.Surface_UVCoord0;
l9_778=l9_834;
l9_780=l9_778;
}
}
}
}
l9_773=l9_780;
float2 l9_835=float2(0.0);
float2 l9_836=(*sc_set0.UserUniforms).uv3Scale;
l9_835=l9_836;
float2 l9_837=float2(0.0);
l9_837=l9_835;
float2 l9_838=float2(0.0);
float2 l9_839=(*sc_set0.UserUniforms).uv3Offset;
l9_838=l9_839;
float2 l9_840=float2(0.0);
l9_840=l9_838;
float2 l9_841=float2(0.0);
l9_841=(l9_773*l9_837)+l9_840;
l9_700=l9_841;
l9_702=l9_700;
}
l9_698=l9_702;
l9_694=l9_698;
l9_697=l9_694;
}
else
{
float2 l9_842=float2(0.0);
l9_842=l9_696.Surface_UVCoord0;
l9_695=l9_842;
l9_697=l9_695;
}
l9_693=l9_697;
float2 l9_843=float2(0.0);
l9_843=l9_693;
float2 l9_844=float2(0.0);
l9_844=l9_843;
l9_637=l9_844;
l9_640=l9_637;
}
else
{
float2 l9_845=float2(0.0);
l9_845=l9_639.Surface_UVCoord0;
l9_638=l9_845;
l9_640=l9_638;
}
}
}
}
l9_633=l9_640;
float4 l9_846=float4(0.0);
float2 l9_847=l9_633;
int l9_848=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_849=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_849=0;
}
else
{
l9_849=in.varStereoViewID;
}
int l9_850=l9_849;
l9_848=1-l9_850;
}
else
{
int l9_851=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_851=0;
}
else
{
l9_851=in.varStereoViewID;
}
int l9_852=l9_851;
l9_848=l9_852;
}
int l9_853=l9_848;
int l9_854=normalTexLayout_tmp;
int l9_855=l9_853;
float2 l9_856=l9_847;
bool l9_857=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_858=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_859=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_860=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_861=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_862=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_863=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_864=0.0;
bool l9_865=l9_862&&(!l9_860);
float l9_866=1.0;
float l9_867=l9_856.x;
int l9_868=l9_859.x;
if (l9_868==1)
{
l9_867=fract(l9_867);
}
else
{
if (l9_868==2)
{
float l9_869=fract(l9_867);
float l9_870=l9_867-l9_869;
float l9_871=step(0.25,fract(l9_870*0.5));
l9_867=mix(l9_869,1.0-l9_869,fast::clamp(l9_871,0.0,1.0));
}
}
l9_856.x=l9_867;
float l9_872=l9_856.y;
int l9_873=l9_859.y;
if (l9_873==1)
{
l9_872=fract(l9_872);
}
else
{
if (l9_873==2)
{
float l9_874=fract(l9_872);
float l9_875=l9_872-l9_874;
float l9_876=step(0.25,fract(l9_875*0.5));
l9_872=mix(l9_874,1.0-l9_874,fast::clamp(l9_876,0.0,1.0));
}
}
l9_856.y=l9_872;
if (l9_860)
{
bool l9_877=l9_862;
bool l9_878;
if (l9_877)
{
l9_878=l9_859.x==3;
}
else
{
l9_878=l9_877;
}
float l9_879=l9_856.x;
float l9_880=l9_861.x;
float l9_881=l9_861.z;
bool l9_882=l9_878;
float l9_883=l9_866;
float l9_884=fast::clamp(l9_879,l9_880,l9_881);
float l9_885=step(abs(l9_879-l9_884),9.9999997e-06);
l9_883*=(l9_885+((1.0-float(l9_882))*(1.0-l9_885)));
l9_879=l9_884;
l9_856.x=l9_879;
l9_866=l9_883;
bool l9_886=l9_862;
bool l9_887;
if (l9_886)
{
l9_887=l9_859.y==3;
}
else
{
l9_887=l9_886;
}
float l9_888=l9_856.y;
float l9_889=l9_861.y;
float l9_890=l9_861.w;
bool l9_891=l9_887;
float l9_892=l9_866;
float l9_893=fast::clamp(l9_888,l9_889,l9_890);
float l9_894=step(abs(l9_888-l9_893),9.9999997e-06);
l9_892*=(l9_894+((1.0-float(l9_891))*(1.0-l9_894)));
l9_888=l9_893;
l9_856.y=l9_888;
l9_866=l9_892;
}
float2 l9_895=l9_856;
bool l9_896=l9_857;
float3x3 l9_897=l9_858;
if (l9_896)
{
l9_895=float2((l9_897*float3(l9_895,1.0)).xy);
}
float2 l9_898=l9_895;
float2 l9_899=l9_898;
float2 l9_900=l9_899;
l9_856=l9_900;
float l9_901=l9_856.x;
int l9_902=l9_859.x;
bool l9_903=l9_865;
float l9_904=l9_866;
if ((l9_902==0)||(l9_902==3))
{
float l9_905=l9_901;
float l9_906=0.0;
float l9_907=1.0;
bool l9_908=l9_903;
float l9_909=l9_904;
float l9_910=fast::clamp(l9_905,l9_906,l9_907);
float l9_911=step(abs(l9_905-l9_910),9.9999997e-06);
l9_909*=(l9_911+((1.0-float(l9_908))*(1.0-l9_911)));
l9_905=l9_910;
l9_901=l9_905;
l9_904=l9_909;
}
l9_856.x=l9_901;
l9_866=l9_904;
float l9_912=l9_856.y;
int l9_913=l9_859.y;
bool l9_914=l9_865;
float l9_915=l9_866;
if ((l9_913==0)||(l9_913==3))
{
float l9_916=l9_912;
float l9_917=0.0;
float l9_918=1.0;
bool l9_919=l9_914;
float l9_920=l9_915;
float l9_921=fast::clamp(l9_916,l9_917,l9_918);
float l9_922=step(abs(l9_916-l9_921),9.9999997e-06);
l9_920*=(l9_922+((1.0-float(l9_919))*(1.0-l9_922)));
l9_916=l9_921;
l9_912=l9_916;
l9_915=l9_920;
}
l9_856.y=l9_912;
l9_866=l9_915;
float2 l9_923=l9_856;
int l9_924=l9_854;
int l9_925=l9_855;
float l9_926=l9_864;
float2 l9_927=l9_923;
int l9_928=l9_924;
int l9_929=l9_925;
float3 l9_930=float3(0.0);
if (l9_928==0)
{
l9_930=float3(l9_927,0.0);
}
else
{
if (l9_928==1)
{
l9_930=float3(l9_927.x,(l9_927.y*0.5)+(0.5-(float(l9_929)*0.5)),0.0);
}
else
{
l9_930=float3(l9_927,float(l9_929));
}
}
float3 l9_931=l9_930;
float3 l9_932=l9_931;
float2 l9_933=l9_932.xy;
float l9_934=l9_926;
float4 l9_935=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_933,bias(l9_934));
float4 l9_936=l9_935;
float4 l9_937=l9_936;
if (l9_862)
{
l9_937=mix(l9_863,l9_937,float4(l9_866));
}
float4 l9_938=l9_937;
float4 l9_939=l9_938;
float3 l9_940=(l9_939.xyz*1.9921875)-float3(1.0);
l9_939=float4(l9_940.x,l9_940.y,l9_940.z,l9_939.w);
l9_846=l9_939;
float3 l9_941=float3(0.0);
float3 l9_942=float3(0.0);
float3 l9_943=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_944=param_16;
float3 l9_945;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_946=float2(0.0);
float2 l9_947=float2(0.0);
float2 l9_948=float2(0.0);
float2 l9_949=float2(0.0);
float2 l9_950=float2(0.0);
float2 l9_951=float2(0.0);
ssGlobals l9_952=l9_944;
float2 l9_953;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_954=float2(0.0);
l9_954=l9_952.Surface_UVCoord0;
l9_947=l9_954;
l9_953=l9_947;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_955=float2(0.0);
l9_955=l9_952.Surface_UVCoord1;
l9_948=l9_955;
l9_953=l9_948;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_956=float2(0.0);
float2 l9_957=float2(0.0);
float2 l9_958=float2(0.0);
ssGlobals l9_959=l9_952;
float2 l9_960;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_961=float2(0.0);
float2 l9_962=float2(0.0);
float2 l9_963=float2(0.0);
ssGlobals l9_964=l9_959;
float2 l9_965;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_966=float2(0.0);
float2 l9_967=float2(0.0);
float2 l9_968=float2(0.0);
float2 l9_969=float2(0.0);
float2 l9_970=float2(0.0);
ssGlobals l9_971=l9_964;
float2 l9_972;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_973=float2(0.0);
l9_973=l9_971.Surface_UVCoord0;
l9_967=l9_973;
l9_972=l9_967;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_974=float2(0.0);
l9_974=l9_971.Surface_UVCoord1;
l9_968=l9_974;
l9_972=l9_968;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_975=float2(0.0);
l9_975=l9_971.gScreenCoord;
l9_969=l9_975;
l9_972=l9_969;
}
else
{
float2 l9_976=float2(0.0);
l9_976=l9_971.Surface_UVCoord0;
l9_970=l9_976;
l9_972=l9_970;
}
}
}
l9_966=l9_972;
float2 l9_977=float2(0.0);
float2 l9_978=(*sc_set0.UserUniforms).uv2Scale;
l9_977=l9_978;
float2 l9_979=float2(0.0);
l9_979=l9_977;
float2 l9_980=float2(0.0);
float2 l9_981=(*sc_set0.UserUniforms).uv2Offset;
l9_980=l9_981;
float2 l9_982=float2(0.0);
l9_982=l9_980;
float2 l9_983=float2(0.0);
l9_983=(l9_966*l9_979)+l9_982;
float2 l9_984=float2(0.0);
l9_984=l9_983+(l9_982*(l9_964.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_962=l9_984;
l9_965=l9_962;
}
else
{
float2 l9_985=float2(0.0);
float2 l9_986=float2(0.0);
float2 l9_987=float2(0.0);
float2 l9_988=float2(0.0);
float2 l9_989=float2(0.0);
ssGlobals l9_990=l9_964;
float2 l9_991;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_992=float2(0.0);
l9_992=l9_990.Surface_UVCoord0;
l9_986=l9_992;
l9_991=l9_986;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_993=float2(0.0);
l9_993=l9_990.Surface_UVCoord1;
l9_987=l9_993;
l9_991=l9_987;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_994=float2(0.0);
l9_994=l9_990.gScreenCoord;
l9_988=l9_994;
l9_991=l9_988;
}
else
{
float2 l9_995=float2(0.0);
l9_995=l9_990.Surface_UVCoord0;
l9_989=l9_995;
l9_991=l9_989;
}
}
}
l9_985=l9_991;
float2 l9_996=float2(0.0);
float2 l9_997=(*sc_set0.UserUniforms).uv2Scale;
l9_996=l9_997;
float2 l9_998=float2(0.0);
l9_998=l9_996;
float2 l9_999=float2(0.0);
float2 l9_1000=(*sc_set0.UserUniforms).uv2Offset;
l9_999=l9_1000;
float2 l9_1001=float2(0.0);
l9_1001=l9_999;
float2 l9_1002=float2(0.0);
l9_1002=(l9_985*l9_998)+l9_1001;
l9_963=l9_1002;
l9_965=l9_963;
}
l9_961=l9_965;
l9_957=l9_961;
l9_960=l9_957;
}
else
{
float2 l9_1003=float2(0.0);
l9_1003=l9_959.Surface_UVCoord0;
l9_958=l9_1003;
l9_960=l9_958;
}
l9_956=l9_960;
float2 l9_1004=float2(0.0);
l9_1004=l9_956;
float2 l9_1005=float2(0.0);
l9_1005=l9_1004;
l9_949=l9_1005;
l9_953=l9_949;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_1006=float2(0.0);
float2 l9_1007=float2(0.0);
float2 l9_1008=float2(0.0);
ssGlobals l9_1009=l9_952;
float2 l9_1010;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1011=float2(0.0);
float2 l9_1012=float2(0.0);
float2 l9_1013=float2(0.0);
ssGlobals l9_1014=l9_1009;
float2 l9_1015;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1016=float2(0.0);
float2 l9_1017=float2(0.0);
float2 l9_1018=float2(0.0);
float2 l9_1019=float2(0.0);
float2 l9_1020=float2(0.0);
float2 l9_1021=float2(0.0);
ssGlobals l9_1022=l9_1014;
float2 l9_1023;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1024=float2(0.0);
l9_1024=l9_1022.Surface_UVCoord0;
l9_1017=l9_1024;
l9_1023=l9_1017;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1025=float2(0.0);
l9_1025=l9_1022.Surface_UVCoord1;
l9_1018=l9_1025;
l9_1023=l9_1018;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1026=float2(0.0);
l9_1026=l9_1022.gScreenCoord;
l9_1019=l9_1026;
l9_1023=l9_1019;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1027=float2(0.0);
float2 l9_1028=float2(0.0);
float2 l9_1029=float2(0.0);
ssGlobals l9_1030=l9_1022;
float2 l9_1031;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1032=float2(0.0);
float2 l9_1033=float2(0.0);
float2 l9_1034=float2(0.0);
ssGlobals l9_1035=l9_1030;
float2 l9_1036;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1037=float2(0.0);
float2 l9_1038=float2(0.0);
float2 l9_1039=float2(0.0);
float2 l9_1040=float2(0.0);
float2 l9_1041=float2(0.0);
ssGlobals l9_1042=l9_1035;
float2 l9_1043;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1044=float2(0.0);
l9_1044=l9_1042.Surface_UVCoord0;
l9_1038=l9_1044;
l9_1043=l9_1038;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1045=float2(0.0);
l9_1045=l9_1042.Surface_UVCoord1;
l9_1039=l9_1045;
l9_1043=l9_1039;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1046=float2(0.0);
l9_1046=l9_1042.gScreenCoord;
l9_1040=l9_1046;
l9_1043=l9_1040;
}
else
{
float2 l9_1047=float2(0.0);
l9_1047=l9_1042.Surface_UVCoord0;
l9_1041=l9_1047;
l9_1043=l9_1041;
}
}
}
l9_1037=l9_1043;
float2 l9_1048=float2(0.0);
float2 l9_1049=(*sc_set0.UserUniforms).uv2Scale;
l9_1048=l9_1049;
float2 l9_1050=float2(0.0);
l9_1050=l9_1048;
float2 l9_1051=float2(0.0);
float2 l9_1052=(*sc_set0.UserUniforms).uv2Offset;
l9_1051=l9_1052;
float2 l9_1053=float2(0.0);
l9_1053=l9_1051;
float2 l9_1054=float2(0.0);
l9_1054=(l9_1037*l9_1050)+l9_1053;
float2 l9_1055=float2(0.0);
l9_1055=l9_1054+(l9_1053*(l9_1035.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1033=l9_1055;
l9_1036=l9_1033;
}
else
{
float2 l9_1056=float2(0.0);
float2 l9_1057=float2(0.0);
float2 l9_1058=float2(0.0);
float2 l9_1059=float2(0.0);
float2 l9_1060=float2(0.0);
ssGlobals l9_1061=l9_1035;
float2 l9_1062;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1063=float2(0.0);
l9_1063=l9_1061.Surface_UVCoord0;
l9_1057=l9_1063;
l9_1062=l9_1057;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1064=float2(0.0);
l9_1064=l9_1061.Surface_UVCoord1;
l9_1058=l9_1064;
l9_1062=l9_1058;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1065=float2(0.0);
l9_1065=l9_1061.gScreenCoord;
l9_1059=l9_1065;
l9_1062=l9_1059;
}
else
{
float2 l9_1066=float2(0.0);
l9_1066=l9_1061.Surface_UVCoord0;
l9_1060=l9_1066;
l9_1062=l9_1060;
}
}
}
l9_1056=l9_1062;
float2 l9_1067=float2(0.0);
float2 l9_1068=(*sc_set0.UserUniforms).uv2Scale;
l9_1067=l9_1068;
float2 l9_1069=float2(0.0);
l9_1069=l9_1067;
float2 l9_1070=float2(0.0);
float2 l9_1071=(*sc_set0.UserUniforms).uv2Offset;
l9_1070=l9_1071;
float2 l9_1072=float2(0.0);
l9_1072=l9_1070;
float2 l9_1073=float2(0.0);
l9_1073=(l9_1056*l9_1069)+l9_1072;
l9_1034=l9_1073;
l9_1036=l9_1034;
}
l9_1032=l9_1036;
l9_1028=l9_1032;
l9_1031=l9_1028;
}
else
{
float2 l9_1074=float2(0.0);
l9_1074=l9_1030.Surface_UVCoord0;
l9_1029=l9_1074;
l9_1031=l9_1029;
}
l9_1027=l9_1031;
float2 l9_1075=float2(0.0);
l9_1075=l9_1027;
float2 l9_1076=float2(0.0);
l9_1076=l9_1075;
l9_1020=l9_1076;
l9_1023=l9_1020;
}
else
{
float2 l9_1077=float2(0.0);
l9_1077=l9_1022.Surface_UVCoord0;
l9_1021=l9_1077;
l9_1023=l9_1021;
}
}
}
}
l9_1016=l9_1023;
float2 l9_1078=float2(0.0);
float2 l9_1079=(*sc_set0.UserUniforms).uv3Scale;
l9_1078=l9_1079;
float2 l9_1080=float2(0.0);
l9_1080=l9_1078;
float2 l9_1081=float2(0.0);
float2 l9_1082=(*sc_set0.UserUniforms).uv3Offset;
l9_1081=l9_1082;
float2 l9_1083=float2(0.0);
l9_1083=l9_1081;
float2 l9_1084=float2(0.0);
l9_1084=(l9_1016*l9_1080)+l9_1083;
float2 l9_1085=float2(0.0);
l9_1085=l9_1084+(l9_1083*(l9_1014.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1012=l9_1085;
l9_1015=l9_1012;
}
else
{
float2 l9_1086=float2(0.0);
float2 l9_1087=float2(0.0);
float2 l9_1088=float2(0.0);
float2 l9_1089=float2(0.0);
float2 l9_1090=float2(0.0);
float2 l9_1091=float2(0.0);
ssGlobals l9_1092=l9_1014;
float2 l9_1093;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1094=float2(0.0);
l9_1094=l9_1092.Surface_UVCoord0;
l9_1087=l9_1094;
l9_1093=l9_1087;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1095=float2(0.0);
l9_1095=l9_1092.Surface_UVCoord1;
l9_1088=l9_1095;
l9_1093=l9_1088;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1096=float2(0.0);
l9_1096=l9_1092.gScreenCoord;
l9_1089=l9_1096;
l9_1093=l9_1089;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1097=float2(0.0);
float2 l9_1098=float2(0.0);
float2 l9_1099=float2(0.0);
ssGlobals l9_1100=l9_1092;
float2 l9_1101;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1102=float2(0.0);
float2 l9_1103=float2(0.0);
float2 l9_1104=float2(0.0);
ssGlobals l9_1105=l9_1100;
float2 l9_1106;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1107=float2(0.0);
float2 l9_1108=float2(0.0);
float2 l9_1109=float2(0.0);
float2 l9_1110=float2(0.0);
float2 l9_1111=float2(0.0);
ssGlobals l9_1112=l9_1105;
float2 l9_1113;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1114=float2(0.0);
l9_1114=l9_1112.Surface_UVCoord0;
l9_1108=l9_1114;
l9_1113=l9_1108;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1115=float2(0.0);
l9_1115=l9_1112.Surface_UVCoord1;
l9_1109=l9_1115;
l9_1113=l9_1109;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1116=float2(0.0);
l9_1116=l9_1112.gScreenCoord;
l9_1110=l9_1116;
l9_1113=l9_1110;
}
else
{
float2 l9_1117=float2(0.0);
l9_1117=l9_1112.Surface_UVCoord0;
l9_1111=l9_1117;
l9_1113=l9_1111;
}
}
}
l9_1107=l9_1113;
float2 l9_1118=float2(0.0);
float2 l9_1119=(*sc_set0.UserUniforms).uv2Scale;
l9_1118=l9_1119;
float2 l9_1120=float2(0.0);
l9_1120=l9_1118;
float2 l9_1121=float2(0.0);
float2 l9_1122=(*sc_set0.UserUniforms).uv2Offset;
l9_1121=l9_1122;
float2 l9_1123=float2(0.0);
l9_1123=l9_1121;
float2 l9_1124=float2(0.0);
l9_1124=(l9_1107*l9_1120)+l9_1123;
float2 l9_1125=float2(0.0);
l9_1125=l9_1124+(l9_1123*(l9_1105.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1103=l9_1125;
l9_1106=l9_1103;
}
else
{
float2 l9_1126=float2(0.0);
float2 l9_1127=float2(0.0);
float2 l9_1128=float2(0.0);
float2 l9_1129=float2(0.0);
float2 l9_1130=float2(0.0);
ssGlobals l9_1131=l9_1105;
float2 l9_1132;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1133=float2(0.0);
l9_1133=l9_1131.Surface_UVCoord0;
l9_1127=l9_1133;
l9_1132=l9_1127;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1134=float2(0.0);
l9_1134=l9_1131.Surface_UVCoord1;
l9_1128=l9_1134;
l9_1132=l9_1128;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1135=float2(0.0);
l9_1135=l9_1131.gScreenCoord;
l9_1129=l9_1135;
l9_1132=l9_1129;
}
else
{
float2 l9_1136=float2(0.0);
l9_1136=l9_1131.Surface_UVCoord0;
l9_1130=l9_1136;
l9_1132=l9_1130;
}
}
}
l9_1126=l9_1132;
float2 l9_1137=float2(0.0);
float2 l9_1138=(*sc_set0.UserUniforms).uv2Scale;
l9_1137=l9_1138;
float2 l9_1139=float2(0.0);
l9_1139=l9_1137;
float2 l9_1140=float2(0.0);
float2 l9_1141=(*sc_set0.UserUniforms).uv2Offset;
l9_1140=l9_1141;
float2 l9_1142=float2(0.0);
l9_1142=l9_1140;
float2 l9_1143=float2(0.0);
l9_1143=(l9_1126*l9_1139)+l9_1142;
l9_1104=l9_1143;
l9_1106=l9_1104;
}
l9_1102=l9_1106;
l9_1098=l9_1102;
l9_1101=l9_1098;
}
else
{
float2 l9_1144=float2(0.0);
l9_1144=l9_1100.Surface_UVCoord0;
l9_1099=l9_1144;
l9_1101=l9_1099;
}
l9_1097=l9_1101;
float2 l9_1145=float2(0.0);
l9_1145=l9_1097;
float2 l9_1146=float2(0.0);
l9_1146=l9_1145;
l9_1090=l9_1146;
l9_1093=l9_1090;
}
else
{
float2 l9_1147=float2(0.0);
l9_1147=l9_1092.Surface_UVCoord0;
l9_1091=l9_1147;
l9_1093=l9_1091;
}
}
}
}
l9_1086=l9_1093;
float2 l9_1148=float2(0.0);
float2 l9_1149=(*sc_set0.UserUniforms).uv3Scale;
l9_1148=l9_1149;
float2 l9_1150=float2(0.0);
l9_1150=l9_1148;
float2 l9_1151=float2(0.0);
float2 l9_1152=(*sc_set0.UserUniforms).uv3Offset;
l9_1151=l9_1152;
float2 l9_1153=float2(0.0);
l9_1153=l9_1151;
float2 l9_1154=float2(0.0);
l9_1154=(l9_1086*l9_1150)+l9_1153;
l9_1013=l9_1154;
l9_1015=l9_1013;
}
l9_1011=l9_1015;
l9_1007=l9_1011;
l9_1010=l9_1007;
}
else
{
float2 l9_1155=float2(0.0);
l9_1155=l9_1009.Surface_UVCoord0;
l9_1008=l9_1155;
l9_1010=l9_1008;
}
l9_1006=l9_1010;
float2 l9_1156=float2(0.0);
l9_1156=l9_1006;
float2 l9_1157=float2(0.0);
l9_1157=l9_1156;
l9_950=l9_1157;
l9_953=l9_950;
}
else
{
float2 l9_1158=float2(0.0);
l9_1158=l9_952.Surface_UVCoord0;
l9_951=l9_1158;
l9_953=l9_951;
}
}
}
}
l9_946=l9_953;
float4 l9_1159=float4(0.0);
float2 l9_1160=l9_946;
int l9_1161=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_1162=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1162=0;
}
else
{
l9_1162=in.varStereoViewID;
}
int l9_1163=l9_1162;
l9_1161=1-l9_1163;
}
else
{
int l9_1164=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1164=0;
}
else
{
l9_1164=in.varStereoViewID;
}
int l9_1165=l9_1164;
l9_1161=l9_1165;
}
int l9_1166=l9_1161;
int l9_1167=detailNormalTexLayout_tmp;
int l9_1168=l9_1166;
float2 l9_1169=l9_1160;
bool l9_1170=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_1171=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_1172=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_1173=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_1174=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_1175=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_1176=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_1177=0.0;
bool l9_1178=l9_1175&&(!l9_1173);
float l9_1179=1.0;
float l9_1180=l9_1169.x;
int l9_1181=l9_1172.x;
if (l9_1181==1)
{
l9_1180=fract(l9_1180);
}
else
{
if (l9_1181==2)
{
float l9_1182=fract(l9_1180);
float l9_1183=l9_1180-l9_1182;
float l9_1184=step(0.25,fract(l9_1183*0.5));
l9_1180=mix(l9_1182,1.0-l9_1182,fast::clamp(l9_1184,0.0,1.0));
}
}
l9_1169.x=l9_1180;
float l9_1185=l9_1169.y;
int l9_1186=l9_1172.y;
if (l9_1186==1)
{
l9_1185=fract(l9_1185);
}
else
{
if (l9_1186==2)
{
float l9_1187=fract(l9_1185);
float l9_1188=l9_1185-l9_1187;
float l9_1189=step(0.25,fract(l9_1188*0.5));
l9_1185=mix(l9_1187,1.0-l9_1187,fast::clamp(l9_1189,0.0,1.0));
}
}
l9_1169.y=l9_1185;
if (l9_1173)
{
bool l9_1190=l9_1175;
bool l9_1191;
if (l9_1190)
{
l9_1191=l9_1172.x==3;
}
else
{
l9_1191=l9_1190;
}
float l9_1192=l9_1169.x;
float l9_1193=l9_1174.x;
float l9_1194=l9_1174.z;
bool l9_1195=l9_1191;
float l9_1196=l9_1179;
float l9_1197=fast::clamp(l9_1192,l9_1193,l9_1194);
float l9_1198=step(abs(l9_1192-l9_1197),9.9999997e-06);
l9_1196*=(l9_1198+((1.0-float(l9_1195))*(1.0-l9_1198)));
l9_1192=l9_1197;
l9_1169.x=l9_1192;
l9_1179=l9_1196;
bool l9_1199=l9_1175;
bool l9_1200;
if (l9_1199)
{
l9_1200=l9_1172.y==3;
}
else
{
l9_1200=l9_1199;
}
float l9_1201=l9_1169.y;
float l9_1202=l9_1174.y;
float l9_1203=l9_1174.w;
bool l9_1204=l9_1200;
float l9_1205=l9_1179;
float l9_1206=fast::clamp(l9_1201,l9_1202,l9_1203);
float l9_1207=step(abs(l9_1201-l9_1206),9.9999997e-06);
l9_1205*=(l9_1207+((1.0-float(l9_1204))*(1.0-l9_1207)));
l9_1201=l9_1206;
l9_1169.y=l9_1201;
l9_1179=l9_1205;
}
float2 l9_1208=l9_1169;
bool l9_1209=l9_1170;
float3x3 l9_1210=l9_1171;
if (l9_1209)
{
l9_1208=float2((l9_1210*float3(l9_1208,1.0)).xy);
}
float2 l9_1211=l9_1208;
float2 l9_1212=l9_1211;
float2 l9_1213=l9_1212;
l9_1169=l9_1213;
float l9_1214=l9_1169.x;
int l9_1215=l9_1172.x;
bool l9_1216=l9_1178;
float l9_1217=l9_1179;
if ((l9_1215==0)||(l9_1215==3))
{
float l9_1218=l9_1214;
float l9_1219=0.0;
float l9_1220=1.0;
bool l9_1221=l9_1216;
float l9_1222=l9_1217;
float l9_1223=fast::clamp(l9_1218,l9_1219,l9_1220);
float l9_1224=step(abs(l9_1218-l9_1223),9.9999997e-06);
l9_1222*=(l9_1224+((1.0-float(l9_1221))*(1.0-l9_1224)));
l9_1218=l9_1223;
l9_1214=l9_1218;
l9_1217=l9_1222;
}
l9_1169.x=l9_1214;
l9_1179=l9_1217;
float l9_1225=l9_1169.y;
int l9_1226=l9_1172.y;
bool l9_1227=l9_1178;
float l9_1228=l9_1179;
if ((l9_1226==0)||(l9_1226==3))
{
float l9_1229=l9_1225;
float l9_1230=0.0;
float l9_1231=1.0;
bool l9_1232=l9_1227;
float l9_1233=l9_1228;
float l9_1234=fast::clamp(l9_1229,l9_1230,l9_1231);
float l9_1235=step(abs(l9_1229-l9_1234),9.9999997e-06);
l9_1233*=(l9_1235+((1.0-float(l9_1232))*(1.0-l9_1235)));
l9_1229=l9_1234;
l9_1225=l9_1229;
l9_1228=l9_1233;
}
l9_1169.y=l9_1225;
l9_1179=l9_1228;
float2 l9_1236=l9_1169;
int l9_1237=l9_1167;
int l9_1238=l9_1168;
float l9_1239=l9_1177;
float2 l9_1240=l9_1236;
int l9_1241=l9_1237;
int l9_1242=l9_1238;
float3 l9_1243=float3(0.0);
if (l9_1241==0)
{
l9_1243=float3(l9_1240,0.0);
}
else
{
if (l9_1241==1)
{
l9_1243=float3(l9_1240.x,(l9_1240.y*0.5)+(0.5-(float(l9_1242)*0.5)),0.0);
}
else
{
l9_1243=float3(l9_1240,float(l9_1242));
}
}
float3 l9_1244=l9_1243;
float3 l9_1245=l9_1244;
float2 l9_1246=l9_1245.xy;
float l9_1247=l9_1239;
float4 l9_1248=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_1246,bias(l9_1247));
float4 l9_1249=l9_1248;
float4 l9_1250=l9_1249;
if (l9_1175)
{
l9_1250=mix(l9_1176,l9_1250,float4(l9_1179));
}
float4 l9_1251=l9_1250;
float4 l9_1252=l9_1251;
float3 l9_1253=(l9_1252.xyz*1.9921875)-float3(1.0);
l9_1252=float4(l9_1253.x,l9_1253.y,l9_1253.z,l9_1252.w);
l9_1159=l9_1252;
l9_942=l9_1159.xyz;
l9_945=l9_942;
}
else
{
l9_945=l9_943;
}
l9_941=l9_945;
float3 l9_1254=float3(0.0);
float3 l9_1255=l9_846.xyz;
float l9_1256=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_1257=l9_941;
float l9_1258=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_1259=l9_1255;
float l9_1260=l9_1256;
float3 l9_1261=l9_1257;
float l9_1262=l9_1258;
float3 l9_1263=mix(float3(0.0,0.0,1.0),l9_1259,float3(l9_1260))+float3(0.0,0.0,1.0);
float3 l9_1264=mix(float3(0.0,0.0,1.0),l9_1261,float3(l9_1262))*float3(-1.0,-1.0,1.0);
float3 l9_1265=normalize((l9_1263*dot(l9_1263,l9_1264))-(l9_1264*l9_1263.z));
l9_1257=l9_1265;
float3 l9_1266=l9_1257;
l9_1254=l9_1266;
float3 l9_1267=float3(0.0);
l9_1267=l9_632*l9_1254;
float3 l9_1268=float3(0.0);
float3 l9_1269=l9_1267;
float l9_1270=dot(l9_1269,l9_1269);
float l9_1271;
if (l9_1270>0.0)
{
l9_1271=1.0/sqrt(l9_1270);
}
else
{
l9_1271=0.0;
}
float l9_1272=l9_1271;
float3 l9_1273=l9_1269*l9_1272;
l9_1268=l9_1273;
param_13=l9_1268;
param_15=param_13;
}
else
{
float3 l9_1274=float3(0.0);
l9_1274=param_16.VertexNormal_WorldSpace;
float3 l9_1275=float3(0.0);
float3 l9_1276=l9_1274;
float l9_1277=dot(l9_1276,l9_1276);
float l9_1278;
if (l9_1277>0.0)
{
l9_1278=1.0/sqrt(l9_1277);
}
else
{
l9_1278=0.0;
}
float l9_1279=l9_1278;
float3 l9_1280=l9_1276*l9_1279;
l9_1275=l9_1280;
param_14=l9_1275;
param_15=param_14;
}
Result_N337=param_15;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float2 Result_N176=float2(0.0);
float2 param_17=float2(0.0);
float2 param_18=float2(0.0);
float2 param_19=float2(0.0);
float2 param_20=float2(0.0);
float2 param_21=float2(0.0);
ssGlobals param_23=Globals;
float2 param_22;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_1281=float2(0.0);
l9_1281=param_23.Surface_UVCoord0;
param_17=l9_1281;
param_22=param_17;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_1282=float2(0.0);
l9_1282=param_23.Surface_UVCoord1;
param_18=l9_1282;
param_22=param_18;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_1283=float2(0.0);
float2 l9_1284=float2(0.0);
float2 l9_1285=float2(0.0);
ssGlobals l9_1286=param_23;
float2 l9_1287;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1288=float2(0.0);
float2 l9_1289=float2(0.0);
float2 l9_1290=float2(0.0);
ssGlobals l9_1291=l9_1286;
float2 l9_1292;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1293=float2(0.0);
float2 l9_1294=float2(0.0);
float2 l9_1295=float2(0.0);
float2 l9_1296=float2(0.0);
float2 l9_1297=float2(0.0);
ssGlobals l9_1298=l9_1291;
float2 l9_1299;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1300=float2(0.0);
l9_1300=l9_1298.Surface_UVCoord0;
l9_1294=l9_1300;
l9_1299=l9_1294;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1301=float2(0.0);
l9_1301=l9_1298.Surface_UVCoord1;
l9_1295=l9_1301;
l9_1299=l9_1295;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1302=float2(0.0);
l9_1302=l9_1298.gScreenCoord;
l9_1296=l9_1302;
l9_1299=l9_1296;
}
else
{
float2 l9_1303=float2(0.0);
l9_1303=l9_1298.Surface_UVCoord0;
l9_1297=l9_1303;
l9_1299=l9_1297;
}
}
}
l9_1293=l9_1299;
float2 l9_1304=float2(0.0);
float2 l9_1305=(*sc_set0.UserUniforms).uv2Scale;
l9_1304=l9_1305;
float2 l9_1306=float2(0.0);
l9_1306=l9_1304;
float2 l9_1307=float2(0.0);
float2 l9_1308=(*sc_set0.UserUniforms).uv2Offset;
l9_1307=l9_1308;
float2 l9_1309=float2(0.0);
l9_1309=l9_1307;
float2 l9_1310=float2(0.0);
l9_1310=(l9_1293*l9_1306)+l9_1309;
float2 l9_1311=float2(0.0);
l9_1311=l9_1310+(l9_1309*(l9_1291.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1289=l9_1311;
l9_1292=l9_1289;
}
else
{
float2 l9_1312=float2(0.0);
float2 l9_1313=float2(0.0);
float2 l9_1314=float2(0.0);
float2 l9_1315=float2(0.0);
float2 l9_1316=float2(0.0);
ssGlobals l9_1317=l9_1291;
float2 l9_1318;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1319=float2(0.0);
l9_1319=l9_1317.Surface_UVCoord0;
l9_1313=l9_1319;
l9_1318=l9_1313;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1320=float2(0.0);
l9_1320=l9_1317.Surface_UVCoord1;
l9_1314=l9_1320;
l9_1318=l9_1314;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1321=float2(0.0);
l9_1321=l9_1317.gScreenCoord;
l9_1315=l9_1321;
l9_1318=l9_1315;
}
else
{
float2 l9_1322=float2(0.0);
l9_1322=l9_1317.Surface_UVCoord0;
l9_1316=l9_1322;
l9_1318=l9_1316;
}
}
}
l9_1312=l9_1318;
float2 l9_1323=float2(0.0);
float2 l9_1324=(*sc_set0.UserUniforms).uv2Scale;
l9_1323=l9_1324;
float2 l9_1325=float2(0.0);
l9_1325=l9_1323;
float2 l9_1326=float2(0.0);
float2 l9_1327=(*sc_set0.UserUniforms).uv2Offset;
l9_1326=l9_1327;
float2 l9_1328=float2(0.0);
l9_1328=l9_1326;
float2 l9_1329=float2(0.0);
l9_1329=(l9_1312*l9_1325)+l9_1328;
l9_1290=l9_1329;
l9_1292=l9_1290;
}
l9_1288=l9_1292;
l9_1284=l9_1288;
l9_1287=l9_1284;
}
else
{
float2 l9_1330=float2(0.0);
l9_1330=l9_1286.Surface_UVCoord0;
l9_1285=l9_1330;
l9_1287=l9_1285;
}
l9_1283=l9_1287;
float2 l9_1331=float2(0.0);
l9_1331=l9_1283;
float2 l9_1332=float2(0.0);
l9_1332=l9_1331;
param_19=l9_1332;
param_22=param_19;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_1333=float2(0.0);
float2 l9_1334=float2(0.0);
float2 l9_1335=float2(0.0);
ssGlobals l9_1336=param_23;
float2 l9_1337;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1338=float2(0.0);
float2 l9_1339=float2(0.0);
float2 l9_1340=float2(0.0);
ssGlobals l9_1341=l9_1336;
float2 l9_1342;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1343=float2(0.0);
float2 l9_1344=float2(0.0);
float2 l9_1345=float2(0.0);
float2 l9_1346=float2(0.0);
float2 l9_1347=float2(0.0);
float2 l9_1348=float2(0.0);
ssGlobals l9_1349=l9_1341;
float2 l9_1350;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1351=float2(0.0);
l9_1351=l9_1349.Surface_UVCoord0;
l9_1344=l9_1351;
l9_1350=l9_1344;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1352=float2(0.0);
l9_1352=l9_1349.Surface_UVCoord1;
l9_1345=l9_1352;
l9_1350=l9_1345;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1353=float2(0.0);
l9_1353=l9_1349.gScreenCoord;
l9_1346=l9_1353;
l9_1350=l9_1346;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1354=float2(0.0);
float2 l9_1355=float2(0.0);
float2 l9_1356=float2(0.0);
ssGlobals l9_1357=l9_1349;
float2 l9_1358;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1359=float2(0.0);
float2 l9_1360=float2(0.0);
float2 l9_1361=float2(0.0);
ssGlobals l9_1362=l9_1357;
float2 l9_1363;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1364=float2(0.0);
float2 l9_1365=float2(0.0);
float2 l9_1366=float2(0.0);
float2 l9_1367=float2(0.0);
float2 l9_1368=float2(0.0);
ssGlobals l9_1369=l9_1362;
float2 l9_1370;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1371=float2(0.0);
l9_1371=l9_1369.Surface_UVCoord0;
l9_1365=l9_1371;
l9_1370=l9_1365;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1372=float2(0.0);
l9_1372=l9_1369.Surface_UVCoord1;
l9_1366=l9_1372;
l9_1370=l9_1366;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1373=float2(0.0);
l9_1373=l9_1369.gScreenCoord;
l9_1367=l9_1373;
l9_1370=l9_1367;
}
else
{
float2 l9_1374=float2(0.0);
l9_1374=l9_1369.Surface_UVCoord0;
l9_1368=l9_1374;
l9_1370=l9_1368;
}
}
}
l9_1364=l9_1370;
float2 l9_1375=float2(0.0);
float2 l9_1376=(*sc_set0.UserUniforms).uv2Scale;
l9_1375=l9_1376;
float2 l9_1377=float2(0.0);
l9_1377=l9_1375;
float2 l9_1378=float2(0.0);
float2 l9_1379=(*sc_set0.UserUniforms).uv2Offset;
l9_1378=l9_1379;
float2 l9_1380=float2(0.0);
l9_1380=l9_1378;
float2 l9_1381=float2(0.0);
l9_1381=(l9_1364*l9_1377)+l9_1380;
float2 l9_1382=float2(0.0);
l9_1382=l9_1381+(l9_1380*(l9_1362.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1360=l9_1382;
l9_1363=l9_1360;
}
else
{
float2 l9_1383=float2(0.0);
float2 l9_1384=float2(0.0);
float2 l9_1385=float2(0.0);
float2 l9_1386=float2(0.0);
float2 l9_1387=float2(0.0);
ssGlobals l9_1388=l9_1362;
float2 l9_1389;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1390=float2(0.0);
l9_1390=l9_1388.Surface_UVCoord0;
l9_1384=l9_1390;
l9_1389=l9_1384;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1391=float2(0.0);
l9_1391=l9_1388.Surface_UVCoord1;
l9_1385=l9_1391;
l9_1389=l9_1385;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1392=float2(0.0);
l9_1392=l9_1388.gScreenCoord;
l9_1386=l9_1392;
l9_1389=l9_1386;
}
else
{
float2 l9_1393=float2(0.0);
l9_1393=l9_1388.Surface_UVCoord0;
l9_1387=l9_1393;
l9_1389=l9_1387;
}
}
}
l9_1383=l9_1389;
float2 l9_1394=float2(0.0);
float2 l9_1395=(*sc_set0.UserUniforms).uv2Scale;
l9_1394=l9_1395;
float2 l9_1396=float2(0.0);
l9_1396=l9_1394;
float2 l9_1397=float2(0.0);
float2 l9_1398=(*sc_set0.UserUniforms).uv2Offset;
l9_1397=l9_1398;
float2 l9_1399=float2(0.0);
l9_1399=l9_1397;
float2 l9_1400=float2(0.0);
l9_1400=(l9_1383*l9_1396)+l9_1399;
l9_1361=l9_1400;
l9_1363=l9_1361;
}
l9_1359=l9_1363;
l9_1355=l9_1359;
l9_1358=l9_1355;
}
else
{
float2 l9_1401=float2(0.0);
l9_1401=l9_1357.Surface_UVCoord0;
l9_1356=l9_1401;
l9_1358=l9_1356;
}
l9_1354=l9_1358;
float2 l9_1402=float2(0.0);
l9_1402=l9_1354;
float2 l9_1403=float2(0.0);
l9_1403=l9_1402;
l9_1347=l9_1403;
l9_1350=l9_1347;
}
else
{
float2 l9_1404=float2(0.0);
l9_1404=l9_1349.Surface_UVCoord0;
l9_1348=l9_1404;
l9_1350=l9_1348;
}
}
}
}
l9_1343=l9_1350;
float2 l9_1405=float2(0.0);
float2 l9_1406=(*sc_set0.UserUniforms).uv3Scale;
l9_1405=l9_1406;
float2 l9_1407=float2(0.0);
l9_1407=l9_1405;
float2 l9_1408=float2(0.0);
float2 l9_1409=(*sc_set0.UserUniforms).uv3Offset;
l9_1408=l9_1409;
float2 l9_1410=float2(0.0);
l9_1410=l9_1408;
float2 l9_1411=float2(0.0);
l9_1411=(l9_1343*l9_1407)+l9_1410;
float2 l9_1412=float2(0.0);
l9_1412=l9_1411+(l9_1410*(l9_1341.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1339=l9_1412;
l9_1342=l9_1339;
}
else
{
float2 l9_1413=float2(0.0);
float2 l9_1414=float2(0.0);
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
float2 l9_1417=float2(0.0);
float2 l9_1418=float2(0.0);
ssGlobals l9_1419=l9_1341;
float2 l9_1420;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1421=float2(0.0);
l9_1421=l9_1419.Surface_UVCoord0;
l9_1414=l9_1421;
l9_1420=l9_1414;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1422=float2(0.0);
l9_1422=l9_1419.Surface_UVCoord1;
l9_1415=l9_1422;
l9_1420=l9_1415;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1423=float2(0.0);
l9_1423=l9_1419.gScreenCoord;
l9_1416=l9_1423;
l9_1420=l9_1416;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1424=float2(0.0);
float2 l9_1425=float2(0.0);
float2 l9_1426=float2(0.0);
ssGlobals l9_1427=l9_1419;
float2 l9_1428;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1429=float2(0.0);
float2 l9_1430=float2(0.0);
float2 l9_1431=float2(0.0);
ssGlobals l9_1432=l9_1427;
float2 l9_1433;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1434=float2(0.0);
float2 l9_1435=float2(0.0);
float2 l9_1436=float2(0.0);
float2 l9_1437=float2(0.0);
float2 l9_1438=float2(0.0);
ssGlobals l9_1439=l9_1432;
float2 l9_1440;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1441=float2(0.0);
l9_1441=l9_1439.Surface_UVCoord0;
l9_1435=l9_1441;
l9_1440=l9_1435;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1442=float2(0.0);
l9_1442=l9_1439.Surface_UVCoord1;
l9_1436=l9_1442;
l9_1440=l9_1436;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1443=float2(0.0);
l9_1443=l9_1439.gScreenCoord;
l9_1437=l9_1443;
l9_1440=l9_1437;
}
else
{
float2 l9_1444=float2(0.0);
l9_1444=l9_1439.Surface_UVCoord0;
l9_1438=l9_1444;
l9_1440=l9_1438;
}
}
}
l9_1434=l9_1440;
float2 l9_1445=float2(0.0);
float2 l9_1446=(*sc_set0.UserUniforms).uv2Scale;
l9_1445=l9_1446;
float2 l9_1447=float2(0.0);
l9_1447=l9_1445;
float2 l9_1448=float2(0.0);
float2 l9_1449=(*sc_set0.UserUniforms).uv2Offset;
l9_1448=l9_1449;
float2 l9_1450=float2(0.0);
l9_1450=l9_1448;
float2 l9_1451=float2(0.0);
l9_1451=(l9_1434*l9_1447)+l9_1450;
float2 l9_1452=float2(0.0);
l9_1452=l9_1451+(l9_1450*(l9_1432.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1430=l9_1452;
l9_1433=l9_1430;
}
else
{
float2 l9_1453=float2(0.0);
float2 l9_1454=float2(0.0);
float2 l9_1455=float2(0.0);
float2 l9_1456=float2(0.0);
float2 l9_1457=float2(0.0);
ssGlobals l9_1458=l9_1432;
float2 l9_1459;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1460=float2(0.0);
l9_1460=l9_1458.Surface_UVCoord0;
l9_1454=l9_1460;
l9_1459=l9_1454;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1461=float2(0.0);
l9_1461=l9_1458.Surface_UVCoord1;
l9_1455=l9_1461;
l9_1459=l9_1455;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1462=float2(0.0);
l9_1462=l9_1458.gScreenCoord;
l9_1456=l9_1462;
l9_1459=l9_1456;
}
else
{
float2 l9_1463=float2(0.0);
l9_1463=l9_1458.Surface_UVCoord0;
l9_1457=l9_1463;
l9_1459=l9_1457;
}
}
}
l9_1453=l9_1459;
float2 l9_1464=float2(0.0);
float2 l9_1465=(*sc_set0.UserUniforms).uv2Scale;
l9_1464=l9_1465;
float2 l9_1466=float2(0.0);
l9_1466=l9_1464;
float2 l9_1467=float2(0.0);
float2 l9_1468=(*sc_set0.UserUniforms).uv2Offset;
l9_1467=l9_1468;
float2 l9_1469=float2(0.0);
l9_1469=l9_1467;
float2 l9_1470=float2(0.0);
l9_1470=(l9_1453*l9_1466)+l9_1469;
l9_1431=l9_1470;
l9_1433=l9_1431;
}
l9_1429=l9_1433;
l9_1425=l9_1429;
l9_1428=l9_1425;
}
else
{
float2 l9_1471=float2(0.0);
l9_1471=l9_1427.Surface_UVCoord0;
l9_1426=l9_1471;
l9_1428=l9_1426;
}
l9_1424=l9_1428;
float2 l9_1472=float2(0.0);
l9_1472=l9_1424;
float2 l9_1473=float2(0.0);
l9_1473=l9_1472;
l9_1417=l9_1473;
l9_1420=l9_1417;
}
else
{
float2 l9_1474=float2(0.0);
l9_1474=l9_1419.Surface_UVCoord0;
l9_1418=l9_1474;
l9_1420=l9_1418;
}
}
}
}
l9_1413=l9_1420;
float2 l9_1475=float2(0.0);
float2 l9_1476=(*sc_set0.UserUniforms).uv3Scale;
l9_1475=l9_1476;
float2 l9_1477=float2(0.0);
l9_1477=l9_1475;
float2 l9_1478=float2(0.0);
float2 l9_1479=(*sc_set0.UserUniforms).uv3Offset;
l9_1478=l9_1479;
float2 l9_1480=float2(0.0);
l9_1480=l9_1478;
float2 l9_1481=float2(0.0);
l9_1481=(l9_1413*l9_1477)+l9_1480;
l9_1340=l9_1481;
l9_1342=l9_1340;
}
l9_1338=l9_1342;
l9_1334=l9_1338;
l9_1337=l9_1334;
}
else
{
float2 l9_1482=float2(0.0);
l9_1482=l9_1336.Surface_UVCoord0;
l9_1335=l9_1482;
l9_1337=l9_1335;
}
l9_1333=l9_1337;
float2 l9_1483=float2(0.0);
l9_1483=l9_1333;
float2 l9_1484=float2(0.0);
l9_1484=l9_1483;
param_20=l9_1484;
param_22=param_20;
}
else
{
float2 l9_1485=float2(0.0);
l9_1485=param_23.Surface_UVCoord0;
param_21=l9_1485;
param_22=param_21;
}
}
}
}
Result_N176=param_22;
float4 Color_N66=float4(0.0);
int l9_1486=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_1487=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1487=0;
}
else
{
l9_1487=in.varStereoViewID;
}
int l9_1488=l9_1487;
l9_1486=1-l9_1488;
}
else
{
int l9_1489=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1489=0;
}
else
{
l9_1489=in.varStereoViewID;
}
int l9_1490=l9_1489;
l9_1486=l9_1490;
}
int l9_1491=l9_1486;
int param_24=materialParamsTexLayout_tmp;
int param_25=l9_1491;
float2 param_26=Result_N176;
bool param_27=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_28=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_29=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_30=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_31=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_32=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_33=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_34=0.0;
bool l9_1492=param_32&&(!param_30);
float l9_1493=1.0;
float l9_1494=param_26.x;
int l9_1495=param_29.x;
if (l9_1495==1)
{
l9_1494=fract(l9_1494);
}
else
{
if (l9_1495==2)
{
float l9_1496=fract(l9_1494);
float l9_1497=l9_1494-l9_1496;
float l9_1498=step(0.25,fract(l9_1497*0.5));
l9_1494=mix(l9_1496,1.0-l9_1496,fast::clamp(l9_1498,0.0,1.0));
}
}
param_26.x=l9_1494;
float l9_1499=param_26.y;
int l9_1500=param_29.y;
if (l9_1500==1)
{
l9_1499=fract(l9_1499);
}
else
{
if (l9_1500==2)
{
float l9_1501=fract(l9_1499);
float l9_1502=l9_1499-l9_1501;
float l9_1503=step(0.25,fract(l9_1502*0.5));
l9_1499=mix(l9_1501,1.0-l9_1501,fast::clamp(l9_1503,0.0,1.0));
}
}
param_26.y=l9_1499;
if (param_30)
{
bool l9_1504=param_32;
bool l9_1505;
if (l9_1504)
{
l9_1505=param_29.x==3;
}
else
{
l9_1505=l9_1504;
}
float l9_1506=param_26.x;
float l9_1507=param_31.x;
float l9_1508=param_31.z;
bool l9_1509=l9_1505;
float l9_1510=l9_1493;
float l9_1511=fast::clamp(l9_1506,l9_1507,l9_1508);
float l9_1512=step(abs(l9_1506-l9_1511),9.9999997e-06);
l9_1510*=(l9_1512+((1.0-float(l9_1509))*(1.0-l9_1512)));
l9_1506=l9_1511;
param_26.x=l9_1506;
l9_1493=l9_1510;
bool l9_1513=param_32;
bool l9_1514;
if (l9_1513)
{
l9_1514=param_29.y==3;
}
else
{
l9_1514=l9_1513;
}
float l9_1515=param_26.y;
float l9_1516=param_31.y;
float l9_1517=param_31.w;
bool l9_1518=l9_1514;
float l9_1519=l9_1493;
float l9_1520=fast::clamp(l9_1515,l9_1516,l9_1517);
float l9_1521=step(abs(l9_1515-l9_1520),9.9999997e-06);
l9_1519*=(l9_1521+((1.0-float(l9_1518))*(1.0-l9_1521)));
l9_1515=l9_1520;
param_26.y=l9_1515;
l9_1493=l9_1519;
}
float2 l9_1522=param_26;
bool l9_1523=param_27;
float3x3 l9_1524=param_28;
if (l9_1523)
{
l9_1522=float2((l9_1524*float3(l9_1522,1.0)).xy);
}
float2 l9_1525=l9_1522;
float2 l9_1526=l9_1525;
float2 l9_1527=l9_1526;
param_26=l9_1527;
float l9_1528=param_26.x;
int l9_1529=param_29.x;
bool l9_1530=l9_1492;
float l9_1531=l9_1493;
if ((l9_1529==0)||(l9_1529==3))
{
float l9_1532=l9_1528;
float l9_1533=0.0;
float l9_1534=1.0;
bool l9_1535=l9_1530;
float l9_1536=l9_1531;
float l9_1537=fast::clamp(l9_1532,l9_1533,l9_1534);
float l9_1538=step(abs(l9_1532-l9_1537),9.9999997e-06);
l9_1536*=(l9_1538+((1.0-float(l9_1535))*(1.0-l9_1538)));
l9_1532=l9_1537;
l9_1528=l9_1532;
l9_1531=l9_1536;
}
param_26.x=l9_1528;
l9_1493=l9_1531;
float l9_1539=param_26.y;
int l9_1540=param_29.y;
bool l9_1541=l9_1492;
float l9_1542=l9_1493;
if ((l9_1540==0)||(l9_1540==3))
{
float l9_1543=l9_1539;
float l9_1544=0.0;
float l9_1545=1.0;
bool l9_1546=l9_1541;
float l9_1547=l9_1542;
float l9_1548=fast::clamp(l9_1543,l9_1544,l9_1545);
float l9_1549=step(abs(l9_1543-l9_1548),9.9999997e-06);
l9_1547*=(l9_1549+((1.0-float(l9_1546))*(1.0-l9_1549)));
l9_1543=l9_1548;
l9_1539=l9_1543;
l9_1542=l9_1547;
}
param_26.y=l9_1539;
l9_1493=l9_1542;
float2 l9_1550=param_26;
int l9_1551=param_24;
int l9_1552=param_25;
float l9_1553=param_34;
float2 l9_1554=l9_1550;
int l9_1555=l9_1551;
int l9_1556=l9_1552;
float3 l9_1557=float3(0.0);
if (l9_1555==0)
{
l9_1557=float3(l9_1554,0.0);
}
else
{
if (l9_1555==1)
{
l9_1557=float3(l9_1554.x,(l9_1554.y*0.5)+(0.5-(float(l9_1556)*0.5)),0.0);
}
else
{
l9_1557=float3(l9_1554,float(l9_1556));
}
}
float3 l9_1558=l9_1557;
float3 l9_1559=l9_1558;
float2 l9_1560=l9_1559.xy;
float l9_1561=l9_1553;
float4 l9_1562=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_1560,bias(l9_1561));
float4 l9_1563=l9_1562;
float4 l9_1564=l9_1563;
if (param_32)
{
l9_1564=mix(param_33,l9_1564,float4(l9_1493));
}
float4 l9_1565=l9_1564;
Color_N66=l9_1565;
float Value2_N304=0.0;
float2 param_35=Color_N66.xy;
float param_36=param_35.y;
Value2_N304=param_36;
float Output_N243=0.0;
float param_37=(*sc_set0.UserUniforms).roughness;
Output_N243=param_37;
float Value_N278=0.0;
Value_N278=Output_N243;
float Output_N313=0.0;
Output_N313=Value_N278*Value2_N304;
float Export_N224=0.0;
Export_N224=Output_N313;
float param_38=Export_N158;
float3 param_39=Export_N334;
float param_40=Export_N224;
ssGlobals param_41=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_41.BumpedNormal=param_39;
}
param_38=fast::clamp(param_38,0.0,1.0);
float l9_1566=param_38;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1566<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1567=gl_FragCoord;
float2 l9_1568=floor(mod(l9_1567.xy,float2(4.0)));
float l9_1569=(mod(dot(l9_1568,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1566<l9_1569)
{
discard_fragment();
}
}
float3 l9_1570=param_41.PositionWS;
float3 l9_1571=param_41.BumpedNormal;
float l9_1572=param_40;
float3 l9_1573=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_1570);
if (dot(l9_1573,l9_1571)>=(-0.050000001))
{
uint3 l9_1574=uint3(round((l9_1570-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_1574.x,l9_1574.y,l9_1574.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_1575=l9_1571;
float l9_1576=dot(abs(l9_1575),float3(1.0));
l9_1575/=float3(l9_1576);
float l9_1577=fast::clamp(-l9_1575.z,0.0,1.0);
float2 l9_1578=l9_1575.xy;
float l9_1579;
if (l9_1575.x>=0.0)
{
l9_1579=l9_1577;
}
else
{
l9_1579=-l9_1577;
}
l9_1578.x+=l9_1579;
float l9_1580;
if (l9_1575.y>=0.0)
{
l9_1580=l9_1577;
}
else
{
l9_1580=-l9_1577;
}
l9_1578.y+=l9_1580;
float2 l9_1581=l9_1578;
float2 l9_1582=l9_1581;
uint2 l9_1583=uint2(as_type<uint>(half2(float2(l9_1582.x,0.0))),as_type<uint>(half2(float2(l9_1582.y,0.0))));
out.normal_and_more=uint4(l9_1583.x,l9_1583.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_1584;
if (l9_1572<0.0)
{
l9_1584=1023u;
}
else
{
l9_1584=uint(fast::clamp(l9_1572,0.0,1.0)*1000.0);
}
uint l9_1585=l9_1584;
l9_1585 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_1585;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
return out;
}
} // RECEIVER MODE SHADER
