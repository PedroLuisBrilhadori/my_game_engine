menu = require("game/menu");


local state = 'MENU'


function love.update (dt)
    
end


function love.draw()
    if state == 'MENU' then
        love.graphics.print('1 - Começar \n2 - Opções \nEsc - Sair', 400, 300);
    elseif state == 'JOGAR' then
        love.graphics.print('Jogo \nM - menu', 400, 300);
    elseif state == 'OPCOES' then
        love.graphics.print('Opções \nM - menu', 400, 300);        
    end 
end


function love.keypressed(key)
    print(key);

    if key == "escape" then
        love.event.quit();
    elseif key == "1" then
        state = 'JOGAR'
    elseif key == "2" then
        state = 'OPCOES'
    elseif key == 'm' then
        state = 'MENU'
    end
end 
