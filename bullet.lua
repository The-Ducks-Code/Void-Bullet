--[[
    
This handles all of the bullet creation outside of the update and draw functions

]]--


bullets = {} -- create the array of bullet objects
bulletcooldown = true -- allow the player to shoot on the first frame
bulletTimer = 0 -- reset the bullet timer


function createBullet(x, y, speed, dir)

    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.width = 10
    bullet.height = 10
    bullet.txt = "#"
    bullet.speed = speed
    bullet.direction = dir
    bullet.damage = 1
    bullet.active = true
    function bullet.update(dt)
        bullet.y = bullet.y + lengthdir_y(bullet.speed * dt, dir)
        bullet.x = bullet.x + lengthdir_x(bullet.speed * dt, dir)
    end
 
    print("bullet created")

    return bullet

end