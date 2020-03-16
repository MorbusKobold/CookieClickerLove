-- setting up the window and holding all variables
local window = {
    TITLE = "Cookie Clicker",
    WIDTH = 800,
    HEIGHT = 600,
    FONT = love.graphics.newFont(16)
}

function window.load()
    love.window.setTitle(window.TITLE)
    love.window.setMode(window.WIDTH,window.HEIGHT)
    love.graphics.setFont(window.FONT)
end

function window.create(text, x, y)
    
end

return window