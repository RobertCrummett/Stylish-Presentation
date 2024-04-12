utils = require("Lua.utils")

-- Global meeting table
titleTable = {}

-- Function sets all titles in table
function setTitle(frame, titleString)
  local delimiter = ";"
  titleTable[frame] = utils.tabulateString(titleString, {}, delimiter)
end

-- Function prints title to title frame
function printTitleTitleFrame(tab)
  -- Get global title table size
	local numTitle = #tab

  -- Print title meeting in default color, normal size, italics
  tex.print("{ \\Huge ")
  for index, t in ipairs(tab) do
    tex.print(t)
    if index ~= numTitle then
      tex.print(" \\\\ ")
    end
  end
  tex.print(" }")
end

function printTitle(frame)
  local tab = titleTable[frame]

  if frame == "title" then
    printTitleTitleFrame(tab)
  end
end

return {
  set = setTitle,
  print = printTitle,
}
