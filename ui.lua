local graphics = love.graphics

ui = {}
bossdir = ""
function uiDraw()

    graphics.setFont(fonts.score)
    drawRect(0, 0, 0, 255, "fill", 0, 0, gameWidth, 32)
    graphics.setColor(255, 255, 255, 255)
    graphics.print(strFPS .. ' FPS', 0, 3, 0, 0.55, 0.55)
    graphics.print('v0.1.4', 67, 3, 0, 0.55, 0.55)
    graphics.print('SCORE:'.. player.score, 0, 15, 0, 0.75, 0.75)
    graphics.setColor(255, 235, 0, 255)
    graphics.print('$:'.. player.coins, 125, 0, 0, 0.75, 0.75)
    graphics.setColor(255, 255, 255, 255)
    graphics.setFont(fonts.entities)
    
    bossbars.draw()

    if player.isAlive == false then
        -- game over screen
        drawRect(0, 0, 0, 155, "fill", 0, 37, gameWidth, gameHeight)
        graphics.print('GAME OVER', gameWidth/2 - fonts.ui:getWidth('GAME OVER') / 2.5, gameHeight/2 - 50, 0, gameWidth/600, gameHeight/600)
        graphics.print('MADE IT TO ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('MADE IT TO ROUND: ' .. player.round) / 2.5, gameHeight/2, 0, gameWidth/600, gameHeight/600)
        graphics.print('FINAL SCORE: ' .. player.score, gameWidth/2 - fonts.ui:getWidth('FINAL SCORE: ' .. player.score) / 2.5, gameHeight/2 + 50, 0, gameWidth/600, gameHeight/600)
        graphics.print('R TO RESTART', gameWidth/2 - fonts.ui:getWidth('ESC TO QUIT') / 2.5, gameHeight/2 + 100, 0, gameWidth/600, gameHeight/600)
        graphics.print('ESC TO QUIT', gameWidth/2 - fonts.ui:getWidth('ESC TO QUIT') / 2.5, gameHeight/2 + 150, 0, gameWidth/600, gameHeight/600)

    end

    if player.roundactive == false then

        graphics.setFont(fonts.ui)
        graphics.setColor(255, 255, 255, 55)
        graphics.print('ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('ROUND: ' .. player.round) / 2.5, 125, 0, gameWidth/1100, gameHeight/1100)
        graphics.setFont(fonts.entities)

    end

    -- Health Display
        graphics.setFont(fonts.ui)

        local i = 0
        local ioffset = 0
        local u = 0
        while i < player.totalHp do

            if u < player.hp then
                graphics.setColor(255, 0, 0, 255)
                graphics.print('♥', 205 + ioffset, -8, 0, gameWidth/1000, gameHeight/1000)
                u = u + 1
            else
                graphics.setColor(255, 255, 255, 255)
            end
            graphics.print('♥', 205 + ioffset, -8, 0, gameWidth/1000, gameHeight/1000)
            i = i + 1
            ioffset = ioffset + 35
        end
        i = 0
        u = 0
        graphics.setColor(255, 255, 255, 255)
        graphics.setFont(fonts.entities)

        
end