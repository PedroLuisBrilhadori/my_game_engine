Game = {}

require('game/inseto');
require('game/objects/parede');
local bloco;
local bloco1;

function Game:load()
    Cam = Camera();
    Inseto:load();

    bloco1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    bloco = Parede:new(100, 400, 200, 10, 1, 0, 0);

end

function Game:draw()
    if Debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x)), 10, 0);
    end
    love.graphics.print('M - menu', 730, 10);

    Cam:attach()
        Inseto:draw();
        bloco:draw();
        bloco1:draw();
    Cam:detach()
end

function Game:update(dt)
    Inseto:update(dt);
    Cam:lookAt(Inseto.x, Inseto.y);
end