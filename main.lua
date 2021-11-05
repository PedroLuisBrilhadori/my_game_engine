HC = require('HC-master');
Json = require('cjson');
require('game/inseto')
require('game/objects/parede');
require('game/objects/buttons');

local jsonRaw = ''; 
local translations;

local state = 'MENU';

-- MENU BUTTONS
local bntComecar;
local bntOpcoes;
local bntExit;

-- OBJECTS IN GAME
local bloco;
local bloco1;

Width = 600;
Height = 800;

Debug = true;
 
function love.update (dt)
    if state == 'MENU' then
        if bntComecar:update() then 
            state = 'JOGAR';
        end
        if bntOpcoes:update() then
            state = 'OPCOES'
        end
        if bntExit:update() then
            love.event.quit();
        end
    end
    if state == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 

    for linhas in io.lines('game/translations/portugues.json') do
        jsonRaw = jsonRaw .. linhas;
    end
    translations = Json.decode(jsonRaw);


    love.window.setTitle("jogo da formiga");
    Inseto:load();

    local buttonsHeight = 100
    
    bntComecar = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) - 40, buttonsHeight, 20, translations.menu.start, 0, 0.5, 0);
    bntOpcoes = Button:new((Height / 2) - buttonsHeight / 2, (Width / 2) - 10, buttonsHeight, 20, translations.menu.options, 0, 0, 1);
    bntExit = Button:new((Height / 2) - buttonsHeight /2, (Width / 2) + 20, buttonsHeight, 20, translations.menu.exit, 1, 0, 0);

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
        love.graphics.print('Opções \nM - menu', 400, 300);
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