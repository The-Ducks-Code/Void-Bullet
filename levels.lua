--[[
    
This handles all of level creation and other level related things

]]--


level = {}

function level.init(levelName)

    if levelName == "roundEnd" then
        items[#items+1] = createItem("speed", 200, 200)
        items[#items+1] = createItem("fireball", 400, 200)
        items[#items+1] = createItem("laser", 600, 200)
    end

end

function roundStart()

    local i = 0
    while i < player.round * 10 do

        enemies[#enemies+1] = createEnemy(love.math.random(10, window.width - 10), love.math.random(10, window.height + 10), "normal", 40) -- create one enemy
        i = i + 1

    end
    player.roundactive = true

end