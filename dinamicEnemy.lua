-- Everything related to the enemies

enemies = {}   -- To hold all the enemies


function spawnEnemy(x , y)
    local enemy = world:newRectangleCollider(x, y, 25, 32, {collision_class = "Danger"})
    enemy.direction = 1
    enemy.speed = 120
    enemy.animation = animations.enemy 


    table.insert(enemies, enemy)
end

-- Update enemies
function updateEnemies(dt)
    for i, e in ipairs(enemies) do

        e.animation:update(dt)  -- Update enemy animation

        
        local ex, ey = e:getPosition()        -- Get the enemies x,y position

        -- Change direction at the boundary
        if e:enter('boundary') then
            e.direction = e.direction * - 1
        end
        
        e:setX(ex + e.speed * dt * e.direction)
    end
end

-- Draw the enemies
function drawEnemy()

    for i, e in ipairs(enemies) do
        local ex, ey = e:getPosition()
        e.animation:draw(sprites.enemySheet, ex, ey - 10, nil, 1.5 * e.direction, 1.5, 16, 16)
    end

end