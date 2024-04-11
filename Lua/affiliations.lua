utils = require("Lua.utils")

-- Global affiliations tabulated
affiliationTable = {}

-- Function sets all affiliations in table
function setAffiliation(frame, affiliationString)
  local delimiter = ";"
  affiliationTable[frame] = utils.tabulateString(affiliationString, {}, delimiter)
end

-- Function prints affiliations to title frame 
function printAffiliationTitleFrame(tab)
	local numAffiliations = #tab

  -- Print the first affiliation big
  tex.print("\\textit{ \\textcolor{cgemblue}{ " .. "{ \\Large " .. tab[1] .. " } \\")
  -- Fors all subsequent affiliations, print small below
  for index = 2, numAffiliations do
    tex.print("{ \\large " .. tab[index] .. " }"	)
    if index ~= numAffiliations then
      tex.print(" \\ ")
    end
  end
  tex.print(" }}")
end

-- Function prints affiliations to question frame 
function printAffiliationQuestionFrame(tab)
  -- Print the second affiliation small on the top of the page
  tex.print("\\textcolor{cgemblue}{")
  tex.print("{ \\footnotesize " .. tab[2] .. "} \\\\[2mm]")
  -- Then print the first affiliation big
  tex.print("{ \\Large " .. tab[1] .. "}}")
end

-- Function prints affiliation information to frame 'frame'
function printAffiliation(frame)
  local tab = affiliationTable[frame]

  if frame == "title" then
    printAffiliationTitleFrame(tab)
  elseif frame == "question" then
    printAffiliationQuestionFrame(tab)
  end
end

return { set = setAffiliation, print = printAffiliation }
