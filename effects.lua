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

function effects.draw()

    if t < shakeDuration then
        local dx = love.math.random(-shakeMagnitude, shakeMagnitude)
        local dy = love.math.random(-shakeMagnitude, shakeMagnitude)
        love.graphics.translate(dx, dy)
    end
end