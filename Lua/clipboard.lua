package.path = package.path .. ";./Lua/Lib/?.so"
print(package.path)

local pboard = require("pboard")
function clip(filepath)
  -- Add shared library for interfacing with Mac OS clip board
 
  -- Count lines in file
  local file = io.open(filepath, "r")
  local numberLines = 0
  
  for line in file:lines() do
    numberLines = numberLines + 1
  end
  
  file:close()

  -- Concatenate lines
  local stringFromPath = ""
  local file = io.open(filepath, "r")
  
  local count = 0
  for line in file:lines() do
    count = count + 1
    stringFromPath = stringFromPath .. line
    if count ~= numberLines then
      stringFromPath = stringFromPath .. "\n"  
    end
  end
  
  file:close()

  -- Add text to clipboard
  pboard.set(stringFromPath)
end

clip("../Clipboard/test.py")

return { clip = clip }
