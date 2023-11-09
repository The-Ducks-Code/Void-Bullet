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
gameover = {}

damageTimer = 0 -- reset the damage timer
damagecooldown = false -- reset the damage cooldown

function player.update(dt)
    if player.hp <= 0 then
        player.isAlive = false
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