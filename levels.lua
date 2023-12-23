--[[
    
This handles all of level creation and other level related things

]]--


level = {}

function level.init(levelName)

    if levelName == "roundEnd" then
        math.randomseed(os.time())  -- Seed with the current system time
        items[#items+1] = createItem(math.random(3, 4), gameWidth / 5, 200)
        items[#items+1] = createItem(math.random(1, 2), gameWidth / 2 + 5, 200)
        items[#items+1] = createItem(math.random(5, 6), gameWidth - 160, 200)
    end
end

function roundStart()


    if player.round < 5 then
        local i = 0
        while i < player.round * 10 do

            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
            i = i + 1

        end
    elseif player.round < 10 then
        local i = 0
        local d = math.random(1, 10)
        while i < player.round * d do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
            i = i + 1
        end
        i = 0
        while i < player.round * (10 - d) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
            i = i + 1
        end
    elseif player.round < 15 then
        local i = 0
        local d = math.random(1, 5)
        while i < player.round * d do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
            i = i + 1
        end
        i = 0
        while i < player.round * (7 - d) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
            i = i + 1
        end
        while i < player.round * (3) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
            i = i + 1
        end
    elseif player.round < 16 then
        bosses[#bosses+1] = createBoss(400, 400, "laser")
        noticolor = {150, 15, 195, 255}
        noti = "OMEGA:"
        noti2 = "'THE FIRST DEFENDER'"
        notiTimerTrigger = true
    else
        local i = 0
        local d = math.random(1, 5)
        while i < player.round * d do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
            i = i + 1
        end
        i = 0
        while i < player.round * (7 - d) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
            i = i + 1
        end
        while i < player.round * (3) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
            i = i + 1
        end
        
    end
    player.roundactive = true
end

blocks = {}
function createBlock(x,y,w,h,fill)
    local block = {x=x,y=y,w=w,h=h, isWall = true}
    blocks[#blocks + 1] = block
    world:add(block, x,y,w,h)
    enemyWorld:add(block, x,y,w,h)
    block.fill = fill
end

function blocks.draw()
    for i=1, #blocks do
        local b = blocks[i]
        world:update(blocks[i], b.x, b.y, b.w, b.h)
        enemyWorld:update(blocks[i], b.x, b.y, b.w, b.h)
        love.graphics.rectangle(blocks[i].fill, b.x, b.y, b.w, b.h)
      end
end