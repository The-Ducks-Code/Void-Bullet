ui = {}

function uiDraw()

    love.graphics.setFont(fonts.score)
    love.graphics.setColor(255, 255, 255, 55)
    love.graphics.print(strFPS .. ' FPS', 0, 0, 0)
    love.graphics.print('Alpha v0.0.4', 100, 0, 0, 0.5, 0.5)
    love.graphics.print('SCORE:'.. player.score, 0, 15, 0)
    love.graphics.setFont(fonts.entities)

    if player.isAlive == false then
        -- game over screen
        drawRect(0, 0, 0, 155, "fill", 0, 37, gameWidth, gameHeight)
        love.graphics.print('GAME OVER', gameWidth/2 - fonts.ui:getWidth('GAME OVER') / 2.5, gameHeight/2 - 50, 0, gameWidth/600, gameHeight/600)
        love.graphics.print('MADE IT TO ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('MADE IT TO ROUND: ' .. player.round) / 2.5, gameHeight/2, 0, gameWidth/600, gameHeight/600)
        love.graphics.print('FINAL SCORE: ' .. player.score, gameWidth/2 - fonts.ui:getWidth('FINAL SCORE: ' .. player.score) / 2.5, gameHeight/2 + 50, 0, gameWidth/600, gameHeight/600)
        love.graphics.print('ESC TO QUIT', gameWidth/2 - fonts.ui:getWidth('ESC TO QUIT') / 2.5, gameHeight/2 + 100, 0, gameWidth/600, gameHeight/600)

    end

    if player.roundactive == false then

        love.graphics.setFont(fonts.ui)
        love.graphics.setColor(255, 255, 255, 55)
        love.graphics.print('ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('ROUND: ' .. player.round) / 2.5, 125, 0, gameWidth/1100, gameHeight/1100)
        love.graphics.setFont(fonts.entities)

    end

    -- Health Display
        love.graphics.setFont(fonts.ui)

        local i = 0
        local ioffset = 0
        local u = 0
        while i < player.totalHp do

            if u < player.hp then
                love.graphics.setColor(255, 0, 0, 255)
                love.graphics.print('♥', 205 + ioffset, -5, 0, gameWidth/1000, gameHeight/1000)
                u = u + 1
            else
                love.graphics.setColor(255, 255, 255, 255)
            end
            love.graphics.print('♥', 205 + ioffset, -5, 0, gameWidth/1000, gameHeight/1000)
            i = i + 1
            ioffset = ioffset + 35
        end
        i = 0
        u = 0
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.setFont(fonts.entities)


end