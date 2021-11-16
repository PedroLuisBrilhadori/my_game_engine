Game = {}

require('game/inseto');
require('game/objects/parede');
require('game/objects/posto_troca');
require('game/scenes/levels/level');

local posto_troca;


function Game:load()
    Cam = Camera();
    Inseto:load();
    Level:draw();

    posto_troca = Posto_troca:new(100, 300, 50, 50, 1, 1, 1);
end

function Game:draw()
    if Debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x) .. "\nColisão: " ..  Inseto.colisao), 10, 0);
        love.graphics.print("Tipo do inseto:" .. tostring(Inseto.type), 10, 60);
    end
    love.graphics.print('M - menu', 715, 10);

    if ColisaoP == true then
        love.graphics.print('F - Abrir Posto', 715, 30); 
        Posto_troca:Abrir()
    end


    Cam:attach()
        Level:draw();
        Inseto:draw();
        posto_troca:draw();
    Cam:detach()

end

function Game:update(dt)
    Inseto:update(dt);
    
    if Inseto.colisao == true then
        Cam:lockPosition(Inseto.x, Inseto.y)
    else 
        Cam:lookAt(Inseto.x, Inseto.y);
    end

    Level:update(dt);

    ColisaoP = false;
    for shape, delta in pairs(HC.collisions(posto_troca.body)) do
		ColisaoP = true;
	end
end