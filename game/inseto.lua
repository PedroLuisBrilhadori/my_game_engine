Inseto = {}

function Inseto:load() 
    self.x = Height / 2;
    self.y = Width / 2;
    self.speed = 600;

    self.xvel = self.speed * math.cos(math.pi / 4);
    self.yvel = self.speed * math.sin(math.pi / 4);

    self.width = 20;
    self.height = 20;

    self.body = HC.rectangle(self.x, self.y, self.width, self.height);
end

function Inseto:update(dt)
    if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
		self.y = self.y - self.yvel * dt;
		self.x = self.x - self.xvel * dt;
	elseif love.keyboard.isDown("a") and love.keyboard.isDown("s") then
		self.y = self.y + self.yvel * dt;
		self.x = self.x - self.xvel * dt;
	elseif love.keyboard.isDown("s") and love.keyboard.isDown("d") then
		self.y = self.y + self.yvel * dt;
		self.x = self.x + self.xvel * dt;
	elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
		self.y = self.y - self.yvel * dt;
		self.x = self.x + self.xvel * dt;
	elseif love.keyboard.isDown("w") then
		self.y = self.y - self.speed * dt;
	elseif love.keyboard.isDown("a") then
		self.x = self.x - self.speed * dt;
	elseif love.keyboard.isDown("s") then
		self.y = self.y + self.speed * dt;
	elseif love.keyboard.isDown("d") then
		self.x = self.x + self.speed * dt;
	end

    -- move o "corpo" de colisão junto com a figura do inseto
    self.body:moveTo(self.x + (self.width/ 2), self.y + (self.height / 2));

end


function Inseto:draw() 
    love.graphics.setColor(0, 0, 1, 1);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1, 1, 1, 1);

end