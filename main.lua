require "key"
love.load = function()
    love.window.setMode(900, 500, {resizable = false, vsync = false})
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    local offset = width / 8
    local pointWhite = function(z)
        return {x = offset * z + offset * 0.02, y = 0, dx = offset - offset * 0.02, dy = height}
    end
    local pointBlack = function(z)
        local p = pointWhite(z)
        p.x = p.x + offset / 2 + offset * 0.1
        p.dx = offset * 0.8
        p.dy = p.dy * 0.5
        return p
    end
    keys = {
        Note:new("c", "flaudio/1.C-low.ogg", pointWhite(0), "w", "s"),
        Note:new("d", "flaudio/3.D.ogg", pointWhite(1), "w", "d"),
        Note:new("e", "flaudio/5.E.ogg", pointWhite(2), "w", "f"),
        Note:new("f", "flaudio/6.F.ogg", pointWhite(3), "w", "g"),
        Note:new("g", "flaudio/8.G.ogg", pointWhite(4), "w", "h"),
        Note:new("a", "flaudio/10.A.ogg", pointWhite(5), "w", "j"),
        Note:new("b", "flaudio/12.B.ogg", pointWhite(6), "w", "k"),
        Note:new("C", "flaudio/13.C-high.ogg", pointWhite(7), "w", "l"),
        Note:new("c#", "flaudio/2.C#.ogg", pointBlack(0), "b", "e"),
        Note:new("d#", "flaudio/4.D#.ogg", pointBlack(1), "b", "r"),
        Note:new("f#", "flaudio/7.F#.ogg", pointBlack(3), "b", "y"),
        Note:new("g#", "flaudio/9.G#.ogg", pointBlack(4), "b", "u"),
        Note:new("a#", "flaudio/11.A#.ogg", pointBlack(5), "b", "i")
    }
end
love.update = function(dt)
    for k, v in ipairs(keys) do
        s = v.source
        if v.release == true then
            vol = s:getVolume()
            nVol = vol - dt * 4
            s:setVolume(nVol)
            if nVol < 0 then 
                v.release = false
                s:stop()
            end
        end
    end
end
function love.keypressed(key)
    for i, k in ipairs(keys) do
        if key == k.shortcut then
            k:play()
        end
    end
end

function love.keyreleased(key)
    for i, k in ipairs(keys) do
        if key == k.shortcut then
            k:releaseKey()
        end
    end
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        for i = #keys, 1, -1 do
            key = keys[i]
            if key:isClicked({x = x, y = y}) then
                key:play()
                return
            end
        end
    end
end

love.draw = function()
    for k, key in ipairs(keys) do
        key:draw()
    end
end
