
local main = require("main")
function Gun(side)
    local bullet = display.newCircle( Player.x, Player.y, 10 )
    physics.addBody( bullet, "dynamic", { radius=10} )
    bullet.gravityScale = 0
    bullet:setLinearVelocity(side,0)
end