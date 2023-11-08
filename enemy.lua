--[[
    
This handles all of the enemy creation outside of the update and draw functions

]]--
enemies = {} -- create the array of enemy objects

function createEnemy(x, y, type, damage)

    local enemy = {}
    enemy.x = x
    enemy.y = y
    enemy.damage = damage
    enemy.active = true
    enemy.type = type
    enemy.dir = love.math.random(0, 360)
    enemy.i = 0
    enemy.ii = 0
    function enemy.update(dt)
        if enemy.i < 10 then
            if enemy.ii < 2.4 then
                enemy.y = enemy.y + lengthdir_y(enemy.speed * dt, enemy.dir)
                enemy.x = enemy.x + lengthdir_x(enemy.speed * dt, enemy.dir)
                enemy.ii = enemy.ii + dt
            end
            enemy.i = enemy.i + dt
            enemy.ii = 0
        elseif enemy.i < 15 then
            enemy.i = enemy.i + dt
        else
            enemy.dir = love.math.random(0, 360)
            enemy.i = 0
            
        end

    end

    if enemy.type == "normal" then
        enemy.txt = "E"
        enemy.speed = 5
    end
 
    print("enemy created")

    return enemy

end