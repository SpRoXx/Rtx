---@diagnostic disable: missing-return
---@class tactical_map
---@field public size vector4
---@field public position point2
local tactical_map = {}


---@param pos vector
---@return vector
function tactical_map:to_map_coord(pos) end

---@param pos vector
---@return boolean
function tactical_map:is_coord_on_map(pos) end


---@type tactical_map
_G.minimap = tactical_map