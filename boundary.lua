boundaries = {}

function spawnBoundary(x , y)

    boundary = world:newRectangleCollider(x, y, 1, 1, {collision_class = 'boundary'})
    boundary:setFixedRotation(true)
    boundary:setType('static')

    table.insert(boundaries, boundary)

end