--[[
    
This has all custom made math and calculation functions

]]--

--Returns the x vector from {len} and {dir}

function lengthdir_x(len, dir)

    dir = degtorad(dir)

    return math.cos(dir) * len

end

--Returns the y vector from {len} and {dir}

function lengthdir_y(len, dir)

    dir = degtorad(dir)

    return -math.sin(dir) * len

end

function degtorad(d)

    return d * math.pi / 180

end