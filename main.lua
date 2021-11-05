HC = require('HC-master');
Json = require('cjson');
require('game/inseto')
require('game/objects/parede');
require('game/objects/buttons');

local jsonRawPT = '';
local jsonRawEN = ''; 
local translations;

local state = 'MENU';

-- MENU BUTTONS
local bntComecar;
local bntOpcoes;
local bntExit;

-- OPTIONS BUTTONS;
local bntTranslatePT;
local bntTranslateEN;
local bntMenu;

-- OBJECTS IN GAME
local bloco;
local bloco1;

Width = 600;
Height = 800;

Debug = true;

for linhas in io.lines('game/translations/portugues.json') do
    jsonRawPT = jsonRawPT .. linhas;
end        
for linhas in io.lines('game/translations/english.json') do
    jsonRawEN = jsonRawEN .. linhas;
end        

PT = Json.decode(jsonRawPT); 
EN = Json.decode(jsonRawEN);

translations = PT;

local function translate()
    bntComecar:translate(translations.menu.start);
    bntOpcoes:translate(translations.menu.options);
    bntExit:translate(translations.menu.exit);

    bntTranslatePT:translate(translations.options.portuguese);
    bntTranslateEN:translate(translations.options.english);
end  


function love.update (dt)
    if state == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 

    love.window.setTitle("jogo da formiga");
    Inseto:load();

    local buttonsHeight = 100 
    
    bntComecar = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 40, buttonsHeight, 20, translations.menu.start, 0, 0.6, 0);
    bntOpcoes = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 10, buttonsHeight, 20, translations.menu.options, 0, 0, 1);
    bntExit = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, translations.menu.exit, 1, 0, 0);

    bntTranslateEN = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 40, buttonsHeight, 20, translations.options.english, 0, 0, 1);
    bntTranslatePT = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 10, buttonsHeight, 20, translations.options.portuguese, 0, 0.6, 0);
    bntMenu = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, translations.options.menu, 0.5, 0, 0);

    bloco1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    bloco = Parede:new(100, 400, 200, 10, 1, 0, 0);
end

function love.draw()

    if state == 'MENU' then
        bntComecar:draw();
        bntOpcoes:draw();
        bntExit:draw();
    elseif state == 'JOGAR' then
        love.graphics.print('M - menu', 700, 10);
        Inseto:draw();
        bloco:draw();
        bloco1:draw()
    elseif state == 'OPCOES' then
        bntTranslatePT:draw();
        bntTranslateEN:draw();
        bntMenu:draw();
    end 
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit();
    elseif key == "1" then
        state = 'JOGAR'
    elseif key == "2" then
        state = 'OPCOES'
    elseif key == 'm' then
        state = 'MENU'
    elseif key == 'o' then
        if Debug then 
            Debug = false;
        else
            Debug = true
        end
    end
end 

function love.mousepressed(x, y, button, istouch, presses)
    if state == 'MENU' and button == 1  and presses == 1 then
        if bntComecar:update(x, y) then 
            state = 'JOGAR';
        end
        if bntOpcoes:update(x, y) then
            state = 'OPCOES'
        end
        if bntExit:update(x,y) then
            love.event.quit();
        end
    elseif state == 'OPCOES' then
        if bntTranslateEN:update(x, y) then 
            translations = EN;
            translate();
        end
        if bntTranslatePT:update(x, y) then
            translations = PT;
            translate();
        end
        if bntMenu:update(x, y) then
            state = 'MENU';
        end
    end 
end