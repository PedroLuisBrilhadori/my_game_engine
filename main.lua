HC = require('HC-master');
Json = require('cjson');
require('game/inseto')
require('game/objects/parede');
require('game/objects/buttons');
require('game/scenes/menu');

local jsonRawPT = '';
local jsonRawEN = ''; 
Translations = {};

State = 'MENU';


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

Translations = PT;

local function translate()
    Menu:translate();
    bntTranslatePT:translate(Translations.options.portuguese);
    bntTranslateEN:translate(Translations.options.english);
end  


function love.update (dt)
    if State == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 

    love.window.setTitle("jogo da formiga");
    Inseto:load();
    Menu:load();

    local buttonsHeight = 100 
    
    bntTranslateEN = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 40, buttonsHeight, 20, Translations.options.english, 0, 0, 1);
    bntTranslatePT = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 10, buttonsHeight, 20, Translations.options.portuguese, 0, 0.6, 0);
    bntMenu = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, Translations.options.menu, 0.5, 0, 0);

    bloco1 = Parede:new(100, 200, 200, 40, 1, 0.5, 0);
    bloco = Parede:new(100, 400, 200, 10, 1, 0, 0);
end

function love.draw()

    if State == 'MENU' then
        Menu:draw()
    elseif State == 'JOGAR' then
        love.graphics.print('M - menu', 700, 10);
        Inseto:draw();
        bloco:draw();
        bloco1:draw()
    elseif State == 'OPCOES' then
        bntTranslatePT:draw();
        bntTranslateEN:draw();
        bntMenu:draw();
    end 
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit();
    elseif key == "1" then
        State = 'JOGAR'
    elseif key == "2" then
        State = 'OPCOES'
    elseif key == 'm' then
        State = 'MENU'
    elseif key == 'o' then
        if Debug then 
            Debug = false;
        else
            Debug = true
        end
    end
end 

function love.mousepressed(x, y, button, istouch, presses)
    if State == 'MENU' and button == 1  and presses == 1 then
        Menu:update(x, y)
    elseif State == 'OPCOES' then
        if bntTranslateEN:update(x, y) then 
            Translations = EN;
            translate();
        end
        if bntTranslatePT:update(x, y) then
            Translations = PT;
            translate();
        end
        if bntMenu:update(x, y) then
            State = 'MENU';
        end
    end 
end