@component
export class NewScript extends BaseScriptComponent {
    onAwake() {

    }
    /*
    // Create a scene object with a collider component.
    var obj = scene.createSceneObject('MyCollider');
    var collider = obj.createComponent('Physics.ColliderComponent');

    // Set it to intangible so nothing collides with it.
    collider.intangible = true;

    // Adjust the overlap filter. For this example, we want to detect all non-intangible colliders and bodies.
    // Note, these match the defaults, but are included for demonstration.
    collider.overlapFilter.includeIntangible = false;
    collider.overlapFilter.includeDynamic = true;
    collider.overlapFilter.includeStatic = true;

    // Print overlap events.
    collider.onOverlapEnter.add(function (e) {
      print('OverlapEnter(' + e.overlap.id + '): ' + e.overlap.collider);
    });
    */
}
