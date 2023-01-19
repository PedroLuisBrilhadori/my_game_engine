require('core/objects/parede');
require('game/objects/comida');

local paredes = {};
Level1_structure = {};

function Level1_structure:load()

    local structureJSON = '';

for linhas in io.lines('./test.json') do
    structureJSON = structureJSON .. linhas;
end        

local objects = Json.decode(structureJSON);

    for i, parede in pairs(objects.objects.paredes) do 
        if parede then 
            table.insert(paredes, Parede:new(parede.x, parede.y, parede.width, parede.height, parede.r, parede.g, parede.b, parede.a));
        end
    end

    Comida:load();
end

function Level1_structure:draw()
    for i, bloco in pairs(paredes) do
        bloco:draw();
    end  

    Inseto:draw();
    Comida:load()
end

function Level1_structure:update(dt)
end