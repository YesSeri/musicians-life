require 'key'
spf = 2.0
local offset = 60
love.load = function () 
    counter = 1
    local pointWhite = function(z) 
        return {x = 100 + offset * z + offset * 0.02, y = 100, dx = offset - offset * 0.02, dy = 150} 
    end
    local pointBlack = function(z) 
        local p = pointWhite(z)
        p.x = p.x + offset/2 + offset * 0.1
        p.dx = offset * 0.8
        p.dy = p.dy * 0.5
        return p
    end
    keys = {
        Note:new('c', "assets/piano/1.C-low.ogg", pointWhite(0), 'w'),
        Note:new('d', "assets/piano/3.D.ogg", pointWhite(1), 'w'),
        Note:new('e', "assets/piano/5.E.ogg", pointWhite(2), 'w'),
        Note:new('f', "assets/piano/6.F.ogg", pointWhite(3), 'w'),
        Note:new('g', "assets/piano/8.G.ogg", pointWhite(4), 'w'),
        Note:new('a', "assets/piano/10.A.ogg", pointWhite(5), 'w'),
        Note:new('b', "assets/piano/12.B.ogg", pointWhite(6), 'w'),
        Note:new('C', "assets/piano/13.C-high.ogg", pointWhite(7), 'w'),
        Note:new('c#', "assets/piano/2.C#.ogg", pointBlack(0), 'b'),
        Note:new('d#', "assets/piano/4.D#.ogg", pointBlack(1), 'b'),
        Note:new('f#', "assets/piano/7.F#.ogg", pointBlack(3), 'b'),
        Note:new('g#', "assets/piano/9.G#.ogg", pointBlack(4), 'b'),
        Note:new('a#', "assets/piano/11.A#.ogg", pointBlack(5), 'b'),
    }
    timer = 3
end
love.update = function (dt) 
    timer = timer + dt
    if timer > spf then
        timer = 0
    end
end
function love.keypressed(key)
   if key == "e" then
        keys[1]:play()
   end
   if key == "r" then
        keys[2]:play()
   end
   if key == "t" then
        keys[3]:play()
   end
   if key == "y" then
        keys[4]:play()
   end
   if key == "u" then
        keys[5]:play()
   end
   if key == "i" then
        keys[6]:play()
   end
   if key == "o" then
        keys[7]:play()
   end
   if key == "p" then
        keys[8]:play()
   end
   if key == "4" then
        keys[9]:play()
   end
   if key == "5" then
        keys[10]:play()
   end
   if key == "7" then
        keys[11]:play()
   end
   if key == "8" then
        keys[12]:play()
   end
   if key == "9" then
        keys[13]:play()
   end
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
        for i = #keys, 1, -1 do
            if keys[i]:isClicked({x=x, y=y}) then
                keys[i]:play()
                return
            end
        end
   end
end

love.draw = function () 
    for k, key in ipairs(keys) do
        key:draw()
    end
end