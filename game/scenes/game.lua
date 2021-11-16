Game = {}

require('game/inseto');
require('game/scenes/levels/level');

function Game:load()
    Cam = Camera();
    Inseto:load();
end

function Game:draw()
    if Debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(Inseto.y)) .. "\nPlayer X: " .. tostring(math.floor(Inseto.x) .. "\nColisão: " ..  Inseto.colisao), 10, 0);
        love.graphics.print("Tipo do inseto:" .. tostring(Inseto.type), 10, 60);
    end
    love.graphics.print('M - menu', 730, 10);


    Cam:attach()
        Level:draw();
        Inseto:draw();
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
end