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
        love.graphics.print("Tipo do inseto:" .. tostring(Inseto.type), 10, 60);
    end
    love.graphics.print('M - menu', 730, 10);


    Cam:attach()
        bloco:draw();
        bloco1:draw();
        Inseto:draw();
    Cam:detach()

end

function Game:update(dt)
    Inseto:update(dt);
    Cam:lookAt(Inseto.x, Inseto.y);

    if Inseto.type == BESOURO then
        bloco:disableColision();
    else 
        bloco:enableColision();
    end

    -- detecta colisão
    colisao = "não"
	for shape, delta in pairs(HC.collisions(Inseto.body)) do
		colisao = "sim"
		Inseto.x = Inseto.x + delta.x;
		Inseto.y = Inseto.y + delta.y;
        Cam:lockPosition(Inseto.x, Inseto.y)
    end
end