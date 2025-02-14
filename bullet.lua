--[[
    
This handles all of the bullet creation outside of the update and draw functions

]]--

bullets = {} -- create the array of bullet objects
bulletcooldown = true -- allow the player to shoot on the first frame
bulletTimer = 0 -- reset the bullet timer

function createBullet(x, y, dir) -- when called creates a bullet in a given location going at a given speed in a given direction

    playershoot:play()

    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.direction = dir
    bullet.active = true
    bullet.color = {255, 255, 255, 255}
    bullet.speed = 10
    bullet.piercei = player.pLvl
    bullet.lasthit = -1

    if player.bType == "normal" then

        bullet.damage = 0.5
        bullet.txt = "+"
        bullet.speed = 7
        bullet.color = {255, 255, 255, 255}
        btTime = 0.25

    elseif player.bType == "fireball" then

        bullet.damage = 1
        bullet.txt = "+"
        bullet.speed = 3
        btTime = 0.5
        
    elseif player.bType == "lasergun" then

        bullet.damage = 0.2
        bullet.txt = "#"
        bullet.speed = 7
        bullet.color = {255, 0, 0, 255}
        btTime = 0.1

    elseif player.bType == "firelser" then

        bullet.damage = 0.7
        bullet.txt = "#"
        bullet.speed = 6
        bullet.color = {255, 0, 0, 255}
        btTime = 0.3

    elseif player.bType == "railgun" then

        bullet.damage = 1.2
        bullet.txt = shotdir
        bullet.speed = 8
        bullet.color = {255, 25, 25, 255}
        btTime = 0.8

    elseif player.bType == "srailgun" then

        bullet.damage = 2.4
        bullet.txt = "█"
        bullet.speed = 9
        bullet.color = {255, 0, 100, 255}
        btTime = 0.9

    end

    

    local b = 0
    local c = 0
    local i = 0
    local lengthdir_y = lengthdir_y
    local lengthdir_x = lengthdir_x
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
            elseif player.bType == "railgun" then

                if shotdir == "up" or shotdir == "down" then
                    bullet.txt = "Ӏ"
                elseif shotdir == "left" or shotdir == "right" then
                    bullet.txt = "—"
                end

            end

            if player.telknsis == true then
                bullet.color[1] = 100
                bullet.color[3] = 200
                bullet.color[4] = 200

                if #enemies > 0 then
                    local initialdiff = 1000000000000
                    local selectedkey = -1
                    local abs = math.abs
                    local atan2 = math.atan2
                    local sqrt = math.sqrt
                    if i > 8 and bullet.active == true then
                        for key, val in ipairs (enemies) do
                            if abs(sqrt((bullet.x - enemies[key].x)^2 + (bullet.y - enemies[key].y)^2)) < 200 then
                                local currentdiff = abs(sqrt((bullet.x - enemies[key].x)^2 + (bullet.y - enemies[key].y)^2))
                                if (currentdiff < initialdiff) then
                                    initialdiff = currentdiff
                                    selectedkey = key
                                    dir = -radtodeg(atan2((enemies[selectedkey].y - bullet.y), (enemies[selectedkey].x - bullet.x)))

                                end
                            end
                            i = 0
                        end
                    else
                        i = i + 1
                    end

                end
                if #bosses > 0 then
                    local initialdiff = 1000000000000
                    local selectedkey = -1
                    local abs = math.abs
                    local atan2 = math.atan2
                    local sqrt = math.sqrt
                    if i > 8 and bullet.active == true then
                        for key, val in ipairs (bosses) do
                            if abs(sqrt((bullet.x - bosses[key].x)^2 + (bullet.y - bosses[key].y)^2)) < 200 then
                                local currentdiff = abs(sqrt((bullet.x - bosses[key].x)^2 + (bullet.y - bosses[key].y)^2))
                                if (currentdiff < initialdiff) then
                                    initialdiff = currentdiff
                                    selectedkey = key
                                    dir = -radtodeg(atan2((bosses[selectedkey].y - bullet.y), (bosses[selectedkey].x - bullet.x)))

                                end
                            end
                            i = 0
                        end
                    else
                        i = i + 1
                    end

                end
            end
    end

    print("bullet created")

    return bullet

end
local graphics = love.graphics
local math = love.math
function bullets.draw()

    for k,v in ipairs(bullets) do
        graphics.setColor(math.colorFromBytes(bullets[k].color[1], bullets[k].color[2], bullets[k].color[3], bullets[k].color[4]))
        graphics.print(bullets[k].txt, bullets[k].x, bullets[k].y, bullets[k].r) -- print bullets every frame they are on screen
        graphics.setColor(1, 1, 1, 1)

    end

end

