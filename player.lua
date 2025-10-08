--[[
    
This handles all the player outside of the update and draw functions

]]--
local graphics = love.graphics
local math = love.math
-- player variables
player = {} -- create the player object
player.w = 24
player.h = 20
player.x =  gameWidth/2 -- set the players x postition to about the middle of the screen
player.y =  gameHeight/2 -- set the players y postition to about the middle of the screen
player.totalHp = 3
player.hp = 3
player.score = 0
player.isAlive = true
player.abilities = {}
player.speed = 3
player.bType = "normal"
player.bSize = 1
player.round = 0
player.roundactive = true
player.defcolor = {255, 255, 255, 255}
player.color = {255, 255, 255, 255}
player.txt = '0'
player.bulletAmount = 1
player.pLvl = 0
player.coins = 0
player.damageMultiplier = 1

player.telknsis = false
player.thirdeye = false
player.thirdeyeCounter = 0
local b = 0
local c = 0

damageTimer = 0 -- reset the damage timer
damagecooldown = false -- reset the damage cooldown

function player.update(dt)

    if player.hp <= 0 then

        for b, n in ipairs(enemybullets) do

            enemybullets[b].active = false
    
        end

        player.isAlive = false

    end

    if player.score > 9999999 then
        player.score = 9999999
        noticolor = {255, 25, 5, 255}
        noti = "MAX SCORE REACHED"
        noti2 = "'bro... why???'"
        notiTimerTrigger = true
    end

    for k,v in ipairs(player.abilities) do

        -- Bullet types:
        if player.abilities[k] == "fireball" then -- fireball bullet

            player.bType = "fireball"

        elseif player.abilities[k] == "lasergun" then -- lasergun bullet

            player.bType = "lasergun"

        elseif player.abilities[k] == "firelser" then -- laser bullet

            player.bType = "firelser"

        elseif player.abilities[k] == "railgun" then -- laser bullet

            player.bType = "railgun"

        elseif player.abilities[k] == "srailgun" then -- laser bullet

            player.bType = "srailgun"

        elseif player.abilities[k] == "thirdeye" then
            
            player.thirdeye = true

        elseif player.abilities[k] == "telknsis" then
            
            player.telknsis = true

        end
    end

    function removeAbility(item)
        for k,v in ipairs(player.abilities) do
    
            -- Bullet types:
            if player.abilities[k] == item then -- fireball bullet
    
                table.remove(player.abilities, k)
    
            end
        end
    end

    if tableContains(player.abilities, "fireball") and tableContains(player.abilities, "lasergun") then
        print("firelser")
        removeAbility("fireball")
        removeAbility("lasergun")
        player.abilities[#player.abilities+1] = "firelser"
        noticolor = {245, 25, 5, 255}
        noti = "Flamethrower: BUL+DMG ↑ ACC ↓"
        noti2 = "'You Feel the POWER'"
        notiTimerTrigger = true

    end

    if player.pLvl >= 2 and tableContains(player.abilities, "lasergun") then
        removeAbility("lasergun")
        player.abilities[#player.abilities+1] = "railgun"
        noticolor = {205, 55, 35, 255}
        noti = "Railgun: BUL ↓ DMG ↑"
        noti2 = "'The result is worth the wait'"
        notiTimerTrigger = true
        player.pLvl = 999
    end

    if player.pLvl >= 2 and tableContains(player.abilities, "firelser") or tableContains(player.abilities, "railgun") and tableContains(player.abilities, "fireball") then
        removeAbility("firelser")
        removeAbility("fireball")
        removeAbility("railgun")
        player.abilities[#player.abilities+1] = "srailgun"
        noticolor = {205, 55, 35, 255}
        noti = "SUPER Railgun: BUL ↓ DMG ↑↑"
        noti2 = "'It almost hurts to fire'"
        notiTimerTrigger = true
        player.pLvl = 999
    end

    if player.coins > 99 then player.coins = 99 end


    if #enemies == 0 and #bosses == 0 and player.roundactive == true then

        player.round = player.round + 1
        player.roundactive = false
        if not player.round == 0 then
            print("ROUND COMPLETE")
        end
        player.x = gameWidth / 2 - 20
        player.y = gameHeight / 2 - 20
        world:move(player, player.x, player.y, playerFilter)
        for k, l in ipairs(bullets) do

            bullets[k].active = false

        end
        print("ROUND " .. player.round)
        if player.round % 5 == 0 then
            level.init("shop")
        else
            level.init("roundEnd")
        end
        endround:play()

    end

    function player.takeDamage(dmg, enemytype, enemydir)


        if not damagecooldown then
            playerhurt:play()
            startShake(2, 10)
            player.hp = player.hp - dmg
            print("player took " .. dmg ..  " damage")
            print("player has " .. player.hp .. "hp left")
            player.color = {255, 100, 25, 155}
            damagecooldown = true
            player.y = player.y + lengthdir_y(10 * dt, enemydir)
            player.x = player.x + lengthdir_x(10 * dt, enemydir)
        end
    end

    function player.shoot(bulnum, buldir, xoffset, yoffset, bulperside)

        if player.bulletAmount == 1 then
            bulperside = 1
            local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir + bulletoffset)
            bullets[#bullets+1] = bullet
        else
            bulperside = bulnum / 2
            if player.bulletAmount % 2 == 0 then
                local i = 0
                while i <= bulperside do
                    local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir + (bulperside / i * 5) + bulletoffset)
                    bullets[#bullets+1] = bullet
                    local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir - (bulperside / i * 5) + bulletoffset)
                    bullets[#bullets+1] = bullet
                    i = i + 1
                end
            else
                local i = 0
                while i <= bulperside do
                    local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir + (bulperside / i * 5) + bulletoffset)
                    bullets[#bullets+1] = bullet
                    local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir - (bulperside / i * 5) + bulletoffset)
                    bullets[#bullets+1] = bullet
                    i = i + 1
                end
                local bullet = createBullet(player.x + xoffset, player.y + yoffset, buldir + bulletoffset)
                    bullets[#bullets+1] = bullet
            end
        end
    
    end

    function player.draw()
        graphics.setFont(fonts.entities)
        graphics.setColor(math.colorFromBytes(player.color[1], player.color[2], player.color[3], player.color[4]))
        graphics.print(player.txt, player.x, player.y - 10) -- print player every frame
        graphics.setColor(1, 1, 1, 1)

    end
end