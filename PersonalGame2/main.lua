push = require 'push'
Class = require 'class'

require 'StateMachine'
require 'Player'
require 'Asteroid'


require 'states/BaseState'
require 'states/StartState'
require 'states/PlayState'
require 'states/ScoreState'


WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280

VIRTUAL_HEIGHT = 288
VIRTUAL_WIDTH = 512

local background = love.graphics.newImage('background.png')
local background_scroll = 0

local BACKGROUND_SCROLL_SPEED = 30

local LOOPING_POINT = 313

local Asteroids = {}

function love.load()
	
	math.randomseed(os.time())
	
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('?!??!!?')
	
	
	mediumFont = love.graphics.newFont('font.ttf', 16)
	bigFont = love.graphics.newFont('font.ttf', 28)
	
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
	
	
	stateMachine = StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
		['score'] = function() return ScoreState() end
	}
	
	stateMachine:change('start')
  
  asteroidEnemy = Asteroid()
	
	love.keyboard.keysPressed = {}
end

function love.update(dt)
  
	background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
	stateMachine:update(dt)
	
	love.keyboard.keysPressed = {}
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
	
	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.draw()
	push:start()

	love.graphics.draw(background, -background_scroll, 0)

	stateMachine:render()

	push:finish()
end