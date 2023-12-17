--[[
    
This handles all of item creation and other item related things

]]--

items = {}

function createItem(itemType, x, y)

    local item = {}
    item.x = x
    item.y = y
    item.type = itemType

    local b = 0
    local c = 0

    function item.update(dt)


        if item.type == "fireball" then
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

        elseif item.type == "lasergun" then

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

        elseif item.type == "speed up" then

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
        end
    end

    return item

end

function items.draw()

    for k,v in ipairs(items) do

        love.graphics.setColor(love.math.colorFromBytes(items[k].color[1], items[k].color[2], items[k].color[3], items[k].color[4]))
        love.graphics.print(items[k].type, items[k].x - fonts.ui:getWidth(items[k].type) / 3.4, items[k].y - 15) -- print items every frame they are on screen
        love.graphics.print(items[k].txt, items[k].x - fonts.ui:getWidth(items[k].txt) / 3, items[k].y) -- print items every frame they are on screen
        love.graphics.setColor(1, 1, 1, 1)

    end
end
