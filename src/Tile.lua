--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    
    -- shiny variation of a tile
    self.shiny = math.random(8) == 1 and true or false
    self.shinybool = self.shiny

    -- whill be used to draw a 'blinking' effect
    Timer.every(0.25, function()
        if self.shinybool then
            self.shiny = not self.shiny
        end
    end)
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34/255, 32/255, 52/255, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y) 

    -- if shiny then draw a star (ellipses) in the top right of tile
    if self.shinybool then
        love.graphics.setColor(174/255,187/255,255/255,1)
        love.graphics.ellipse('fill', self.x + 24 + x, self.y + 8 + y, 1,4)
        love.graphics.ellipse('fill', self.x + 24 + x, self.y + 8 + y, 4,1) 
    end

    -- this alternates bettwn true and false so we draw a 'blinking' effect
    if self.shiny then
        love.graphics.setColor(174/255,187/255,255/255,1)
        love.graphics.ellipse('fill', self.x + 24 + x, self.y + 8 + y, 1,5)
        love.graphics.ellipse('fill', self.x + 24 + x, self.y + 8 + y, 5,1)  
    end
end
