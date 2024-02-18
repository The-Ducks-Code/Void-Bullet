enemydeaths = {}

function enemyDeath(ex, ey)

    local this = {}

    this.img = enemydeath1
    this.x = ex
    this.y = ey
    this.active = true

    local i = 0

    function this.update(dt)
        i = i + 1 * dt
        if i < 5 then
            this.img = enemydeath2
        elseif i < 10 then
            this.img = enemydeath2
        elseif i < 15 then
            this.img = enemydeath3
        elseif i < 20 then
            this.img = enemydeath4
        elseif i < 25 then
            this.img = enemydeath5
        elseif i < 30 then
            this.img = enemydeath6
        elseif i < 35 then
            this.img = enemydeath7
        elseif i < 40 then
            this.img = enemydeath8
        else
            this.active = false
        end
    end

    return this
end


function enemydeaths.draw()

    for i,k in ipairs(enemydeaths) do

        love.graphics.draw(enemydeaths[i].img, enemydeaths[i].x, enemydeaths[i].y, 0, 5, 5)

    end

end