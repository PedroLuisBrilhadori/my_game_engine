require('game/objects/parede');

local structure = {
    teste1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    teste = Parede:new(100, 400, 200, 10, 1, 0, 0);
}

Level1_structure = {}


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

function Level1_structure:drawAll()
    for paredes, bloco in pairs(structure) do
        bloco:draw();
    end    
end