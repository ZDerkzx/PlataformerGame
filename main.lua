-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local playerStats = require("src.playerStats")
local physics = require("physics")
local detect_EnemyCollision = require("src.detections.detect_EnemyCollision")





physics.start()

-- Enemigos ----------------

robot = display.newCircle(100,100,40)
robot:setFillColor(1,0,0)
physics.addBody(robot,"kynematic", {bounce=0,density=0.2})


---------------------------- ENEMY FUNCTIONS -------------------------------------

local function FollowPlayer(mindistance,followspeed,enemyname, playername)
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




-- JUGADOR ------------------
local Player = display.newRect(0,0,20,20)
Player.x = display.contentCenterX
Player:setFillColor(0,1,0)
physics.addBody(Player,"dynamic",{radius=12, bounce=0})

FollowPlayer(5,50,robot,Player)
-- funcion de movimiento del jugador para windows




--- FIN DE LOS CONTROLES DE MOVIMIENTO DEL JUGADOR DE WINDOWS

-- Testeo de Pistola



---- VERIFICA SI LA VIDA DEL JUGADOR ESTA EN 0
--- SI ES ASI MUERE






-- todas las stats del jugador



--- fin de todas las stats del jugador


-- Gun functions


-- gun functions end


-- DRAW

-- RECT

local plano = display.newRect(0,0,15000,20)
plano.x = display.contentCenterX + 50
plano.y = display.contentCenterY + 100
physics.addBody(plano, "static",{ shape=Shape, density=1.0, friction=0} )


local plano1 = display.newRect(400,150,200,20)
local wall = display.newRect(400,150,20,200)
physics.addBody(wall, "static", {shape=Shape})
physics.addBody(plano1,"static", {shape=Shape, density=1.0, friction=0, bounce=0.5})
----- PLAYER MOVEMENT

-- Detecta la colision del jugador al saltar


----- PLAYER MOVEMENT
---WINDOWS PLAYER MOVEMENT
local function MovePlayerPC(event) 
    -- verifica si la tecla esta abajo
    if event.phase == "down" then
        if event.keyName == "up" and jumpCount < 2 then
            Player:setLinearVelocity(0,-500)
            jumpCount = jumpCount + 1
        elseif event.keyName == "down" then
            Player:setLinearVelocity(0,0)
        
        elseif event.keyName == "right" then
            Player:setLinearVelocity(500,0)
        elseif event.keyName == "left" then
            Player:setLinearVelocity(-500,0)
        end
        -- si las teclas esta arriba pues establece la velocidad en 0,0
    elseif event.phase == "up" then
        Player:setLinearVelocity(0,0)
    end
end


-- enemigo de testeo para el enemy collision
-- Borrenlo si no lo usan


----- IN ANDROID
upControl = display.newRect(0,0,40,40)
upControl.x = display.contentCenterX - 200
upControl.y = display.contentCenterY
upControl.direction = "up"



downControl = display.newRect(0,0,40,40)
downControl.x = display.contentCenterX - 200
downControl.y = display.contentCenterY + 120
downControl.direction = "down"

rightControl = display.newRect(0,0,40,40)
rightControl.x = display.contentCenterX - 145
rightControl.y = display.contentCenterY + 60
rightControl.direction = "right"

leftControl = display.newRect(0,0,40,40)
leftControl.x = display.contentCenterX - 255
leftControl.y = display.contentCenterY + 60
leftControl.direction = "left"

spellControl = display.newRect(0,0,40,40)
spellControl.x = display.contentCenterX - 200
spellControl.y = display.contentCenterY + 60
-- manejar el salto
local function onCollision(event)
    if event.phase == "began" then
        if event.other == plano then
            jumpCount = 0
        end
    end
end

Player:addEventListener("collision", onCollision)

-- Función para manejar el touch
local function onTouch(event)
    local phase = event.phase
    local target = event.target
    local vx, vy = Player:getLinearVelocity()

    -- comprueba si esta tocando
    -- luego comprueba cual boton toco y dependiendo a eso
    -- movera el jugador
    if phase == "began" or phase == "moved" then
        if target == upControl and jumpCount < 2 then
            Player:setLinearVelocity(vx, -500)
            jumpCount = jumpCount + 1
        elseif target == leftControl then
            Player:setLinearVelocity(-500, vy)
        elseif target == rightControl then
            Player:setLinearVelocity(500, vy)
        end
        -- CANCELA EL MOVIMIENTO DEL JUGADOR
    elseif phase == "ended" or phase == "cancelled" then
        if target == upControl or target == leftControl or target == rightControl then
            Player:setLinearVelocity(0, vy)
        end
    end

    return true
end


-- testeoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooxd


caja = display.newRect(300,100,50,50)
physics.addBody(caja,"dynamic",{bounce=0.3})






-- crea el label y lo actualiza
local health = display.newText("Vida: ".. Health,250,20)
function updateHealth()
    health.text = "Vida: ".. Health
end



--- funcion quitar vida





-- touch
leftControl:addEventListener("touch", onTouch)
rightControl:addEventListener("touch", onTouch)
upControl:addEventListener("touch", onTouch)
downControl:addEventListener("touch", onTouch)
-- Evento de movimiento para windows
Runtime:addEventListener("key", MovePlayerPC)


-- manejo de colisiones con enemigos
-- agregar valores 
Player:addEventListener("collision", function(event)
    EnemyCollision(event,Enemy,10)
end)

Player:addEventListener("collision", function(event)
    EnemyCollision(event,robot,110)
    
end)
-- Actualiza la vida del jugador

Runtime:addEventListener("enterFrame", updateHealth)

-- Seguir al jugador
Runtime:addEventListener("enterFrame", function()
    FollowPlayer(100,1, robot,Player)
    
end)
