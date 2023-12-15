
input = {}

function input.player(dt)
    

    if love.keyboard.isDown('w') then
		player.y = player.y - player.speed * dt
    end
	if love.keyboard.isDown('s') then
		player.y = player.y + player.speed * dt
    end
	if love.keyboard.isDown('a') then
		player.x = player.x - player.speed * dt
    end
	if love.keyboard.isDown('d') then
		player.x = player.x + player.speed * dt
	end

    function playerFilter(item, other)
        if other.isEnemy then return 'cross'
        elseif other.isWall then return "slide"
        end
    end

        -- update the player associated bounding box in the world
        local newX, newY, cols, len = world:move(player, player.x, player.y, playerFilter)
        player.x, player.y = newX, newY
    

    if love.keyboard.isDown("up") then

        if not bulletcooldown then

            local bullet = createBullet(player.x, player.y - 3.5, 90)
            bullets[#bullets+1] = bullet
            bulletcooldown = true

        
        end

    end

    if love.keyboard.isDown("left") then

        if not bulletcooldown then

            local bullet = createBullet(player.x, player.y - 3.5, 180)
            bullets[#bullets+1] = bullet
            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("right") then

        if not bulletcooldown then

            local bullet = createBullet(player.x, player.y - 3.5, 0)
            bullets[#bullets+1] = bullet
            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("down") then

        if not bulletcooldown then

            local bullet = createBullet(player.x, player.y - 3.5, 270)
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