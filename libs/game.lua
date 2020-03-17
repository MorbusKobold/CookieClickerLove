local game = {
    cookies = 100000,
    clickRate = 0,
    cookieRate = 100
}

function game.update()
    if game.cookies >= 1000 then
        --game.cookies = 0
        game.cookieRate = game.cookieRate * 1.1
        --cookie.createRain(5)
    end
end

return game