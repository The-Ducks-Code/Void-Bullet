--[[
    
This handles all the player outside of the update and draw functions

]]--

-- player variables
player = {} -- create the player object
player.x =  gameWidth/2 - fonts.ui:getWidth("O") / 2 + 8 -- set the players x postition to about the middle of the screen
player.y =  gameHeight/2 + 21 -- set the players y postition to about the middle of the screen
player.w = 24
player.h = 20
player.totalHp = 3
player.hp = 3
player.score = 0
player.isAlive = true
player.abilities = {}
player.speed = 2
gameover = {}
player.bType = "normal"
player.round = 0
player.roundactive = true
player.color = {255, 255, 255, 255}
player.txt = '0'
player.bulletAmount = 1


local b = 0
local c = 0

damageTimer = 0 -- reset the damage timer
damagecooldown = false -- reset the damage cooldown

function player.update(dt)

    if player.hp <= 0 then

        player.isAlive = false

    end

    for k,v in ipairs(player.abilities) do

        -- Bullet types:
        if player.abilities[k] == "fireball" then -- fireball bullet

            player.bType = "fireball"

        elseif player.abilities[k] == "lasergun" then -- lasergun bullet

            player.bType = "lasergun"

        elseif player.abilities[k] == "firelser" then -- laser bullet

            player.bType = "firelser"

        end
    end

    function removeAbility(item)
        for k,v in ipairs(player.abilities) do
    
            -- Bullet types:
            if player.abilities[k] == item then -- fireball bullet
    
                table.remove(player.abilities, k)
    
            end
        end
    end

    if tableContains(player.abilities, "fireball") and tableContains(player.abilities, "lasergun") then
        print("firelser")
        removeAbility("fireball")
        removeAbility("lasergun")
        player.abilities[#player.abilities+1] = "firelser"

    end


    if #enemies == 0 and player.roundactive == true then

        player.round = player.round + 1
        player.roundactive = false
        if not player.round == 0 then
            print("ROUND COMPLETE")
        end
        print("ROUND " .. player.round)
        level.init("roundEnd")

    end

    function player.takeDamage(dmg, enemytype, enemydir)


        if not damagecooldown then
    
            player.hp = player.hp - dmg
            print("player took " .. dmg ..  " damage")
            print("player has " .. player.hp .. "hp left")
            player.color = {255, 100, 25, 155}
            damagecooldown = true
            player.y = player.y + lengthdir_y(10 * dt, enemydir)
            player.x = player.x + lengthdir_x(10 * dt, enemydir)
        end
    end

    function player.draw()
        love.graphics.setFont(fonts.entities)
        love.graphics.setColor(love.math.colorFromBytes(player.color[1], player.color[2], player.color[3], player.color[4]))
        love.graphics.print(player.txt, player.x, player.y - 10) -- print player every frame
        love.graphics.setColor(1, 1, 1, 1)

    end
end