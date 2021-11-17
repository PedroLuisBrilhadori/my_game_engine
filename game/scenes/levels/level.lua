Level = {}

require('game/scenes/levels/1/level1');

function Level:load()
    Level1_structure:load();
end

function Level:update(dt) 
    Level1_structure:update(dt);
end

function Level:draw()
    Level1_structure:draw()
end