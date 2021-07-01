goblins = {}


function spawnGoblin(x, y)
    local goblin = world:newRectangleCollider(x, y, 32, 32, {collision_class = "Danger"})
    --goblin:setType('static')

    goblin.animation = animations.goblin
    goblin.timer = 1.1

    table.insert(goblins, goblin)

end

function updateGoblins(dt)


    for i,g in ipairs(goblins) do
        g.animation:update(dt)

        if g.timer >= 0 then
            g.timer = g.timer - dt
        else
            g.timer = 1.1
            g:applyLinearImpulse(0, -700)
        end

    end

end


function drawGoblins()
    for i,g in ipairs(goblins) do
        local gx, gy = g:getPosition()
        g.animation:draw(sprites.goblinSheet, gx + 2, gy, nil, 1.7 , 1.8, 16, 19)
    end
end