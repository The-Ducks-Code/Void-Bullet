--[[
    
This handles all of the bullet creation outside of the update and draw functions

]]--

bullets = {} -- create the array of bullet objects
bulletcooldown = true -- allow the player to shoot on the first frame
bulletTimer = 0 -- reset the bullet timer

function createBullet(x, y, dir) -- when called creates a bullet in a given location going at a given speed in a given direction

    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.direction = dir
    bullet.active = true
    bullet.color = {255, 255, 255, 255}
    bullet.speed = 10

    if player.bType == "normal" then

        bullet.damage = 1
        bullet.txt = "+"
        bullet.speed = 7
        bullet.color = {255, 255, 255, 255}
        btTime = 0.2

    elseif player.bType == "fireball" then

        bullet.damage = 2
        bullet.txt = "+"
        bullet.speed = 3
        btTime = 0.4
        
    elseif player.bType == "lasergun" then

        bullet.damage = 0.5
        bullet.txt = "#"
        bullet.speed = 5
        bullet.color = {255, 0, 0, 255}
        btTime = 0.02

    elseif player.bType == "firelser" then

        bullet.damage = 1
        bullet.txt = "#"
        bullet.speed = 6
        bullet.color = {255, 0, 0, 255}
        btTime = 0.01

    end

    local b = 0
    local c = 0

    function bullet.update(dt)
                bullet.y = bullet.y + lengthdir_y(bullet.speed * dt, dir)
                bullet.x = bullet.x + lengthdir_x(bullet.speed * dt, dir)


            if player.bType == "fireball" then
                
                if b < 12 then

                    bullet.color = {254, 100, 4, 255}
                    bullet.txt = "#"
                    b = b + 1 * dt

                elseif c < 12 then

                    bullet.color = {254, 222, 23, 255}
                    bullet.txt = "*"
                    c = c + 1 * dt
                else

                    b = 0
                    c = 0

                end
            elseif player.bType == "firelser" then
                
                if b < 12 then

                    bullet.color = {254, 100, 4, 255}
                    bullet.txt = "#"
                    b = b + 1 * dt

                elseif c < 12 then

                    bullet.color = {254, 222, 23, 255}
                    bullet.txt = "*"
                    c = c + 1 * dt
                else

                    b = 0
                    c = 0

                end
            end
    end

    print("bullet created")

    return bullet

end

function bullets.draw()

    for k,v in ipairs(bullets) do

        love.graphics.setColor(love.math.colorFromBytes(bullets[k].color[1], bullets[k].color[2], bullets[k].color[3], bullets[k].color[4]))
        love.graphics.print(bullets[k].txt, bullets[k].x, bullets[k].y, bullets[k].r) -- print bullets every frame they are on screen
        love.graphics.setColor(1, 1, 1, 1)

    end

end

