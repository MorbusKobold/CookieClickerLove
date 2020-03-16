local input = {}

function input.load()
    input.key_exit = "escape"
    input.key_debug = "f1"
    input.key_t = "t"
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
end

return input