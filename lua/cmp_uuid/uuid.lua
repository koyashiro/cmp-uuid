local crypto = require("cmp_uuid.crypto")

local M = {}

--- Format UUID bytes to string.
--- @param bytes table
--- @return string
local function format(bytes)
  if #bytes ~= 16 then
    error("UUID must be 16 bytes")
  end

  return string.format("%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", unpack(bytes))
end

--- Generate UUID v4 string.
--- @return string
local function uuid_v4()
  local bytes = crypto.get_random_bytes(16)

  -- ver 0b0100
  bytes[7] = bit.bor(0x40, bit.band(0x0f, bytes[7]))

  -- var 0b10
  bytes[9] = bit.bor(0x80, bit.band(0x3f, bytes[9]))

  return format(bytes)
end

M.format = format
M.uuid_v4 = uuid_v4

return M
