import VPlay 1.0
import QtQuick 1.1
import "GravityLogic.js" as Gravity

GameWindow {
  EntityManager {
    id: entityManager
    entityContainer: scene
  }
  Scene {
    id: scene
    property alias player: player

    PhysicsWorld {
      id: world
    }

    Player {
      id: player
      x: scene.width/2
      y: scene.height/2
    }

    Timer {
      id: gravityTimer
      interval: 100
      repeat: true
      running: false
      onTriggered: {
        Gravity.applyGravity()
      }
    }

    Component.onCompleted: {
      Gravity.player = player
      Gravity.force = 0.5
      for(var i = 0; i <50; i++) {
        var entityId = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Object.qml"),{"x":Math.random()*scene.width, "y":Math.random()*scene.height})
        Gravity.addObject(entityId)
      }
      gravityTimer.start()
    }
  }
}
