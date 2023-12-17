-- MAIN CODEBASE 

-- lovec "C:\Users\decla\github\love2droguelike"
require("windowlock")
require("xtramath")
require("bullet")
require("enemy")
require("betterdrawing")
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

    fonts.entities = love.graphics.newFont( 'fonts/joystixmono.ttf', 15 * (gameWidth / 800), 'normal')
    fonts.ui = love.graphics.newFont( 'fonts/joystixmono.ttf', 25 * (gameWidth / 800), 'normal')

    focus = " " -- set the focus text to nothing so it is hidden
    focusTimer = 0 -- reset the focus timer
    focusTimerTrigger = false -- reset the focus timer trigger
    btTime = 0.2

    require("player") -- moved it here because it needed to be ran after the width and height variables were assigned
    -- initiate collisions
    world:add(player, player.x, player.y, player.w, player.h)
    
    createBlock(0, 37, 5, gameHeight - 37, "fill") -- left wall
    createBlock(gameWidth - 5, 37, 5, gameHeight - 37, "fill") -- right wall
    createBlock(0, 37, gameWidth, 5, "fill") -- top wall
    createBlock(0, gameHeight - 5, gameWidth, 5, "fill") -- bottom wall

    -- set window title
    love.window.setTitle("roguelike")

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

            if bullets[k].y < 35 or bullets[k].y > gameHeight or bullets[k].x < - 10 or bullets[k].x > gameWidth - 8 then

                bullets[k].active = false

            end

            if bullets[k].active == false then

                table.remove(bullets, k)
                print("bullet destroyed")
            end
        end

        for k,v in ipairs(enemies) do

            enemies[k].update(deltatime)

            if enemies[k].x + 10 > player.x and enemies[k].x - 10 < player.x and enemies[k].y - 10 < player.y and enemies[k].y + 10 > player.y then

                player.takeDamage(20, enemies[k].type, enemies[k].dir)
            end

            for b,l in ipairs(bullets) do

                if enemies[k].x + 10 > bullets[b].x and enemies[k].x - 10 < bullets[b].x and enemies[k].y - 15 < bullets[b].y and enemies[k].y + 15 > bullets[b].y then
                    enemies[k].active = false
                    print("bullet hit enemy")
                    bullets[b].active = false
                    player.score = player.score + 10

                end

            end

            if enemies[k].active == false then
                print("enemy destroyed")
                enemyWorld:remove(enemies[k])
                table.remove(enemies, k)
            end
        end
    end

    for z,x in ipairs(items) do

        items[z].update(deltatime)

        
        if items[z].x + 10 > player.x and items[z].x - 30 < player.x and items[z].y - 10 < player.y and items[z].y + 10 > player.y then

            print(items[z].type .. " aquired")
            if  items[z].type == "speed up" then
                player.speed = player.speed + 1
            else
                player.abilities[#player.abilities+1] = items[z].type
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


    if focusTimerTrigger then

        focusTimer = focusTimer + dt
        if focusTimer > 0.4 then

            focusTimer = 0
            focusTimerTrigger = false
            focus = " "

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
        if damageTimer > 0.5 then

            damageTimer = 0
            damagecooldown = false
            player.color = {255, 255, 255, 255}
        end
    end
end

function love.focus(f)

    if not f then

      focus = "LOST FOCUS" -- change the on screen lost and gained focus text to 'LOST FOCUS'
      love.window.setTitle("roguelike (FOCUS LOST)") -- set the program window to 'roguelike (FOCUS LOST)'

    else

      focus = "GAINED FOCUS" -- change the on screen lost and gained focus text to 'GAINED FOCUS'
      love.window.setTitle("roguelike") -- set the program window to 'roguelike'
      focusTimerTrigger = true
      
    end
end

function love.draw()
    
    love.graphics.setCanvas(gameCanvas)
    love.graphics.clear()
        love.graphics.setFont(fonts.entities)

        love.graphics.print(focus, gameWidth/2 - fonts.ui:getWidth(focus) / 3.4, gameHeight/2 - fonts.ui:getHeight()) -- print the lost and gained focus text when needed

        blocks.draw()
        player.draw()
        bullets.draw()
        enemies.draw()
        items.draw()
        uiDraw()
    love.graphics.setCanvas()

    local windowWidth, windowHeight = love.graphics.getDimensions()
    
    local scaleAmount = scaleCanvasToFit(windowWidth, windowHeight)

    local horizontalPadding = ((windowWidth - (gameWidth * scaleAmount)) / 2) / scaleAmount
    local verticalPadding = ((windowHeight - (gameHeight * scaleAmount)) / 2) / scaleAmount

    love.graphics.draw(gameCanvas, horizontalPadding, verticalPadding)
end

