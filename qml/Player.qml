import VPlay 1.0
import QtQuick 1.1

EntityBase {
  id: player
  entityType: "player"

  width: 25
  height: 25

  Rectangle {
    width: player.width
    height: player.height
    x: -player.width/2
    y: -player.height/2
    color: "blue"
  }

  BoxCollider {
    id: collider
    width: player.width
    height: player.height
    x: -player.width/2
    y: -player.height/2
    bodyType: Body.Static
  }

  function getPosition() {
    return collider.body.getWorldCenter()
  }
}
