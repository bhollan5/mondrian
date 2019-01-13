require "scripts/particles"

piet = {}

piet.startPos = {3.5, 12}
piet.deathHeight = 30 -- in 32 px units
piet.deathHeight = piet.deathHeight * 32

piet.x = piet.startPos[1]
piet.y = piet.startPos[2]
piet.yVel = 0
piet.xVel = 0

piet.isGrounded = true
piet.hasDouble = true
piet.upKeyBuffer = true
piet.isSticky = false
piet.isBouncy = false
piet.isNormal = false

<<<<<<< HEAD
piet.contactType = "none"

piet.dead = false

piet.spd = 150
=======
piet.spd = 175
>>>>>>> 626f7b67d9bda3160d38ffa1d869702e67e3a197
piet.jumpHeight = -500


function piet:load(args)
    particles.color = {}

    particles:load(bluePart)


    self.body = love.physics.newBody(world.world, self.x * 16, self.y * 16, "dynamic", 0, 100)
    self.body:setLinearDamping(.5);
    

    self.shape = love.physics.newRectangleShape(16, 16)
    self.fixture = love.physics.newFixture(self.body, self.shape, 5)
    self.fixture:setFriction(0.75)
    self.fixture:setUserData("piet")

    -- self.body:setFixedRotation( true )

    --self.fixture:setRestitution(0.9)
end

function piet:update(dt)
    --redPart:update(dt)
    particles:update(dt)
    local halfJump = (self.jumpHeight / 2)

    self.xVel, self.yVel = self.body:getLinearVelocity()
    self.x, self.y = self.body:getPosition()

<<<<<<< HEAD
=======
    -- Pausing controls for dialogue
>>>>>>> 626f7b67d9bda3160d38ffa1d869702e67e3a197
    if love.keyboard.isDown("space") and dialogue.skipBuffer then
        dialogue:next()
        dialogue.skipBuffer = false
    elseif not love.keyboard.isDown("space") then
        dialogue.skipBuffer = true
    end
    if dialogue.showText then
        return
    end

    if love.keyboard.isDown("left") then
        self.body:setLinearVelocity(-self.spd, self.yVel)
    elseif love.keyboard.isDown("right") then
        self.body:setLinearVelocity(self.spd, self.yVel)
    elseif self.isGrounded == true then 
        self.body:setLinearVelocity(self.xVel, self.yVel)
    else
        self.body:setLinearVelocity(self.xVel, self.yVel)
    end

    if love.keyboard.isDown("up") and (self.isGrounded or (self.hasDouble and self.upKeyBuffer)) then 

        if (self.isGrounded) then
             -- Normal jump
            self.body:applyLinearImpulse(0, self.jumpHeight)

            self.isGrounded = false
            self.upKeyBuffer = false
        else
            self.body:setLinearVelocity(self.xVel, self.jumpHeight)
            self.hasDouble = false 
        end
    end
    if love.keyboard.isDown("up") and ((self.isSticky) and (self.isGrounded)) then
        self.body:applyLinearImpulse(0, halfJump)
    elseif not (love.keyboard.isDown("up") and ((self.isSticky) and (self.isGrounded))) then
        if love.keyboard.isDown("up") and (self.isSticky) then
            self.body:setLinearVelocity(self.xVel, -self.spd)
        elseif not (love.keyboard.isDown("up") and (self.isSticky)) then
            if love.keyboard.isDown("left") and (self.isSticky) then
                self.body:setLinearVelocity(-self.spd, self.yVel)
            elseif not (love.keyboard.isDown("left") and (self.isSticky)) then
                if love.keyboard.isDown("right") and (self.isSticky) then
                    self.body:setLinearVelocity(self.spd, self.yVel)
                end
            end
        end
    end
    if not love.keyboard.isDown("up") then
        self.upKeyBuffer = true
    end

    -- Handling death
    --if (self.dead) then
    --self.body:setPosition( self.startPos[1], self.startPos[2] )
    if self.dead then
        self.body:setPosition( self.startPos[1] * 16, self.startPos[2] * 16 )
        self.body:setLinearVelocity(0, 0)
        piet:draw()
        self.dead = false
    end

    -- Fall damage
    if self.y > (self.deathHeight) then
        self.dead = true
    end
end

function piet:draw()

    love.graphics.draw(redPart, self.x, self.y, 0, 0.5, 0.5) 
    drawColor(blue)   
    love.graphics.draw(bluePart, self.x, self.y, 0, 0.5, 0.5)
    
    if (self.isSticky) then
        drawColor('yellow')
        love.graphics.draw(yellowPart, self.x, self.y, 0, 0.5, 0.5)
    elseif not (self.isSticky) then
        if (self.isNormal) then
            drawColor('black')
            love.graphics.draw(blackPart, self.x, self.y, 0, 0.5, 0.5)
        elseif not ((self.isNormal) or (self.isSticky)) then
            if (self.isBouncy) then
                drawColor('blue')
                love.graphics.draw(bluePart, self.x, self.y, 0, 0.5, 0.5)
            end
        end  
    end 

        
    

    -- if (contactType == "sticky") then

    -- elseif contactType == "normal" then

    -- elseif


    
    love.graphics.setColor(0,0,0, 1)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))

end

function piet:death() 
    self.dead = true
end