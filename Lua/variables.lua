VARIABLES = {}

function logVariable(name, var, description, units)
  -- Add name value pair to global VARIABLE table
  VARIABLES[name] = {var, description, units}
end

function printVariables()
  -- Alphabetical sorting of variables
  a = {}
  for n in pairs(VARIABLES) do
    table.insert(a, n)
  end
  table.sort(a)
  for i, n in ipairs(a) do
    line = VARIABLES[n]
    tex.print(string.format(" %s & %s & %s \\\\ ", line[1], line[2], line[3]))
  end
end

return {
  log = logVariable,
  print = printVariables,
}
