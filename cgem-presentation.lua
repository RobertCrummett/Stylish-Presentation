-- CGEM Presentation formatting package
--
-- Author: R Nate Crummett
-- Date: 5.10.24

affiliations = require("Lua.affiliations")
authors = require("Lua.authors")
bib = require("Lua.bib")
contact = require("Lua.contact")
meetingInfo = require("Lua.meetingInfo")
title = require("Lua.title")
variable = require("Lua.variables")

return {
  bib = bib,
  title = title,
  authors = authors,
  affiliations = affiliations,
  meetingInfo = meetingInfo,
  contact = contact,
  variable = variable,
}
