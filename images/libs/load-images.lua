-- Library to hold all the Images used ingame
local images = {}

function images.load()
    images.background = love.graphics.newImage("images/background.png")
    images.cookie = love.graphics.newImage("images/cookie.png")
    images.tileset = love.graphics.newImage("images/tileset.png")
end

return images