if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input Component.RenderMeshVisual pathRmv
checkUndefined("pathRmv", []);
// @input Asset.ObjectPrefab pfbSurfaceDetection
checkUndefined("pfbSurfaceDetection", []);
// @input Asset.ObjectPrefab pfbPlaceObject
checkUndefined("pfbPlaceObject", []);
// @input SceneObject camObj
// @input SceneObject camObjOffset
checkUndefined("camObjOffset", []);
// @input UI ui
checkUndefined("ui", []);
// @input float placingStartForwardDisplace = 200
checkUndefined("placingStartForwardDisplace", []);
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../../Modules/Src/Assets/Scripts/PlaceSurfaceDetector");
Object.setPrototypeOf(script, Module.PlaceSurfaceDetector.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
