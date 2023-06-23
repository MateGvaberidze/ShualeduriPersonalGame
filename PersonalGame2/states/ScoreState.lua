ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        stateMachine:change('start')
    end
end

function ScoreState:render()
    love.graphics.setFont(mediumFont)
    love.graphics.printf('You Lost! Press ESCAPE to quit. Press Return Or Enter To Restart', 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')
end