---@class hud_camera_logic
---@field public current_zoom number
---@field public position vector
---@field public view_angle vector
---@field public zoom_factor number
local hud_camera_logic = {}


---@param value number
function hud_camera_logic:set_current_zoom(value) end

---@param value vector
function hud_camera_logic:set_position(value) end

---@param value vector
function hud_camera_logic:set_view_angle(value) end

---@param value number
function hud_camera_logic:set_zoom_factor(value) end