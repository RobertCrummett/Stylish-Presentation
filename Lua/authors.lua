utils = require("Lua.utils")

-- All authors tabulated
authorTable = {}

-- Function sets all authors in table
function setGlobalAuthors(authorString)
  local delimiter = ";"
  utils.tabulateString(authorString, authorTable, delimiter)
end

-- Function prints authors on title frame
function printTitleAuthors()
  -- Get global authors table size
	local numAuthors = #authorTable

  -- In index order print authors
	tex.print("\\textcolor{cgemblue}{\\LARGE ")
	for index, a in ipairs(authorTable) do
    -- Hyperlink title page and authors in question slide
		tex.print("\\hyperlink{" .. index .. "}{ " .. a .. " }")
		if index ~= numAuthors then
			tex.print(" \\\\[3mm] ")
		end
	end
	tex.print("}")
end

-- Function prints authors on question frame
function printQuestionAuthors()
  -- Get global authors table size
	local numAuthors = #authorTable

  -- In index order print authors
	tex.print("\\textcolor{cgemblue}{\\small ")
	for index, a in ipairs(authorTable) do
    -- Hyperlink title page and authors in question slide
		tex.print("\\hypertarget{" .. index .. "}{ " .. a .. " }")
		if index ~= numAuthors then
			tex.print(" \\\\[-2mm] ")
		end
	end
	tex.print("}")
end

return { 
  set = setGlobalAuthors, 
  titleframe = printTitleAuthors,
  questionframe = printQuestionAuthors,
}
