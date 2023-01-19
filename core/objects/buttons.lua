Button = {};
Button.__index = Button;

local function isColor (a)
    if type(a) == type(1) then 
        if a <= 1 and a >= 0 then
            return true;
        else 
            return false;
        end
    else 
        return false;
    end
end

function Button:new(x, y, width, height, text, ...)
    local self = setmetatable({}, Button);

    self.x = x;
    self.y = y;
    
    self.width = width;
    self.height = height;

    self.text = text;

    self.textx = x ;
    self.texty = (y + (height / 2)) - 8;

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

    return self
end

function Button:translate(translate) 
    self.text = translate
end

function Button:update(x, y)
    if 
        x >= self.x and x <= (self.x + self.width) and
        y >= self.y and y <= (self.y + self.height)
    then
        return true
    end
end

function Button:draw()
    love.graphics.setColor(self.r, self.g, self.b, self.a);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);
    love.graphics.printf(self.text, self.textx, self.texty, self.width, "center");

end