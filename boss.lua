--[[
    
This handles all of the boss creation outside of the update and draw functions

]]--

bosses = {} -- create the array of boss objects
bosses.isEnemy = true
bossbars = {}

function createBoss(x, y, type)

    local boss = {}
    boss.isboss = true
    boss.x = x
    boss.y = y
    boss.active = true
    boss.type = type
    boss.dir = 90
    boss.randir = 0
    boss.d = 1 -- which attack
    boss.r = 0
    boss.br = 0

    boss.o = 0 -- burst cooldown
    boss.i = 0 -- timer between each attack
    boss.dash = 0 -- dash cooldown
    boss.t = 0 -- timer 4 way attack cooldown

    
    if boss.type == "alpha" then
        boss.w = 2
        boss.h = 2
        boss.txt = "α"
        boss.speed = 0.75
        boss.pts = 30000
        boss.hp = 150
        boss.color = {150, 15, 175, 255}
    end

    if boss.type == "phi" then
        boss.w = 2
        boss.h = 2
        boss.txt = "φ"
        boss.speed = 0.9
        boss.pts = 50000
        boss.hp = 200
        boss.color = {150, 165, 75, 255}
    end

    if boss.type == "xi" then
        boss.w = 2
        boss.h = 2
        boss.txt = "Ξ"
        boss.speed = 0.5
        boss.pts = 70000
        boss.hp = 450
        boss.color = {15, 30, 165, 255}
    end




    enemyWorld:add(boss, boss.x, boss.y, 30 * boss.w, 30 * boss.h)

    local bossbar = createBossbar(boss)
    bossbars[#bossbars+1] = bossbar

    function boss.update(dt)
        

        if boss.type == "alpha" then
            -- moves
            
            if boss.i > 200 then
                boss.d = math.random(1, 5)
                boss.i = 0
            end
            boss.i = boss.i + dt
            boss.color = {150, 15, 175, 255}
            
            boss.dir = radtodeg(math.atan2((boss.y - player.y + 13), (player.x - boss.x - 13)))

            if boss.d == 1 then -- move towards player
                boss.y = boss.y + lengthdir_y(boss.speed * dt, boss.dir)
                boss.x = boss.x + lengthdir_x(boss.speed * dt, boss.dir)
                if boss.active == true then 
                    local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                    boss.x, boss.y = newX, newY
                end
            elseif boss.d == 2 then -- laser
                boss.r = 0
                local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, boss.dir - math.random(-10, 10))
                enemybullets[#enemybullets+1] = enemybullet
            elseif boss.d == 3 then -- wall burst attack
                boss.r = 0
                if boss.o > 30 then
                    local enemybullet = createEnemyBullet(boss.x , boss.y, boss.dir)
                    enemybullets[#enemybullets+1] = enemybullet
                    local enemybullet = createEnemyBullet(boss.x + 13, boss.y, boss.dir)
                    enemybullets[#enemybullets+1] = enemybullet
                    local enemybullet = createEnemyBullet(boss.x + 23, boss.y, boss.dir)
                    enemybullets[#enemybullets+1] = enemybullet
                    local enemybullet = createEnemyBullet(boss.x + 33, boss.y, boss.dir)
                    enemybullets[#enemybullets+1] = enemybullet
                    local enemybullet = createEnemyBullet(boss.x + 44, boss.y, boss.dir)
                    enemybullets[#enemybullets+1] = enemybullet
                    boss.o = 0
                else
                    boss.o = boss.o + dt
                end

            elseif boss.d == 4 then -- dash towards player
                boss.r = 0
                boss.y = boss.y + lengthdir_y(boss.speed * 1.7 * dt, boss.dir)
                boss.x = boss.x + lengthdir_x(boss.speed * 1.7 * dt, boss.dir)
                if boss.active == true then 
                    if boss.dash > 200 then
                    local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                    boss.x, boss.y = newX, newY 
                    boss.dash = 0
                    else
                        boss.dash = boss.dash + dt
                    end
                end
                elseif boss.d == 5 then -- 4 way burst attack
                    boss.r = 0
                    if boss.t > 30 then
                        local enemybullet = createEnemyBullet(boss.x, boss.y, 90)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 90)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 20, boss.y, 90)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 90)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 90)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x , boss.y- 10, 180)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 180)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y + 10, 180)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 20, 180)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 30, 180)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y- 10, 0)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 0)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 10, 0)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 20, 0)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 30, 0)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x, boss.y, 270)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 270)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 20, boss.y, 270)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 270)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 40, boss.y, 270)
                        enemybullets[#enemybullets+1] = enemybullet
                        boss.t = 0
                    else
                        boss.t = boss.t + dt
                    end
                end
            elseif boss.type == "phi" then
                -- moves
                
                if boss.i > 200 then
                    boss.d = math.random(1, 5)
                    boss.i = 0
                end
                boss.i = boss.i + dt
                boss.color = {150, 165, 75, 255}
                
                boss.dir = radtodeg(math.atan2((boss.y - player.y + 13), (player.x - boss.x - 13)))
    
                if boss.d == 1 then -- move towards player
                    boss.y = boss.y + lengthdir_y(boss.speed * dt, boss.dir)
                    boss.x = boss.x + lengthdir_x(boss.speed * dt, boss.dir)
                    if boss.active == true then 
                        local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                        boss.x, boss.y = newX, newY
                    end
                elseif boss.d == 2 then -- random bullets
                    boss.r = 0
                    if boss.dash > 2 then
                        local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, boss.dir - math.random(0, 360))
                        enemybullets[#enemybullets+1] = enemybullet                        
                        boss.dash = 0
                    else
                        boss.dash = boss.dash + dt
                    end
                elseif boss.d == 3 then -- move in a random direction
                    boss.r = 0
                    boss.y = boss.y + lengthdir_y(boss.speed * 5 * dt, boss.randir)
                    boss.x = boss.x + lengthdir_x(boss.speed * 5 * dt, boss.randir)
                    if boss.active == true then 
                        local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                        boss.x, boss.y = newX, newY
                    end
                    if boss.dash > 60 then
                        boss.randir = math.random(0, 360)
                        boss.dash = 0
                    else
                        boss.dash = boss.dash + dt
                    end
                elseif boss.d == 4 then -- dash towards player
                    boss.r = 0
                    boss.y = boss.y + lengthdir_y(boss.speed * 2.7 * dt, boss.dir)
                    boss.x = boss.x + lengthdir_x(boss.speed * 2.7 * dt, boss.dir)
                    if boss.active == true then 
                        if boss.dash > 200 then
                        local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                        boss.x, boss.y = newX, newY 
                        boss.dash = 0
                        else
                            boss.dash = boss.dash + dt
                        end
                    end
                    elseif boss.d == 5 then -- 4 way burst attack
                        boss.r = 0
                        if boss.t > 30 then
                            local enemybullet = createEnemyBullet(boss.x, boss.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 20, boss.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x , boss.y- 10, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y + 10, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 20, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 30, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y- 10, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 10, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 20, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y+ 30, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x, boss.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 10, boss.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 20, boss.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 30, boss.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 40, boss.y, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            boss.t = 0
                        else
                            boss.t = boss.t + dt
                        end
                    end
                elseif boss.type == "xi" then
                    -- moves
                    
                    if boss.i > 200 then
                        boss.d = math.random(1, 5)
                        boss.i = 0
                    end
                    boss.i = boss.i + dt
                    boss.color = {15, 30, 165, 255}
                    
                    boss.dir = radtodeg(math.atan2((boss.y - player.y + 13), (player.x - boss.x - 13)))
                    
                    if boss.d == 1 then -- move towards player
                        boss.y = boss.y + lengthdir_y(boss.speed * dt, boss.dir)
                        boss.x = boss.x + lengthdir_x(boss.speed * dt, boss.dir)
                        if boss.active == true then 
                            local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                            boss.x, boss.y = newX, newY
                        end
                    elseif boss.d == 2 then -- cross pattern and moving
                        boss.r = 0
                        boss.y = boss.y + lengthdir_y(boss.speed * 5 * dt, boss.randir)
                        boss.x = boss.x + lengthdir_x(boss.speed * 5 * dt, boss.randir)
                        if boss.dash > 2 then
                            local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, 0)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 13, boss.y + 16, 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            boss.dash = 0
                            boss.randir = math.random(0, 360)
                        else
                            boss.dash = boss.dash + dt
                        end
                    elseif boss.d == 3 then -- move in a random direction
                        boss.r = 0
                        boss.y = boss.y + lengthdir_y(boss.speed * 5 * dt, boss.randir)
                        boss.x = boss.x + lengthdir_x(boss.speed * 5 * dt, boss.randir)
                        if boss.active == true then 
                            local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                            boss.x, boss.y = newX, newY
                        end
                        if boss.dash > 60 then
                            boss.randir = math.random(0, 360)
                            boss.dash = 0
                            boss.t = 0
                        else
                            boss.dash = boss.dash + dt
                        end
                    elseif boss.d == 4 then -- circular attack
                        boss.r = 0
                        boss.br = boss.br + 2
                        if boss.t > 5 then
                            local enemybullet = createEnemyBullet(boss.x + 15, boss.y, boss.br)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 15, boss.y, boss.br + 90)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 15, boss.y, boss.br + 180)
                            enemybullets[#enemybullets+1] = enemybullet
                            local enemybullet = createEnemyBullet(boss.x + 15, boss.y, boss.br + 270)
                            enemybullets[#enemybullets+1] = enemybullet
                            boss.t = 0
                        else
                            boss.t = boss.t + dt
                        end
                    elseif boss.d == 5 then -- wave attack
                        boss.r = 0
                        if boss.t > 30 then
                            if (boss.dir < 135 and boss.dir > 45) or (boss.dir > -135 and boss.dir < -45) then
                                local enemybullet = createEnemyBullet(boss.x + 15, boss.y, boss.dir, 3)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x + 30, boss.y, boss.dir, 3)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x + 45, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet                                
                                local enemybullet = createEnemyBullet(boss.x + 60, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x - 15, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x - 30, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x - 45, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x - 60, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                            elseif (boss.dir > 135 and boss.dir < 180) or (boss.dir < -135 and boss.dir > -180) or (boss.dir < 45 and boss.dir > -45) then
                                local enemybullet = createEnemyBullet(boss.x, boss.y + 15, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y + 30, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y + 45, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y + 60, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y - 15, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y - 30, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y - 45, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                                local enemybullet = createEnemyBullet(boss.x, boss.y - 60, boss.dir, 4)
                                enemybullets[#enemybullets+1] = enemybullet
                            end
                            boss.t = 0
                        else
                            boss.t = boss.t + dt
                        end
                    end
                end
        
    end
 
    print("boss created - " .. boss.type)

    return boss

end



function createBossbar(boss)
    
    local bossbar = {}
    bossbar.txt = boss.txt
    bossbar.color = {boss.color[1],boss.color[2],boss.color[3],boss.color[4]}
    bossbar.proportion = boss.hp
    bossbar.active = true
    bossbar.health = 1

    function bossbar.update(dt)

        bossbar.health = boss.hp/bossbar.proportion

        if boss.hp <= 0 then bossbar.active = false end

        if player.x > 80 and player.x < 720 and player.y > 730 then
            bossbar.color[4] = 100
        elseif boss.x > 80 and boss.x < 720 and boss.y > 730 then
            bossbar.color[4] = 100
        else  
            bossbar.color[4] = 255
        end

    end
    function bossbar.bosshit()
        bossbarhitanims[#bossbarhitanims+1] = bossbarHit(135 + (boss.hp/bossbar.proportion * 530), 755 + math.random( -5, 5))
    end
    return bossbar
end

local graphics = love.graphics
local math = love.math
function bossbars.draw()

    for k,v in ipairs(bossbars) do
        if bossbars[k].active == true then
            graphics.setColor(255, 255, 255, bossbars[k].color[4])
            graphics.rectangle("line", 100, 750, 600, 40)
            graphics.setColor(math.colorFromBytes(bossbars[k].color[1], bossbars[k].color[2], bossbars[k].color[3], bossbars[k].color[4]))
            graphics.print(bossbars[k].txt, 105, 740, 0, 1.5, 1.5) -- print bosses every frame they are on screen
            graphics.rectangle("fill", 150, 755, bossbars[k].health * 530, 30)
            graphics.setColor(255, 255, 255, 255)
        end
    end

end


function bosses.draw()

    for k,v in ipairs(bosses) do
        graphics.setColor(math.colorFromBytes(bosses[k].color[1], bosses[k].color[2], bosses[k].color[3], bosses[k].color[4]))
        graphics.print(bosses[k].txt, bosses[k].x, bosses[k].y, bosses[k].r, bosses[k].w, bosses[k].h) -- print bosses every frame they are on screen
        graphics.setColor(255, 255, 255, 255)
    end

end