

local main = require("main")


-- WINDOWS PLAYER MOVEMENT
function MovePlayerPC(event) 
    -- verifica si la tecla esta abajo
    if event.phase == "down" then
        if event.keyName == "up" and jumpCount < 2 then
            Player:setLinearVelocity(0,-150)
            jumpCount = jumpCount + 1
        elseif event.keyName == "down" then
            Player:setLinearVelocity(0,0)
        
        elseif event.keyName == "right" then
            Player:setLinearVelocity(50,0)
        elseif event.keyName == "left" then
            Player:setLinearVelocity(-50,0)
        end
        -- si las teclas esta arriba pues establece la velocidad en 0,0
    elseif event.phase == "up" then
        Player:setLinearVelocity(0,0)
    end
end


Runtime:addEventListener("key", MovePlayerPC)