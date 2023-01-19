require('game/main');

function love.update (dt)
    Main:update(dt);
end

function love.load() 
    Main:load();
end

function love.draw()
    Main:draw();
end

function love.keypressed(key)
    Main:keypressed(key)
end 

function love.mousepressed(x, y, button, istouch, presses)
    Main:mousepressed(x, y, button, istouch, presses);
end

function love.conf(t)
	t.console = true
end