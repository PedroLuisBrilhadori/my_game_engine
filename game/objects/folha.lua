Folha = {}

local x = 250;
local y = 250;
local width = 10;
local height = 10;

function Folha:load()
    
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;

    self.r = 0;
    self.g = 0.8;
    self.b = 0;
    self.a = 1;

    self.body = HC.rectangle(self.x, self.y, self.width, self.height)
end


function Folha:draw()
    love.graphics.setColor(self.r, self.g, self.b, self.a);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);
end
