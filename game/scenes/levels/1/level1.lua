require('game/objects/parede');
require('game/objects/folha');

local structure = {};
Level1_structure = {};


function Level1_structure:load()
    structure = {
        teste1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
        teste = Parede:new(100, 400, 200, 10, 1, 0, 0);
    }

    Folha:load();
end

function Level1_structure:disableAllColisions()
    for paredes, bloco in pairs(structure) do
        bloco:disableColision();
    end    
end

function Level1_structure:enableAllColisions()
    for paredes, bloco in pairs(structure) do
        bloco:enableColision();
    end     
end

function Level1_structure:draw()
    for paredes, bloco in pairs(structure) do
        bloco:draw();
    end  

    Folha:draw();  
end

function Level1_structure:update(dt)
    Folha:update(dt);

    if Inseto.type == BESOURO then
        Level1_structure:disableAllColisions();
    else  
        Level1_structure:enableAllColisions();
    end
    
end