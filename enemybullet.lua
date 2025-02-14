enemybullets = {} -- create the array of enemybullet objects


function createEnemyBullet(x, y, dir, speed) -- when called creates a enemybullet in a given location going at a given speed in a given direction

    local enemybullet = {}
    enemybullet.x = x
    enemybullet.y = y
    enemybullet.direction = dir
    enemybullet.active = true
    enemybullet.color = {255, 255, 255, 255}
    enemybullet.speed = 10
    enemybullet.damage = 0.5
    enemybullet.txt = "x"
    enemybullet.speed = speed or 5
    enemybullet.color = {255, 0, 0, 255}
    enemybullet.btTime = 0.02

    function enemybullet.update(dt)
        enemybullet.dir = radtodeg(math.atan2((enemybullet.y - player.y), (player.x - enemybullet.x)))
        enemybullet.y = enemybullet.y + lengthdir_y(enemybullet.speed * dt, dir)
        enemybullet.x = enemybullet.x + lengthdir_x(enemybullet.speed * dt, dir)

    end
    return enemybullet

end

local graphics = love.graphics
local math = love.math

function enemybullets.draw()

    for k,v in ipairs(enemybullets) do

        graphics.setColor(love.math.colorFromBytes(200, 25 , 33, 255))
        graphics.print(enemybullets[k].txt, enemybullets[k].x, enemybullets[k].y) -- print enemyenemybullets every frame they are on screen
        graphics.setColor(1, 1, 1, 1)

    end

end