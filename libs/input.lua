local input = {}

function input.load()
    input.key_exit = "escape"
    input.key_debug = "f1"
    input.key_t = "t"
    input.key_plus = "+"
    input.key_minus = "-"
end

function input.keypressed(key)
    if key == input.key_exit then
        love.event.quit()
    end
    if key == input.key_debug then
        debug = not debug
    end
    if key == input.key_t then
        t = not t
    end
    if key == input.key_minus and game.clickRate-100 >= 0 then
        game.clickRate = game.clickRate - 100
    end
    if key == input.key_plus then
        game.clickRate = game.clickRate + 100
    end
end

return input