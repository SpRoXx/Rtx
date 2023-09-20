---@diagnostic disable: missing-return
---@class mec
local mec = {}


---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function mec.angle_value(x1, y1, x2, y2) end

---@param center vector
---@param radius2 number
---@param points vector[]
---@param skip1 number
---@param skip2 number
---@param skip3 number
---@return boolean
function mec.circle_encloses_points(center, radius2, points, skip1, skip2, skip3) end

---@param a vector
---@param b vector
---@param c vector
---@param center vector
---@return number
function mec.find_circle(a, b, c, center) end

---@param points vector[]
---@param center vector
---@return number
function mec.find_minimal_bounding_circle(points, center) end

---@param points vector[]
---@return mec_circle
function mec.get_mec(points) end

---@param points vector[]
---@return rectangle_f
function mec.get_min_max_box(points) end

---@param points vector[]
---@return vector[]
function mec.make_convex_hull(points) end

_G.mec = mec
