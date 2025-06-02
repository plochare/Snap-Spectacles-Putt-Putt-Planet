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
// @input SceneObject camObj
checkUndefined("camObj", []);
// @input SceneObject homeUI
checkUndefined("homeUI", []);
// @input SceneObject duringPathCreationUI
checkUndefined("duringPathCreationUI", []);
// @input SceneObject goToStartUI
checkUndefined("goToStartUI", []);
// @input Component.Text goToStartUiDistance
checkUndefined("goToStartUiDistance", []);
// @input SceneObject endSessionUI
checkUndefined("endSessionUI", []);
// @input Asset.ObjectPrefab pfbLoopUi
checkUndefined("pfbLoopUi", []);
// @input SceneObject backplateSo
checkUndefined("backplateSo", []);
// @input SceneObject warningTutorialUI
checkUndefined("warningTutorialUI", []);
// @input SceneObject tutorialUI
checkUndefined("tutorialUI", []);
// @input Component.AnimationPlayer tutorialAnimationPlayer
checkUndefined("tutorialAnimationPlayer", []);
// @input Component.Text tutorialText
checkUndefined("tutorialText", []);
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
var Module = require("../../../../Modules/Src/Assets/Scripts/UI");
Object.setPrototypeOf(script, Module.UI.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
