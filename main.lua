require('game/inseto')

local state = 'MENU';
local debug = false;
 
function love.update (dt)
    if state == 'JOGAR' then
        Inseto:update(dt)
    end
end

function love.load() 
    love.window.setTitle("jogo da formiga");
    Inseto:load();
end

function love.draw()

    if state == 'MENU' then
        love.graphics.print('1 - Começar \n2 - Opções \nEsc - Sair', 400, 300);
    elseif state == 'JOGAR' then
        love.graphics.print('M - menu', 700, 10);
        Inseto:draw();
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
        if debug == true then 
            debug = false;
        else
            debug = true;
        end
    end
end 