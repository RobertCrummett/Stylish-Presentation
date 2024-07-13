-- Module to create bibliography
-- Wonderful idea by Skuost, Dec 5 2023
-- https://tex.stackexchange.com/questions/192917/include-all-bib-files-in-one-directory-to-a-bibliography

-- Function checks whether directory exists or not
local function isDir(name)
	if type(name) ~= "string" then
		return false
	end
	local cd = lfs.currentdir()
	local is = lfs.chdir(name) and true or false
	lfs.chdir(cd)
	return is
end


-- Lua function to collect *.bib files in Bib directory
local function findBibFiles(folder)
	local files = {}
	local lfs = require("lfs")
	if isDir(folder) then
		for file in lfs.dir(folder) do
			if file:match("%.bib$") then
				table.insert(files, folder .. "/" .. file)
			end
		end
	end
	return files
end

-- Function assembles bibliography
local function printBibResources(folder)
	-- Get all bib files in folder
	local files = findBibFiles(folder)

	-- For each file, add the file to the bibliography
	for _, file in ipairs(files) do
		tex.print("\\addbibresource{" .. file .. "}")
	end
end

return { make = printBibResources }
