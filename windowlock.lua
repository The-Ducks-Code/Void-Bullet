love.graphics.setDefaultFilter('nearest', 'nearest') -- Keeps those crispy pixels

gameWidth, gameHeight = 800, 800

local function initWindow()
    local screenWidth, screenHeight = love.window.getMode()
    local scaleAmount = math.min(screenWidth / gameWidth, screenHeight / gameHeight) + 0.45 
    love.window.setMode(gameWidth * scaleAmount, gameHeight * scaleAmount, { resizable = true })
end

function scaleCanvasToFit(windowWidth, windowHeight)
    -- Preserves aspect ratio when resizing the game
    local scaleAmount = math.min(windowWidth / gameWidth, windowHeight / gameHeight)    
    love.graphics.scale(scaleAmount, scaleAmount)
    return scaleAmount
end

initWindow()

gameCanvas = love.graphics.newCanvas(gameWidth, gameHeight)