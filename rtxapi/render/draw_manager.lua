---@diagnostic disable: missing-return
---@class drawning_manager
local drawning_manager = {}


---@param point vector
---@param color number
---@param fontsize number
---@param str string
function drawning_manager:add_text(point, color, fontsize, str) end

---@param point vector
---@param color number
---@param fontsize number
---@param str string
function drawning_manager:add_text_on_screen(point, color, fontsize, str) end

---@param center vector
---@param radius number
---@param color number
---@param thickness? number
---@param height? number
---@param num_segments? number
function drawning_manager:add_circle(center, radius, color, thickness, height, num_segments) end

---@param center vector
---@param radius number
---@param color number
---@param thickness? number
---@param height? number
---@param num_segments? number
function drawning_manager:add_circle_on_screen(center, radius, color, thickness, height, num_segments) end

---@param a vector
---@param b vector
---@param color number
---@param thickness? number
function drawning_manager:add_line(a, b, color, thickness) end

---@param a vector
---@param b vector
---@param color number
---@param thickness? number
function drawning_manager:add_line_on_screen(a, b, color, thickness) end

---@param a vector
---@param b vector
---@param color number
---@param rounding? number
---@param rounding_corners_flags? number
function drawning_manager:add_rect(a, b, color, rounding, rounding_corners_flags) end

---@param a vector
---@param b vector
---@param color number
---@param rounding? number
---@param rounding_corners_flags? number
function drawning_manager:add_filled_rect(a, b, color, rounding, rounding_corners_flags) end

---@param user_texture_id number
---@param pos vector
---@param size vector
---@param rounding? number
---@param uv0? vector
---@param uv1? vector
---@param tint_col? vector4
---@param border_col? vector4
function drawning_manager:add_image(user_texture_id, pos, size, rounding, uv0, uv1, tint_col, border_col) end

---@param fontsize number
---@param str string
---@return vector
function drawning_manager:calc_text_size(fontsize, str) end

---@param path string
---@return loaded_texture
function drawning_manager:load_texture_from_file(path) end

---@param center vector
---@param radius number
---@param color number
---@param num_segments? number
function drawning_manager:add_filled_circle_on_screen(center, radius, color, num_segments) end

---@param center vector
---@param radius number
---@param color number
---@param height? number
---@param num_segments? number
function drawning_manager:add_filled_circle(center, radius, color, height, num_segments) end

---@param vstart vector
---@param vend vector
---@param color number
---@param rectangle_width number
---@param outline_width number
---@param rounding number
---@param glow_power number
function drawning_manager:add_rectangle_3d(vstart, vend, color, rectangle_width, outline_width, rounding, glow_power) end

---@param vstart vector
---@param vend vector
---@param color number
---@param rectangle_width number
---@param rounding number
function drawning_manager:add_rectangle_3d_filled(vstart, vend, color, rectangle_width, rounding) end

---@param center vector
---@param radius number
---@param color number
---@param fill_percent? number
---@param thickness? number
---@param num_segments? number
function drawning_manager:add_circle_on_screen_ex(center, radius, color, fill_percent, thickness, num_segments) end

---@param center vector
---@param radius number
---@param color number
---@param color2 number
---@param thickness? number
---@param height? number
function drawning_manager:add_circle_gradient(center, radius, color, color2, thickness, height) end

---@param center vector
---@param radius number
---@param color number
---@param color2 number
---@param height? number
function drawning_manager:add_filled_circle_gradient(center, radius, color, color2, height) end

---@param center vector
---@param radius number
---@param color number
---@param thickness? number
---@param quality? number
function drawning_manager:draw_circle_on_minimap(center, radius, color, thickness, quality) end

---@type drawning_manager
_G.draw_manager = {}
