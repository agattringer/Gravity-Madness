var player
var objects = new Array
var force

function addObject(entityId) {
  objects.push(entityManager.getEntityById(entityId))
}

function applyGravity() {
  for(var i = 0; i < objects.length; i++) {
    var object = objects[i]
    var objectPosition = object.getPosition()
    var playerPosition = player.getPosition()
    // the distance could be useful if you want to apply the gravity only within a radius around the player
    var distance = Math.sqrt(Math.pow(Math.abs(objectPosition.x-playerPosition.x),2)+Math.pow(Math.abs(objectPosition.y-playerPosition.y),2))
    var atanY = playerPosition.y - objectPosition.y;
    var atanX = playerPosition.x - objectPosition.x;
    var angle = Math.atan2(atanY, atanX);
    var impulseX = force*Math.cos(angle)
    var impulseY = force*Math.sin(angle)
    object.applyGravityImpuls(Qt.point(impulseX,impulseY))
  }
}
