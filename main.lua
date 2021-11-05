----- GLOBAL VARS
HC = require('HC-master');
Json = require('cjson');
State = 'MENU';
Width = 600;
Height = 800;
Debug = true;


-------------- OBJECTS IN GAME
require('game/inseto')
require('game/objects/parede');
local bloco;
local bloco1;

------------------- SCENES 
-- MENU
require('game/scenes/menu');

-- OPTIONS 
require('game/scenes/options');


-------------- TRANSLATIONS 
local jsonRawPT = '';
local jsonRawEN = ''; 
Translations = {};

for linhas in io.lines('game/translations/portugues.json') do
    jsonRawPT = jsonRawPT .. linhas;
end        
for linhas in io.lines('game/translations/english.json') do
    jsonRawEN = jsonRawEN .. linhas;
end        

PT = Json.decode(jsonRawPT); 
EN = Json.decode(jsonRawEN);

Translations = PT;

function Translate()
    Menu:translate();
    Options:translate();
end  


------------ LOVE FUNCTIONS

function love.update (dt)
    if State == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 
    love.window.setTitle("jogo da formiga");

    --- SCENES 
    Menu:load();
    Options:load();
    
    Inseto:load();
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
        Options:draw();
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
            Debug = true;
        end
    end
end 

function love.mousepressed(x, y, button, istouch, presses)
    if State == 'MENU' and button == 1  and presses == 1 then
        Menu:update(x, y);
    elseif State == 'OPCOES' then
        Options:update(x, y);
    end 
end