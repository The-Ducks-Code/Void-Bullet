--[[
    
This handles all of level creation and other level related things

]]--


level = {}

function level.init(levelName)

    if levelName == "roundEnd" then

        math.randomseed(os.time() * os.time() * math.pi)  -- Seed with the current system time

        local itema = itempoolERa[math.random(1, #itempoolERa)]
        local itemb = itempoolERb[math.random(1, #itempoolERb)]

        if itema == itemb then
            itemb = itempoolERb[math.random(1, #itempoolERb)]
        end
        
        items[#items+1] = createItem(itema, gameWidth / 3, 200, false)
        items[#items+1] = createItem(itemb, 2* gameWidth / 3 + 5, 200, false)

        for k, l in ipairs(enemybullets) do

            enemybullets[k].active = false
    
        end
    elseif levelName == "shop" then

        math.randomseed(os.time() * os.time() * math.pi)  -- Seed with the current system time

        local itema = itempoolSHOPa[math.random(1, #itempoolSHOPa)]
        local itemb = itempoolSHOPb[math.random(1, #itempoolSHOPb)]
        local itemc = itempoolSHOPc[math.random(1, #itempoolSHOPc)]
        
        items[#items+1] = createItem(itema, gameWidth / 5, 200, true)
        items[#items+1] = createItem(itemb, gameWidth / 2 + 5, 200, true)
        items[#items+1] = createItem(itemc, gameWidth - 160, 200, true)
        items[#items+1] = createItem(10000, gameWidth / 2 + 5, 700, true)


        for k, l in ipairs(enemybullets) do

            enemybullets[k].active = false
    
        end
        noticolor = {255, 100, 100, 255}
        noti = "WELCOME TO"
        noti2 = "'█████'s SHOP'"
    end
end

function roundStart()

    for k, l in ipairs(bullets) do

        bullets[k].active = false

    end

    if  player.round > 0 then

        if player.round < 5 then
            local i = 0
            local d = math.random(1, 3)
            while i < player.round * d do

                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
                i = i + 1

            end

        elseif player.round < 10 then
            local i = 0
            local d = math.random(1, 5)
            while i < player.round/3 * d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
                i = i + 1
            end
            i = 0
            while i < 5 - d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
                i = i + 1
            end
        elseif player.round < 15 then
            local i = 0
            local d = math.random(1, 5)
            while i < player.round * d/2 do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
                i = i + 1
            end
            i = 0
            while i < d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
                i = i + 1
            end
            i = 0
            while i < player.round do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
                i = i + 1
            end
        elseif player.round < 16 then
            bosses[#bosses+1] = createBoss(400, 400, "alpha")
            noticolor = {150, 15, 195, 255}
            noti = "ALPHA:"
            noti2 = "'THE FIRST DEFENDER'"
            notiTimerTrigger = true
        elseif player.round < 30 then
            local i = 0
            local d = math.random(1, 5)
            while i < 2 * d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "normal", 40) -- create one enemy
                i = i + 1
            end
            i = 0
            while i < 2 * (7 - d) do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
                i = i + 1
            end
            i = 0
            while i < d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "gunner", 40) -- create one enemy
                i = i + 1
            end
        elseif player.round < 31 then
            bosses[#bosses+1] = createBoss(400, 400, "phi")
            noticolor = {150, 165, 75, 255}
            noti = "PHI:"
            noti2 = "'THE MASTER OF SPEED'"
            notiTimerTrigger = true
        elseif player.round < 45 then
            local i = 0
            i = 0
            local d = math.random(1, 10)
            while i < d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "gunner", 40) -- create one enemy
                i = i + 1
            end
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "mirrorer", 40) -- create one enemy

            local ran = math.random(1, 20)

            if ran == 10 then
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "alpha", 40) -- create one enemy
            elseif ran == 20 then
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "phi", 40) -- create one enemy
            end
        elseif player.round < 46 then
            bosses[#bosses+1] = createBoss(400, 400, "xi")
            noticolor = {225, 30, 15, 255}
            noti = "XI:"
            noti2 = "'WAVE OF DEATH'"
            notiTimerTrigger = true  
        else
            local i = 0
            i = 0
            local d = math.random(10, 20)
            while i < d do
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "fast", 40) -- create one enemy
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "heavy", 40) -- create one enemy
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "gunner", 40) -- create one enemy
                i = i + 1
            end
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "mirrorer", 40) -- create one enemy
            enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "mirrorer", 40) -- create one enemy

            local ran = math.random(1, 20)

            if ran == 10 or ran == 5 then
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "alpha", 40) -- create one enemy
            elseif ran == 20 or ran == 15 then
                enemies[#enemies+1] = createEnemy(love.math.random(100, gameWidth - 120), love.math.random(250, gameHeight - 60), "phi", 40) -- create one enemy
            end
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

    player.w = 24
    player.h = 20
    player.x =  gameWidth/2 -- set the players x postition to about the middle of the screen
    player.y =  gameHeight/2 -- set the players y postition to about the middle of the screen
    player.totalHp = 3
    player.hp = 3
    player.score = 0
    player.isAlive = true
    player.abilities = {}
    player.speed = 3
    player.bType = "normal"
    player.bSize = 1
    player.round = 0
    player.roundactive = true
    player.defcolor = {255, 255, 255, 255}
    player.color = {255, 255, 255, 255}
    player.txt = '0'
    player.bulletAmount = 1
    player.pLvl = 0
    player.coins = 0
    player.telknsis = false
    bulletoffset = 0
    player.thirdeye = false
    player.thirdeyeCounter = 0
    player.damageMultiplier = 1


    if player.roundactive == true then
        table.remove(items, 3)
        table.remove(items, 2)
        table.remove(items, 1)
        
    end
    
    for k, l in ipairs(bullets) do

        bullets[k].active = false

    end

    for k, l in ipairs(bossbars) do

        bossbars[k].active = false

    end

    for k, l in ipairs(enemies) do

        enemies[k].active = false

    end

    for k, l in ipairs(bosses) do

        bosses[k].active = false

    end
    player.hp = 3
    
    itempoola = {4, 5}
    itempoolb = {1, 2, 3}
    itempoolc = {6, 7}


    roundStart()
end