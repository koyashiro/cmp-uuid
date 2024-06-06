local M = {}

math.randomseed(os.time())

-- Ref: https://gist.github.com/jrus/3197011
local function uuid_v4()
  local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
  return string.gsub(template, "[xy]", function(c)
    local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
    return string.format("%x", v)
  end)
end

M.uuid_v4 = uuid_v4

return M
