--[[
    
This handles all of the enemy creation outside of the update and draw functions

]]--

enemies = {} -- create the array of enemy objects
enemies.isEnemy = true

function createEnemy(x, y, type, damage)

    local enemy = {}
    enemy.isEnemy = true
    enemy.x = x
    enemy.y = y
    enemy.damage = damage
    enemy.active = true
    enemy.type = type
    enemy.dir = 90
    enemy.w = 30
    enemy.h = 34
    enemy.o = 0
    enemy.hitlist = {"itemsoitdoesntbreakhopefullylol"}
    enemy.color = {255, 255, 255, 255}
    enemyWorld:add(enemy, enemy.x, enemy.y, enemy.w, enemy.h)

    function enemy.update(dt)

        enemy.dir = radtodeg(math.atan2((enemy.y - player.y), (player.x - enemy.x)))

        enemy.y = enemy.y + lengthdir_y(enemy.speed * dt, enemy.dir)
        enemy.x = enemy.x + lengthdir_x(enemy.speed * dt, enemy.dir)
        if enemy.active == true then
            local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)

            if newX > 4 and newX < gameWidth - 5 and newY > 40 and newY < gameHeight - 5 then
                enemy.x, enemy.y = newX, newY
            else
                enemy.active = false
            end

            if enemy.type == "gunner" then
                if enemy.o > 75 then
                    local enemybullet = createEnemyBullet(enemy.x, enemy.y, 90 * math.random(0, 4))
                    enemybullets[#enemybullets+1] = enemybullet
                    enemy.o = 0
                else
                    enemy.o = enemy.o + dt
                end
            end

            if enemy.type == "mirrorer" then
                if player.isShooting then
                    if enemy.o > 1 then
                        enemy.o = 0
                    else
                        local enemybullet = createEnemyBullet(enemy.x, enemy.y, enemy.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        enemy.o = enemy.o + dt
                    end
                end
                
            end
        end
    end

    if enemy.type == "normal" then

        enemy.txt = "E"
        enemy.speed = 1
        enemy.hp = 2
        enemy.pts = 100

    elseif enemy.type == "fast" then

        enemy.txt = "F"
        enemy.speed = 2
        enemy.hp = 1
        enemy.pts = 150
    
    elseif enemy.type == "heavy" then

        enemy.txt = "H"
        enemy.speed = 0.5
        enemy.hp = 4
        enemy.pts = 200
    
    elseif enemy.type == "gunner" then

        enemy.txt = "G"
        enemy.speed = 0.8
        enemy.hp = 1
        enemy.pts = 250
    
    elseif enemy.type == "mirrorer" then

        enemy.txt = "M"
        enemy.speed = 0.7
        enemy.hp = 2
        enemy.pts = 250
    
    end
 
    print("enemy created")

    return enemy

end

function enemies.draw()


    for k,v in ipairs(enemies) do
        love.graphics.setColor(love.math.colorFromBytes(enemies[k].color[1], enemies[k].color[2], enemies[k].color[3], enemies[k].color[4]))
        love.graphics.print(enemies[k].txt, enemies[k].x, enemies[k].y) -- print enemies every frame they are on screen
        love.graphics.setColor(255, 255, 255, 255)
    end

    

end

