Menu = {}
require('game/objects/buttons');



-- MENU BUTTONS
local bntComecar;
local bntOpcoes;
local bntExit;


function Menu:load()
    local buttonsHeight = 100 
    
    bntComecar = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 40, buttonsHeight, 20, Translations.menu.start, 0, 0.6, 0);
    bntOpcoes = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 10, buttonsHeight, 20, Translations.menu.options, 0, 0, 1);
    bntExit = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, Translations.menu.exit, 1, 0, 0);
end

function Menu:draw()
    bntComecar:draw();
    bntOpcoes:draw();
    bntExit:draw();
end

function Menu:update(x, y)
    if bntComecar:update(x, y) then 
        State = 'JOGAR';
    end
    if bntOpcoes:update(x, y) then
        State = 'OPCOES'
    end
    if bntExit:update(x,y) then
        love.event.quit();
    end
end

function Menu:translate()
    bntComecar:translate(Translations.menu.start);
    bntOpcoes:translate(Translations.menu.options);
    bntExit:translate(Translations.menu.exit);
end