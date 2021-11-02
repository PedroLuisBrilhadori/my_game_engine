local parede = {}

parede['x'] = 0;
parede['y'] = 0;
parede['width'] = 0;
parede['height'] = 0;
parede['angle'] = 90;

parede['bug'] = false;

parede['r'] = 255;
parede['g'] = 255;
parede['b'] = 255;
parede['a'] = 255;

function parede:init (x, y, width, height, angle,...)
    parede.x = x;
    parede.y = y;
    parede.height = height;
    parede.width = width;
    parede.angle = angle;
    
    local r, g, b, a = ...;

    if isColor(r) then
        parede.r = r;
        if isColor(g) then 
            parede.g = g;
            if isColor(b) then
                parede.b = b;
                if isColor(a) then
                    parede.a = a;
                end
            end
        end
    end
end

function parede:bugavel(switch) 
    if switch then
        parede.bug = true
    else 
        parede.bug = false
    end
end

function parede:render()
    love.graphics.setColor(parede.r, parede.g, parede.b, parede.a);
    love.graphics.rectangle('fill', parede.x, parede.y, parede.width, parede.height);
    love.graphics.setColor(255, 255, 255, 255);
end

function isColor (a)
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

return parede
