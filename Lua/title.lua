utils = require("Lua.utils")

-- Global meeting table
titleTable = {}

-- Function sets all titles in table
function setGlobalTitle(titleString)
  local delimiter = ";"
  utils.tabulateString(titleString, titleTable, delimiter)
end

-- Function prints title to title frame
function printTitle()
  -- Get global title table size
	local numTitle = #titleTable

  -- Print title meeting in default color, normal size, italics
  tex.print("{ \\Huge ")
  for index, t in ipairs(titleTable) do
    tex.print( t )
    if index ~= numTitle then
      tex.print(" \\\\ ")
    end
  end
  tex.print(" }")
end

return {
  set = setGlobalTitle,
  titleframe = printTitle,
}
