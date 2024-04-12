utils = require("Lua.utils")

-- All authors tabulated
contactTable = {}

-- Function sets all contact information in table
function setContact(contactString)
  local delimiter = ";"
  utils.tabulateString(contactString, contactTable, delimiter)
end

return { set = setContact }
