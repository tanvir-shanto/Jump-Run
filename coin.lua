-- Everything related to the coin class will be here

coins = {}

function spawnCoin(x, y)
    local coin = world:newRectangleCollider(x, y, 10, 10, {collision_class = "Coin"})
    coin:setFixedRotation(true)
    coin:setType('static')
    coin:setMass(0)
    coin.animation = animations.coin
    coin.destroyed = false

    table.insert(coins, coin)

end

function updateCoins(dt)
    -- Just updates the animation
    for i, c in ipairs(coins) do
        c.animation:update(dt)
    end


    for i= #coins, 1, -1 do
        local c = coins[i]
        if c:enter('Player') then
            sounds.coin:play()
            c:destroy()
            table.remove(coins, i)
            player.coin = player.coin + 1
        end
    end

end

function drawCoin()
    for i, c in ipairs(coins) do
        cx, cy = c:getPosition()
        c.animation:draw(sprites.coinSheet, cx, cy, nil, 1, 1, 15, 15  )
    end
    
end