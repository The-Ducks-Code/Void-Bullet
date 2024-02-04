--[[
    
This handles all of level creation and other level related things

]]--


level = {}

function level.init(levelName)

    if levelName == "roundEnd" then
        
        math.randomseed(os.time() * os.time() * math.pi)  -- Seed with the current system time
        items[#items+1] = createItem(math.random(3, 4), gameWidth / 5, 200)
        items[#items+1] = createItem(math.random(1, 2), gameWidth / 2 + 5, 200)
        items[#items+1] = createItem(math.random(5, 6), gameWidth - 160, 200)
    end
end

function roundStart()

    for k, l in ipairs(bullets) do

        bullets[k].active = false

    end

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
        i = 0
        while i < player.round * (3) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
            i = i + 1
        end
    elseif player.round < 16 then
        bosses[#bosses+1] = createBoss(400, 400, "omgea")
        noticolor = {150, 15, 195, 255}
        noti = "OMEGA:"
        noti2 = "'THE FIRST DEFENDER'"
        notiTimerTrigger = true
    elseif player.round < 75 then
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
        i = 0
        while i < player.round * (3) do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
            i = i + 1
        end
        
    else
        local i = 0
        i = 0
        while i < 50 do
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
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

function gameRestart()

    player.health = 100
    player.roundactive = false
    player.x =  gameWidth/2 - fonts.ui:getWidth("O") / 2 + 8 -- set the players x postition to about the middle of the screen
    player.y =  gameHeight/2 + 21 -- set the players y postition to about the middle of the screen
    player.totalHp = 3
    player.hp = 3
    player.score = 0
    player.isAlive = true
    player.abilities = {}
    player.speed = 2
    player.bType = "normal"
    player.round = 0
    player.roundactive = true
    player.defcolor = {255, 255, 255, 255}
    player.color = {255, 255, 255, 255}
    player.txt = '0'
    player.bulletAmount = 1

    if player.roundactive == true then
        table.remove(items, 3)
        table.remove(items, 2)
        table.remove(items, 1)
        
    end
    
    for k, l in ipairs(bullets) do

        bullets[k].active = false

    end

    for k, l in ipairs(enemies) do

        enemies[k].active = false

    end

    for k, l in ipairs(bosses) do

        bosses[k].active = false

    end

    roundStart()

end