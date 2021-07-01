platforms = {}  -- To hold all the platform objects from the object layer

-- Platform (Object Layer) related function
function spawnPlatform(x, y, width, height)
    -- Create a platform for the player
    local platform = world:newRectangleCollider(x, y, width, height, {collision_class = "Platform"})
    platform:setType('static')   -- Setting it to static because we don't want it to be affected by any force

    table.insert(platforms, platform)    -- Add the platform object to the platforms table
end