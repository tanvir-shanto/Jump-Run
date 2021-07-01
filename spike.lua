spikes = {}

spikeID = 0

function spawnSpike(x , y)
    local spike = world:newRectangleCollider(x, y, 32, 24, {collision_class = "Danger"})

    table.insert(spikes, spike)

end

function updateSpikes(dt)

end

function drawSpikes()
    for i, s in ipairs(spikes) do
        local sx, sy = s:getPosition()
        local randomNumber = math.random(0,1)
        if randomNumber == 1 then
            love.graphics.draw(sprites.spikeMonster1, sx, sy - 3, nil, 1.1, 1,sprites.spikeMonster1:getWidth()/2 , sprites.spikeMonster1:getHeight()/2)
        elseif randomNumber == 0 then
            love.graphics.draw(sprites.spikeMonster2, sx, sy - 3, nil, 1.1, 1,sprites.spikeMonster2:getWidth()/2 , sprites.spikeMonster2:getHeight()/2)
        end
    end
end