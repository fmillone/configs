local M = {}

M.findSource = function(sources, name)
  for _, source in ipairs(sources) do
    if source.name == name then
      return source
    end
  end
  return nil
end

return M
