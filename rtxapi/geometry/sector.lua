---@diagnostic disable: missing-return
---@class sector
---@field public angle number
---@field public center vector
---@field public direction vector
---@field public radius number
local sector = {}


---@param offset? number
---@return polygon
function sector:to_polygon(offset) end


---@param offset? number
---@return polygon
function sector:update_polygon(offset) end

---@param center vector
---@param direction vector
---@param _angle number
---@param _radius number
---@return sector
_G.sector = function(center, direction, _angle, _radius) end
