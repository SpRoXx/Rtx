---@diagnostic disable: missing-return, duplicate-set-field
---@class vector
---@field public x number
---@field public y number
---@field public z number
---@operator add(vector): vector
---@operator sub(vector): vector
---@operator mul(vector): vector
---@operator mul(number): vector
---@operator div(vector): vector
---@operator div(number): vector
local vector = {
    zero = vector(0,0,0)
}

---@return number
function vector:length() end

---@return number
function vector:length_sqr() end

---@param other vector|game_object_script
---@return number
function vector:distance(other) end

---@param segment_start vector
---@param segment_end vector
---@param only_if_on_segment boolean
---@param squared boolean
---@return number
function vector:distance(segment_start, segment_end, only_if_on_segment, squared) end

---@param vOther vector
---@return number
function vector:distance_squared(vOther) end

---@param vOther vector
---@return number
function vector:dot_product(vOther) end

---@param vOther vector
---@return number
function vector:cross_product(vOther) end

---@return number
function vector:polar() end

---@param vOther vector
---@return number
function vector:angle_between(vOther) end

---@param to vector
---@param range number
---@return vector
function vector:extend(to, range) end

---@return vector
function vector:normalized() end

---@param angle number
---@return vector
function vector:rotated(angle) end

---@return vector
function vector:perpendicular() end

---@param z number
---@return vector
function vector:set_z(z) end

---@return vector
function vector:to3d() end

---@return vector
function vector:worldtoscreen() end

---@return vector
function vector:switchyz() end

---@param segment_start vector
---@param segment_end vector
---@return projection_info
function vector:project_on(segment_start, segment_end) end

---@param line_segment_end vector
---@param line_segment2_start vector
---@param line_segment2_end vector
---@return intersection_result
function vector:intersection(line_segment_end, line_segment2_start, line_segment2_end) end

---@return boolean
function vector:is_valid() end

---@return boolean
function vector:is_wall() end

---@return boolean
function vector:is_wall_of_grass() end

---@return boolean
function vector:is_in_fow() end

---@return boolean
function vector:is_building() end

---@return boolean
function vector:is_on_screen() end

---@return boolean
function vector:is_under_enemy_turret() end

---@param range number
---@return number
function vector:count_enemies_in_range(range) end

---@param range number
---@param unit game_object_script|nil
---@return number
function vector:count_allys_in_range(range,unit) end

---@return vector
_G.vector = function() end

---@param x number
---@param y number
---@return vector
_G.vector = function(x, y) end

---@param x number
---@param y number
---@param z number
---@return vector
_G.vector = function(x, y, z) end



---@type vector
_G.vector = vector


-- simple operator example
--[[
local veczero = vector(100.0,200.0)
local vector_other = vector(100.0,300.0)
local result_mult_2 = veczero * 2.0
local result_mult_vector = veczero * vector_other
print(string.format("veczero x = %0.1f y = %0.1f", veczero.x, veczero.y))
print(string.format("result_mult_2 x = %0.1f y = %0.1f", result_mult_2.x, result_mult_2.y))
print(string.format("result_mult_vector x = %0.1f y = %0.1f", result_mult_vector.x, result_mult_vector.y))
--]]
