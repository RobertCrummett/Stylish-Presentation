utils = require("Lua.utils")

-- All authors tabulated
authorTable = {}

-- Function sets all authors in table
function setAuthors(frame, authorString)
  local delimiter = ";"
  authorTable[frame] = utils.tabulateString(authorString, {}, delimiter)
end

-- Function prints authors on title frame
function printAuthorsTitleFrame(tab)
  -- Get global authors table size
	local numAuthors = #tab

  -- In index order print authors
	tex.print("\\textcolor{cgemblue}{\\LARGE ")
	for index, a in ipairs(tab) do
    -- Hyperlink title page and authors in question slide
		tex.print("\\hyperlink{" .. index .. "}{" .. a .. "}")
		if index ~= numAuthors then
			tex.print(" \\\\[3mm] ")
		end
	end
	tex.print("}")
end

-- Function prints authors on question frame
function printAuthorsQuestionFrame(tab)
  -- Get global authors table size
	local numAuthors = #tab
  local numContact = #contactTable

  -- In index order print authors
	tex.print("\\textcolor{cgemblue}{\\small ")
	for index, a in ipairs(tab) do
    -- Hyperlink title page and authors in question slide
		tex.print("\\hypertarget{" .. index .. "}{" .. a .. "}")
    if index <= numContact then
      tex.print(": \\href{" .. contactTable[index] .. "}{" .. contactTable[index] .. "}")
    end
		if index ~= numAuthors then
			tex.print(" \\\\ [-2mm] ")
		end
	end
	tex.print("}")
end

-- Function prints authors on specified frame 'frame'
function printAuthors(frame)
  local tab = authorTable[frame]

  if frame == "title" then
    printAuthorsTitleFrame(tab)
  elseif frame == "question" then
    printAuthorsQuestionFrame(tab)
  end
end


return { 
  set = setAuthors,
  print = printAuthors,
}
