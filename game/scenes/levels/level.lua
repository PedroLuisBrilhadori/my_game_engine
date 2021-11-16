Level = {}

require('game/scenes/levels/1/level1');

function Level:update(dt) 
    if Inseto.type == BESOURO then
        Level1_structure:disableAllColisions();
    else  
        Level1_structure:enableAllColisions();
    end
end

function Level:draw()
    Level1_structure:drawAll()
end