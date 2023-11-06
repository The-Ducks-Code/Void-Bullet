

function love.load()
    x = 0
    y = 0
    focus = " "
    focusTimer = 0
    focusTimerTrigger = false
    love.window.setTitle("roguelike")
 end



function love.update(dt)

    width, height = love.graphics.getDimensions()

    if love.keyboard.isDown("down") then
        y = y + 1
    end
    if love.keyboard.isDown("up") then
        y = y - 1
    end
    if love.keyboard.isDown("left") then
        x = x - 1
    end
    if love.keyboard.isDown("right") then
        x = x + 1
    end


    if x > width - 10 then
        x = width - 10
    end

    if x < 0 then
        x = 0
    end

    if y > height - 12 then
        y = height - 12
    end

    if y < 0 then
        y = 0
    end



    if focusTimerTrigger == true then
        focusTimer = focusTimer + dt

        if focusTimer > 0.4 then

            focusTimer = 0
            focusTimerTrigger = false
            focus = " "

        end
    end
    

end


function love.focus(f)
    if not f then
      focus = "LOST FOCUS"
      love.window.setTitle("roguelike (FOCUS LOST)")
    else
      focus = "GAINED FOCUS"
      love.window.setTitle("roguelike")
      focusTimerTrigger = true
    end
end

function love.draw()
    love.graphics.print('P', x, y)
    love.graphics.print(focus, width/2 - 50, height/2 - 50)
end

