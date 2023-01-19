Game = {}

require('game/objects/inseto');
require('game/scenes/levels/level');

function Game:load()
    Inseto:load();
    Level:load();
end

function Game:draw()
    Level:draw();
    if Debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x) .. "\nColisão: " ..  Inseto.colisao), 20, 20);
        love.graphics.print("Tipo do inseto:" .. tostring(Inseto.type) .. "\nInventario: " .. tostring(Inseto.inventory) .. "\nVoando: " .. tostring(Inseto.fly), 20, 80);
    end
    love.graphics.print('M - menu', 730, 10)

end

function Game:update(dt)
    Inseto:update(dt);

    Level:update(dt);
end