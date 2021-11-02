Inseto = {}

function Inseto:load() 
    self.x = 400;
    self.y = 300;
    self.speed = 200;

    self.xvel = self.speed * math.cos(math.pi / 4);
    self.yvel = self.speed * math.sin(math.pi / 4);

    self.width = 20;
    self.height = 20;

end

function Inseto:update(dt)
    if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
		self.y = self.y - self.yvel * dt
		self.x = self.x - self.xvel * dt
	elseif love.keyboard.isDown("a") and love.keyboard.isDown("s") then
		self.y = self.y + self.yvel * dt
		self.x = self.x - self.xvel * dt
	elseif love.keyboard.isDown("s") and love.keyboard.isDown("d") then
		self.y = self.y + self.yvel * dt
		self.x = self.x + self.xvel * dt
	elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
		self.y = self.y - self.yvel * dt
		self.x = self.x + self.xvel * dt
	elseif love.keyboard.isDown("w") then
		self.y = self.y - self.speed * dt
	elseif love.keyboard.isDown("a") then
		self.x = self.x - self.speed * dt
	elseif love.keyboard.isDown("s") then
		self.y = self.y + self.speed * dt
	elseif love.keyboard.isDown("d") then
		self.x = self.x + self.speed * dt
	end
end


function Inseto:draw() 
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
end