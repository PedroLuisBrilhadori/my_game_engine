Inseto = {}

function Inseto:load() 
    -- posição do inseto
    self.x = Height / 2;
    self.y = Width / 2;
    
    -- movimento
	self.colisao = 'não';
    self.speed = 150;

    self.moviment = 'stop'

    -- tamanho do inseto 
    self.width = 15;
    self.height = 15;
    self.body = HC.rectangle(self.x, self.y, self.width, self.height);
end

function Inseto:update(dt)
	if love.keyboard.isDown("w") and self.moviment ~= 'down' then
        self.moviment = 'up'
	elseif love.keyboard.isDown("s") and self.moviment ~= 'up' then
        self.moviment = 'down'
	elseif love.keyboard.isDown("a") and self.moviment ~= 'rigth' then
        self.moviment = 'left'
	elseif love.keyboard.isDown("d") and self.moviment ~= 'left' then
        self.moviment = 'rigth'
	end

    if self.moviment == 'left' then 
		self.x = self.x - self.speed * dt;
    elseif self.moviment == 'rigth' then
		self.x = self.x + self.speed * dt;

    elseif self.moviment == 'down' then
        self.y = self.y + self.speed * dt;
    elseif self.moviment == 'up' then
        self.y = self.y - self.speed * dt;
    elseif self.moviment == 'stop' then

    end


    -- move o "corpo" de colisão junto com a figura do inseto
    self.body:moveTo(self.x + (self.width/ 2), self.y + (self.height / 2));

	-- detecta colisão do inseto
	self.colisao = "não"
	for shape, delta in pairs(HC.collisions(self.body)) do
		self.colisao = "sim"
		self.x = self.x + delta.x;
		self.y = self.y + delta.y;
	end    
end


function Inseto:draw() 
    love.graphics.setColor(0.2, 0.7, 0.1, 1);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);
end