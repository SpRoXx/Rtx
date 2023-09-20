---@diagnostic disable: missing-return, duplicate-set-field
---@class r3d_renderer
---@field public view_matrix D3DMATRIX
---@field public projection_matrix D3DMATRIX
---@field public screen_width number
---@field public screen_height number
---@field public is_using_d3d9 boolean
local r3d_renderer = {}


---@param screen vector
---@param tolerance number
function r3d_renderer:is_on_screen(screen, tolerance) end

---@param world vector
---@return vector
function r3d_renderer:world_to_screen(world) end

---@param r number
---@param g number
---@param b number
---@param a number
---@return number
_G.MAKE_COLOR = function(r, g, b, a) end



---@type r3d_renderer
_G.renderer = r3d_renderer
