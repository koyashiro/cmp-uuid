local cmp = require("cmp")
local uuid = require("cmp_uuid.uuid")

local source = {}

source.new = function()
  return setmetatable({}, { __index = source })
end

source.get_position_encoding_kind = function()
  return "utf-8"
end

source.get_trigger_characters = function()
  return { "u" }
end

source.get_keyword_pattern = function()
  return [[\k\+]]
end

source.complete = function(_, _, callback)
  local items = {
    {
      label = "uuid",
      insertText = uuid.uuid_v4(),
      documentation = {
        kind = cmp.lsp.MarkupKind.PlainText,
        value = "Generate UUIDv4.",
      },
    },
  }
  callback(items)
end

return source
