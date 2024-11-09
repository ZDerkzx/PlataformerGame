

local playerStats = require("src.playerStats")
local physics = require("physics")

physics.start()
-- test
-- funcion para detectar colisiones


function EnemyCollision(event,obj1,menosvida)
    if event.phase == "began" then
        if event.other == obj1 then
            Health = Health - menosvida
            print("Detect COLLISION!!!".. Health)
        end
    elseif event.phase == "ended" or "cancelled" then
        print("...")
    end
end


