PlayState = Class{__includes = BaseState}

ENEMY_SCROLL = 60

function PlayState:init()
	self.player = Player()
	self.asteroid = Asteroid()
	self.asteroidTable = {}
	self.timer = 0
	self.score = 0
  
  self.remove = false
end

function PlayState:update(dt)

	self.timer = self.timer + dt

	self.player:update(dt)
  
	if self.timer > 2 then
		local x = VIRTUAL_WIDTH
		local y = math.random(40, 140)
		table.insert(self.asteroidTable, Asteroid(x, y))
    self.timer = 0
	end
  
  for k, asteroid in pairs(self.asteroidTable) do
    if self.player:collides(asteroid) == true then
      stateMachine:change('score', {
        score = self.score
      })
    end
  end

	if self.player.y > VIRTUAL_HEIGHT or self.player.y < 0 then
		stateMachine:change('score', {
			score = self.score
		})
	end
	
	for k, asteroid in pairs(self.asteroidTable) do
    
    if self.player.x + self.player.width > asteroid.x + asteroid.width then
      self.score = self.score + 1
      self.remove = true
    end
    
    if self.remove == true then
      table.remove(self.asteroidTable, k)
      self.remove = false
    end
    
		asteroid:update(dt)
	end
  

  
end
  



function PlayState:render()
	love.graphics.setFont(bigFont)
	love.graphics.print('Score: ' .. tostring(self.score), 10, 10)

	for k, asteroid in pairs(self.asteroidTable) do
		asteroid:render()
	end

	--love.graphics.printf(self.timer, 0, 80, VIRTUAL_WIDTH, 'center')

	self.player:render()
end