


---------------------------- ENEMY FUNCTIONS -------------------------------------
---
---
---
local physics = require("physics")

physics.start()


function bullet(mindistanceattack,atacante,objetivo)
    local bullet = display.newCircle(atacante.x,atacante.y, 10 )
    physics.addBody( bullet, "dynamic", { radius=10} )
    bullet.gravityScale = 0
    local distanceX = atacante.x - objetivo.x
    if distanceX < mindistanceattack then
        if distanceX.x > 1 then
            bullet:setLinearVelocity(100,0)
        else
            bullet:setLinearVelocity(-100,0)
        end
    end
end



function EnemyCollision(event,alertcollision,sethealthbar,obj1,menosvida)
    if event.phase == "began" then
        if event.other == obj1 then
            sethealthbar = sethealthbar - menosvida
            if alertcollision == true then
                print("Detect COLLISION!!!".. sethealthbar)
            end
        end
    elseif event.phase == "ended" or "cancelled" then
        if alertcollision == true then
            print("CANCELED COLLISION...")
        end
    end
end

function FollowPlayer(mindistance,followspeed,enemyname, playername)
    local distanceX = playername.x - enemyname.x
    local distanceY = playername.y - enemyname.y
    
    -- verifica si el juador esta cerca del enemigo, si es asi
    -- ase otra verificacion si esta en negativo o positivo
    if distanceX <= mindistance then
        if distanceX > 0 then
            enemyname.x = enemyname.x + followspeed  -- Mover a la derecha
        else
            enemyname.x = enemyname.x - followspeed  -- Mover a la izquierda
        end
    end

    if distanceY <= mindistance then
        if distanceY > 1  then
            enemyname.y = enemyname.y + followspeed
        else
            enemyname.y = enemyname.y - followspeed
        end
    end
end