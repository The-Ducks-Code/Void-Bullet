-- lovec 'C:\Users\decla\github\love2droguelike'

require("xtramath")
require("bullet")
require("enemy")
require("betterdrawing")

function love.load() -- ran before the first frame

    love.window.setMode(800, 800) -- set the window width and height to 800x800
    -- define variables and arrays
    window = {} -- window object
    window.width, window.height = love.graphics.getDimensions() -- set window.width and window.height to the width and height of the window respectively
    focus = " " -- set the focus text to nothing so it is hidden
    focusTimer = 0 -- reset the focus timer
    focusTimerTrigger = false -- reset the focus timer trigger



    -- player variables
    player = {} -- create the player object
    player.x =  window.width/2 -- set the players x postition to about the middle of the screen
    player.y =  window.height/2 -- set the players y postition to about the middle of the screen
    player.hp = 100

    -- set window title
    love.window.setTitle("roguelike")

    enemies[#enemies+1] = createEnemy(love.math.random(10, window.width - 10), love.math.random(10, window.height + 10), "normal", 40) -- create one enemy


end

function love.update(dt)

    fps = love.timer.getFPS()
    strFPS = tostring(love.timer.getFPS())
    local deltatime = love.timer.getDelta() * 60



    window.width, window.height = love.graphics.getDimensions()


    if love.keyboard.isDown("w") then
        player.y = player.y - 2 * deltatime
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 2 * deltatime
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - 2 * deltatime
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 2 * deltatime
    end

    if love.keyboard.isDown("up") then

        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 90)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("left") then

        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 180)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("right") then

        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 0)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("down") then

        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 270)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end

    for k,v in ipairs(bullets) do
        bullets[k].update(deltatime)

        if bullets[k].y < -5 or bullets[k].y > window.height or bullets[k].x < -5 or bullets[k].x > window.width then
            bullets[k].active = false
        end

        if not bullets[k].active then
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
    
        if enemies[k].y < 0 then
            enemies[k].y = 0
        end


        for b,l in ipairs(bullets) do

            if enemies[k].x + 10 > bullets[b].x and enemies[k].x - 10 < bullets[b].x and enemies[k].y - 10 < bullets[b].y and enemies[k].y + 10 > bullets[b].y then
                print("bullet hit enemy")
                enemies[k].active = false
                bullets[b].active = false
            end

        end

        if not enemies[k].active then
            table.remove(enemies, k)
            print("enemy destroyed")
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

    if player.y < 0 then
        player.y = 0
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

        if bulletTimer > 0.2 then

            bulletTimer = 0
            bulletcooldown = false

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

    love.graphics.print(focus, window.width/2 - 50, window.height/2 - 50) -- print the lost and gained focus text when needed

    love.graphics.print('O', player.x, player.y) -- print player every frame

    for k,v in ipairs(bullets) do
            love.graphics.print(bullets[k].txt, bullets[k].x, bullets[k].y) -- print bullets every frame they are on screen
    end

    for k,v in ipairs(enemies) do
        love.graphics.print(enemies[k].txt, enemies[k].x, enemies[k].y) -- print enemies every frame they are on screen
    end



    drawRect(0, 0, 0, 155, "fill", 0, 0, 45, 20)

    love.graphics.setColor(255, 255, 255, 155)

    love.graphics.print(strFPS .. ' FPS', 0, 0)

end

