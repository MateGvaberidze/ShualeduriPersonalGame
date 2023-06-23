Player = Class{}

local GRAVITY = 40

function Player:init()
	self.image = love.graphics.newImage('PlayerIcon.png')
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
  self.asteroidEnemy = Asteroid()
	
	self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
	self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
	
	self.dy = 0
  

end

function Player:update(dt)
	self.dy = self.dy + GRAVITY * dt
	
	if love.keyboard.wasPressed('space') then
		self.dy = -5
	end
	
	self.y = self.y + self.dy
end

function Player:collides(target)
	if (self.x + 2) + (self.width - 4) >= target.x and self.x + 2 <= target.x + target.width then
		if (self.y + 2) + (self.height - 4) >= target.y and self.y + 2 <= target.y + target.height then      
		    return true
		end
  end
  return false
end

function Player:render()
	love.graphics.draw(self.image, self.x, self.y)
end