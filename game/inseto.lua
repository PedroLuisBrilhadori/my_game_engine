local inseto = {}

inseto['x']  = 0;
inseto['y'] = 0;
inseto['width'] = 0;
inseto['height'] = 0;

inseto['dx'] = 0;
inseto['dy'] = 0;


function inseto:init(x, y, width, heigth) 
    inseto.x = x;
    inseto.y = y;
    inseto.width = width;
    inseto.height = heigth;
end

function inseto:update(dt)
    if inseto.dy < 0 then
        inseto.y = math.max(0, inseto.y + inseto.dy * dt)
    else
        inseto.y = math.min(VIRTUAL_HEIGHT - inseto.height, inseto.y + inseto.dy * dt)
    end


    if inseto.dx < 0 then
        inseto.x = math.max(0, inseto.x + inseto.dx * dt)
    else
        inseto.x = math.min(VIRTUAL_WIDTH - inseto.width, inseto.x + inseto.dx * dt)
    end

end


function inseto:render()
    love.graphics.rectangle('fill', inseto.x, inseto.y, inseto.width, inseto.height);
end

return inseto