MenuP = {}
require('game/objects/buttons');
require('game/inseto')

-- MENU BUTTONS
local btnFormiga;


function MenuP:load()
    local buttonsHeight = 100 
    
    btnFormiga = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 40, buttonsHeight, 20, Translations.insetos.ant, 0, 0.6, 0);
end

function MenuP:draw()
    btnFormiga:draw();
end

function MenuP:update(x, y)
    if btnFormiga:update(x, y) then 
        Inseto.type = INSETO_PADRAO;
        State = 'JOGAR';
    end
end

function MenuP:translate()
    btnFormiga:translate(Translations.insetos.ant);
end