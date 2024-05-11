-- CGEM Presentation formatting package
--
-- Author: R Nate Crummett
-- Date: 5.10.24

bib = require("Lua.bib")
title = require("Lua.title")
authors = require("Lua.authors")
affiliations = require("Lua.affiliations")
meetingInfo = require("Lua.meetingInfo")
contact = require("Lua.contact")
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
