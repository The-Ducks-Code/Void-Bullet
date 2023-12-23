--[[
    
This handles all of the boss creation outside of the update and draw functions

]]--

bosses = {} -- create the array of boss objects
bosses.isEnemy = true

function createBoss(x, y, type)

    local boss = {}
    boss.isboss = true
    boss.x = x
    boss.y = y
    boss.active = true
    boss.type = type
    boss.dir = 90
    boss.w = 2
    boss.h = 2
    boss.txt = "Ω"
    boss.speed = 1
    boss.pts = 300   
    boss.hp = 1000
    boss.color = {150, 15, 175, 255}
    enemyWorld:add(boss, boss.x, boss.y, 30 * boss.w, 30 * boss.h)
    boss.d = 1 -- which attack

    boss.o = 0 -- burst cooldown
    boss.i = 0 -- timer between each attack
    boss.dash = 0 -- dash cooldown
    function boss.update(dt)

            -- moves
            boss.color = {150, 15, 175, 255}

            
                if boss.i > 200 then
                    boss.d = math.random(1, 4)
                    boss.i = 0
                end
                boss.i = boss.i + dt

            
            boss.dir = radtodeg(math.atan2((boss.y - player.y ), (player.x - boss.x)))

            if boss.d == 1 then -- move towards player
                boss.y = boss.y + lengthdir_y(boss.speed * dt, boss.dir)
                boss.x = boss.x + lengthdir_x(boss.speed * dt, boss.dir)
                if boss.active == true then 
                    local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                    boss.x, boss.y = newX, newY
                end
            elseif boss.d == 2 then -- laser
                local enemybullet = createEnemyBullet(boss.x + 10, boss.y, boss.dir)
                enemybullets[#enemybullets+1] = enemybullet
            elseif boss.d == 3 then -- wall burst attack
                    if boss.o > 30 then
                        local enemybullet = createEnemyBullet(boss.x - 10, boss.y, boss.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x, boss.y, boss.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 10, boss.y, boss.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 20, boss.y, boss.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        local enemybullet = createEnemyBullet(boss.x + 30, boss.y, boss.dir)
                        enemybullets[#enemybullets+1] = enemybullet
                        boss.o = 0
                    else
                        boss.o = boss.o + dt
                    end

            elseif boss.d == 4 then -- dash towards player
                print("dash")
                    boss.y = boss.y + lengthdir_y(boss.speed * 3 * dt, boss.dir)
                    boss.x = boss.x + lengthdir_x(boss.speed * 3 * dt, boss.dir)
                    if boss.active == true then 
                        if boss.dash > 200 then
                        local newX, newY, cols, len = enemyWorld:move(boss, boss.x, boss.y)
                        boss.x, boss.y = newX, newY 
                        boss.dash = 0
                        else
                            boss.dash = boss.dash + dt
                        end
                    end
            end

        
    end
 
    print("boss created")

    return boss

end


function bosses.draw()

    for k,v in ipairs(bosses) do
        love.graphics.setColor(love.math.colorFromBytes(bosses[k].color[1], bosses[k].color[2], bosses[k].color[3], bosses[k].color[4]))
        love.graphics.print(bosses[k].txt, bosses[k].x, bosses[k].y, 0, bosses[k].w, bosses[k].h) -- print bosses every frame they are on screen
        love.graphics.setColor(255, 255, 255, 255)
    end

end