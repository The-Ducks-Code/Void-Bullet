



ui = {}



function uiDraw()

    drawRect(0, 0, 0, 155, "fill", 0, 0, 75, 30)

    drawRect(255, 255, 255, 255, "fill", 0, 37, window.width, 5)

    love.graphics.setColor(255, 255, 255, 55)

    love.graphics.print(strFPS .. ' FPS', 0, 0)

    love.graphics.print('SCORE: '.. player.score, 0, 15)

    if player.roundactive == false then

        love.graphics.setFont(fonts.ui)
        love.graphics.print('ROUND: ' .. player.round, window.width/2 - 100, 0, 0, window.width/600, window.height/600)
        love.graphics.setFont(fonts.entities)

    end

end