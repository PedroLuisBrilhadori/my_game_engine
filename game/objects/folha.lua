Folha = {}

require('game/inseto');

local x = 250;
local y = 250;
local width = 10;
local height = 10;

function Folha:load()
    
    -- posição
    self.x = x;
    self.y = y;

    -- tamanho
    self.width = width;
    self.height = height;

    -- cor 
    self.r = 0;
    self.g = 0.8;
    self.b = 0;
    self.a = 1;

    -- configurações 
    self.colisao = false;
end

function Folha:update(dt)
    if Folha:checkColision() then
        self.x = 300;
    end
end

function Folha:checkColision()
    if self.x > (Inseto.x + Inseto.width) or Inseto.x > (self.x + self.width) then 
        self.colisao = false;
    end 
    if self.y > (Inseto.y + Inseto.height) or Inseto.y > (self.y + self.height) then
        self.colisao = false;
    end
    self.colisao = true;
end

function Folha:draw()
    love.graphics.setColor(self.r, self.g, self.b, self.a);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);
end
