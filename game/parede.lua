Parede = {}
Parede.__index = Parede;

local function isColor (a)
    if a ~= nil then 
        if a <= 255 and a >= 0 then
            return true;
        else 
            return false;
        end
    else 
        return false;
    end
end

function Parede:new(x, y ,width, height, ...)
    local self = setmetatable({}, Parede);
    
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;

    self.r = 255;
    self.g = 255;
    self.b = 255;
    self.a = 255;

    local r, g, b, a = ...;

    if isColor(r) then
        self.r = r;
        if isColor(g) then 
            self.g = g;
            if isColor(b) then
                self.b = b;
                if isColor(a) then
                    self.a = a;
                end
            end
        end
    end

    self.body = HC.rectangle(self.x, self.y, self.width, self.height)


    return self;
end

function Parede:draw()
    love.graphics.setColor(self.r, self.g, self.b, self.a);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(255,255,255,255);

    if Debug then
        self.body:draw();
        love.graphics.print("Parede Y: " .. tostring(self.y) .. "\nParede X: " .. tostring(self.x), 10, 50);
    end
end
