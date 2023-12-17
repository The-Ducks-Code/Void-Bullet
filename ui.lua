ui = {}

function uiDraw()

    love.graphics.setColor(255, 255, 255, 55)

    love.graphics.print(strFPS .. ' FPS', 0, 0)

    love.graphics.print('SCORE: '.. player.score, 0, 15)

    if player.isAlive == false then

        drawRect(0, 0, 0, 155, "fill", 0, 37, gameWidth, gameHeight)
        love.graphics.print('GAME OVER', gameWidth/2 - fonts.ui:getWidth('GAME OVER') / 2.5, gameHeight/2 - 50, 0, gameWidth/600, gameHeight/600)
        love.graphics.print('MADE IT TO ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('MADE IT TO ROUND: ' .. player.round) / 2.5, gameHeight/2, 0, gameWidth/600, gameHeight/600)
        love.graphics.print('FINAL SCORE: ' .. player.score, gameWidth/2 - fonts.ui:getWidth('FINAL SCORE: ' .. player.score) / 2.5, gameHeight/2 + 50, 0, gameWidth/600, gameHeight/600)
            
    end

    if player.roundactive == false then

        love.graphics.setFont(fonts.ui)
        love.graphics.print('ROUND: ' .. player.round, gameWidth/2 - fonts.ui:getWidth('ROUND: ' .. player.round) / 1.5, 0, 0, gameWidth/600, gameHeight/600)
        love.graphics.setFont(fonts.entities)

    end
end