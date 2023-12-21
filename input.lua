
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
            
            if player.bulletAmount == 1 then
                
                local bullet = createBullet(player.x, player.y - 18, 90)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                
                local bullet = createBullet(player.x - 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                
                local bullet = createBullet(player.x, player.y - 18, 60)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 120)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x - 30, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 30, player.y - 18, 90)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y - 18, 30)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 60)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 120)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 150)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x - 50, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 30, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 30, player.y - 18, 90)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 50, player.y - 18, 90)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end

    end

    if love.keyboard.isDown("left") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x, player.y - 10, 180)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x, player.y - 20, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 180)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x, player.y - 10, 150)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 10, 210)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 10, 180)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x, player.y - 40, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 20, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 20, 180)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y - 18, 120)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 150)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 210)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 240)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x, player.y - 60, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 40, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 20, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 20, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 40, 180)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 180)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("right") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x, player.y - 10, 0)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x, player.y - 20, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 0)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x, player.y - 10, -30)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 10, 30)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 10, 0)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x, player.y - 40, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 20, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 20, 0)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y - 18, -60)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, -30)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 30)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 60)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x, player.y - 60, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 40, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 20, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 20, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y + 40, 0)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 0)
                bullets[#bullets+1] = bullet
            end
            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("down") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x, player.y - 18, 270)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x - 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x, player.y - 18, 240)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 300)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 270)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x - 30, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 30, player.y - 18, 270)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y - 18, 210)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 240)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 300)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 330)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x - 50, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 30, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 10, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 30, player.y - 18, 270)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x + 50, player.y - 18, 270)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end
    end
end

function input.general()

    if love.keyboard.isDown("escape") then

        love.event.quit()
        
    end
end