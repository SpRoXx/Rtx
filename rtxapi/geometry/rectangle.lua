---@diagnostic disable: missing-return
---@class rectangle
---@field public direction vector
---@field public perpendicular vector
---@field public r_end vector
---@field public r_start vector
---@field public width number
local rectangle = {}

---@param offset? number
---@param overrideWidth? number
---@return polygon
function rectangle:to_polygon(offset, overrideWidth) end

---@param _start vector
---@param _end vector
---@param _widthStart number
---@return rectangle
_G.rectangle = function(_start, _end, _widthStart) end
