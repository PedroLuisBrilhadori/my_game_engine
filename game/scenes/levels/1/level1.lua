require('game/objects/parede');

Level1_structure = {
    teste1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    teste = Parede:new(100, 400, 200, 10, 1, 0, 0);
}

function Level1_structure:disableAllColisions()
    for paredes, bloco in pairs(Level1_structure) do
        if not (paredes == 'disableAllColisions' or paredes == 'drawAll' or paredes == 'enableAllColisions') then
            bloco:disableColision();
        end
    end    
end

function Level1_structure:enableAllColisions()
    for paredes, bloco in pairs(Level1_structure) do
        if not (paredes == 'disableAllColisions' or paredes == 'drawAll' or paredes == 'enableAllColisions') then
            bloco:enableColision();
        end
    end     
end


function Level1_structure:drawAll()
    for paredes, bloco in pairs(Level1_structure) do
        if not (paredes == 'drawAll' or paredes == 'disableAllColisions' or paredes == 'enableAllColisions') then        
            bloco:draw();
        end
    end    
end