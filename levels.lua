--[[
    
This handles all of level creation and other level related things

]]--


level = {}

function level.init(levelName)

    if levelName == "roundEnd" then
        items[#items+1] = createItem("speed up", 200, 200)
        items[#items+1] = createItem("fireball", 400, 200)
        items[#items+1] = createItem("lasergun", 600, 200)
    end

end

function roundStart()

    local i = 0
    while i < player.round * 10 do

        enemies[#enemies+1] = createEnemy(love.math.random(50, gameWidth - 40), love.math.random(50, gameHeight - 40), "normal", 40) -- create one enemy
        i = i + 1

    end
    player.roundactive = true

end

blocks = {}
function createBlock(x,y,w,h,fill)
    local block = {x=x,y=y,w=w,h=h, isWall = true}
    blocks[#blocks + 1] = block
    world:add(block, x,y,w,h)
    enemyWorld:add(block, x,y,w,h)
    block.fill = fill
end

function blocks.draw()
    for i=1, #blocks do
        local b = blocks[i]
        world:update(blocks[i], b.x, b.y, b.w, b.h)
        enemyWorld:update(blocks[i], b.x, b.y, b.w, b.h)
        love.graphics.rectangle(blocks[i].fill, b.x, b.y, b.w, b.h)
      end
end