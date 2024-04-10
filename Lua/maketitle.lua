-- Module makes title

-- Splits string by delimiter 'sep' - default is white space
-- Wonderful function designed by user973713
-- https://stackoverflow.com/questions/1426954/split-string-in-lua
function splitString(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end
