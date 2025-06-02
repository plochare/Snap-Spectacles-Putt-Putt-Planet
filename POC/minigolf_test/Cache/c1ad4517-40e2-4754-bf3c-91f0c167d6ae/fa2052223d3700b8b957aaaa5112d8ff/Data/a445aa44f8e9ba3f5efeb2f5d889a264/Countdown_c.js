if (script.onAwake) {
	script.onAwake();
	return;
};
/*
@typedef CustomFunctions
@property {Component.ScriptComponent} script 
@property {string} function 
*/
function checkUndefined(property, showIf, showIfValue){
   if (showIf && script[showIf] != showIfValue){
       return;
   }
   if (script[property] == undefined){
       throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input bool autostart {"label":"Auto Start"}
checkUndefined("autostart", undefined, undefined);
// @ui {"widget":"separator"}
// @input bool eventCallbacks
checkUndefined("eventCallbacks", undefined, undefined);
// @ui {"widget":"group_start", "label":"Event Callbacks", "showIf":"eventCallbacks"}
// @input int callbackType = "0" {"widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Behavior Script", "value":1}, {"label":"Behavior Custom", "value":2}, {"label":"Custom Function", "value":3}]}
checkUndefined("callbackType", undefined, undefined);
// @input Component.ScriptComponent[] onCountdownStartBehaviors {"showIf":"callbackType", "showIfValue":1}
checkUndefined("onCountdownStartBehaviors", "callbackType", 1);
// @input Component.ScriptComponent[] onCountdownFinishBehaviors {"showIf":"callbackType", "showIfValue":1}
checkUndefined("onCountdownFinishBehaviors", "callbackType", 1);
// @input string[] onCountdownStartCustomTriggers {"showIf":"callbackType", "showIfValue":2}
checkUndefined("onCountdownStartCustomTriggers", "callbackType", 2);
// @input string[] onCountdownFinishCustomTriggers {"showIf":"callbackType", "showIfValue":2}
checkUndefined("onCountdownFinishCustomTriggers", "callbackType", 2);
// @input CustomFunctions[] onCountdownStartFunctions {"showIf":"callbackType", "showIfValue":3}
// @input CustomFunctions[] onCountdownFinishFunctions {"showIf":"callbackType", "showIfValue":3}
// @ui {"widget":"group_end"}
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
var Module = require("../../Modules/Src/Countdown");
Object.setPrototypeOf(script, Module.Countdown.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}