--Conway's Game Of Life in Love2D
--Created by Greenman

--fix for math.random generating the same number every time
math.randomseed(os.time())

local grid = {}

--creates the multi dimensional table
for i=1,20 do
  grid[i] = {}
  for j=1, 20 do
    grid[i][j] = {}
  end
end

--randomly makes each cell dead or alive
--true = alive, false = dead
for i=1,20 do
  for j=1, 20 do
    if math.random(0,1) > 0.05 then
      grid[i][j] = true
    else
      grid[i][j] = false
    end
  end
end

--returns the number of ALIVE neighbors around a cell
function getNeighbors(x,y)
  local count = 0
  for i=-1,1 do
    for j=-1,1 do
      if i ~= 0 or j ~= 0 then --excludes x+0,y+0 which is just the original cell
        if (x+i <= 20 and x+i > 0) and (y+j <= 20 and y+j > 0) then --prevents nil index errors
          if grid[x+i][y+j] == true then
            count = count+1 --increment the count if the neighbor cell is alive
          end
        end
      end
    end
  end
  return count --the number of alive neighbors
end

--updates based on standard rules

--[[
Rules:
    1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
    2. Any live cell with two or three live neighbours lives on to the next generation.
    3. Any live cell with more than three live neighbours dies, as if by overpopulation.
    4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    
    Source: https://en.wikipedia.org/wiki/Conway's_Game_of_Life
]]--
function updateGrid()
  for i=1,20 do
    for j=1,20 do
      if grid[i][j] == true then --rules for alive cells
        local n = getNeighbors(i,j)
        if n < 2 or n > 3 then --rules 1,2, and 3
          grid[i][j] = false
        end
      else --rules for dead cells
        local n = getNeighbors(i,j)
        if n == 3 then --rule 4
          grid[i][j] = true
        end
      end
    end
  end
end

function love.update(dt)
   if dt < 1/5 then 
      love.timer.sleep(1/5 - dt) --slows down the game enough to make each generation visible
   end
end

function love.draw()
  --grid lines
  for i=1,20 do
    love.graphics.line(i*20,100,i*20,500)
    love.graphics.line(0,i*20+100,400,i*20+100)
  end
  --draw the cells
  for i=1,20 do
    for j=1,20 do
      if grid[i][j] == true then
        love.graphics.rectangle("fill",j*20-20,i*20+80,20,20)
      end
    end
  end
  --text
  love.graphics.draw(love.graphics.newText(love.graphics.newFont(20),"Conway's Game Of Life: Love2D Edition"))
  love.graphics.draw(love.graphics.newText(love.graphics.newFont(20),"Created by Greenman"),100,50)
  --divider line between grid and top area
  love.graphics.line(0,100,400,100)
  --updates the grid after each draw cycle
  updateGrid()
end
