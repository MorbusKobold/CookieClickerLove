collision = require "libs.collision"
images = require "libs.load-images"
window = require "libs.window"
mouse = require "libs.mouse"
game = require "libs.game"
input = require "libs.input"
cookie = require "libs.cookie"
numberHandler = require "libs.numberHandler"

debug = true
t = false
hasCollision = false

function love.load()
    window.load()
    input.load()
    images.load()
    cookie.load(images.cookie)
    background = {
        sx = window.WIDTH/images.background:getWidth(),
        sy = window.HEIGHT/images.background:getHeight(),
        image = images.background
    }
    circle = {
        x = window.WIDTH/2,
        y = window.HEIGHT/2,
        radius = images.cookie:getWidth()/2,
        color = {1,1,1}
    }
end

function love.update(dt)
    mouse.update()
    cookie.updateText()

    -- update cookies
    cookie.update(dt)
    cookie.updateRain()

    game.update()

    if collision.pointInCircle(mouse.x,mouse.y,circle.x,circle.y,circle.radius) then
        hasCollision = true
        cookie.hover(true)
        circle.color = {1,0,0}
    else
        hasCollision = false
        cookie.hover(false)
        circle.color = {1,1,1}
    end
end

function love.draw()
    love.graphics.draw(background.image,0,0,0,background.sx,background.sy)
    cookie.drawRain()
    cookie.draw()
    cookie.click(false)
    cookie.drawText()
    if debug then
        love.graphics.print("hasCollision: " .. boolToNumb(hasCollision, "text"),0,0)
        love.graphics.setColor(circle.color)
        love.graphics.circle("line",circle.x,circle.y,circle.radius)
        love.graphics.setColor(1,1,1)
        love.graphics.print("clickRate: " .. game.clickRate,0,16)
        love.graphics.print("cookieRate: " .. math.floor(game.cookieRate),0,32)
        love.graphics.print("rainingCookies: " .. #cookie.rainingCookies,0,48)
        love.graphics.print("Fps: " .. love.timer.getFPS(),0,64)
        love.graphics.print("numberIndex: " .. numberHandler.i,0,80)
    end
    if t then
        love.graphics.draw(images.tileset,0,0,0,0.4,0.5)
    end
end

function love.keypressed(key)
    input.keypressed(key)
end

function love.mousepressed(x, y, button)
    if button == 1 and collision.pointInCircle(mouse.x,mouse.y,circle.x,circle.y,circle.radius) then
        game.cookies = game.cookies + game.clickRate
        cookie.click(true)
    end
end

function boolToNumb(val, mode)
    local mode = mode or "number"
    if mode == "number" then
        return val and 1 or 0
    elseif mode == "text" then
        return val and "true" or "false"
    else
        return false
    end
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end