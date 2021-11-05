HC = require('HC-master');
require('game/inseto')
require('game/objects/parede');
require('game/objects/buttons');

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
    love.window.setTitle("jogo da formiga");
    Inseto:load();
    
    bntComecar = Button:new((Height / 2) - 40, (Width / 2) - 40, 80, 20, "Começar", 0, 0.5, 0);
    bntOpcoes = Button:new((Height / 2) - 40, (Width / 2) - 10, 80, 20, "Opções", 0, 0, 1);
    bntExit = Button:new((Height / 2) - 40, (Width / 2) + 20, 80, 20, "Sair", 1, 0, 0);

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