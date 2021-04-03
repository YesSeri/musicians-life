Note = {}

function Note:new(name, file, point, color, shortcut)
  o = {}
  o.name = name
  o.source = love.audio.newSource(file, "static")
  o.point = point
  o.color = color
  o.active = false
  o.release = false
  o.shortcut = shortcut
  setmetatable(o, self)
  self.__index = self
  return o
end

function Note:play()
    local position = self.source:tell()
    self.active = true
    self.source:setVolume(1)
    self.release = false
    if self:isPlaying() then
        self.source:stop()
        self.source:play()
    else
        self.source:play()
    end
end

function Note:getName()
    return self.name
end
function Note:isPlaying()
   return self.source:isPlaying()
end
function Note:releaseKey()
    if self:isPlaying() then
        self.release = true
    end
    self.active = false
end
function Note:isClicked(mp)
    local p = self.point
    if mp.x >= p.x and mp.x <= p.x + p.dx and mp.y >= p.y and mp.y <= p.y + p.dy then
        return true
    end
    return false
end
function Note:draw()
    local p = self.point
    if self.color == 'w' then
        if self.active then
            love.graphics.setColor(0.8,0.8,0.8,1)
        else
            love.graphics.setColor(1,1,1,1)
        end
    else
        if self.active then
            love.graphics.setColor(0.3,0.3,0.3,1)
        else
            love.graphics.setColor(0,0,0,1)
        end
    end
        love.graphics.rectangle('fill', p.x, p.y, p.dx, p.dy )
end
