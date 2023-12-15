--[[
    
This handles all the player outside of the update and draw functions

]]--

-- player variables
player = {} -- create the player object
player.x =  window.width/2 -- set the players x postition to about the middle of the screen
player.y =  window.height/2 -- set the players y postition to about the middle of the screen
player.w = 15
player.h = 11.5
player.hp = 100
player.score = 0
player.isAlive = true
player.abilities = {}
player.speed = 2
gameover = {}
player.bType = "normal"
player.round = 0
player.roundactive = true

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

        elseif player.abilities[k] == "laser" then -- laser bullet

            player.bType = "laser"

        elseif player.abilities[k] == "firelaser" then -- laser bullet

            player.bType = "firelaser"

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

    if tableContains(player.abilities, "fireball") and tableContains(player.abilities, "laser") then
        print("firelaser")
        removeAbility("fireball")
        removeAbility("laser")
        player.abilities[#player.abilities+1] = "firelaser"

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
end

function player.draw()

    love.graphics.print('0', player.x, player.y - 3.5) -- print player every frame

end


