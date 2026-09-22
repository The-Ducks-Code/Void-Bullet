--[[
    
This handles all of item creation and other item related things

]]--

items = {}

itempoolERa = {4, 6, 7}
itempoolERb = {9}
itempoolSHOPa = {1, 2, 3, 8, 10, 11, 12}
itempoolSHOPb = {4, 5}
itempoolSHOPc = {6, 7}

function itempoolupdate()

    if #itempoolERa == 0 then
        itempoolERa[#itempoolERa+1] = 9
    end

    if #itempoolERb == 0 then
        itempoolERb[#itempoolERb+1] = 7
    end

end


function createItem(itemType, x, y, shopornot)

    local item = {}
    item.x = x
    item.y = y
    item.type = itemType
    item.isInShop = shopornot

    local b = 0
    local c = 0

    function item.update(dt)


        if item.type == "fireball" or item.type == 1 then
            if b < 12 then

                item.color = {254, 100, 4, 255}
                item.txt = "|#|"
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {254, 222, 23, 255}
                item.txt = "|*|"
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "fireball"
            item.cost = 15
        elseif item.type == "lasergun" or item.type == 2 then

            item.txt = "/=="

            if b < 12 then

                item.color = {10, 5, 255, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {90, 5, 155, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "lasergun"
            item.cost = 15
        elseif item.type == "piercing" or item.type == 3 then

            item.txt = "==>"

            if b < 12 then

                item.color = {130, 75, 255, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {90, 5, 155, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "piercing"
            item.cost = 5 + math.floor((2 * player.pLvl + 0.5))
        elseif item.type == "speed up" or item.type == 4 then

            item.txt = ">>>"

            if b < 12 then

                item.color = {243, 209, 4, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {239, 183, 0, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "speed up"
            item.cost = math.floor((2 * player.speed - 4) + 0.5)
        elseif item.type == "bulletup" or item.type == 5 then

            item.txt = '|||'

            if b < 12 then

                item.color = {50, 209, 4, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {50, 183, 0, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "bulletup"
            item.cost = 3 * player.bulletAmount
        elseif item.type == "heartsup" or item.type == 6 then

            item.txt = '↑♥↑'

            if b < 12 then

                item.color = {250, 115, 104, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {200, 130, 100, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "heartsup"
            item.cost = math.floor((2 * player.totalHp - 4) + 0.5)
        elseif item.type == "heal kit" or item.type == 7 then

            item.txt = '+♥+'

            if b < 12 then

                item.color = {230, 25, 4, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {200, 30, 0, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "heal kit"
            item.cost = 1
        elseif item.type == "thirdeye" or item.type == 8 then

            item.txt = '·◊·'

            if b < 12 then

                item.color = {25, 25, 254, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {20, 30, 264, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "thirdeye"
            item.cost = 15
        elseif item.type == "goldcoin" or item.type == 9 then

            item.txt = '($)'

            if b < 12 then

                item.color = {255, 235, 0, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {235, 255, 264, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "goldcoin"
        elseif item.type == "exitshop" or item.type == 10000 then

            item.color = {255, 255, 255, 255}
            item.txt = "-->"
            b = b + 1 * dt
            item.type = "exitshop"
            item.cost = 0
        elseif item.type == "telknsis" or item.type == 10 then

            item.txt = '⁰†⁰'

            if b < 12 then

                item.color = {25, 200, 255, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {200, 30, 255, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "telknsis"
            item.cost = 45
        elseif item.type == "purerage" or item.type == 11 then
        item.txt = '>:('

            if b < 12 then

                item.color = {225, 20, 50, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {200, 50, 20, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "purerage"
            item.cost = 30
        elseif item.type == "vamprism" or item.type == 12 then
        item.txt = '-Ж-'

            if b < 12 then

                item.color = {225, 0, 0, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {255, 50, 20, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "vamprism"
            item.cost = 35
        elseif item.type == "bulspdup" or item.type == 13 then

            item.txt = '↑#↑'

            if b < 12 then

                item.color = {23, 205, 4, 255}
                b = b + 1 * dt

            elseif c < 12 then

                item.color = {20, 300, 0, 255}
                c = c + 1 * dt

            else

                b = 0
                c = 0

            end
            item.type = "bulspdup"
            item.cost = 3 + math.floor((2 * player.bulSpdMod + 0.5))
        end
    end

    return item

end

local graphics = love.graphics
local math = love.math

function items.draw()

    for k,v in ipairs(items) do

        graphics.setColor(love.math.colorFromBytes(items[k].color[1], items[k].color[2], items[k].color[3], items[k].color[4]))
        graphics.print(items[k].type, items[k].x - 164 / 1.57, items[k].y - 30) -- print items every frame they are on screen
        graphics.print(items[k].txt, items[k].x - fonts.ui:getWidth(items[k].txt) / 3, items[k].y) -- print items every frame they are on screen
        if items[k].isInShop == true then
            graphics.setColor(love.math.colorFromBytes(255, 235, 0, 255))
            graphics.print("$" .. tostring(items[k].cost), items[k].x - fonts.ui:getWidth(items[k].txt) / 3, items[k].y + 30) -- print items every frame they are on screen
        end
        graphics.setColor(1, 1, 1, 1)
    end
end
