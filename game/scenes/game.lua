Game = {}

require('game/inseto');
require('game/objects/parede');
local bloco;
local bloco1;

function Game:load()
    Inseto:load();

    bloco1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    bloco = Parede:new(100, 400, 200, 10, 1, 0, 0);
end

function Game:draw()
    love.graphics.print('M - menu', 700, 10);

    Inseto:draw();
    bloco:draw();
    bloco1:draw();
end

function Game:update(dt)
    Inseto:update(dt);
end