local cookie = {}
local numberString = {}

function cookie.load(image)
    cookie.x = love.graphics.getWidth()/2-image:getWidth()/2
    cookie.y = love.graphics.getHeight()/2-image:getHeight()/2
    cookie.sx = 1
    cookie.sy = 1
    cookie.image = image
    cookie.color = {1,1,1,0.8}
end

function cookie.update(dt)
    game.cookies = game.cookies + game.cookieRate * dt
end

function cookie.draw()
    love.graphics.setColor(cookie.color)
    love.graphics.draw(cookie.image,cookie.x,cookie.y,0,cookie.sx,cookie.sy)
    love.graphics.setColor(1,1,1,1)
end

function cookie.hover(bool)
    if bool then
        cookie.color = {1,1,1,1}
        cookie.sx = cookie.sx + 0.1
        cookie.sy = cookie.sy + 0.1
        cookie.x = cookie.x-17
        cookie.y = cookie.y-17
    else
        cookie.color = {1,1,1,0.8}
    end
end

function cookie.createText(cookies)
    local text = {}
    text.x = mouse.x
    text.y = mouse.y - 16
    text.color = {1,1,1,1}
    text.string = "+ " .. game.clickRate
    table.insert(numberString, text)
end

function cookie.updateText()
    for i, v in pairs(numberString) do
        v.y = v.y - 2
        v.color[4] = v.color[4] - 0.02
        if v.color[4] <= 0.5 then
            table.remove(numberString,i)
        end
    end
end

function cookie.drawText()
    for i, v in pairs(numberString) do
        love.graphics.setColor(v.color)
        love.graphics.print(v.string,v.x,v.y)
        love.graphics.setColor(1,1,1,1)
    end
    love.graphics.print("Cookies: " .. math.floor(game.cookies),window.WIDTH/2-70,16)
end

function cookie.click(bool)
    if bool then
        cookie.x = cookie.x + 16
        cookie.y = cookie.y + 16
        cookie.sx = cookie.sx - 0.1
        cookie.sy = cookie.sy - 0.1
        cookie.createText(game.cookies)
    else
        cookie.sx = 1
        cookie.sy = 1
        cookie.x = window.WIDTH/2-images.cookie:getWidth()/2
        cookie.y = window.HEIGHT/2-images.cookie:getHeight()/2
    end
end

return cookie