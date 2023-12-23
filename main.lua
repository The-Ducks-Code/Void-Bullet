-- MAIN CODEBASE 

-- lovec "C:\Users\decla\github\love2droguelike"
require("windowlock")
require("xtramath")
require("bullet")
require("enemy")
require("boss")
require("enemybullet")
require("betterdrawing")
Cheatcode = require('plugins.kc')
require("input")
require("levels")
require("items")
require("ui")
bump = require ("plugins.bump")
function love.load() -- ran before the first frame

    -- define variables and arrays
    window = {} -- window object
    window.width, window.height = love.graphics.getDimensions() -- set window.width and window.height to the width and height of the window respectively

    world = bump.newWorld()
    enemyWorld = bump.newWorld()

    fonts = {}

    fonts.entities = love.graphics.newFont( 'fonts/joystixmono.ttf', 30 * (gameWidth / 800), 'normal')
    fonts.ui = love.graphics.newFont( 'fonts/joystixmono.ttf', 50 * (gameWidth / 800), 'normal')
    fonts.score = love.graphics.newFont( 'fonts/joystixmono.ttf', 20 * (gameWidth / 800), 'normal')

    noti = " " -- set the noti text to nothing so it is hidden
    noti2 = " " -- set the noti2 text to nothing so it is hidden
    noticolor = {255, 255, 255, 255}
    notiTimer = 0 -- reset the noti timer
    notiTimerTrigger = false -- reset the noti timer trigger
    btTime = 0.2

    require("player") -- moved it here because it needed to be ran after the width and height variables were assigned
    -- initiate collisions
    world:add(player, player.x, player.y, player.w, player.h)
    
    createBlock(0, 37, 5, gameHeight - 37, "fill") -- left wall
    createBlock(gameWidth - 5, 37, 5, gameHeight - 37, "fill") -- right wall
    createBlock(0, 37, gameWidth, 5, "fill") -- top wall
    createBlock(0, gameHeight - 5, gameWidth, 5, "fill") -- bottom wall

    -- set window title
    love.window.setTitle("Void Bullet ALPHA")

    roundStart()
    
end

function love.update(dt)

    window.width, window.height = love.graphics.getDimensions() -- set window.width and window.height to the width and height of the window respectively

    fps = love.timer.getFPS()
    strFPS = tostring(love.timer.getFPS())
    local deltatime = love.timer.getDelta() * 60

    player.update(deltatime)
    input.general()

    if player.isAlive then
        
        input.player(deltatime)

        for k,v in ipairs(bullets) do

            bullets[k].update(deltatime)

            if bullets[k].y < 25 or bullets[k].y > gameHeight or bullets[k].x < - 10 or bullets[k].x > gameWidth - 8 then

                bullets[k].active = false

            end

            if bullets[k].active == false then

                table.remove(bullets, k)
                print("bullet destroyed")
            end
        end

        for k,v in ipairs(enemybullets) do

            enemybullets[k].update(deltatime)
    
            if enemybullets[k].y < 25 or enemybullets[k].y > gameHeight or enemybullets[k].x < - 10 or enemybullets[k].x > gameWidth - 8 then
    
                enemybullets[k].active = false
    
            end
    
            if enemybullets[k].x + 20 > player.x - 1 and enemybullets[k].x - 20 < player.x - 1 and enemybullets[k].y - 15 < player.y - 5 and enemybullets[k].y + 25 > player.y - 5 then
    
                player.takeDamage(1, "laser", enemybullets[k].dir)
            end
    
            if enemybullets[k].active == false then
    
                table.remove(enemybullets, k)
            end
        end

        for k,v in ipairs(enemies) do

            enemies[k].update(deltatime)

            if enemies[k].x + 20 > player.x - 1 and enemies[k].x - 20 < player.x - 1 and enemies[k].y - 15 < player.y - 5 and enemies[k].y + 25 > player.y - 5 then

                player.takeDamage(1, enemies[k].type, enemies[k].dir)
            end

            for b,l in ipairs(bullets) do

                if enemies[k].x + 22 > bullets[b].x and enemies[k].x - 20 < bullets[b].x and enemies[k].y - 25 < bullets[b].y and enemies[k].y + 25 > bullets[b].y then
                    enemies[k].hp = enemies[k].hp - bullets[b].damage
                    print("bullet hit enemy")
                    bullets[b].active = false
                    player.score = player.score + enemies[k].pts
                    enemies[k].color = {255, 0, 0, 255}
                end
            end

            if enemies[k].hp <= 0 then
                enemies[k].active = false
            end

            if enemies[k].active == false then
                print(enemies[k].type ..  " enemy destroyed at (" .. enemies[k].x .. ", " .. enemies [k].y .. ")")
                enemyWorld:remove(enemies[k])
                table.remove(enemies, k)
            end
        end
    

        for k,v in ipairs(bosses) do

            bosses[k].update(deltatime)

            if bosses[k].x + 40 > player.x - 1 and bosses[k].x - 20 < player.x - 1 and bosses[k].y - 7 < player.y - 5 and bosses[k].y + 55 > player.y then

                player.takeDamage(1, bosses[k].type, bosses[k].dir)
            end

            for b,l in ipairs(bullets) do

                if bosses[k].x + 40 > bullets[b].x and bosses[k].x - 20 < bullets[b].x and bosses[k].y - 5 < bullets[b].y and bosses[k].y + 55 > bullets[b].y then
                    bosses[k].hp = bosses[k].hp - bullets[b].damage
                    print("bullet hit boss")
                    bullets[b].active = false
                    player.score = player.score + bosses[k].pts
                    bosses[k].color = {255, 0, 0, 255}
                    print(bosses[k].hp)
                end
            end

            if bosses[k].hp <= 0 then
                bosses[k].active = false
            end

            if bosses[k].active == false then
                print(bosses[k].type ..  " enemy destroyed at (" .. bosses[k].x .. ", " .. bosses [k].y .. ")")
                enemyWorld:remove(bosses[k])
                table.remove(bosses, k)
            end
        end
    

    
    

    for z,x in ipairs(items) do

        items[z].update(deltatime)

        
        if items[z].x + 10 > player.x - 1 and items[z].x - 50 < player.x - 1 and items[z].y - 10 < player.y - 5 and items[z].y + 25 > player.y - 5  then

            print(items[z].type .. " aquired")
            if  items[z].type == "speed up" then
                player.speed = player.speed + 1
                noticolor = {25, 0, 164, 255}
                noti = "Speed ↑"
                notiTimerTrigger = true
            elseif  items[z].type == "bulletup" then
                player.bulletAmount = player.bulletAmount + 1
                noticolor = {50, 255, 0, 255}
                noti = "Bullet Streams ↑"
                notiTimerTrigger = true
                if player.bulletAmount > 6 then
                    player.bulletAmount = 6
                end
            elseif  items[z].type == "healthup" then
                if player.totalHp > player.hp then
                    player.hp = player.hp + 1
                    noticolor = {255, 0, 0, 255}
                    noti = "Healed"
                    notiTimerTrigger = true
                else
                    print("already at full hp")
                    noticolor = {255, 0, 0, 255}
                    noti = "You Are Already Fully Healed"
                    notiTimerTrigger = true
                end
            elseif  items[z].type == "heartsup" then
                player.totalHp = player.totalHp + 1
                noticolor = {255, 0, 0, 255}
                noti = "Total Hearts ↑"
                notiTimerTrigger = true
            elseif  items[z].type == "lasergun" then
                player.abilities[#player.abilities+1] = items[z].type
                if not tableContains(player.abilities, "fireball") then
                    noticolor = {245, 0, 0, 255}
                    noti = "Laser Gun: Bullets ↑ DMG ↓"
                    noti2 = "'PEW! PEW!'"
                    notiTimerTrigger = true
                end
            elseif  items[z].type == "fireball" then
                player.abilities[#player.abilities+1] = items[z].type
                if not tableContains(player.abilities, "lasergun") then
                    noticolor = {254, 222, 23, 255}
                    noti = "Fireball: Bullets ↓ DMG ↑"
                    noti2 = "'You Feel the Warmth of Fire'"
                    notiTimerTrigger = true
                end
            end

            if player.roundactive == false then
                table.remove(items, 3)
                table.remove(items, 2)
                table.remove(items, 1)
                roundStart()
            else
                table.remove(items, z)
            end
        end
    end
    end


    if notiTimerTrigger then

        notiTimer = notiTimer + dt
        if notiTimer > 5 then

            notiTimer = 0
            notiTimerTrigger = false
            noti = " "
            noti2 = " "

        end
    end

    if bulletcooldown then

        bulletTimer = bulletTimer + dt
        if bulletTimer > btTime then

            bulletTimer = 0
            bulletcooldown = false

        end
    end

    if damagecooldown then

        damageTimer = damageTimer + dt
        if damageTimer > 0.75 then

            damageTimer = 0
            damagecooldown = false
            player.color = player.defcolor
        end
    end
end

function love.focus(f)

    if not f then

      noti = "LOST FOCUS" -- change the on screen lost and gained noti text to 'LOST FOCUS'
      love.window.setTitle("Void Bullet ALPHA (FOCUS LOST)") -- set the program window to 'roguelike (FOCUS LOST)'
    else

      noti = "GAINED FOCUS" -- change the on screen lost and gained focus text to 'GAINED FOCUS'
      notiTimerTrigger = true
      love.window.setTitle("Void Bullet ALPHA") -- set the program window to 'roguelike'
    end
end

function love.draw()

    love.graphics.setCanvas(gameCanvas)
    love.graphics.clear()
        love.graphics.setFont(fonts.entities)
        love.graphics.setColor(love.math.colorFromBytes(noticolor[1], noticolor[2], noticolor[3], noticolor[4]))
        
        love.graphics.print(noti, gameWidth/2 - fonts.ui:getWidth(noti) / 3.4, 100 - fonts.ui:getHeight()) -- print the lost and gained noti text when needed
        love.graphics.print(noti2, gameWidth/2 - fonts.ui:getWidth(noti2) / 3.4, 150 - fonts.ui:getHeight()) -- print the lost and gained noti text when needed
        love.graphics.setColor(1, 1, 1, 1)
        blocks.draw()
        player.draw()
        bullets.draw()
        enemybullets.draw()
        enemies.draw()
        bosses.draw()
        items.draw()
        uiDraw()
    love.graphics.setCanvas()

    local windowWidth, windowHeight = love.graphics.getDimensions()

    local scaleAmount = scaleCanvasToFit(windowWidth, windowHeight)

    local horizontalPadding = ((windowWidth - (gameWidth * scaleAmount)) / 2) / scaleAmount
    local verticalPadding = ((windowHeight - (gameHeight * scaleAmount)) / 2) / scaleAmount

    love.graphics.draw(gameCanvas, horizontalPadding, verticalPadding) 
end