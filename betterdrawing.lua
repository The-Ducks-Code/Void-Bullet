-- DRAW A RECTANGLE WITH COLORS
function drawRect(r, g, b, a, mode, x, y, w, h, rx, ry, segments)
    
    love.graphics.setColor(love.math.colorFromBytes(r, g, b, a)) -- for color use for example love.math.colorFromBytes(255, 255, 255) or a built in color
    love.graphics.rectangle(mode, x, y, w, h, rx, ry, segments )
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))

end