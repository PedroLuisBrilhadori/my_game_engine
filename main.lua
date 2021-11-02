inseto = require('game/inseto');
parede = require('game/parede');

local state = 'MENU';
local debug = true;

VIRTUAL_WIDTH = 800;
VIRTUAL_HEIGHT = 600;

VELOCIDADE_INSETO = 200;

local player = inseto;
local bloco = parede;

local debugMode = {}
function debugMode:render() 
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10);
    love.graphics.print("player X: ".. tostring(player.x), 10, 25); 
    love.graphics.print("player Y: ".. tostring(player.y), 10, 40); 
    love.graphics.print("player DX: ".. tostring(player.dx), 10, 65); 
    love.graphics.print("player DY: ".. tostring(player.dy), 10, 80); 
end
 
function love.update (dt)
    if state == 'JOGAR' then

        if love.keyboard.isDown('s') then
            player.dy = VELOCIDADE_INSETO;
        elseif love.keyboard.isDown('w') then
            player.dy = -VELOCIDADE_INSETO;
        elseif love.keyboard.isDown('d') then
            player.dx = VELOCIDADE_INSETO;
        elseif love.keyboard.isDown('a') then
            player.dx = -VELOCIDADE_INSETO;
        else
            player.dx = 0;
            player.dy = 0;
        end

        player.update(0, dt);
    end
end

function love.load() 
    love.window.setTitle("jogo da formiga");
    
    player.init(0, 400, 300, 20, 20);
    bloco.init(0, 300, 100, 100, 20, 255, 90, 0, 0);
end

function love.draw()


    if state == 'MENU' then
        love.graphics.print('1 - Começar \n2 - Opções \nEsc - Sair', 400, 300);
        if debug == true then
            debugMode.render();
        end
    elseif state == 'JOGAR' then
        love.graphics.print('M - menu', 700, 10);
        player.render();
        bloco.render();
        if debug == true then
            debugMode.render()  
        end
    elseif state == 'OPCOES' then
        love.graphics.print('Opções \nM - menu', 400, 300);
        if debug == true then
            debugMode.render(); 
        end
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
        if debug == true then 
            debug = false;
        else
            debug = true;
        end
    end
end 