Game = {}
local colisao;

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
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x) .. "\nColisão: " .. colisao), 10, 0);
        love.graphics.print("Parede Y: " .. tostring(bloco.y) .. "\nParede X: " .. tostring(bloco.x), 10, 60);
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

    -- detecta colisão
    colisao = "não"
	for shape, delta in pairs(HC.collisions(Inseto.body)) do
		colisao = "sim"
		Inseto.x = Inseto.x + delta.x;
		Inseto.y = Inseto.y + delta.y;
	end
end