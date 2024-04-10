-- Module makes title

-- Splits string by delimiter 'sep' - default is white space
-- Wonderful function designed by user973713
-- https://stackoverflow.com/questions/1426954/split-string-in-lua
function splitString(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	t = {}
	local index = 1
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, index, str)
		index = index + 1
	end
	return t
end

-- Function print title
function printTitle(title)
	tex.print("{\\Huge " .. title .. "}")
end

-- Function prints authors
function printAuthors(authorsString)
  -- Seperate authors by comma delimiter
	local sep = ","
	local authors = splitString(authorsString, sep)
	local numAuthors = #authors

  -- In index order print authors
	tex.print("\\textcolor{cgemblue}{\\LARGE ")
	for index, a in ipairs(authors) do
		tex.print(a)
		if index ~= numAuthors then
			tex.print("\\\\[3mm] ")
		end
	end
	tex.print("}")
end

return { title = printTitle, author = printAuthors }
