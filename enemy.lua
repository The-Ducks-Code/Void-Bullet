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
    enemy.randir = math.random(0, 360)
    enemy.w = 30
    enemy.h = 34
    enemy.o = 0
    enemy.t = 0
    enemy.i = 0
    enemy.dash = 0
    enemy.d = math.random(1, 5)
    enemy.hitlist = {"itemsoitdoesntbreakhopefullylol"}
    enemy.color = {255, 255, 255, 255}
    enemyWorld:add(enemy, enemy.x, enemy.y, enemy.w, enemy.h)

    function enemy.update(dt)

        if enemy.active == true then

            

            if enemy.type == "normal" or enemy.type == "gunner" or enemy.type == "heavy" or enemy.type == "fast" or enemy.type == "mirrorer" then
                
                enemy.dir = radtodeg(math.atan2((enemy.y - player.y), (player.x - enemy.x)))

                enemy.y = enemy.y + lengthdir_y(enemy.speed * dt, enemy.dir)
                enemy.x = enemy.x + lengthdir_x(enemy.speed * dt, enemy.dir)
                local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                if newX > 4 and newX < gameWidth - 5 and newY > 40 and newY < gameHeight - 5 then
                    enemy.x, enemy.y = newX, newY
                else
                    enemy.active = false
                end
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

            if enemy.type == "alpha" then
                -- moves
                enemy.dir = radtodeg(math.atan2((enemy.y - player.y), (player.x - enemy.x)))

                if enemy.i > 200 then
                    enemy.d = math.random(1, 5)
                    enemy.i = 0
                end
                enemy.i = enemy.i + dt
                enemy.color = {150, 15, 175, 255}
                    
                if enemy.d == 1 then -- move towards player
                    enemy.y = enemy.y + lengthdir_y(enemy.speed * dt, enemy.dir)
                    enemy.x = enemy.x + lengthdir_x(enemy.speed * dt, enemy.dir)
                    if enemy.active == true then 
                        local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                        enemy.x, enemy.y = newX, newY
                    end
                elseif enemy.d == 2 then -- laser
                    enemy.r = 0
                    local enemybullet = createEnemyBullet(enemy.x, enemy.y, enemy.dir - math.random(-10, 10))
                    enemybullets[#enemybullets+1] = enemybullet
                elseif enemy.d == 3 then -- wall burst attack
                    enemy.r = 0
                    if enemy.o > 30 then
                        local enemybullet = createEnemyBullet(enemy.x + 13, enemy.y, enemy.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(enemy.x + 23, enemy.y, enemy.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(enemy.x + 33, enemy.y, enemy.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        enemy.o = 0
                    else
                        enemy.o = enemy.o + dt
                    end
    
                elseif enemy.d == 4 then -- dash towards player
                    enemy.r = 0
                    enemy.y = enemy.y + lengthdir_y(enemy.speed * 1.7 * dt, enemy.dir)
                    enemy.x = enemy.x + lengthdir_x(enemy.speed * 1.7 * dt, enemy.dir)
                    if enemy.active == true then 
                        if enemy.dash > 200 then
                        local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                        enemy.x, enemy.y = newX, newY 
                        enemy.dash = 0
                        else
                            enemy.dash = enemy.dash + dt
                        end
                    end
                    elseif enemy.d == 5 then -- 4 way burst attack
                        enemy.r = 0
                        if enemy.t > 30 then
                            local enemybullet = createEnemyBullet(enemy.x, enemy.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(enemy.x , enemy.y- 10, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(enemy.x, enemy.y, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(enemy.x, enemy.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            enemy.t = 0
                        else
                            enemy.t = enemy.t + dt
                        end
                    end
                end
                if enemy.type == "phi" then
                    -- moves
                    enemy.dir = radtodeg(math.atan2((enemy.y - player.y), (player.x - enemy.x)))
                    
                    if enemy.i > 200 then
                        enemy.d = math.random(1, 5)
                        enemy.i = 0
                    end
                    enemy.i = enemy.i + dt
                    enemy.color = {150, 165, 75, 255}
                            
                    if enemy.d == 1 then -- move towards player
                        enemy.y = enemy.y + lengthdir_y(enemy.speed * dt, enemy.dir)
                        enemy.x = enemy.x + lengthdir_x(enemy.speed * dt, enemy.dir)
                        if enemy.active == true then 
                            local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                            enemy.x, enemy.y = newX, newY
                        end
                    elseif enemy.d == 2 then -- random bullets
                        enemy.r = 0
                        if enemy.dash > 2 then
                            local enemybullet = createEnemyBullet(enemy.x + 13, enemy.y + 16, enemy.dir - math.random(0, 360))
                            enemybullets[#enemybullets+1] = enemybullet                        
                            enemy.dash = 0
                        else
                            enemy.dash = enemy.dash + dt
                        end
                    elseif enemy.d == 3 then -- move in a random direction
                        enemy.r = 0
                        enemy.y = enemy.y + lengthdir_y(enemy.speed * 5 * dt, enemy.randir)
                        enemy.x = enemy.x + lengthdir_x(enemy.speed * 5 * dt, enemy.randir)
                        if enemy.active == true then 
                            local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                            enemy.x, enemy.y = newX, newY
                        end
                        if enemy.dash > 60 then
                            enemy.randir = math.random(0, 360)
                            enemy.dash = 0
                        else
                            enemy.dash = enemy.dash + dt
                        end
                    elseif enemy.d == 4 then -- dash towards player
                        enemy.r = 0
                        enemy.y = enemy.y + lengthdir_y(enemy.speed * 2.7 * dt, enemy.dir)
                        enemy.x = enemy.x + lengthdir_x(enemy.speed * 2.7 * dt, enemy.dir)
                        if enemy.active == true then 
                            if enemy.dash > 200 then
                            local newX, newY, cols, len = enemyWorld:move(enemy, enemy.x, enemy.y)
                            enemy.x, enemy.y = newX, newY 
                            enemy.dash = 0
                            else
                                enemy.dash = enemy.dash + dt
                            end
                        end
                        elseif enemy.d == 5 then -- 4 way burst attack
                            enemy.r = 0
                            if enemy.t > 30 then
                                local enemybullet = createEnemyBullet(enemy.x, enemy.y, 90)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(enemy.x , enemy.y- 10, 180)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(enemy.x, enemy.y, 0)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(enemy.x, enemy.y, 270)
                                enemybullets[#enemybullets+1] = enemybullet
                                enemy.t = 0
                            else
                                enemy.t = enemy.t + dt
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
    
    elseif enemy.type == "alpha" then

        enemy.txt = "α"
        enemy.speed = 0.4
        enemy.hp = 7
        enemy.pts = 400
    
    elseif enemy.type == "phi" then

        enemy.txt = "φ"
        enemy.speed = 0.7
        enemy.hp = 4
        enemy.pts = 400
    
    end
 
    print("enemy created")

    return enemy

end

local graphics = love.graphics
local math = love.math

function enemies.draw()

    for k,v in ipairs(enemies) do
        graphics.setColor(math.colorFromBytes(enemies[k].color[1], enemies[k].color[2], enemies[k].color[3], enemies[k].color[4]))
        graphics.print(enemies[k].txt, enemies[k].x, enemies[k].y) -- print enemies every frame they are on screen
        graphics.setColor(255, 255, 255, 255)
    end

end

