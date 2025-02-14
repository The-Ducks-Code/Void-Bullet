local graphics = love.graphics

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

        graphics.draw(enemydeaths[i].img, enemydeaths[i].x, enemydeaths[i].y, 0, 5, 5)

    end

end

bossbarhitanims = {}

function bossbarHit(ex, ey)

    local this = {}

    this.img = bossbaranim[1]
    this.x = ex
    this.y = ey
    this.active = true

    local i = 0

    function this.update(dt)
        i = i + 1 * dt
        if i < 4 then
            this.img = bossbaranim[1]
        elseif i < 8 then
            this.img = bossbaranim[2]
        elseif i < 12 then
            this.img = bossbaranim[3]
        elseif i < 16 then
            this.img = bossbaranim[4]
        elseif i < 20 then
            this.img = bossbaranim[5]
        elseif i < 24 then
            this.img = bossbaranim[6]
        elseif i < 28 then
            this.img = bossbaranim[7]
        elseif i < 32 then
            this.img = bossbaranim[8]
        elseif i < 36 then
            this.img = bossbaranim[9]
        elseif i < 40 then
            this.img = bossbaranim[10]
        else
            this.active = false
        end
    end

    return this
end


function bossbarhitanims.draw()

    for i,k in ipairs(bossbarhitanims) do
        if bossbarhitanims[i].active == true then
            graphics.draw(bossbarhitanims[i].img, bossbarhitanims[i].x, bossbarhitanims[i].y, 0, 5, 5)
        end
    end

end

enemyhitanims = {}

function enemyHit(ex, ey)

    local this = {}

    this.img = enemyhit[1]
    this.x = ex
    this.y = ey
    this.active = true

    local i = 0

    function this.update(dt)
        i = i + 1 * dt
        if i < 3 then
            this.img = enemyhit[1]
        elseif i < 6 then
            this.img = enemyhit[2]
        elseif i < 9 then
            this.img = enemyhit[3]
        else
            this.active = false
        end
    end

    return this
end


function enemyhitanims.draw()

    for i,k in ipairs(enemyhitanims) do
        if enemyhitanims[i].active == true then
            graphics.draw(enemyhitanims[i].img, enemyhitanims[i].x, enemyhitanims[i].y, 0, 5, 5)
        end
    end

end