-- Split string 'str' by delimiter 'sep' and put into table 'tab'
function tabulateString(str, tab, sep)
  local index = 1
  for s in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(tab, index, s)
    index = index + 1
  end
end

return {
  tabulateString = tabulateString,
}
