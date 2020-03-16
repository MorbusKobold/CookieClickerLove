-- setting up the window and holding all variables
local window = {
    TITLE = "Cookie Clicker",
    WIDTH = 800,
    HEIGHT = 600
}

function window.load()
    love.window.setTitle(window.TITLE)
    love.window.setMode(window.WIDTH,window.HEIGHT)
end

function window.create(text, x, y)
    
end

return window