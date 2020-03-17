local game = {
    cookies = 0,
    clickRate = 1,
    cookieRate = 100
}

function game.update()
    if game.cookies >= 1000 then
        game.cookies = 0
        game.cookieRate = game.cookieRate + 10
        cookie.createRain(5)
    end
end

return game