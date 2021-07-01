function love.load()  

    -- Import external libraries
    importLibraries()

    -- Audio for the game
    makeAudio()

    -- 3 things are required to perform animation

    -- FIRST STEP: LOAD THE SPRITESHEET
    loadSpriteSheet()

    -- SECOND STEP: Specify the grid for the player animation
    createGrid()

    -- THIRD STEP: STORE THE IMAGES IN THE TABLE (Create Animation)
    createAnimation()

    -- Create the world for the game
    createGameWorld()

    -- Add collision classes
    addAllCollisionClasses()

    -- Import all the written Lua files
    importLuaFiles()



    -- Flag co ordinates
    flagX = 0
    flagY = 0

    -- Timer variables
    maxTime = 3
    timer = maxTime

    saveData = {}   -- To save certain data
    saveData.currentLevel = "level1"

    -- Load info from data.lua
    if love.filesystem.getInfo("data.lua") then
        local data = love.filesystem.load("data.lua")
        data()    -- Update all the info/data related to saveData table
    end

    -- Create a font for the texts in the game
    gameFont = love.graphics.newFont("fonts/Judges SC.ttf", 40)
    creditsFont = love.graphics.newFont(15)
    instructionsFont = love.graphics.newFont("fonts/Judges SC.ttf", 30)
    timerFont = love.graphics.newFont("fonts/Judges SC.ttf", 100)


    -- The State of the Game
    gameState = 1
 

    -- Read the credis from a file
    creditText, size = love.filesystem.read( "credits/License2.txt" , 804 )
    
    instructions = "Hold left and right key to move and press up key to jump"

end



-- Imports the external libraries
function importLibraries()

    -- Import Simple-Tiled-Implementation library
    sti = require 'libraries/Simple-Tiled-Implementation/sti'

    -- Import 'hump' library to include camera support
    cameraFile = require 'libraries/hump/camera'
    cam = cameraFile()      -- Create the camera

    -- Import anim8 for animation
    anim8 = require 'libraries/anim8/anim8'

    -- Import windfield to handle the physics in the project
    wf = require 'libraries/windfield/windfield' 

    require('libraries/show')   -- To save data/ serialization


end




--Imports all the written Lua files
function importLuaFiles()

    require('player')    
    require('dinamicEnemy')
    require('staticEnemy')
    require('spike')    
    require('boundary')  
    require('coin')     
    require('platform')

end

-- Create the game world
function createGameWorld()

    world = wf.newWorld(0, 700, false)  -- Create the world that uses the windfield(wf) physics ... Parametres are(x gravity, y gravity, false means objects will not got to sleep)
    world:setQueryDebugDrawing(true)   -- So that the query objects are visible 

    dangerZone = world:newRectangleCollider(-500, 800, 6000, 50, {collision_class = "Danger"})  -- This zone is just below the screen and much wide
    dangerZone:setType('static')

end


-- Loads all the spritesheets
function loadSpriteSheet()

    sprites = {}
    sprites.playerRunSheet = love.graphics.newImage('sprites/run.png')   -- Load the player running spritesheet
    sprites.playerIdleSheet = love.graphics.newImage('sprites/idle.png')  
    sprites.playerJump = love.graphics.newImage('sprites/jump.png')    -- Single image
    sprites.playerJumpSheet = love.graphics.newImage('sprites/jumpSheet.png')  -- Multiple image for the purpose of animation

    sprites.enemySheet = love.graphics.newImage('sprites/batSheet.png')    -- Load the dinamic enemy spriteSheet 
    sprites.goblinSheet = love.graphics.newImage('sprites/goblinSheet.png')  -- Static enemy

    -- Load the spike images
    sprites.spikeMonster1 = love.graphics.newImage('sprites/spikeMonster1.png')
    sprites.spikeMonster2 = love.graphics.newImage('sprites/spikeMonster2.png')
    sprites.spike = love.graphics.newImage('sprites/spike.png')

    sprites.coinSheet = love.graphics.newImage('sprites/coins.png')

    sprites.background = love.graphics.newImage('sprites/background.png')    -- Load the background
    sprites.flag = love.graphics.newImage('sprites/flag.png')    -- Load the flag
    sprites.coinHud = love.graphics.newImage('sprites/coinHud.png')  -- The coin image in the hud

    -- Load the buttons
    sprites.playButton = love.graphics.newImage('sprites/buttons/playButton.png')
    sprites.creditsButton = love.graphics.newImage('sprites/buttons/creditsButton.png')
    sprites.quitButton = love.graphics.newImage('sprites/buttons/quitButton.png')
    sprites.menuButton = love.graphics.newImage('sprites/buttons/menuButton.png')

    sprites.logo = love.graphics.newImage('sprites/logo.png')
    sprites.logo2 = love.graphics.newImage('sprites/logo2.png')


end


-- Creates Grid for animation from the loaded spritesheets
function createGrid()

    -- The parametres are (image width, image height, spritesheet width, spritesheet height)
    
    -- Grid for the players different states
    runGrid = anim8.newGrid(20, 34,sprites.playerRunSheet:getWidth(), sprites.playerRunSheet:getHeight())  -- Grid for player running
    idleGrid = anim8.newGrid(21, 35, sprites.playerIdleSheet:getWidth(), sprites.playerIdleSheet:getHeight())
    jumpGrid = anim8.newGrid(19, 36, sprites.playerJump:getWidth(), sprites.playerJump:getHeight())

    jumpSheetGrid = anim8.newGrid(22, 37, sprites.playerJumpSheet:getWidth(), sprites.playerJumpSheet:getHeight())
         
    
    enemyGrid = anim8.newGrid(32, 31, sprites.enemySheet:getWidth(), sprites.enemySheet:getHeight())  -- Grid for enemy
    goblinGrid = anim8.newGrid(32, 32, sprites.goblinSheet:getWidth(), sprites.goblinSheet:getHeight())  -- Grid for goblin
    
    coinGrid = anim8.newGrid(32, 32, sprites.coinSheet:getWidth(), sprites.coinSheet:getHeight())

end


-- Creates the animation
function createAnimation()

    animations = {}
    animations.idle = anim8.newAnimation(idleGrid('1-12', 1), 0.1)  -- Here (1-15) means from collumn 1 to 15, 1 means number 1 row, and 0.05 is the duration between each image
    animations.jump = anim8.newAnimation(jumpGrid('1-1', 1), 0.1)
    animations.jump2 = anim8.newAnimation(jumpSheetGrid('1-2', 1), 0.3)
    animations.run = anim8.newAnimation(runGrid('4-8', 1), 0.09)  

    animations.enemy = anim8.newAnimation(enemyGrid('1-6', 1), 0.3)
    animations.goblin = anim8.newAnimation(goblinGrid('1-2', 1) , 0.7)

    animations.coin = anim8.newAnimation(coinGrid('1-9', 1), 0.6)

end

-- Handles the audio
function makeAudio()

    sounds = {}
    sounds.jump = love.audio.newSource("audio/jump.wav", "static")   -- Load jump sound (Short audio, so it's static)
    sounds.death = love.audio.newSource("audio/death.wav", "static")
    sounds.coin = love.audio.newSource("audio/coinSound.wav", "static")  -- Coin sound
    sounds.levelUp = love.audio.newSource("audio/levelUp.wav", "static")

    sounds.buttonClick = love.audio.newSource("audio/buttonClick.wav", "static")  -- When the player clicks on a button
    sounds.buttonClick:setVolume(2)

    -- Background music
    sounds.music = love.audio.newSource("audio/backgroundMusic.mp3", "stream")  -- Load background music (Large audio, hence stream)
    sounds.music:setLooping(true)    -- So the background music will loop
    sounds.music:setVolume(0.7)    -- Reduce the volume by 30%

end


-- Adds all the collision classes
function addAllCollisionClasses()



    world:addCollisionClass('Platform')
    world:addCollisionClass('boundary')
    world:addCollisionClass('Coin')
    world:addCollisionClass('Player', {ignores = {boundary}})  -- Player will ignore the enemy boundary, so there will be no collision
    world:addCollisionClass('Danger', {ignores = {Coin}})
    
   

end




-- [[ UPDATE UPDATE UPDATE UPDATE]]

function love.update(dt)

    if gameState == 2 then

        if player.alive then
                    -- Update all the objects in the game world
            world:update(dt)
            gameMap:update(dt)  -- Update the Map
            moveBackground(dt)
            updateEnemies(dt)   -- Update the dinamic enemies
            updateGoblins(dt)   -- Update the static enemies
            updateCoins(dt)
        end

        playerUpdate(dt)  -- Invoke the player related updates


        --newUpdateEnemies(dt)

        -- Get player position to pass it to the camera
        local px, py = player:getPosition()
        --cam:lookAt(px, py)    -- Look at the player all the time/ Follow the player
        cam:lookAt(px, love.graphics.getHeight()/2)    -- Follow the player only in the x axis

        -- Change level if necessary
        local colliders = world:queryCircleArea(flagX, flagY, 10, {'Player'})
        if #colliders > 0 then
            if saveData.currentLevel == "level1" then
                sounds.levelUp:play()
                loadMap("level2")
                player.coin = 0
            elseif saveData.currentLevel == "level2" then
                sounds.levelUp:play()
                loadMap("level3")
                player.coin = 0
            elseif saveData.currentLevel == "level3" then   -- If the game is finished 
                sounds.levelUp:play()
                loadMap("level4")
                player.coin = 0
            elseif saveData.currentLevel == "level4" then
                sounds.levelUp:play()
                loadMap("level5")
                player.coin = 0
            elseif saveData.currentLevel == "level5" then
                sounds.levelUp:play()
                loadMap("level6")
                player.coin = 0
            elseif saveData.currentLevel == "level6" then
                sounds.levelUp:play()
                destroyAll()
                player.coin = 0
                saveData.currentLevel = "level1"   -- So that the game starts from level 1
                gameState = 3
                sounds.music:stop()
            end
        end

    elseif gameState == 1 then


    end



end

function moveBackground(dt)

end



-- [[ DRAW... DRAW... DRAW.... DRAW]]

function love.draw()

    love.graphics.setFont(gameFont)   -- The basic font for the game

    if gameState == 2 then

        love.graphics.setColor(1, 1, 1)
        -- Draw the background outside the realm of the camera
        love.graphics.draw(sprites.background, 0, 0)



        -- The code between cam:attach() and cam:detach() will be affected by the camera

        cam:attach()
            -- Draw the map
            -- Need to draw all the layers seperately
            gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
    

            --world:draw()       -- Draws the colliders in the game world
            drawPlayer()       -- Draw player related stuffs
            drawEnemy()    -- Draw the enemy (Dinamic)
            drawGoblins()    -- Static enemies
            drawSpikes()
            drawCoin()

            love.graphics.draw(sprites.flag, flagX - sprites.flag:getWidth()/2, flagY - sprites.flag:getHeight()/2, nil, 1)  -- draw the flag         
            
        cam:detach()
    
        -- The Hud
        drawHud()

        -- Draw timer on the screen if the player is dead and waiting to respawn
        if player.alive == false then
            love.graphics.setFont(timerFont)
            love.graphics.setColor(1,1,1)
            love.graphics.printf("" .. math.ceil(timer), 0, love.graphics.getHeight()/4, love.graphics.getWidth(), "center")
            love.graphics.setFont(gameFont)
        end
        

    elseif gameState == 1 then   -- Main menu
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(sprites.background, 0, 0)   -- The background
        --love.graphics.draw(sprites.playerJump, love.graphics.getWidth()/2, love.graphics.getHeight()/2, nil, 1.4)
        
        -- draw the buttons
        love.graphics.draw(sprites.playButton, 50, 20)
        love.graphics.draw(sprites.creditsButton, 285, 20)
        love.graphics.draw(sprites.quitButton, 520, 20)

        -- draw the logo
        love.graphics.draw(sprites.logo, love.graphics.getWidth()/2 - sprites.logo:getWidth()/2, love.graphics.getHeight()/2 - sprites.logo:getHeight()/2)

        --Instructions
        love.graphics.setFont(instructionsFont)
        love.graphics.printf(instructions, 0, love.graphics.getHeight() - 60, love.graphics.getWidth(), "center")
        love.graphics.setFont(gameFont)

        --love.graphics.printf("Click anywhere to start! ", 0, love.graphics.getHeight() - 50 , love.graphics.getWidth(), "center")
    elseif gameState == 3 then  -- Game Complete
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(sprites.background, 0, 0)   -- The background

        love.graphics.setColor(31/255,89/255, 3/255)
        love.graphics.printf("Game Over!!", 0, love.graphics.getHeight()/9 , love.graphics.getWidth(), "center")

        love.graphics.setColor(1,1,1)
        love.graphics.printf("Click left for menu section, or right for Credits section", 0,  love.graphics.getHeight() - 80, love.graphics.getWidth(), "center")
   
    elseif gameState == 4 then  -- Credits section

        -- The back button
        love.graphics.setColor(1,1,1)
        love.graphics.draw(sprites.menuButton, love.graphics.getWidth() - 150, love.graphics.getHeight() - 50)

        -- The actual text in the credits section
        love.graphics.setFont(creditsFont)
        love.graphics.setColor(223/255, 70/255, 70/255)
        love.graphics.printf(creditText, 0, 0, love.graphics.getWidth(), "left")
        love.graphics.setFont(gameFont)

    end
  

end

-- The hud system for the game
function drawHud()

    love.graphics.draw(sprites.coinHud, love.graphics:getWidth() - (2.4 * sprites.coinHud:getWidth()), sprites.coinHud:getHeight()/20, nil, 1.5)

    love.graphics.setColor(31/255,89/255, 3/255)
    love.graphics.setFont(gameFont)   -- Set the font for the score
    love.graphics.printf(":" .. player.coin , 0, sprites.coinHud:getHeight()/7, love.graphics.getWidth(), "right")

    love.graphics.printf(saveData.currentLevel, 0 , 0, love.graphics:getWidth(), "left")

end




function love.keypressed(key)

    if gameState == 2 then

        if player.alive then
            if key == "up" then 
                -- Check if there are 'Platform' colliders beneath the player / Check if the player is grounded
                if player.grounded then
                    player:applyLinearImpulse(0, -400)     -- Apply an upward linear impulse that makes the player jump
                    sounds.jump:play()
                end
            end
    
            if key == "escape" then
                gameState = 1
                sounds.music:stop()
            end
        end


    elseif gameState == 1 then
        if key == "escape" then
            quit()
        end
    elseif gameState == 3 then
        
    end


end

-- Mouseclick handling
function love.mousepressed(x, y, button)
    if gameState == 1 then
        if button == 1 then


            if x > 50 and x < 50 + sprites.playButton:getWidth() and y > 20 and y < 20 + sprites.playButton:getHeight() then
                sounds.buttonClick:play()
                gameState = 2     -- Go to the gameplay state
                loadMap(saveData.currentLevel)   -- Set the current saved map

            elseif x > 520 and x < 520 + sprites.playButton:getWidth() and y > 20 and y < 20 + sprites.playButton:getHeight() then
                sounds.buttonClick:play()
                quit()
            elseif x > 285 and x < 285 + sprites.playButton:getWidth() and y > 20 and y < 20 + sprites.playButton:getHeight() then 
                sounds.buttonClick:play()
                gameState = 4 -- The state that represents credits
            end


        end
    elseif gameState == 3 then         -- If the game is complete
        if button == 1 then
            gameState = 1              -- Take the player to the main menu
        elseif button == 2 then
            gameState = 4             -- Take the player to the credits section
        end
    
    elseif gameState == 4 then     -- Credits section
        if button == 1 then
            if x > love.graphics.getWidth() - 150 and x < love.graphics.getWidth() - 150 + sprites.menuButton:getWidth() and y > love.graphics.getHeight() - 50 and y < love.graphics.getHeight() - 50 + sprites.menuButton:getHeight() then
                sounds.buttonClick:play()
                gameState = 1
            end
        end
    end

end


-- Map related function
function loadMap(mapName)

    sounds.music:play()     -- Play the background music

    saveData.currentLevel = mapName  -- Update the current level

    love.filesystem.write("data.lua", table.show(saveData, "saveData"))   -- This will save the saveData table

    destroyAll()     -- At the beginning of the map destroy previous platforms and enemies


    gameMap = sti("maps/" .. mapName.. ".lua")   -- Load the tileMap


    player:setPosition(playerStartX, playerStartY)  -- Set the player position
    
    -- Iterate through all the objects in the map and add them to the platforms table
    for i, obj in pairs(gameMap.layers["Platforms"].objects) do
        spawnPlatform(obj.x, obj.y, obj.width, obj.height)
    end

    -- Load the enemies

    -- Dinamic
    for i, obj in pairs(gameMap.layers["enemies"].objects) do
        spawnEnemy(obj.x, obj.y)
    end

    -- Static
    for i,obj in pairs(gameMap.layers["goblins"].objects) do
        spawnGoblin(obj.x, obj.y)
    end

    -- Spike
    for i,obj in pairs(gameMap.layers["spikes"].objects) do
        spawnSpike(obj.x, obj.y)
    end

    -- Load the boundaries
    for i, obj in pairs(gameMap.layers["boundaries"].objects) do
        spawnBoundary(obj.x, obj.y)
    end

    -- Load the coins
    for i, obj in pairs(gameMap.layers["coins"].objects) do
        spawnCoin(obj.x, obj.y)
    end

    

    -- Get the flag position
    for i,obj in pairs(gameMap.layers["flag"].objects) do
        flagX = obj.x
        flagY = obj.y
    end


end

-- Destroy all the previous platforms and enemies while changing levels
function destroyAll()

    -- Remove previous platforms
    local i = #platforms
    while i > -1 do
        if platforms[i] ~= nil then
            platforms[i]:destroy() 
        end
        table.remove(platforms, i)
        i = i - 1
    end

    -- Remove previous enemies
    -- Dinamic ones
    local j = #enemies
    while j > -1 do
        if enemies[j] ~= nil then
            enemies[j]:destroy()
        end
        table.remove(enemies, j)
        j = j - 1
    end

    -- Static ones
    local j = #goblins
    while j > -1 do
        if goblins[j] ~= nil then
            goblins[j]:destroy()
        end
        table.remove(goblins, j)
        j = j - 1
    end

    -- Static ones
    local j = #spikes
    while j > -1 do
        if spikes[j] ~= nil then
            spikes[j]:destroy()
        end
        table.remove(spikes, j)
        j = j - 1
    end

    -- Remove previous enemy boundaries
    local k = #boundaries
    while k > -1 do
        if boundaries[k] ~= nil then
             boundaries[k]:destroy()
        end
        table.remove(boundaries, k)
        k = k - 1
    end

    -- Remove previous coins (If any is left)
    local i = #coins
    while i > -1 do
        if coins[i] ~= nil then
            coins[i]:destroy() 
        end
        table.remove(coins, i)
        i = i - 1
    end
end


function quit()
    love.event.quit()
end

