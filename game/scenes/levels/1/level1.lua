require('game/objects/parede');
require('game/objects/folha');

local paredes = {};
local luzes = {};
Level1_structure = {};


function Level1_structure:load()
    paredes = {
        teste1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
        teste = Parede:new(100, 400, 200, 10, 1, 0, 0);
    }

    luzes = {
        teste = Parede:new(200, 600, 200, 10);
    }

    Folha:load();
end

function Level1_structure:disableAllColisions()
    for i, bloco in pairs(paredes) do
        bloco:disableColision();
    end    
end

function Level1_structure:enableAllColisions()
    for i, bloco in pairs(paredes) do
        bloco:enableColision();
    end     
end

function Level1_structure:draw()
    for i, bloco in pairs(paredes) do
        bloco:draw();
    end  

    for i, luzes in pairs(luzes) do 
        luzes:draw();
    end

    Inseto:draw();
    Folha:draw();
end

function Level1_structure:update(dt)
    Folha:update(dt);

    if Inseto.fl then
        Level1_structure:disableAllColisions();
    else  
        Level1_structure:enableAllColisions();
    end
end