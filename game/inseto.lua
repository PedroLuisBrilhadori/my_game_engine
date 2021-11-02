Inseto = {}

function Inseto:load() 
    self.x = 400;
    self.y = 300;
    self.speed = 200;

    self.xvel = self.speed * math.cos(math.pi / 4);
    self.yvel = self.speed * math.sin(math.pi / 4);

    self.width = 20;
    self.height = 20;

    self.body = HC.rectangle(self.x, self.y, self.width, self.height);
    
    self.debug = true;
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

    -- impede que o inseto passe para o lado de fora 

    if self.y < 0 then 
        self.y = 0;
    end
    if self.x < 0 then
        self.x = 0;
    end
    if self.y > Width - self.width then 
        self.y = Width - self.width;
    end
    if self.x > Height - self.height then 
        self.x = Height - self.height;
    end

end


function Inseto:draw() 
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);

    if self.debug then 
        love.graphics.print("Player Y: " .. tostring(math.floor(self.y)) .. "\nPlayer X: " .. tostring(math.floor(self.x)), 10, 10);
    end
end