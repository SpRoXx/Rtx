---@diagnostic disable: missing-return
---@class arc
---@field public end vector
---@field public hit_box number
---@field public start vector
---@field public distance number
local arc = {}


---@param offset? number
---@return polygon
function arc:to_polygon(offset) end

---@param _start vector
---@param _end vector
---@param _hitbox number
---@return arc
_G.arc = function(_start, _end, _hitbox) end
