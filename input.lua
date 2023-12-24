
input = {}
bulletoffset = 0
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
                
                local bullet = createBullet(player.x, player.y - 18, 90 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                
                local bullet = createBullet(player.x, player.y - 18, 85 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 95 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                
                local bullet = createBullet(player.x, player.y - 18, 60 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 90 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 120 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x, player.y - 18, 80 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 85 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 95 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 100 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y - 18, 30 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 60 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 90 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 120 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 150 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x, player.y - 18, 75 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 80 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 85 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 95 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 100 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y - 18, 105 + bulletoffset)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end

    end

    if love.keyboard.isDown("left") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x - 10, player.y - 10, 180 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x - 10, player.y - 10, 175 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 185 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x - 10, player.y - 10, 150 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 180 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 210 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x - 10, player.y - 10, 170 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 175 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 185 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 190 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x - 10, player.y - 10, 120 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 150 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 180 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 210 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 240 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x - 10, player.y - 10, 165 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 170 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 175 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 190 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 195 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x - 10, player.y - 10, 200)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("right") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x +10, player.y - 10, 0 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x +10, player.y - 10, -5 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 10 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x +10, player.y - 10, -30 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 30 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 0 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x +10, player.y - 10, -10 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, -5 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 5 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 10 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x +10, player.y - 10, -60 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, -30 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 0 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 30 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 60 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x +10, player.y - 10, -15 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, -10 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, -5 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 5 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 10 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x +10, player.y - 10, 15 + bulletoffset)
                bullets[#bullets+1] = bullet
            end
            bulletcooldown = true

        end

    end
    if love.keyboard.isDown("down") then

        if not bulletcooldown then

            if player.bulletAmount == 1 then
                local bullet = createBullet(player.x, player.y, 270 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 2 then
                local bullet = createBullet(player.x, player.y, 265 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 275 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 3 then
                local bullet = createBullet(player.x, player.y, 240 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 300 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 270 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 4 then
                
                local bullet = createBullet(player.x, player.y, 260 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 265 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 275 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 280 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 5 then
                
                local bullet = createBullet(player.x, player.y, 210 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 240 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 270 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 300 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 330 + bulletoffset)
                bullets[#bullets+1] = bullet
            elseif player.bulletAmount == 6 then
                
                local bullet = createBullet(player.x, player.y, 255 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 260 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 265 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 275 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 280 + bulletoffset)
                bullets[#bullets+1] = bullet
                local bullet = createBullet(player.x, player.y, 285 + bulletoffset)
                bullets[#bullets+1] = bullet
            end

            bulletcooldown = true

        end
    end
    
end

local codes = {}
codes['{up}{up}{down}{down}{left}{right}{left}{right}ba{return}'] = function() noticolor = {255, 0, 0, 255} noti = 'KONMAI CODE ACTIVATED, 99 HP' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.hp = 99 player.totalHp = 99 end
codes['ggez'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BEST LOOT' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 6 player.abilities[#player.abilities+1] = 'fireball' player.abilities[#player.abilities+1] = 'lasergun' end

codes['hl3confirmed'] = function() noticolor = {255, 165, 0, 255} noti = 'GORDON FREEMAN???' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.txt = "Ồ" end
codes['r15'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 15' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 15 end
codes['r70'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 70' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 70 end
codes['r80'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 80' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 80 end
codes['duck'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, quack quack' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.color = {255,239,1, 255} player.defcolor = {255,239,1, 255} player.txt = 'D' end
codes['score'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED,' noti2 = '1696969 pts added' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.score = player.score + 1696969 end
Cheatcode(codes)



function love.keypressed(key)
    Cheatcode.handle(key)
end
function input.general()

    if love.keyboard.isDown("escape") then

        love.event.quit()
        
    end
end