utils = require("Lua.utils")

-- Global affiliations tabulated
affiliationTable = {}

-- Function sets all affiliations in table
function setGlobalAffiliations(affiliationString)
  local delimiter = ";"
  utils.tabulateString(affiliationString, affiliationTable, delimiter)
end

-- Function prints affiliations to title frame 
function printTitleAffiliations()
  -- Get global affiliations table size
	local numAffiliations = #affiliationTable

  if numAffiliations == 0 then -- No affiliations
    return 
  elseif numAffiliations == 1 then -- One main affiliation
    tex.print("\\textit{ \\textcolor{cgemblue}{ " .. 
      "{ \\Large " .. affiliationTable[1] .. " }}}")
  else -- More than one affiliation
    tex.print("\\textit{ \\textcolor{cgemblue}{ " .. 
      "{ \\Large " .. affiliationTable[1] .. " } \\")
    for index = 2, numAffiliations do
      tex.print("{ \\large " .. affiliationTable[index] .. " }"	)
      if index ~= numAffiliations then
        tex.print(" \\ ")
      end
	  end
	  tex.print(" }}")
  end
end

return { set = setGlobalAffiliations, titleframe = printTitleAffiliations }
