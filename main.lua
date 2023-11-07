-- love 'C:\Users\decla\github\love2dgame'


function love.load()

    -- define variables and arrays
    window = {}
    window.width, window.height = love.graphics.getDimensions()
    focus = " "
    focusTimer = 0
    focusTimerTrigger = false
    bullets = {}
    bulletcooldown = true
    bulletTimer = 0

    -- player variables
    player = {}
    player.x =  window.width/2 
    player.y =  window.height/2 - 50

    -- set window title
    love.window.setTitle("roguelike")





    bullet1 = {}
    bullet1.x = player.x
    bullet1.y = player.y

 end



function createBullet(x, y, speed, dir)

    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.width = 10
    bullet.height = 10
    bullet.txt = "#"
    bullet.speed = speed
    bullet.direction = dir
    bullet.damage = 1
    bullet.active = true

    

    if bullet.y < 0 then
        bullet.active = false
    end

    if bullet.active == false then
        bullet.txt = " "
    end

    bullet.i = 0
    while bullet.i < 80 do
        bullet.i = bullet.i + 1
        bullet.y = bullet.y - bullet.speed


    end

    return bullet

end


function love.update(dt)

    window.width, window.height = love.graphics.getDimensions()


    if love.keyboard.isDown("w") then
        player.y = player.y - 1
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 1
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - 1
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 1
    end

    if love.keyboard.isDown("up") then

        if bulletcooldown == false then
            local bullet = createBullet(player.x, player.y - 10, 10, "up")
            bullets[#bullets+1] = bullet
            bulletcooldown = true
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




    if focusTimerTrigger == true then
        focusTimer = focusTimer + dt

        if focusTimer > 0.4 then

            focusTimer = 0
            focusTimerTrigger = false
            focus = " "

        end
    end
    

    if bulletcooldown == true then
        bulletTimer = bulletTimer + dt

        if bulletTimer > 0.2 then

            bulletTimer = 0
            bulletcooldown = false

        end
    end

end


function love.focus(f)
    if not f then
      focus = "LOST FOCUS"
      love.window.setTitle("roguelike (FOCUS LOST)")
    else
      focus = "GAINED FOCUS"
      love.window.setTitle("roguelike")
      focusTimerTrigger = true
    end
end

function love.draw()
    love.graphics.print('O', player.x, player.y)
    love.graphics.print(focus, window.width/2 - 50, window.height/2 - 50)
    for k,v in ipairs(bullets) do
            love.graphics.print(bullets[k].txt, bullets[k].x, bullets[k].y)
    end
end

