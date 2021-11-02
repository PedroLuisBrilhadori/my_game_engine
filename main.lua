HC = require('HC-master');
require('game/inseto')
require('game/parede');

local state = 'MENU';
local debug = false;

Width = 600;
Height = 800;
 
function love.update (dt)
    if state == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 
    love.window.setTitle("jogo da formiga");
    Inseto:load();
    Parede:load(100, 200, 200, 10, 255, 0, 0);
end

function love.draw()

    if state == 'MENU' then
        love.graphics.print('1 - Começar \n2 - Opções \nEsc - Sair', 400, 300);
    elseif state == 'JOGAR' then
        love.graphics.print('M - menu', 700, 10);
        Inseto:draw();
        Parede:draw();
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
        if Inseto.debug then 
            Inseto.debug = false;
            Parede.debug = false;
        else
            Inseto.debug = true;
            Parede.debug = true;
        end
    end
end 