---@diagnostic disable: missing-return, duplicate-set-field
---@class polygon
---@field public points vector[]
local polygon = {}

---@param pos vector
---@return boolean
function polygon:is_inside(pos) end

---@param pos vector
---@return boolean
function polygon:is_outside(pos) end

---@param pos vector
---@return number
function polygon:point_in_polygon(pos) end

---@param pos vector
function polygon:add(pos) end

---@return IntPoint[]
function polygon:to_clipper_path() end

---@param color number
---@param thickness? number
---@param check_walls? boolean
function polygon:draw(color, thickness, check_walls) end

---@return polygon
_G.polygon = function() end

---@param points vector[]
_G.polygon = function(points) end
