----- GLOBAL VARS
HC = require('HC-master');
Camera = require('camera');
Json = require('json');
State = 'MENU';
Width = 600;
Height = 800;
Debug = true;

------------------- SCENES 
-- MENU
require('game/scenes/menu');

-- OPTIONS 
require('game/scenes/options');

-- GAME
require('game/scenes/game');

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
        Game:update(dt);
    end
end

function love.load() 
    love.window.setTitle("jogo da formiga");

    --- SCENES 
    Menu:load();
    Options:load();
    Game:load();

    --- CAMERA
    local cam = Camera()
end

function love.draw()

    if State == 'MENU' then
        Menu:draw();
    elseif State == 'JOGAR' then
        Game:draw();
    elseif State == 'OPCOES' then
        Options:draw();
    end 
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit();
    elseif key == "1" then
        State = 'JOGAR';
    elseif key == "2" then
        State = 'OPCOES';
    elseif key == 'm' then
        State = 'MENU';
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