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
    love.graphics.print("velocidade: ".. tostring(VELOCIDADE_INSETO), 10, 95); 
    love.graphics.print("colisão: ".. tostring(player.collides(0, bloco)), 10, 110); 


    
    love.graphics.print("parede X: ".. tostring(bloco.x), 10, 200); 
    love.graphics.print("parede Y: ".. tostring(bloco.y), 10, 215); 
    love.graphics.print("parede BUGAVEL: ".. tostring(bloco.bug), 10, 230); 
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

        player.collides(0, bloco);

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
    elseif key == '9' then
        VELOCIDADE_INSETO = VELOCIDADE_INSETO + 10;
    elseif key == '8' then  
        VELOCIDADE_INSETO = VELOCIDADE_INSETO - 10;
    end
end 