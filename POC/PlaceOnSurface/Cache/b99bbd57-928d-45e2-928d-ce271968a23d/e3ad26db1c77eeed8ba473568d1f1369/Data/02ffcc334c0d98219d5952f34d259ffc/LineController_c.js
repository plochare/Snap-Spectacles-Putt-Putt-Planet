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
// @input SceneObject visualSo
checkUndefined("visualSo", []);
// @input SceneObject startVisual
checkUndefined("startVisual", []);
// @input SceneObject finishVisual
checkUndefined("finishVisual", []);
// @input SceneObject countdownSo
checkUndefined("countdownSo", []);
// @input SceneObject[] countdownSoArray
checkUndefined("countdownSoArray", []);
// @input Component.ColliderComponent countdownCollider
checkUndefined("countdownCollider", []);
// @input Component.ColliderComponent camCol
checkUndefined("camCol", []);
// @input Component.Text3D lapCounter3Dtext
checkUndefined("lapCounter3Dtext", []);
// @input SceneObject realVisualsParent
checkUndefined("realVisualsParent", []);
// @input SceneObject hintVisualsParent
checkUndefined("hintVisualsParent", []);
// @input SceneObject startLineTurnArrow
checkUndefined("startLineTurnArrow", []);
// @input SceneObject finishLineTurnArrow
checkUndefined("finishLineTurnArrow", []);
// @input SceneObject hintStartVisual
checkUndefined("hintStartVisual", []);
// @input SceneObject hintFinishVisual
checkUndefined("hintFinishVisual", []);
// @input PathCollisionEvents pathCollisionEvents
checkUndefined("pathCollisionEvents", []);
// @input PathWalker pathWalker
checkUndefined("pathWalker", []);
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
var Module = require("../../../../Modules/Src/Assets/Scripts/LineController");
Object.setPrototypeOf(script, Module.LineController.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
