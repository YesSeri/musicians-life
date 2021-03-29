Note = {}

function Note:new(name, file, point, color)
  o = {}
  o.name = name
  o.sound = love.audio.newSource(file, "static")
  o.point = point
  o.color = color
  setmetatable(o, self)
  self.__index = self
  return o
end

function Note:play()

    local position = self.sound:tell( unit )
    if self:isPlaying() then
        self.sound:seek(0)
    else
        self.sound:play()
    end
end

function Note:getName()
    return self.name
end
function Note:isPlaying()
   return self.sound:isPlaying()
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
        love.graphics.setColor(1,1,1,1)
    else
        love.graphics.setColor(0,0,0,1)
    end
        love.graphics.rectangle('fill', p.x, p.y, p.dx, p.dy )
end