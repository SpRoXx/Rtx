---@diagnostic disable: missing-return
---@class geometry
local geometry = {}

---@param center vector
---@param center1 vector
---@param radius number
---@param radius2 number
---@return vector[]
function geometry.circle_circle_intersection(center, center1, radius, radius2) end

---@param origin vector
---@param range number
---@param quality number
---@return vector[]
function geometry.circle_points(origin, range, quality) end

---@param polygons polygon[]
---@return IntPoint[][]
function geometry.clip_polygons(polygons) end

---@param path vector[]
---@param distance number
---@return vector[]
function geometry.cut_path(path, distance) end

---@param path vector[]
---@return vector
function geometry.path_length(path) end

---@param startpoint vector
---@param endpoint vector
---@param v1 number
---@param startpoint2 vector
---@param v2 number
---@param t1 number
---@param delay? number
---@return vector,number
function geometry.vector_movement_collision(startpoint, endpoint, v1, startpoint2, v2, t1, delay) end

---@param path vector[]
---@param time number
---@param speed number
---@param delay? number
---@return vector
function geometry.position_after(path, time, speed, delay) end

_G.geometry = geometry
