require('core/objects/parede');
require('core/objects/folha');

local paredes = {};
local luzes = {};
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

    for i, parede in pairs(objects.objects.luzes) do 
        if parede then 
            table.insert(luzes, Parede:new(parede.x, parede.y, parede.width, parede.height, parede.r, parede.g, parede.b, parede.a));
        end
    end

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

    if Inseto.fly then
        Level1_structure:disableAllColisions();
    else  
        Level1_structure:enableAllColisions();
    end
end