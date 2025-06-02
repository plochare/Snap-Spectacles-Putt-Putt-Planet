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
// @input SceneObject pointer
checkUndefined("pointer", []);
// @input Component.Text textComponent
checkUndefined("textComponent", []);
// @input Asset.Material[] Mats
checkUndefined("Mats", []);
// @input Asset.Material BarMat
checkUndefined("BarMat", []);
// @input float initialProgress
checkUndefined("initialProgress", []);
// @input float globalOpacity = 1
checkUndefined("globalOpacity", []);
// @input Component.ScreenTransform startPosScreenTransform
checkUndefined("startPosScreenTransform", []);
// @input Component.ScreenTransform endPosScreenTransform
checkUndefined("endPosScreenTransform", []);
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
var Module = require("../../../../Modules/Src/Assets/Scripts/ProgressBarController");
Object.setPrototypeOf(script, Module.ProgressBarController.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
