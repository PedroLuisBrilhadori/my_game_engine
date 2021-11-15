Game = {}
local colisao;

require('game/inseto');
require('game/objects/parede');
require('game/objects/posto_troca')
local bloco;
local bloco1;
local posto_troca;

function Game:load()
    Cam = Camera();
    Inseto:load();

    bloco1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    bloco = Parede:new(100, 400, 200, 10, 1, 0, 0);
    posto_troca = Posto_troca:new(100, 300, 50, 50, 1, 1, 1);
end

function Game:draw()
    if Debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x) .. "\nColisão: " .. colisao), 10, 0);
        love.graphics.print("Parede Y: " .. tostring(bloco.y) .. "\nParede X: " .. tostring(bloco.x), 10, 60);
    end
    love.graphics.print('M - menu', 715, 10);

    if ColisaoP == true then
        love.graphics.print('F - Abrir Posto', 715, 30); 
    end


    Cam:attach()
        Inseto:draw();
        bloco:draw();
        bloco1:draw();
        posto_troca:draw();
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
        Cam:lockPosition(Inseto.x, Inseto.y)
    end

    ColisaoP = false;
    for shape, delta in pairs(HC.collisions(posto_troca.body)) do
		ColisaoP = true;
	end

    ColisaoP = false;
    for shape, delta in pairs(HC.collisions(posto_troca.body)) do
		ColisaoP = true;
	end

end