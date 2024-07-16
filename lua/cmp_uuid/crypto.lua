local M = {}

--- Get random bytes.
--- @param n number
--- @return table
local function get_random_bytes(n)
  local f = assert(io.open("/dev/urandom", "rb"))
  local bytes = f:read(n)
  f:close()
  return { bytes:byte(1, #bytes) }
end

M.get_random_bytes = get_random_bytes

return M
