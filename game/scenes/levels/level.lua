Level1 = {}

require('game/scenes/levels/1/level1');

function Level1:update(dt) 
    if Inseto.type == BESOURO then
        Level1_structure:disableAllColisions();
    else  
        Level1_structure:enableAllColisions();
    end
end

function Level1:draw()
    Level1_structure:drawAll()
end