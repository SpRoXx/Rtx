---@diagnostic disable: missing-return
---@class nav_mesh
---@field public width number
---@field public height number
---@field public cell_size number
local nav_mesh = {}


---@param pos vector
---@return number|nav_collision_flags
function nav_mesh:get_collision_flag(pos) end

---@param pos vector
---@return boolean
function nav_mesh:is_in_fow(pos) end

---@return number
function nav_mesh:get_height_for_position(x, y) end

---@param cell_x number
---@param cell_y number
---@return vector
function nav_mesh:get_cell_center(cell_x, cell_y) end

---@param cell_x number
---@param cell_y number
---@return number|nav_collision_flags
function nav_mesh:get_collision_flag_by_cell(cell_x, cell_y) end

---@param pos vector
---@return point2
function nav_mesh:get_cell_location(pos) end

_G.navmesh = nav_mesh
