local Utils = {}

function Utils.printTable(table)
  print("[")
  for key, value in pairs(table) do
    print("{", key,":", value, "},")
  end
  print("]")
end

function Utils.readPuzzle(filename)
  local file = io.open(filename, "r")
  if not file then return nil end
  local content = file:read("*all")
  file:close()
  local t={}
  for str in string.gmatch(content, ".") do
    table.insert(t, str)
  end
  return t
end

return Utils
