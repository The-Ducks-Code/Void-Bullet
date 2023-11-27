--[[
    
This handles all the player outside of the update and draw functions

]]--

-- player variables
player = {} -- create the player object
player.x =  window.width/2 -- set the players x postition to about the middle of the screen
player.y =  window.height/2 -- set the players y postition to about the middle of the screen
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

        end
        
        -- Player upgrades:
        if player.abilities[k] == "speed" then

            player.speed = 3

        end
    end

    if #enemies == 0 and player.roundactive == true then

        player.round = player.round + 1
        player.roundactive = false
        print("ROUND COMPLETE")
        print("ROUND " .. player.round)
        level.init("roundEnd")

    end
end

function player.draw()

    love.graphics.print('O', player.x, player.y) -- print player every frame

end

function gameover.draw()

    if player.isAlive == false then

        love.graphics.print('GAME OVER', window.width/2 - 40, window.height/2 - 10, 0, window.width/600, window.height/600)
        love.graphics.print('FINAL SCORE: ' .. player.score, window.width/2 - 40, window.height/2 + 40, 0, window.width/600, window.height/600)
        
    end
end 