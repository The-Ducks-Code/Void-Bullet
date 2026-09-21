bulletoffset = 0
shotdir = 0


joystickcount = love.joystick.getJoystickCount( )

if joystickcount > 0 then

    joystick = love.joystick.getJoysticks()[1]
    vendorID, productID, productVersion = joystick:getDeviceInfo()

else
    vendorID, productID, productVersion = 0, 0, 0
end


if vendorID == 1406 then -- check if a nintendo controller is being used and will adjust the key bindings to work

    input = baton.new {
        controls = {
            left = {'key:a', 'axis:leftx-', 'button:dpleft'},
            right = {'key:d', 'axis:leftx+', 'button:dpright'},
            up = {'key:w', 'axis:lefty-', 'button:dpup'},
            down = {'key:s', 'axis:lefty+', 'button:dpdown'},
            shootl = {'key:left', 'axis:rightx-', 'button:y'},
            shootr = {'key:right', 'axis:rightx+', 'button:a'},
            shootu = {'key:up', 'axis:righty-', 'button:x'},
            shootd = {'key:down','axis:righty+', 'button:b'},
            restart = {'key:r', 'button:start'},
            quit = {'key:escape', 'button:back'}
        },
        joystick = love.joystick.getJoysticks()[1],
    }
else 

    input = baton.new {
        controls = {
            left = {'key:a', 'axis:leftx-', 'button:dpleft'},
            right = {'key:d', 'axis:leftx+', 'button:dpright'},
            up = {'key:w', 'axis:lefty-', 'button:dpup'},
            down = {'key:s', 'axis:lefty+', 'button:dpdown'},
            shootl = {'key:left', 'axis:rightx-', 'button:x'},
            shootr = {'key:right', 'axis:rightx+', 'button:b'},
            shootu = {'key:up', 'axis:righty-', 'button:y'},
            shootd = {'key:down','axis:righty+', 'button:a'},
            restart = {'key:r', 'button:start'},
            quit = {'key:escape', 'button:back'}
        },
        joystick = love.joystick.getJoysticks()[1],
    }
end

function input.player(dt)


    local dx, dy = 0, 0
    if input:down 'up' then dy = -1 end
	if input:down 'left' then dx = -1 end
	if input:down 'right' then dx = 1 end
	if input:down 'down' then dy = 1 end
	if dx ~= 0 or dy ~= 0 then
		if dx ~= 0 and dy ~= 0 then
			dx = dx * 0.7071
			dy = dy * 0.7071
		end
		player.x = player.x + dx * player.speed * dt
		player.y = player.y + dy * player.speed * dt
	end


    function playerFilter(item, other)
        if other.isEnemy then return 'cross'
        elseif other.isWall then return "slide"
        end
    end

    -- update the player associated bounding box in the world
    local newX, newY, cols, len = world:move(player, player.x, player.y, playerFilter)
    player.x, player.y = newX, newY

    if input:down 'shootu' or input:down 'shootd' or input:down 'shootl' or input:down 'shootr' then
        if not bulletcooldown then
            player.isShooting = true

            if player.thirdeye == true then
        
                if player.thirdeyeCounter < 4 then
                    player.thirdeyeCounter = player.thirdeyeCounter + 1
                else
                    player.shoot(player.bulletAmount, 90, 0, -18)
                    player.shoot(player.bulletAmount, 180, -10, -10)
                    player.shoot(player.bulletAmount, 0, 10, -10)
                    player.shoot(player.bulletAmount, 270, 0, 0)
                    player.thirdeyeCounter = 0
                end
            end
        else
            player.isShooting = false
        end
    
    end

    if input:down 'shootu' then
        if not bulletcooldown then
            shotdir = "up"
            player.shoot(player.bulletAmount, 90, 0, -18)
            bulletcooldown = true
        end

    end

    if input:down 'shootl' then

        if not bulletcooldown then
            shotdir = "left"
            player.shoot(player.bulletAmount, 180, -10, -10)
            bulletcooldown = true

        end

    end
    if input:down 'shootr' then

        if not bulletcooldown then
            shotdir = "right"
            player.shoot(player.bulletAmount, 0, 10, -10)
            bulletcooldown = true

        end

    end
    if input:down 'shootd' then

        if not bulletcooldown then
            shotdir = "down"
            player.shoot(player.bulletAmount, 270, 0, 0)
            bulletcooldown = true

        end
    end
    
end




local codes = {}
codes['{up}{up}{down}{down}{left}{right}{left}{right}ba{return}'] = function() noticolor = {255, 0, 0, 255} noti = 'KONAMI CODE ACTIVATED, 99 HP' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.hp = 99 player.totalHp = 99 end
codes['ggez'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BEST LOOT' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 6 player.abilities[#player.abilities+1] = 'fireball' player.abilities[#player.abilities+1] = 'lasergun' player.abilities[#player.abilities+1] = 'vamprism'  player.pLvl = 2 end
codes['hl3confirmed'] = function() noticolor = {255, 165, 0, 255} noti = 'GORDON FREEMAN???' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.txt = "Ồ" end
codes['shoptest'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, shop test' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 4 player.coins = 99 end
codes['r15'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 15' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 15 end
codes['r30'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 30' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 30 end
codes['r35'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 35' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 35 end
codes['r45'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 45' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 45 end
codes['r70'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 70' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 70 end
codes['r80'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 80' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 80 end
codes['r1000'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, ROUND 1000' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.round = 1000 end
codes['ba2'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 2' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 2 end
codes['ba3'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 3' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 3 end
codes['ba4'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 4' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 4 end
codes['ba5'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 5' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 5 end
codes['ba6'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 6' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 6 end
codes['ba7'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, BUL AMNT 7' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.bulletAmount = 7 end
codes['duck'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED, quack quack' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.color = {255,239,1, 255} player.defcolor = {255,239,1, 255} player.txt = 'D' end
codes['score'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED,' noti2 = '999999999 pts added' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.score = player.score + 999999999 end
codes['medic'] = function() noticolor = {255, 0, 0, 255} noti = 'CHEAT ACTIVATED,' noti2 = 'Full Health' notiTimerTrigger = true noticolor = {255, 255, 255, 255} player.hp = 17 player.totalHp = 17 end
codes['thirdeye'] = function() player.abilities[#player.abilities+1] = "thirdeye" end
codes['railgun'] = function() player.pLvl = 2 player.abilities[#player.abilities+1] = "lasergun" end
codes['firelaser'] = function() player.abilities[#player.abilities+1] = "lasergun" player.abilities[#player.abilities+1] = "fireball" end
Cheatcode(codes)



function love.keypressed(key)
    Cheatcode.handle(key)
end
function input.general()

    if input:pressed 'quit' then

        love.event.quit()
        
    end

    if player.isAlive == false then
        if input:pressed 'restart' then

            gameRestart()
        
        end
    end
end