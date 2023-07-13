local Utils = require "utils"

local t = Utils.readPuzzle("2015")

local function containsElement(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

-- a function that loop through the table and count the number of houses visited

function CountHouses(n)
  local santaPosition = {x = 0, y = 0}
  local botPosition = {x = 0, y = 0}
  local visitedSanta = {}
  local visitedBot = {}
  table.insert(visitedSanta, santaPosition.x..","..santaPosition.y)

  for i=1, #n do
    if i % 2 == 1 then
      if n[i] == "^" then
        santaPosition.y = santaPosition.y + 1
      elseif n[i] == "v" then
        santaPosition.y = santaPosition.y - 1
      elseif n[i] == ">" then
        santaPosition.x = santaPosition.x + 1
      elseif n[i] == "<" then
        santaPosition.x = santaPosition.x - 1
      end
      local santaPosString = santaPosition.x..","..santaPosition.y

      if not containsElement(visitedSanta, santaPosString) then
        if not  containsElement(visitedBot, santaPosString) then
          table.insert(visitedBot, santaPosString)
        end
      end
    else
      if n[i] == "^" then
        botPosition.y = botPosition.y + 1
      elseif n[i] == "v" then
        botPosition.y = botPosition.y - 1
      elseif n[i] == ">" then
        botPosition.x = botPosition.x + 1
      elseif n[i] == "<" then
        botPosition.x = botPosition.x - 1
      end
      local botPosString = botPosition.x..","..botPosition.y
      if not containsElement(visitedBot, botPosString) then
        if not containsElement(visitedSanta, botPosString) then
          table.insert(visitedBot, botPosString)
        end
      end
    end
  end

  print("visited santa ->")
  Utils.printTable(visitedSanta)
  print("visited bot ->")
  Utils.printTable(visitedBot)
  return #visitedSanta + #visitedBot
end

print(CountHouses(t))
