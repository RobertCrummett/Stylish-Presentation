utils = require("Lua.utils")

-- Global meeting table
meetingTable = {}

-- Function sets all meeting information in table
function setGlobalMeetingInfo(meetingString)
  local delimiter = ";"
  utils.tabulateString(meetingString, meetingTable, delimiter)
end

-- Function prints meeting information
function printTitleMeetingInfo()
  -- Get global meeting table size
	local numMeeting = #meetingTable

  -- Print title meeting in default color, normal size, italics
  tex.print("\\textit{ \\normalsize ")
  for index, m in ipairs(meetingTable) do
    tex.print( m )
    if index ~= numMeeting then
      tex.print(" \\\\ [-1mm] ")
    end
  end
  tex.print(" }")
end

return { set = setGlobalMeetingInfo, titleframe = printTitleMeetingInfo }
