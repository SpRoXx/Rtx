---@diagnostic disable: missing-return
---@class circle
---@field public center vector
---@field public radius number
local circle = {}


---@param offset? number
---@param overrideWidth? number
---@return polygon
function circle:to_polygon(offset, overrideWidth) end

---@param center vector
---@param radius number
---@return circle
_G.circle = function(center, radius) end
