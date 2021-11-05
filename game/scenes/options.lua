Options = {}
require('game/objects/buttons');

-- OPTIONS BUTTONS;
local bntTranslatePT;
local bntTranslateEN;
local bntMenu;


function Options:load ()
    local buttonsHeight = 100;
    
    bntTranslateEN = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 40, buttonsHeight, 20, Translations.options.english, 0, 0, 1);
    bntTranslatePT = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 10, buttonsHeight, 20, Translations.options.portuguese, 0, 0.6, 0);
    bntMenu = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, Translations.options.menu, 0.5, 0, 0);
end

function Options:draw()
    bntTranslatePT:draw();
    bntTranslateEN:draw();
    bntMenu:draw();
end

function Options:translate()
    bntTranslatePT:translate(Translations.options.portuguese);
    bntTranslateEN:translate(Translations.options.english);
end

function Options:update(x, y)
    if bntTranslateEN:update(x, y) then 
        Translations = EN;
        Translate();
    end
    if bntTranslatePT:update(x, y) then
        Translations = PT;
        Translate();
    end
    if bntMenu:update(x, y) then
        State = 'MENU';
    end
end