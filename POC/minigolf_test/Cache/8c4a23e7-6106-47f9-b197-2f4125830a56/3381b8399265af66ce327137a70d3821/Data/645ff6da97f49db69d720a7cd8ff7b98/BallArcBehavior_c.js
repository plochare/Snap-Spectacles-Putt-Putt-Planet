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
// @input Component.AudioComponent bounce1audio
checkUndefined("bounce1audio", []);
// @input Asset.Material targetOutlineMaterial {"hint":"This is the material that will provide the mesh outline"}
checkUndefined("targetOutlineMaterial", []);
// @input Component.RenderMeshVisual meshVisual
// @input SceneObject gameContainer
checkUndefined("gameContainer", []);
// @input SceneObject arcContainer
checkUndefined("arcContainer", []);
// @input SceneObject dragObject
checkUndefined("dragObject", []);
// @input SceneObject targetObject
checkUndefined("targetObject", []);
// @input SceneObject ballObject
checkUndefined("ballObject", []);
// @input SceneObject t0Object
checkUndefined("t0Object", []);
// @input SceneObject t1Object
checkUndefined("t1Object", []);
// @input SceneObject t2Object
checkUndefined("t2Object", []);
// @input SceneObject t3Object
checkUndefined("t3Object", []);
// @input SceneObject t4Object
checkUndefined("t4Object", []);
// @input SceneObject t5Object
checkUndefined("t5Object", []);
// @input SceneObject t6Object
checkUndefined("t6Object", []);
// @input SceneObject t7Object
checkUndefined("t7Object", []);
// @input SceneObject t8Object
checkUndefined("t8Object", []);
// @input SceneObject basketball_1
checkUndefined("basketball_1", []);
// @input SceneObject basketball_2
checkUndefined("basketball_2", []);
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
var Module = require("../../../../../Modules/Src/Assets/GameAssets/Scripts/BallArcBehavior");
Object.setPrototypeOf(script, Module.BallArcBehavior.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
