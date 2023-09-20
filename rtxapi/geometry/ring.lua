---@diagnostic disable: missing-return
---@class ring
---@field public center vector
---@field public radius number
---@field public ring_radius number
local ring = {}


---@param offset? number
---@return polygon
function ring:to_polygon(offset) end

---@param center vector
---@param radius number
---@return circle
_G.ring = function(center, radius, _ringRadius) end
