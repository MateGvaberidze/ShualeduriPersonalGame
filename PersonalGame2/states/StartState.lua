StartState = Class{__includes = BaseState}

function StartState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('play')
	end
end

function StartState:render()
	love.graphics.setFont(mediumFont)
	love.graphics.printf('Welcome! Press Enter to start playing!', 0, 64, VIRTUAL_WIDTH, 'center')
end
