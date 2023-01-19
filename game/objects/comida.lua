Comida = {}

function Comida:load() 
    -- posição do Comida
    self.x = Height / 2;
    self.y = Width / 2;
    
    -- movimento
	self.colisao = 'não';

    -- tamanho do Comida 
    self.width = 15;
    self.height = 15;
    self.body = HC.rectangle(self.x, self.y, self.width, self.height);
end

function Comida:update(dt)

	-- detecta colisão do Comida
	self.colisao = "não"
	for shape, delta in pairs(HC.collisions(self.body)) do
		self.colisao = "sim"
        Comida:randomPosition()
	end    
end


function Comida:randomPosition()
    self.x = math.random(10, 790)
    self.y = math.random(10, 590)
end


function Comida:draw() 
    love.graphics.setColor(0.2, 0.7, 0.1, 1);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);
end