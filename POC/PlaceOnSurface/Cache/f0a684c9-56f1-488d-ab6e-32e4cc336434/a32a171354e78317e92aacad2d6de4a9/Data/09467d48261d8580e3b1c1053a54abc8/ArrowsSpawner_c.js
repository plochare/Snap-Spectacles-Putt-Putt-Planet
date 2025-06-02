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
// @input Component.Camera mainCamera
checkUndefined("mainCamera", []);
// @input float maxArrows
checkUndefined("maxArrows", []);
// @input float revealDistance = 1000
checkUndefined("revealDistance", []);
// @input float minimalDistanceBetweenArrows = 100
checkUndefined("minimalDistanceBetweenArrows", []);
// @input Asset.ObjectPrefab pfbSideArrow
checkUndefined("pfbSideArrow", []);
// @input Asset.Material arrowMaterial
checkUndefined("arrowMaterial", []);
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
var Module = require("../../../../Modules/Src/Assets/Scripts/ArrowsSpawner");
Object.setPrototypeOf(script, Module.ArrowsSpawner.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
