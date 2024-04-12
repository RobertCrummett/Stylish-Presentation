utils = require("Lua.utils")

-- Global meeting table
meetingTable = {}

-- Function sets all meeting information in table
function setMeeting(frame, meetingString)
  local delimiter = ";"
  meetingTable[frame] = utils.tabulateString(meetingString, {}, delimiter)
end

-- Function prints meeting information
function printMeetingTitleFrame(tab)
  -- Get global meeting table size
	local numMeeting = #tab

  -- Print title meeting in default color, normal size, italics
  tex.print("\\textit{ \\normalsize ")
  for index, m in ipairs(tab) do
    tex.print(m)
    if index ~= numMeeting then
      tex.print(" \\\\ [-1mm] ")
    end
  end
  tex.print(" }")
end

function printMeeting(frame)
  local tab = meetingTable[frame]

  if frame == "title" then
    printMeetingTitleFrame(tab)
  end
end

return { set = setMeeting, print = printMeeting }
