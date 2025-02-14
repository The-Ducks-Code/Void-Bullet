effects = {}

local t, shakeDuration, shakeMagnitude = 0, -1, 0

function startShake(duration, magnitude)
    t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
end

function effects.update(dt)

    if t < shakeDuration then
        t = t + dt
    end
end
local graphics = love.graphics
local math = love.math
function effects.draw()

    if t < shakeDuration then
        local dx = math.random(-shakeMagnitude, shakeMagnitude)
        local dy = math.random(-shakeMagnitude, shakeMagnitude)
        graphics.translate(dx, dy)
    end
end