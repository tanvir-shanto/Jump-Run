-- Contains everything associated with the player class

-- Starting position of the player at each level
playerStartX = 100
playerStartY = 150


-- Create the player which is dynamic (affected by force). Related collision class is also attached to it
player = world:newRectangleCollider(playerStartX, playerStartY, 20, 30, {collision_class = "Player"})  -- The parametres are (x, y, width, height, associated collision class)
player:setFixedRotation(true)  -- So that the player body doesn't rotate
player.speed = 150
player.animation = animations.idle
player.isMoving = false
player.direction = 1    -- The player looking right
player.grounded = true  -- The player's on the ground
player.coin = 0
player.alive = true


function playerUpdate(dt)
        -- Player movement

        if player.body then     -- If the player object exists

            -- Find out if the player is grounded or not
            -- Check if there are 'Platform' colliders beneath the player.
            local colliders = world:queryRectangleArea(player:getX() - 10, player:getY() + 15, 20, 2, {'Platform'})
    
            if #colliders > 0 then
                player.grounded = true
            else
                player.grounded = false
            end
    
    
            player.isMoving = false

            -- The player will only be able to move when he is alive 
            if player.alive then
                local px, py = player:getPosition()    -- Get the player x,y position
                if love.keyboard.isDown('right') then
                    player:setX(px + player.speed*dt)
                    player.isMoving = true
                    player.direction = 1     -- Player looking right
                end
                if love.keyboard.isDown('left') then
                    player:setX(px - player.speed*dt)
                    player.isMoving = true
                    player.direction = -1    -- Player looking left. So, by using -1 as the value the image gets flipped
                end
            end
  
            -- Collision with the danger zone
            if player:enter('Danger') then
                if player.alive then
                    sounds.music:stop()
                    sounds.death:play()
                    player.alive = false
                end
                timer = timer - dt
                if timer < 0 then
                    timer = maxTime
                    player.alive = true
                    sounds.music:play()
                    player:setPosition(playerStartX, playerStartY)   -- Reposition the player
                end
            end

        end
    
        -- Choose the player's animation state
        if player.grounded then
            if player.isMoving == true then
                player.animation = animations.run
            else
                player.animation = animations.idle
            end
        else
            player.animation = animations.jump2
        end
    
        -- Animation update
        -- Only animate the player if he is alive
        if player.alive then
            player.animation:update(dt)
        end
        
        
end

function drawPlayer()

    local px, py = player:getPosition()

    if player.animation == animations.idle then
        player.animation:draw(sprites.playerIdleSheet, px, py, nil, 1.1 * player.direction, 1.1, 10 , 18)
    elseif player.animation == animations.run then
        player.animation:draw(sprites.playerRunSheet, px, py, nil, 1.1 * player.direction, 1.1, 10, 18)
    elseif player.animation == animations.jump2 then
        player.animation:draw(sprites.playerJumpSheet, px, py, nil, 1.1 * player.direction, 1.1, 10, 18)
    end

   

end