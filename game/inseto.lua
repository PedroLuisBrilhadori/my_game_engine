Inseto = {}

function Inseto:load() 
    self.x = 400;
    self.y = 300;
    self.speed = 200;

    self.xvel = self.speed * math.cos(math.pi / 4);
    self.yvel = self.speed * math.sin(math.pi / 4);

    self.width = 20;
    self.height = 20;

<<<<<<< HEAD
    self.body = HC.rectangle(self.x, self.y, self.width, self.height);
    
    self.debug = true;

=======
>>>>>>> parent of 5bc3a07 (feat: adiciona limites ao 'mundo')
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

    -- move o corpo junto com a imagem 
    self.body:moveTo(self.x + 10, self.y + 10);

end


function Inseto:draw() 
    love.graphics.setColor(0, 0, 255, 255);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
    love.graphics.setColor(255, 255, 255, 255);

    if self.debug then 
        self.body:draw();
        love.graphics.print("Player Y: " .. tostring(math.floor(self.y)) .. "\nPlayer X: " .. tostring(math.floor(self.x)), 10, 10);
    end
end