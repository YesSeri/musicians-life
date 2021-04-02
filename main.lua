require 'key'
require 'socket'
love.load = function () 
     love.window.setMode(900, 500, { resizable=false, vsync=false })
     local width = love.graphics.getWidth()
     local height = love.graphics.getHeight()
     local offset = width / 8
    local pointWhite = function(z) 
        return {x = offset * z + offset * 0.02, y = 0, dx = offset - offset * 0.02, dy = height} 
    end
    local pointBlack = function(z) 
        local p = pointWhite(z)
        p.x = p.x + offset/2 + offset * 0.1
        p.dx = offset * 0.8
        p.dy = p.dy * 0.5
        return p
    end
    keys = {
        Note:new('c', "audio/1.C-low.ogg", pointWhite(0), 'w'),
        Note:new('d', "audio/3.D.ogg", pointWhite(1), 'w'),
        Note:new('e', "audio/5.E.ogg", pointWhite(2), 'w'),
        Note:new('f', "audio/6.F.ogg", pointWhite(3), 'w'),
        Note:new('g', "audio/8.G.ogg", pointWhite(4), 'w'),
        Note:new('a', "audio/10.A.ogg", pointWhite(5), 'w'),
        Note:new('b', "audio/12.B.ogg", pointWhite(6), 'w'),
        Note:new('C', "audio/13.C-high.ogg", pointWhite(7), 'w'),
        Note:new('c#', "audio/2.C#.ogg", pointBlack(0), 'b'),
        Note:new('d#', "audio/4.D#.ogg", pointBlack(1), 'b'),
        Note:new('f#', "audio/7.F#.ogg", pointBlack(3), 'b'),
        Note:new('g#', "audio/9.G#.ogg", pointBlack(4), 'b'),
        Note:new('a#', "audio/11.A#.ogg", pointBlack(5), 'b'),
    }
    timer = 3
end
love.update = function (dt) 
    for k, v in ipairs(keys) do
        if v.active.is == true then 
            v.active.time = v.active.time + dt
            if v.active.time > 0.2 then
                v.active.is = false
                v.active.time = 0
            end
        end
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
            key = keys[i]
            if key:isClicked({x=x, y=y}) then
                key:play()
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
