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
// @input SceneObject cam
checkUndefined("cam", []);
// @input SceneObject walkPathScreenHUD
checkUndefined("walkPathScreenHUD", []);
// @input Component.Text averagePaceText
checkUndefined("averagePaceText", []);
// @input Component.Text lapCountText
checkUndefined("lapCountText", []);
// @input Timer timerScript
checkUndefined("timerScript", []);
// @input UI uiScript
checkUndefined("uiScript", []);
// @input ProgressBarController progressBarController
checkUndefined("progressBarController", []);
// @input ArrowsSpawner arrowSpawner
checkUndefined("arrowSpawner", []);
// @input PlayerPaceCalculator playerPaceCalulator
checkUndefined("playerPaceCalulator", []);
// @input WarningController warningController
checkUndefined("warningController", []);
// @input Component.RenderMeshVisual pathRmv
checkUndefined("pathRmv", []);
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
var Module = require("../../../../Modules/Src/Assets/Scripts/PathWalker");
Object.setPrototypeOf(script, Module.PathWalker.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
