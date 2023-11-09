
input = {}

function input.player()
    if love.keyboard.isDown("w") then
        player.y = player.y - 2 * deltatime
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 2 * deltatime
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - 2 * deltatime
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 2 * deltatime
    end

    if love.keyboard.isDown("up") then
        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 90)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("left") then
        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 180)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("right") then
        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 0)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
    if love.keyboard.isDown("down") then
        if not bulletcooldown then
            local bullet = createBullet(player.x, player.y, 10, 270)
            bullets[#bullets+1] = bullet
            bulletcooldown = true
        end
    end
end

function input.general()
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end