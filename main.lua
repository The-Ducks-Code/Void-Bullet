-- MAIN CODEBASE 

-- lovec "C:\Users\decla\github\love2droguelike"

require("xtramath")
require("bullet")
require("enemy")
require("betterdrawing")
require("input")
require("levels")
require("items")
require("ui")

function love.load() -- ran before the first frame

    love.window.setMode(800, 800) -- set the window width and height to 800x800
    -- define variables and arrays
    window = {} -- window object
    window.width, window.height = love.graphics.getDimensions() -- set window.width and window.height to the width and height of the window respectively

    fonts = {}

    fonts.entities = love.graphics.newFont( 'fonts/joystixmono.ttf', 15 * (window.width / 800), 'normal')
    fonts.ui = love.graphics.newFont( 'fonts/joystixmono.ttf', 25 * (window.width / 800), 'normal')

    focus = " " -- set the focus text to nothing so it is hidden
    focusTimer = 0 -- reset the focus timer
    focusTimerTrigger = false -- reset the focus timer trigger
    btTime = 0.2

    require("player") -- moved it here because it needed to be ran after the width and height variables were assigned

    -- set window title
    love.window.setTitle("roguelike")

    roundStart()
    
end

function love.update(dt)

    fps = love.timer.getFPS()
    strFPS = tostring(love.timer.getFPS())
    local deltatime = love.timer.getDelta() * 60

    player.update(deltatime)
    input.general()

    window.width, window.height = love.graphics.getDimensions()

    if player.isAlive then
        
        input.player(deltatime)

        for k,v in ipairs(bullets) do

            bullets[k].update(deltatime)

            if bullets[k].y < 35 or bullets[k].y > window.height or bullets[k].x < - 10 or bullets[k].x > window.width then

                bullets[k].active = false

            end

            if bullets[k].active == false then

                table.remove(bullets, k)
                print("bullet destroyed")
            end
        end

        for k,v in ipairs(enemies) do

            enemies[k].update(deltatime)

            if enemies[k].x > window.width - 10 then

                enemies[k].x = window.width - 10

            end
        
            if enemies[k].x < 0 then

                enemies[k].x = 0

            end
        
            if enemies[k].y > window.height - 12 then

                enemies[k].y = window.height - 12

            end
        
            if enemies[k].y < 40 then

                enemies[k].y = 40

            end

        



            if enemies[k].x + 10 > player.x and enemies[k].x - 10 < player.x and enemies[k].y - 10 < player.y and enemies[k].y + 10 > player.y then

                if not damagecooldown then

                    player.hp = player.hp - 20
                    print("player took " .. 20 ..  " damage")
                    print("player has " .. player.hp .. "hp left")
                    damagecooldown = true

                end
            end

            for b,l in ipairs(bullets) do

                if enemies[k].x + 10 > bullets[b].x and enemies[k].x - 10 < bullets[b].x and enemies[k].y - 15 < bullets[b].y and enemies[k].y + 15 > bullets[b].y then

                    print("bullet hit enemy")
                    enemies[k].active = false
                    bullets[b].active = false
                    player.score = player.score + 10

                end

            end

            if enemies[k].active == false then
                table.remove(enemies, k)
                print("enemy destroyed")
            end
        end
    end

    for z,x in ipairs(items) do

        items[z].update(deltatime)

        
        if items[z].x + 20 > player.x and items[z].x - 10 < player.x and items[z].y - 10 < player.y and items[z].y + 10 > player.y then

            print(items[z].type .. " aquired")
            player.abilities[#player.abilities+1] = items[z].type

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




    if player.x > window.width - 10 then

        player.x = window.width - 10

    end

    if player.x < 0 then

        player.x = 0

    end

    if player.y > window.height - 12 then

        player.y = window.height - 12

    end

    if player.y < 40 then

        player.y = 40

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
        if damageTimer > 1 then

            damageTimer = 0
            damagecooldown = false
            
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

    love.graphics.setFont(fonts.entities)

    love.graphics.print(focus, window.width/2 - 50, window.height/2 - 50) -- print the lost and gained focus text when needed

    player.draw()
    bullets.draw()
    enemies.draw()
    items.draw()
    uiDraw()
    gameover.draw()

end

