Asteroid = Class{}

ASTEROID_SCROLL = 120

function Asteroid:init()
	self.image = love.graphics.newImage('enemy.png')	
	
	self.x = VIRTUAL_WIDTH
	self.y = math.random(VIRTUAL_HEIGHT/4, VIRTUAL_HEIGHT - 10)
	self.width = 60
	self.height = 60
	
end

function Asteroid:update(dt)
  self.x = self.x - ASTEROID_SCROLL * dt
end

function Asteroid:render()
	love.graphics.draw(self.image, self.x, self.y)
end