---@diagnostic disable: missing-return, duplicate-set-field
---@class point2
---@field public x number
---@field public y number
---@operator add(point2): point2
---@operator sub(point2): point2
---@operator mul(point2): point2
---@operator div(point2): point2


local point2 = {}

---@return point2
_G.point2 = function() end

---@param x number
---@param y number
---@return point2
_G.point2 = function(x, y) end

---@type point2
_G.point2 = point2
