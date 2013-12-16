import VPlay 1.0
import QtQuick 1.1

EntityBase {
  id: object
  entityType: "object"

  width: 4
  height: 4

  Rectangle {
    width: object.width
    height: object.height
    x: -object.width/2
    y: -object.height/2
    color: "red"
  }

  BoxCollider {
    id: collider
    width: object.width
    height: object.height
    x: -object.width/2
    y: -object.height/2
  }

  function getPosition() {
    return collider.body.getWorldCenter()
  }

  function applyGravityImpuls(forward) {
    collider.applyLinearImpulse(forward,getPosition())
  }
}
